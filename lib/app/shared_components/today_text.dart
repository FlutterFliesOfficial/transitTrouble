import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayText extends StatelessWidget {
  const TodayText({Key? key, required Null Function() onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
          )
        ],
      ),
    );
  }
}
