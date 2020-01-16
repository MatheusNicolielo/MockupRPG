import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockup_app/model/jogador_model.dart';
import 'package:mockup_app/repository/service.dart';
import 'package:mockup_app/screen/salvar_jogador_screen.dart';
import 'package:mockup_app/tile/jogador_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fila de Combate'),
      ),
      body: FutureBuilder<List<JogadorModel>>(
          future: Service.getListaJogador(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data.isNotEmpty) {
              return ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Divider(
                      color: Colors.grey.shade400,
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return JogadorTile(snapshot.data.elementAt(index));
                },
              );
            }

            return SizedBox.shrink();
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onPressed,
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) {
        return SalvarJogadorScreen(_onSuccess, null);
      }),
    );
  }

  void _onSuccess() {
    setState(() {});
  }
}
