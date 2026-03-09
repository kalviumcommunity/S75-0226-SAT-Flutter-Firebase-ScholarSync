import 'package:flutter/material.dart';

class MaterialDetailsScreen extends StatelessWidget {
  const MaterialDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final details = args is Map<String, String> ? args : <String, String>{};
    final title = details['title'] ?? (args is String ? args : 'Unknown Material');
    final subject = details['subject'] ?? 'General';
    final type = details['type'] ?? 'Resource';
    final dueDate = details['dueDate'] ?? 'Not set';
    final uploadedAt = details['uploadedAt'] ?? 'Not available';
    final completion = details['completion'] ?? 'No completion data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    child: Icon(_iconForType(type), size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('$subject • $type'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _detailRow('Due Date', dueDate),
                    const SizedBox(height: 10),
                    _detailRow('Uploaded On', uploadedAt),
                    const SizedBox(height: 10),
                    _detailRow('Progress', completion),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Read or watch this material and update your task status from the dashboard.',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Dashboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    );
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