import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/**Neste projeto se usará stateful pois o conteudo da tela será modificado*/
void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetField(){
      weightController.text = "";
      heightController.text = "";
      _infoText ="Informe seus dados!";
  }
/**setState muda os elementos na interface a partir de uma função*/
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do Peso IMC= (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 40) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /**Scafold cria a interface com appbar, icones
     * appBar: Vai modificar a Barra "Titulo"*/
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,/**Centraliza a barra de titulo*/
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
        IconButton(icon: Icon(Icons.refresh),
        onPressed: _resetField,),
       ],
      ),
      backgroundColor: Colors.black,
      /**SingleChildScrollView habilita a sobreposição do teclado com
       * os elementos presentes na tela
       * EdgeInsets.fromLTRB define as margens (ESQUERDA, TOPO, DIREITA, FUNDO)
       * para não definir uma altura é só colocar 0.0*/
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
        child: Column(
          /**crossAxis vai definir o eixo horizontal e o strech preenche pela horizontal
           * A imagem não ocupa toda a largura pois foi definido um tamanho
           * já o texto preenche*/
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color:
            Colors.lightBlueAccent,),

            TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso em (Kg)",
                labelStyle: TextStyle(color: Colors.lightBlueAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
              controller: weightController,
            ),

            TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (Cm)",
                labelStyle: TextStyle(color: Colors.lightBlueAccent),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
              controller: heightController,
            ),

            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calculate,
                  child: Text("Calcular", style: TextStyle(color: Colors.black,
                      fontSize: 25.0),),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),

            Text(_infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0,),
            ),
          ],
        ),
      ),
    );
  }
}
