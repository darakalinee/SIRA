import 'package:flutter/material.dart';
import './page_indicator.dart';
import './pageBody.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stepFormState();
  }
}

class _stepFormState extends State<StepForm> {
  final _stepFormController = PageController();
  int _page = 0;
  List _pagesList = [
    pageBody(
        'https://imagensemoldes.com.br/wp-content/uploads/2020/05/Cartoon-L%C3%A2mpada-PNG.png',
        'LAMPADA',
        'LIGAR LAMPADA'),
    pageBody(
        'https://lh3.googleusercontent.com/proxy/FPpxxAPaCKJwsMIRbCzphcaz4Mk2CtPWOuR_0g7fm4EtdX8bcnlwnpFbN7g03s2mvyq3TaVKI3eycT_mqFpMyyVBaZ-RB0JouJAXZwa43EA_dTJY4eeAEFp_btw4U2UoD3b8GsLcMt3u',
        'TOMADA',
        'LIGAR TOMADA'),
    pageBody(
        'https://imagensemoldes.com.br/wp-content/uploads/2020/06/Desenho-de-Ar-Condicionado-PNG.png',
        'AR CONDICIONADO',
        'LIGAR AR CONDICIONADO'),
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem vindo a SIRA')),
      body: PageView.builder(
          controller: _stepFormController,
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FlatButton(
          onPressed: () => _changeStep(false),
          child: Text('Anterior'),
        ),
        pageIndicator(_page == 0),
        pageIndicator(_page == 1),
        pageIndicator(_page == 2),
        FlatButton(
          onPressed: () => _changeStep(true),
          child: Text('Proximo'),
        ),
      ]),
    );
  }
}
