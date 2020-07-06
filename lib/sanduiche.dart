class Sanduiche {
  String _id;
  String _nome;
  String _pao;
  String _queijo;
  String _recheio;
  String _salada;
  String _molho;
  String _acompanhamento;
  String _bebida;

  Sanduiche(this._id, this._nome, this._pao, this._queijo, this._recheio, this._salada, this._molho, this._acompanhamento, this._bebida);

  Sanduiche.map(dynamic obj) {
    this._id = obj['id']; 
    this._nome = obj['nome'];
    this._pao = obj['pao'];  
    this._queijo = obj['queijo'];  
    this._recheio = obj['recheio']; 
    this._salada = obj['salada'];  
    this._molho = obj['molho'];  
    this._acompanhamento = obj['acompanhamento']; 
    this._bebida = obj['bebida'];  
  }

  String get id => _id;
  String get nome => _nome;
  String get pao => _pao;
  String get queijo => _queijo;
  String get recheio => _recheio;
  String get salada => _salada;
  String get molho => _molho;
  String get acompanhamento => _acompanhamento;
  String get bebida => _bebida;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['nome'] = _nome;
    map['queijo'] = _queijo;
    map['recheio'] = _recheio;
    map['salada'] = _salada;
    map['molho'] = _molho;
    map['acompanhamento'] = _acompanhamento;
    map['bebida'] = _bebida;

    return map;
  }

  Sanduiche.fromMap(Map<String, dynamic> map, String id){
    this._id = id ?? '';
    this._nome = map['nome'];
    this._pao = map['pao'];
    this._queijo = map['queijo'];
    this._recheio = map['recheio'];
    this._salada = map['salada'];
    this._molho = map['molho'];
    this._acompanhamento = map['acompanhamento'];
    this._bebida = map['bebida'];
  }

}