
import 'package:flutter/cupertino.dart';

class Favoritechangenotifier with ChangeNotifier {
   bool _isFavorited;
   final int _favoritecount;

Favoritechangenotifier(this._isFavorited, this._favoritecount);

bool get isFavorited => _isFavorited;
int get favoriteCount => _favoritecount + (_isFavorited ? 1 : 0); // si le favorie est verifier ajoute 1 sinon zero 

// il sagit ici de la methode qui va modifier le booleen
  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners(); // methonde de notification a lecoute du  ChangeNotifier
  }
}