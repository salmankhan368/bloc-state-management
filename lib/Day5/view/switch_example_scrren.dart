import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day5/bloc/switch_block.dart';
import 'package:my_bloc/Day5/bloc/switch_event.dart';
import 'package:my_bloc/Day5/bloc/switch_state.dart';

class SwitchExampleS extends StatefulWidget {
  const SwitchExampleS({super.key});

  @override
  State<SwitchExampleS> createState() => _SwitchExampleSState();
}

class _SwitchExampleSState extends State<SwitchExampleS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifiaction'),
                BlocBuilder<SwitchBlock, SwitchState>(
                  builder: (context, states) {
                    return Switch(
                      value: states.isSwitch,
                      onChanged: (value) {
                        context.read<SwitchBlock>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(height: 250, color: Colors.deepPurple.withOpacity(0.2)),
            SizedBox(height: 10),
            Slider(value: .4, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
