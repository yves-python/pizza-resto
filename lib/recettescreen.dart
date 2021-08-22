import 'package:flutter/material.dart';
import 'package:resto/favoritechangenotifier.dart';
import 'package:resto/favoritewidget.dart';
import 'package:resto/recip.dart';
import 'favoritewidget.dart';
import 'package:provider/provider.dart';


class recettescreen extends StatelessWidget {

const recettescreen({Key? key, required this.recip}) : super(key: key);

final Recip recip;

  @override
  Widget build(BuildContext context) {
        Widget titleSection = Container(
              padding: const EdgeInsets.all(10),  // marge interieur general sur tout les cote du container 
              child: Row( children: [
                  Expanded(child:   // "Expanded" est un mot cle qui permet detendre toute la colonne 
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // alignement a gauche
                  children: [
                    Container ( 
                    padding: const EdgeInsets.only(bottom: 8), // marge interieur du container de 8 px vers le bas
                    child :   Text(recip.title , 
                    style: TextStyle( 
                    fontWeight:  FontWeight.bold,
                    fontSize: 20,
                        ),
                      ),
                    ),
                    Text(recip.user, 
                    style: TextStyle(
                      color:Colors.grey[500],
                      fontSize: 16,
                      ),
                    )
                    ],
                ),
              ),

            favoriteIconewidget(),
            favoriteTextwidget()


              ],
            ),
          ); 

    Widget buttonsection =   Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // espace tout autour des deux element
                children: [
                  _buildButtonColumn(Colors.blue, Icons.comment, "Comment"),
                  _buildButtonColumn(Colors.blue, Icons.share ,"Partager"),
                ],
              ),
            );

    Widget descriptionsection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(recip.description,
      softWrap:true, // softWrap permet de ne pas couper les mots en plain milieu
      ),
      
    );
    return ChangeNotifierProvider(
      create: (BuildContext context) { Favoritechangenotifier(
    recip.isfavorite    , recip.favoritcount) ; 
    },
      child: Scaffold(
          appBar: AppBar(
            title: Text("mes recettes"),
          ),
          body: ListView( children: [           // ListView permet de scroller dans la page
          //  FadeInImage.assetNetwork(
          //   placeholder: 'images/pizza.jpg',
          //   image: 'https://picsum.photos/250?image=9',
          //       width: 600,
          //       height: 240,
          //       fit: BoxFit.cover, // permet dafficher au mieux limage
          //    ),
           Image.asset(recip.imageurl,
                width: 600,
                 height: 240,
                  fit: BoxFit.cover
               ),
              titleSection,
              buttonsection,
              descriptionsection
            ],
          )
          
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {  // on cree une nethode qui va nous permetre de repeter deux fois une meme colonne 

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child:Icon(icon, color: color),
        ),
        Text(label, 
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: color 
         ),
        )
      ],
    );
  }
}