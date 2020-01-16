import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockup_app/model/jogador_model.dart';
import 'package:mockup_app/screen/salvar_jogador_screen.dart';

class JogadorTile extends StatefulWidget {
  final JogadorModel _jogadorModel;
  JogadorTile(this._jogadorModel);

  @override
  _JogadorTileState createState() => _JogadorTileState();
}

class _JogadorTileState extends State<JogadorTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildContainer1(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: _buildContainer2(),
            ),
            Expanded(
              child: _buidContainer3(),
            ),
          ],
        ),
      ),
      //onTap: _onTap,
    );
  }

  Widget _buildContainer1() {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      backgroundImage: widget._jogadorModel.image1 != null &&
              widget._jogadorModel.image1.isNotEmpty
          ? FileImage(File(widget._jogadorModel.image1))
          : AssetImage('assets/crono.jpg'),
      radius: 42,
      child: InkWell(
        onTap: _onTap,
      ),
    );
  }

  Widget _buildContainer2() {
    return Container(
      height: 70,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildContanerTile1(FontAwesomeIcons.solidHeart,
              widget._jogadorModel.heart.toString(), Colors.black54),
          _buildContanerTile1(FontAwesomeIcons.skullCrossbones,
              widget._jogadorModel.iniciatiiva.toString(), Colors.black45),
          _buildContanerTile1(FontAwesomeIcons.check,
              widget._jogadorModel.auxiliarVida.toString(), Colors.black45)
        ],
      ),
    );
  }

  Widget _buidContainer3() {
    return Container(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            widget._jogadorModel.nome,
            style: _textStyle(FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  width: 35,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "-1",
                      style: _textStyle(FontWeight.w500),
                    ),
                  ),
                ),
                onTap: _onDecrement,
              ),
              SizedBox(
                width: 2,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  width: 38,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "+1",
                      style: _textStyle(FontWeight.w500),
                    ),
                  ),
                ),
                onTap: _onIncrement,
              ),
              SizedBox(
                width: 2,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  width: 43,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "-10",
                      style: _textStyle(FontWeight.w500),
                    ),
                  ),
                ),
                onTap: _onDecrementDez,
              ),
              SizedBox(
                width: 2,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  width: 46,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: new Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "+10",
                      style: _textStyle(FontWeight.w500),
                    ),
                  ),
                ),
                onTap: _onIncrementDez,
              ),
              SizedBox(
                width: 2,
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  child: Center(
                    child: Icon(
                      Icons.check,
                    ),
                  ),
                ),
                onTap: _adicionarSubtrairVida,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContanerTile1(IconData icon, String text, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: _textStyle(),
          ),
        ),
      ],
    );
  }

  TextStyle _textStyle([FontWeight fontWeight]) {
    return TextStyle(
      fontSize: 14,
      color: Colors.blueGrey.shade700,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  void _onDecrement() {
    setState(() {
      widget._jogadorModel.auxiliarVida--;
    });
  }

  void _onDecrementDez() {
    setState(() {
      widget._jogadorModel.auxiliarVida =
          widget._jogadorModel.auxiliarVida - 10;
    });
  }

  void _onIncrement() {
    setState(() {
      widget._jogadorModel.auxiliarVida++;
    });
  }

  void _onIncrementDez() {
    setState(() {
      widget._jogadorModel.auxiliarVida =
          widget._jogadorModel.auxiliarVida + 10;
    });
  }

  void _onTap() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) {
        return SalvarJogadorScreen(_onSuccess, widget._jogadorModel);
      }),
    );
  }

  void _onSuccess() {
    setState(() {});
  }

  void _adicionarSubtrairVida() {
    setState(() {
      widget._jogadorModel.heart = widget._jogadorModel.heart +
          int.parse(widget._jogadorModel.auxiliarVida.toString());
      widget._jogadorModel.auxiliarVida = 0;
    });
  }
}
