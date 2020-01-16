import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockup_app/model/jogador_model.dart';
import 'package:mockup_app/repository/service.dart';

class SalvarJogadorScreen extends StatefulWidget {
  final VoidCallback success;
  final JogadorModel jogadorModel;
  SalvarJogadorScreen(this.success, this.jogadorModel);
  @override
  _SalvarJogadorScreenState createState() => _SalvarJogadorScreenState();
}

class _SalvarJogadorScreenState extends State<SalvarJogadorScreen> {
  JogadorModel _jogadorModel;

  TextEditingController _ecNome;
  TextEditingController _ecHeart;
  TextEditingController _eciniciatiiva;

  @override
  void initState() {
    super.initState();

    if (widget.jogadorModel != null) {
      _jogadorModel = widget.jogadorModel;

      _ecNome = TextEditingController(text: _jogadorModel.nome);
      _ecHeart = TextEditingController(text: _jogadorModel.heart.toString());
      _eciniciatiiva =
          TextEditingController(text: _jogadorModel.iniciatiiva.toString());
    } else {
      _jogadorModel = JogadorModel();

      _ecNome = TextEditingController();
      _ecHeart = TextEditingController();
      _eciniciatiiva = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jogadorModel == null
            ? 'Adicionar Jogador/Monstro'
            : 'Atualizar Jogador/Monstro'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _jogadorModel.image1 != null &&
                          _jogadorModel.image1.isNotEmpty
                      ? FileImage(File(_jogadorModel.image1))
                      : null,
                  child: _jogadorModel.image1 == null ||
                          _jogadorModel.image1.isEmpty
                      ? Icon(
                          Icons.add_photo_alternate,
                          color: Colors.blueGrey,
                        )
                      : SizedBox.shrink(),
                  backgroundColor: Colors.grey.shade200,
                ),
                onTap: getImage1,
              ),
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sword.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _jogadorModel.image2 != null &&
                          _jogadorModel.image2.isNotEmpty
                      ? FileImage(File(_jogadorModel.image2))
                      : null,
                  child: _jogadorModel.image2 == null ||
                          _jogadorModel.image2.isEmpty
                      ? Icon(
                          Icons.add_photo_alternate,
                          color: Colors.blueGrey,
                        )
                      : SizedBox.shrink(),
                  backgroundColor: Colors.grey.shade200,
                ),
                onTap: getImage2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                    'Nome: ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  width: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    controller: _ecNome,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Informe o nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidHeart,
                    size: 20,
                    color: Colors.black87,
                  ),
                  width: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _ecHeart,
                    decoration: InputDecoration(
                      hintText: 'Informe ...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Icon(
                    FontAwesomeIcons.skullCrossbones,
                    size: 20,
                    color: Colors.black87,
                  ),
                  width: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    controller: _eciniciatiiva,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Informe ...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.only(left: 10, top: 2, bottom: 4),
                  child: RaisedButton(
                    color: Colors.red,
                    child:
                        Text('Cancelar', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.only(right: 10, top: 2, bottom: 4),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'Salvar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _salvar,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _salvar() {
    _jogadorModel.nome = _ecNome.text;
    _jogadorModel.heart = int.parse(_ecHeart.text);
    _jogadorModel.iniciatiiva = int.parse(_eciniciatiiva.text);
    _jogadorModel.auxiliarVida = 0;

    if (widget.jogadorModel != null) {
      Service.attJogador(_jogadorModel);
    } else {
      Service.addJogador(_jogadorModel);
    }

    widget.success();
    Navigator.of(context).pop();
  }

  Future getImage1() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null && image.path != null && image.path.isNotEmpty) {
      setState(() {
        _jogadorModel.image1 = image.path;
      });
    }
  }

  Future getImage2() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null && image.path != null && image.path.isNotEmpty) {
      setState(() {
        _jogadorModel.image2 = image.path;
      });
    }
  }
}
