import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/ui/blocs/characters/bloc.dart';
import 'package:flutter_app_challenge/ui/blocs/characters/events.dart';
import 'package:flutter_app_challenge/ui/blocs/characters/state.dart';
import 'package:flutter_app_challenge/ui/widgets/character.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _BasicCharacterWidgetState();
}


class _BasicCharacterWidgetState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
    builder: (context, state){
      return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                'Cargados: ${state.pagesFetched * 20}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE9E8E4),
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  context.read<CharactersBloc>().add(FetchCharactersEvent());
                },
                child: const Text('Cargar',),
              ),
              const SizedBox(height: 16),
              if (state.characters.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) {
                      final character = state.characters[index];
                      return CharacterWidget(character: character);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    });
  }
}

