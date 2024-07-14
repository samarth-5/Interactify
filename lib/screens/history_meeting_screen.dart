import 'package:flutter/material.dart';
import 'package:interactify/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Error: No Meetings attended!'),
          );
        }

        if (!snapshot.hasData || (snapshot.data as dynamic).docs.isEmpty) {
          return const Center(
            child: Text('No meeting history available'),
          );
        }

        var docs = (snapshot.data as dynamic).docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            var meetingData = docs[index];
            return ListTile(
              title: Text(
                'Room name: ${meetingData['meetingName']}',
              ),
              subtitle: Text(
                'Joined on: ${meetingData['createdAt']}',
              ),
            );
          },
        );
      },
    );
  }
}