class JogadorModel {
  int id;
  String image1;
  String nome;
  int auxiliarVida;
  int iniciatiiva;
  int heart;
  bool proximoJogador = false;

  JogadorModel({
    this.id,
    this.image1,
    this.nome,
    this.auxiliarVida,
    this.heart,
    this.iniciatiiva,
    this.proximoJogador,
  });
}
