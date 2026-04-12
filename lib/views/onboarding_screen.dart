import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentStep = 0;

  // Form controllers
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SYSTEM ONBOARDING',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: _buildStepContent(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep > 0)
                    TextButton(
                      onPressed: () => setState(() => _currentStep--),
                      child: const Text('BACK', style: TextStyle(color: Colors.grey)),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentStep < 2) {
                        setState(() => _currentStep++);
                      } else {
                        // Complete onboarding
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    child: Text(_currentStep < 2 ? 'NEXT' : 'AWAKEN'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PHYSICAL PARAMETERS',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _heightController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        );
      case 1:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PSYCHOLOGICAL PROFILING',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'What is your biggest weakness?',
              style: TextStyle(color: Colors.blueGrey),
            ),
            // Placeholder for psychological questions
          ],
        );
      case 2:
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CHOOSE YOUR PERSONA',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 16),
            // Placeholder for persona selection (Goku, Jin-Woo, etc.)
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
