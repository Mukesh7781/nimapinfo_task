import 'package:flutter/material.dart';
import 'record_item.dart';
import 'record_card.dart';

class RecordListPage extends StatefulWidget {
  @override
  _RecordListPageState createState() => _RecordListPageState();
}

class _RecordListPageState extends State<RecordListPage> {
  List<RecordItem> records = [
    RecordItem(
      title: "Smile Crowdfunding",
      description: "This foundation will bring smile on there faces",
      funded: 500,
      goals: 5000,
      endsIn: 36,
      image: "assets/children1.jpg",
    ),
    RecordItem(
      title: "Animal Funding",
      description: "This foundation will help animals",
      funded: 200,
      goals: 10000,
      endsIn: 32,
      image: "assets/children2.jpg",
    ),
  ];

  void updateFunded(int index, int amount) {
    setState(() {
      records[index].funded += amount;
    });
  }

  void toggleLike(int index) {
    setState(() {
      records[index].liked = !records[index].liked;
    });
  }

  void checkGoalCompletion(BuildContext context, RecordItem record) {
    if (record.funded >= record.goals) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.blue[800], // Matches card blue
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          title: Text(
            "Congratulations!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "We completed the goal.",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), // Pill-shaped
                backgroundColor: Colors.white,
              ),
              child: Text("OK", style: TextStyle(color: Colors.blue)),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            Text(
              "Record List",
              style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return RecordCard(
                    record: records[index],
                    onPledge: (amount) {
                      updateFunded(index, amount);
                      checkGoalCompletion(context, records[index]);
                    },
                    onHeartTap: () => toggleLike(index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
