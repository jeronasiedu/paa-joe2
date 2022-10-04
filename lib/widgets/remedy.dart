// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:planttech_2/translate/translations.dart';
import 'package:planttech_2/utils/audio_player.dart';

class Remedy extends StatefulWidget {
  const Remedy({
    Key? key,
    required this.lowercaseType,
  }) : super(key: key);
  final String lowercaseType;
  @override
  State<Remedy> createState() => _RemedyState();
}

class _RemedyState extends State<Remedy> {
  Map currentTranslation = EnglishTranslations;

  MyAudioPlayer player = MyAudioPlayer();

  @override
  void dispose() {
    player.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h6 = Theme.of(context).textTheme.headline6;
    final btnStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 18,
      ),
      minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 25),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: widget.lowercaseType == "healthy"
          ? Column(
              children: [
                Text(
                  'Your plant is healthy',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        player.play(
                            type: widget.lowercaseType, lang: Languages.twi);
                      },
                      style: btnStyle,
                      label: const Text("Audio in Twi"),
                      icon: const Icon(Icons.mic_rounded),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        player.play(
                            type: widget.lowercaseType, lang: Languages.ga);
                      },
                      style: btnStyle,
                      label: const Text("Audio in Ga"),
                      icon: const Icon(Icons.mic_rounded),
                    ),
                  ],
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text("Remedy", style: h6),
                ),
                ...List.generate(
                  currentTranslation[widget.lowercaseType].length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                '${index + 1}.',
                                style: h6,
                              )),
                          Expanded(
                            child: Text(
                              currentTranslation[widget.lowercaseType][index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.grey[800],
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        player.play(
                            type: widget.lowercaseType, lang: Languages.twi);
                      },
                      style: btnStyle,
                      label: const Text("Audio in Twi"),
                      icon: const Icon(Icons.mic_rounded),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        player.play(
                            type: widget.lowercaseType, lang: Languages.ga);
                      },
                      style: btnStyle,
                      label: const Text("Audio in Ga"),
                      icon: const Icon(Icons.mic_rounded),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
