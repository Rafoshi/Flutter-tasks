import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/model/NivelModel.dart';

class TaskCard extends StatefulWidget {
  final String nome;

  const TaskCard(this.nome, {super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NivelModel(),
      child: Stack(
        children: [
          DownPart(),
          UpPart(widget.nome),
        ],
      ),
    );
  }
}

class UpPart extends StatefulWidget {
  final nome;

  const UpPart(this.nome, {super.key});

  @override
  State<UpPart> createState() => _UpPartState();
}

class _UpPartState extends State<UpPart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: SizedBox(
        height: 90,
        width: 1000,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              width: 70,
              height: 1000,
              child: const Image(
                image: NetworkImage(
                    'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    widget.nome,
                    style: const TextStyle(
                        fontSize: 20, overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(widget.nome),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(47, 128, 237, 1),
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Provider.of<NivelModel>(context, listen: false).upNivel();
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_up_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Lvl Up',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DownPart extends StatelessWidget {
  const DownPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: const Color.fromRGBO(47, 128, 237, 1),
      child: SizedBox(
        height: 130,
        width: 1000,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 160,
                    child: Consumer<NivelModel>(
                      builder: (context, nivel, child) {
                        return LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel.nivel / 10,
                        );
                      }
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Consumer<NivelModel>(builder: (context, nivel, child) {
                    return Text(
                      'Nível: ${nivel.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
