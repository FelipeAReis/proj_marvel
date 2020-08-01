import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:proj_marvel/Model/historico_model.dart';
import 'package:proj_marvel/Model/moeda_model.dart';
import 'package:http/http.dart' as Http;
import 'package:proj_marvel/constants.dart';
import 'package:localstorage/localstorage.dart';


part 'home_page_controller.g.dart';

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store {

  final HistoricoList list = new HistoricoList();

  
  final LocalStorage storage = new LocalStorage('marvel_app');
  
  
  
  Future<List<HistoricoItem>> recuperaHistoricos() async{    
    List<HistoricoItem> _list = new List<HistoricoItem>();
    var json = storage.getItem('historicos');
    for (var gets in json){
      HistoricoItem item = new HistoricoItem.fromJson(gets);
      _list.add(item);
    } 
   return _list;
  }


  addItem(String valorInicial, double valorFinal, String moedaOrigem, String moedaDestino, String data) {
  
      final item = new HistoricoItem(valorInicial: double.parse(valorInicial.replaceAll(",", ".")), valorFinal: valorFinal, moedaOrigem: moedaOrigem, moedaDestino: moedaDestino, date: data);
      
      if(list.items.length == 0){
        
        var json = storage.getItem('historicos');
    for (var gets in json){
      HistoricoItem item = new HistoricoItem.fromJson(gets);
      list.items.add(item); } 
      }
      list.items.add(item);
      print(list.items.length);
        storage.setItem('historicos', list.toJSONEncodable());

  }
  
  @observable
  double result = 0.0;

  @action
  Future<void> convertMoeda(String valor, String moedaOrigem, String moedaDestino) async{
    String uri = endPoint + "/latest?base=$moedaOrigem&symbols=$moedaDestino";
    Http.Response response = await Http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeJson = jsonDecode(response.body);
      var val = decodeJson["rates"];

      result =  val[moedaDestino] * double.parse(valor.replaceAll(",", "."));
      
      addItem(valor, result, moedaOrigem, moedaDestino, DateTime.now().toString());
    

    }
  }
  
  Future<List<Moeda>> getListaRates() async {
    var uri = endPoint + "/latest";
    Http.Response response = await Http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeJson = jsonDecode(response.body);
     List<Moeda> moedas = new List(); 
    decodeJson["rates"].forEach((key, value) {
      Moeda moeda = new Moeda();
      moeda.nome = key;
      moedas.add(moeda);
    });
      return moedas;
    } else {
      return null;
    }
  }








}
