import 'package:flutter/material.dart';
import 'package:unsplash/src/models/modelo_storie.dart';
import 'package:unsplash/src/providers/photos_providers.dart';


class HomePage extends StatelessWidget {

  final provedor = new ProvedorFotos();

  var tamano;

  @override
  Widget build(BuildContext context) {

    tamano = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(title: Text('Wallpapers')),

      body: recibirFuture(),

    );
  }

  Widget recibirFuture(){

     final provedorCasting = ProvedorFotos();

    return FutureBuilder(
      future: provedorCasting.getWallpaper(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if(snapshot.hasData){

          return pageView(snapshot.data);

        }else{

          return Center(child: CircularProgressIndicator());

        }
      },
    );

  }


  Widget pageView(List<Photo> lista) {

    
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 1,
          initialPage: 1
        ),
        pageSnapping: true,
        itemCount: lista.length,
        itemBuilder: (context, i) => card(context, lista[i]),
      )  
    );

  }


  Widget card(BuildContext context, Photo foto){

    provedor.getWallpaper();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              height: tamano.height*0.9,
              width: tamano.width*0.9,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/img/placeholder.jpg'), 
              image: NetworkImage(foto.getUrl())
            ),
          ),
          // FlatButton(child: Text('SET WALLPAPER'), onPressed: (){})
    );

  }
}