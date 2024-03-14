import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String nome;

  const TaskCard(this.nome, {super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
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
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: nivel / 10,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Nível: $nivel',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
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
                const SizedBox(
                  width: 12,
                ),
                const Image(
                  width: 60,
                  image: NetworkImage(
                      'https://static-00.iconduck.com/assets.00/todo-icon-2048x2048-m7wp6prw.png'),
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
                        style: TextStyle(
                            fontSize: 20, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text('Aprender Flutter'),
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
                      setState(() {
                        nivel++;
                      });
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
        )
      ],
    );
  }
}
