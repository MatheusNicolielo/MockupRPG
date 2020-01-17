import 'package:mockup_app/model/jogador_model.dart';

class Service {
  static List<JogadorModel> _lista = [];

  static Future<List<JogadorModel>> getListaJogador() async {
    return _lista;
  }

  static bool addJogador(JogadorModel model) {
    try {
      model.id = DateTime.now().millisecondsSinceEpoch;
      _lista.add(model);
      ordenarLista(_lista);
    } catch (e) {
      return false;
    }
    return true;
  }

  static void deleteJogador(int id) {
    try {
      _lista.removeWhere((value) {
        return value.id == id;
      });
    } catch (e) {}
  }

  static bool attJogador(JogadorModel model) {
    try {
      var modelAux = _lista.firstWhere((value) {
        return value.id == model.id;
      }, orElse: () {
        return null;
      });

      if (modelAux != null && model != null) {
        modelAux.image1 = model.image1;
        modelAux.iniciatiiva = model.iniciatiiva;
        modelAux.heart = model.heart;
        ordenarLista(_lista);
        return true;
      }
    } catch (e) {}
    return false;
  }

  static void ordenarLista(List<JogadorModel> _list) {
    try {
      _list.sort((b, a) => a.iniciatiiva.compareTo(b.iniciatiiva));
    } catch (e) {}
  }

  static void setarJogadorAtual(List<JogadorModel> _list) {
    try {
      _list.elementAt(0).jogadorAtual = true;
    } catch (e) {}
  }

  static void mudarTurno() {
    JogadorModel auxiliarJogador = _lista.elementAt(0);
    try {
      _lista.removeAt(0);
      _lista.add(auxiliarJogador);
    } catch (e) {}
  }
}
