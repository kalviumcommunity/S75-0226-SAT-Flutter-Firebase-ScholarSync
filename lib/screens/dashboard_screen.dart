import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _teacherMode = true;
  String _selectedStudent = 'Aarav';
  String _subjectFilter = 'All';
  String _typeFilter = 'All';

  final List<String> _students = ['Aarav', 'Diya', 'Karan', 'Meera', 'Rohan'];

  final List<_MaterialItem> _materials = [
    _MaterialItem(
      id: 'm1',
      title: 'Algebra Practice Set 3',
      subject: 'Math',
      type: 'PDF',
      dueDate: DateTime(2026, 3, 12),
      uploadedAt: DateTime(2026, 3, 5),
      completedBy: {'Aarav', 'Diya'},
    ),
    _MaterialItem(
      id: 'm2',
      title: 'Cell Structure Revision Video',
      subject: 'Science',
      type: 'Video',
      dueDate: DateTime(2026, 3, 10),
      uploadedAt: DateTime(2026, 3, 4),
      completedBy: {'Meera'},
    ),
    _MaterialItem(
      id: 'm3',
      title: 'Tenses Quick Notes',
      subject: 'English',
      type: 'Notes',
      dueDate: DateTime(2026, 3, 15),
      uploadedAt: DateTime(2026, 3, 3),
      completedBy: {'Aarav', 'Karan', 'Rohan'},
    ),
  ];

  List<_MaterialItem> get _filteredMaterials {
    return _materials.where((item) {
      final subjectOk = _subjectFilter == 'All' || item.subject == _subjectFilter;
      final typeOk = _typeFilter == 'All' || item.type == _typeFilter;
      return subjectOk && typeOk;
    }).toList();
  }

  double _completionForStudent(String studentName) {
    if (_materials.isEmpty) return 0;
    final completed =
        _materials.where((item) => item.completedBy.contains(studentName)).length;
    return completed / _materials.length;
  }

  Future<void> _openAddMaterialDialog() async {
    final titleController = TextEditingController();
    String selectedSubject = 'Math';
    String selectedType = 'PDF';
    DateTime selectedDueDate = DateTime.now().add(const Duration(days: 7));

    await showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add Study Material'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: selectedSubject,
                      decoration: const InputDecoration(
                        labelText: 'Subject',
                        border: OutlineInputBorder(),
                      ),
                      items: const ['Math', 'Science', 'English']
                          .map((subject) => DropdownMenuItem(
                                value: subject,
                                child: Text(subject),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setDialogState(() => selectedSubject = value);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: selectedType,
                      decoration: const InputDecoration(
                        labelText: 'Type',
                        border: OutlineInputBorder(),
                      ),
                      items: const ['PDF', 'Video', 'Notes']
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(type),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setDialogState(() => selectedType = value);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    FilledButton.tonalIcon(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                          initialDate: selectedDueDate,
                        );
                        if (picked != null) {
                          setDialogState(() => selectedDueDate = picked);
                        }
                      },
                      icon: const Icon(Icons.event),
                      label: Text('Due: ${_formatDate(selectedDueDate)}'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    if (title.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a title.')),
                      );
                      return;
                    }
                    setState(() {
                      _materials.insert(
                        0,
                        _MaterialItem(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          title: title,
                          subject: selectedSubject,
                          type: selectedType,
                          dueDate: selectedDueDate,
                          uploadedAt: DateTime.now(),
                          completedBy: <String>{},
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _openAddStudentDialog() async {
    final nameController = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Student'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Student name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isEmpty) return;
              if (_students.contains(name)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Student already exists.')),
                );
                return;
              }
              setState(() {
                _students.add(name);
                if (!_teacherMode) {
                  _selectedStudent = name;
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _toggleCompletion(_MaterialItem item, String studentName, bool complete) {
    setState(() {
      if (complete) {
        item.completedBy.add(studentName);
      } else {
        item.completedBy.remove(studentName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScholarSync'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SegmentedButton<bool>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment<bool>(
                  value: true,
                  icon: Icon(Icons.school_outlined),
                  label: Text('Teacher'),
                ),
                ButtonSegment<bool>(
                  value: false,
                  icon: Icon(Icons.person_outline),
                  label: Text('Student'),
                ),
              ],
              selected: {_teacherMode},
              onSelectionChanged: (selection) {
                setState(() => _teacherMode = selection.first);
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colors.primaryContainer.withValues(alpha: 0.35), colors.surface],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final horizontalPadding = constraints.maxWidth > 700 ? 32.0 : 16.0;
              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(horizontalPadding, 20, horizontalPadding, 20),
                child: _teacherMode ? _buildTeacherView() : _buildStudentView(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTeacherView() {
    final avgProgress = _students
        .map(_completionForStudent)
        .fold<double>(0, (sum, value) => sum + value) /
        _students.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Teacher Dashboard',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        const Text(
          'Distribute materials, assign due dates, and monitor student completion.',
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _StatCard(
              title: 'Materials',
              value: '${_materials.length}',
              icon: Icons.library_books_outlined,
              tone: Colors.indigo,
            ),
            _StatCard(
              title: 'Students',
              value: '${_students.length}',
              icon: Icons.groups_outlined,
              tone: Colors.teal,
            ),
            _StatCard(
              title: 'Avg Completion',
              value: '${(avgProgress * 100).round()}%',
              icon: Icons.insights_outlined,
              tone: Colors.orange,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton.icon(
              onPressed: _openAddMaterialDialog,
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload Material'),
            ),
            OutlinedButton.icon(
              onPressed: _openAddStudentDialog,
              icon: const Icon(Icons.person_add_alt),
              label: const Text('Add Student'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Recent Study Materials',
          child: Column(
            children: _materials
                .map(
                  (item) => Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(_iconForType(item.type)),
                      ),
                      title: Text(item.title),
                      subtitle: Text(
                        '${item.subject} • ${item.type} • Due ${_formatDate(item.dueDate)}',
                      ),
                      trailing: Text('${item.completedBy.length}/${_students.length}'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/material-details',
                          arguments: {
                            'title': item.title,
                            'subject': item.subject,
                            'type': item.type,
                            'dueDate': _formatDate(item.dueDate),
                            'uploadedAt': _formatDate(item.uploadedAt),
                            'completion':
                                '${item.completedBy.length}/${_students.length} students',
                          },
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          title: 'Student Progress Tracker',
          child: Column(
            children: _students
                .map(
                  (student) {
                    final progress = _completionForStudent(student);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(student),
                              Text('${(progress * 100).round()}%'),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildStudentView() {
    final studentMaterials = _filteredMaterials;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Student Workspace',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        const Text('Track pending tasks and mark your progress transparently.'),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: _selectedStudent,
          decoration: const InputDecoration(
            labelText: 'Current Student',
            border: OutlineInputBorder(),
          ),
          items: _students
              .map((student) => DropdownMenuItem(value: student, child: Text(student)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedStudent = value);
            }
          },
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FilterChip(
              label: 'All Subjects',
              selected: _subjectFilter == 'All',
              onSelected: () => setState(() => _subjectFilter = 'All'),
            ),
            _FilterChip(
              label: 'Math',
              selected: _subjectFilter == 'Math',
              onSelected: () => setState(() => _subjectFilter = 'Math'),
            ),
            _FilterChip(
              label: 'Science',
              selected: _subjectFilter == 'Science',
              onSelected: () => setState(() => _subjectFilter = 'Science'),
            ),
            _FilterChip(
              label: 'English',
              selected: _subjectFilter == 'English',
              onSelected: () => setState(() => _subjectFilter = 'English'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FilterChip(
              label: 'All Types',
              selected: _typeFilter == 'All',
              onSelected: () => setState(() => _typeFilter = 'All'),
            ),
            _FilterChip(
              label: 'PDF',
              selected: _typeFilter == 'PDF',
              onSelected: () => setState(() => _typeFilter = 'PDF'),
            ),
            _FilterChip(
              label: 'Video',
              selected: _typeFilter == 'Video',
              onSelected: () => setState(() => _typeFilter = 'Video'),
            ),
            _FilterChip(
              label: 'Notes',
              selected: _typeFilter == 'Notes',
              onSelected: () => setState(() => _typeFilter = 'Notes'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _SectionCard(
          title: 'Pending Tasks & Completion',
          child: Column(
            children: studentMaterials.map((item) {
              final done = item.completedBy.contains(_selectedStudent);
              return CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: done,
                title: Text(item.title),
                subtitle: Text('${item.subject} • Due ${_formatDate(item.dueDate)}'),
                secondary: Icon(_iconForType(item.type)),
                onChanged: (value) {
                  _toggleCompletion(item, _selectedStudent, value ?? false);
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        _SectionCard(
          title: 'Material Library',
          child: Column(
            children: studentMaterials
                .map(
                  (item) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(child: Icon(_iconForType(item.type))),
                    title: Text(item.title),
                    subtitle: Text('${item.subject} • ${item.type}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/material-details',
                        arguments: {
                          'title': item.title,
                          'subject': item.subject,
                          'type': item.type,
                          'dueDate': _formatDate(item.dueDate),
                          'uploadedAt': _formatDate(item.uploadedAt),
                          'completion': item.completedBy.contains(_selectedStudent)
                              ? 'You marked this as completed'
                              : 'Not completed yet',
                        },
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'PDF':
        return Icons.picture_as_pdf_outlined;
      case 'Video':
        return Icons.play_circle_outline;
      default:
        return Icons.sticky_note_2_outlined;
    }
  }
}

class _MaterialItem {
  _MaterialItem({
    required this.id,
    required this.title,
    required this.subject,
    required this.type,
    required this.dueDate,
    required this.uploadedAt,
    required this.completedBy,
  });

  final String id;
  final String title;
  final String subject;
  final String type;
  final DateTime dueDate;
  final DateTime uploadedAt;
  final Set<String> completedBy;
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.tone,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: tone.withValues(alpha: 0.32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: tone),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text(title),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
    );
  }
}