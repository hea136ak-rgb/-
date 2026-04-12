import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/user_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('STATUS BOARD | لوحة الحالة', style: TextStyle(letterSpacing: 1, fontSize: 16)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatsCard(),
              const SizedBox(height: 24),
              const Text('CORE PILLARS | الأقسام الأساسية', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildPillarTile(context, 'BODY | الجسد', Icons.fitness_center, Colors.redAccent, '/body'),
                  _buildPillarTile(context, 'MIND | العقل', Icons.psychology, Colors.blueAccent, '/mind'),
                  _buildPillarTile(context, 'SOUL | النفس', Icons.self_improvement, Colors.purpleAccent, '/soul'),
                  _buildPillarTile(context, 'MONEY | المال', Icons.account_balance_wallet, Colors.greenAccent, '/money'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Consumer<UserState>(
      builder: (context, userState, child) {
        final stats = userState.stats;
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RANK: ${stats.rank.name} | رتبة',
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('LEVEL: ${stats.level} | مستوى',
                      style: const TextStyle(color: Colors.blueAccent, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                  value: stats.xp / stats.nextLevelXp,
                  backgroundColor: Colors.black,
                  color: Colors.blueAccent),
              const SizedBox(height: 8),
              Text('XP: ${stats.xp} / ${stats.nextLevelXp}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPillarTile(BuildContext context, String title, IconData icon, Color color, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
