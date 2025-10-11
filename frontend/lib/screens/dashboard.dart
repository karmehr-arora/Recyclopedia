import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _kpiRow(context),
        const SizedBox(height: 12),
        _card(
          title: 'Badges',
          child: Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('First Ten')),
              Chip(label: Text('One Week Strong')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _card(
          title: 'Recent Scans',
          child: Column(
            children: const [
              ListTile(leading: Icon(Icons.check_circle), title: Text('Water Bottle'), subtitle: Text('PET (#1) • Today')),
              ListTile(leading: Icon(Icons.check_circle), title: Text('Yogurt Cup'), subtitle: Text('PP (#5) • 12h ago')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _card(
          title: 'Next Pickup',
          trailing: TextButton(onPressed: () {}, child: const Text('Set reminders')),
          child: const ListTile(
            title: Text('Recycling • Thu, 7:30 AM'),
            subtitle: Text('Remember to rinse containers.'),
          ),
        ),
      ],
    );
  }

  Widget _kpiRow(BuildContext context) {
    Widget kpi(String label, String value) => Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );

    return Row(
      children: [
        kpi('Streak', '7 days'),
        const SizedBox(width: 8),
        kpi('Longest', '21 days'),
        const SizedBox(width: 8),
        kpi('Points', '135'),
      ],
    );
  }

  Widget _card({required String title, Widget? trailing, required Widget child}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 8),
          child,
        ]),
      ),
    );
  }
}
