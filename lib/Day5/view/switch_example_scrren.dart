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
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitch,
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
            BlocBuilder<SwitchBlock, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                return Container(
                  height: 250,
                  color: Colors.deepPurple.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(height: 10),
            BlocBuilder<SwitchBlock, SwitchState>(
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print('slider');
                    context.read<SwitchBlock>().add(SliderEvent(slider: value));
                    // TODO: dispatch slider update event if needed
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
