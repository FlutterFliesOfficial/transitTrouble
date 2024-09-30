part of dashboard;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TodayText(
          onPressed: () {},
        ),
        const SizedBox(width: 2),
        Expanded(child: SearchField()),
      ],
    );
  }
}
