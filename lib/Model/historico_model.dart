class HistoricoItem {
  String moedaOrigem;
  String moedaDestino;
  double valorInicial;
  double valorFinal;
  String date;

  HistoricoItem({
    this.moedaOrigem,
    this.moedaDestino,
    this.valorInicial,
    this.valorFinal,
    this.date 
    });

  toJSONEncodable() {
    Map<String, dynamic> historico = new Map();

    historico['moedaOrigem'] = moedaOrigem;
    historico['moedaDestino'] = moedaDestino;
    historico['valorFinal'] = valorInicial;
    historico['valorInicial'] = valorFinal;
    historico['date'] = date;
    return historico;
  }

  HistoricoItem.fromJson(Map<String, dynamic> json) :
    
    moedaOrigem = json['moedaOrigem'],
    moedaDestino = json['moedaDestino'],
    valorInicial = json['valorFinal'],
    valorFinal = json['valorInicial'],
    date = json['date'] ;
}

class HistoricoList {
  List<HistoricoItem> items;

  HistoricoList() {
    items = new List();
  }

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}
