import 'package:flutter/material.dart';
import 'package:resto/favoritechangenotifier.dart';
import 'package:provider/provider.dart';


class favoriteIconewidget extends StatefulWidget {

  _favoriteIconewidgetState createState() => _favoriteIconewidgetState();
}

class _favoriteIconewidgetState extends State<favoriteIconewidget> {
   
   late bool _isFavorited;
 
  void _toggleFavorite(Favoritechangenotifier _notifier) {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false ;
      } else {
        _isFavorited = true ;
      }

      _notifier.isFavorited  =  _isFavorited; // nouvelle valeur du isfavorited
    });
  }

  @override
  Widget build(BuildContext context) {
    Favoritechangenotifier _notifier = Provider.of<Favoritechangenotifier>(context);

    _isFavorited = _notifier.isFavorited; // methode pour recuperer e booleen
    return  Row(
      children: [
        IconButton(
        icon:  _isFavorited ? Icon (Icons.favorite) : Icon (Icons.favorite_border),
          color:Colors.red,
          onPressed: ()=> _toggleFavorite(_notifier),
        )
      ],
    );
  }
}

class favoriteTextwidget extends StatefulWidget {

  _favoriteTextwidgetState createState() => _favoriteTextwidgetState();
}

class _favoriteTextwidgetState extends State<favoriteTextwidget> {
   

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Consumer<Favoritechangenotifier> (   
      builder: (context, notifier, _) => Text(notifier.favoriteCount.toString())
    )
      ],
    );
    

  }
}