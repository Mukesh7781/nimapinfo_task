import 'package:flutter/material.dart';
import 'record_item.dart';
import 'pledge_dialog.dart';

class RecordCard extends StatelessWidget {
  final RecordItem record;
  final Function(int) onPledge;
  final VoidCallback onHeartTap;

  const RecordCard({
    required this.record,
    required this.onPledge,
    required this.onHeartTap,
  });

  @override
  Widget build(BuildContext context) {
    double progress = record.funded / record.goals;
    int displayProgress = (progress * 100).clamp(0, 100).toInt();
    bool isGoalCompleted = record.funded >= record.goals;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Image.asset(record.image, fit: BoxFit.cover, width: double.infinity, height: 120),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        record.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: onHeartTap,
                      child: Icon(
                        Icons.favorite,
                        color: record.liked ? Colors.red : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  record.description,
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text("₹ ${record.funded}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text("FUNDED", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text("₹ ${record.goals}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text("GOALS", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text("${record.endsIn}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Text("ENDS IN", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress > 1.0 ? 1.0 : progress,
                        color: Colors.white,
                        backgroundColor: Colors.blue[200],
                        minHeight: 7,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "$displayProgress%",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white,
                        foregroundColor: isGoalCompleted ? Colors.grey : Colors.blue, // Optional: Gray text when disabled
                      ),
                      onPressed: isGoalCompleted
                          ? null // Disables the button
                          : () {
                              showDialog(
                                context: context,
                                builder: (context) => PledgeDialog(
                                  onSubmit: (amount) {
                                    Navigator.pop(context);
                                    onPledge(amount);
                                  },
                                ),
                              );
                            },
                      child: Text("PLEDGE"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
