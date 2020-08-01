import 'package:flutter/material.dart';
import 'package:proj_marvel/Controller/home_page_controller.dart';
import 'package:proj_marvel/Model/historico_model.dart';
import 'package:intl/intl.dart';

HomePageController homeController = new HomePageController();

class HistoricoPage extends StatelessWidget {

  
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    

    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico"),
    
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
              width: size.width,
              height: size.height,
              child: FutureBuilder(
                future: homeController.recuperaHistoricos(),
                builder: (context, AsyncSnapshot snapshot){
                  if(!snapshot.hasData)
                    return Container();

                    List<HistoricoItem> item = snapshot.data;
                    
                 
                     return (item != null) ?
                     ListView.separated(
                      itemBuilder: (context, index){
                        return ListTile(
                      title: 
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Moeda: " + item[index].moedaOrigem),
                                    Icon(Icons.compare_arrows),
                                    Text("Moeda: " + item[index].moedaDestino),
                                ],),
                                 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>
                                [
                                  Text("\$ " + item[index].valorInicial.toStringAsFixed(2)),
                                  
                                  Text("\$ " + item[index].valorFinal.toStringAsFixed(2)),
                                ],)
                              ],
                            ),
                      
                      
                      subtitle: Center(child:  Text(DateFormat("dd/MM/yyyy H:m:s").format(DateTime.parse(item[index].date)) ,))
                      
                     
                      
                      );
                      
                      }, 
                      separatorBuilder: (context, index) => Divider(), 
                      itemCount: item.length) : Center(child: CircularProgressIndicator(),);
                    
                    
                 

                })
                  )
                  ),
    );
  }
}
