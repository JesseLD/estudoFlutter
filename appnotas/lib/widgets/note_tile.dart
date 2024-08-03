// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:appnotas/models/note_model.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;
  final void Function(dynamic) handleClick;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  NoteTile({
    super.key,
    required this.note,
    required this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${dateFormat.format(DateTime.parse(note.createdAt))} - ${note.description}",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                onSelected: (item) => handleClick(item),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: {
                      'note': note,
                      'operation': 'edit',
                    },
                    child: const Text('Edit '),
                  ),
                  PopupMenuItem(
                    value: {
                      'note': note,
                      'operation': 'delete',
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
