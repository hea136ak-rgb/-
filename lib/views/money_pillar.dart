import 'package:flutter/material.dart';

class MoneyPillarScreen extends StatelessWidget {
  const MoneyPillarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('TREASURY')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildWalletSummary(),
            const SizedBox(height: 24),
            const Text(
              'FINANCIAL QUESTS',
              style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildQuestItem('Save \$5 Today', 'XP +50'),
            _buildQuestItem('No Spend Day', 'XP +100'),
            _buildQuestItem('Read "Rich Dad Poor Dad" Summary', 'XP +200'),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF0F2027), Color(0xFF203A43)]),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.5)),
      ),
      child: const Column(
        children: [
          Text('VIRTUAL BALANCE', style: TextStyle(color: Colors.white70, fontSize: 12)),
          SizedBox(height: 8),
          Text('\$1,240.00', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildQuestItem(String title, String reward) {
    return Card(
      color: const Color(0xFF1A1A1A),
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.greenAccent),
        title: Text(title),
        trailing: Text(reward, style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
