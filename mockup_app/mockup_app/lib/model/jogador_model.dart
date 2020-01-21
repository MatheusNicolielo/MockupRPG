class JogadorModel {
  int id;
  String image1;
  String nome;
  int auxiliarVida;
  int iniciativa;
  int heart;
  bool jogadorAtual = false;

  JogadorModel({
    this.id,
    this.image1,
    this.nome,
    this.auxiliarVida,
    this.heart,
    this.iniciativa,
    this.jogadorAtual,
  });
}
