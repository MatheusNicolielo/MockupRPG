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
        modelAux.image2 = model.image2;
        modelAux.iniciatiiva = model.iniciatiiva;
        modelAux.heart = model.heart;

        return true;
      }
    } catch (e) {}
    return false;
  }
}
