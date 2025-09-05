import 'dart:async';

import 'package:flutter/material.dart';
import 'view_model/index.dart';
import '../widgets/character.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final TextEditingController _controller = TextEditingController();
  final CharacterViewModel _viewModel = CharacterViewModel();
  Timer? _debounce;

  void _onTextChanged(String value) {
  
    if(_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
    _viewModel.searchCharacter(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personaje')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _controller,
                onChanged: _onTextChanged,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AnimatedBuilder(
                animation: _viewModel,
                builder: (context, _) {
                  if (_viewModel.characterResult.isEmpty) {
                    return const Center(child: Text('Personaje no encontrado'));
                  }
                  return ListView.builder(
                    itemCount: _viewModel.characterResult.length,
                    itemBuilder: (context, index) {
                      final character = _viewModel.characterResult[index];
                      return CharacterWidget(character: character);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
