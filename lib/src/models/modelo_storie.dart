class Photos{

  List<Photo> list = new List();

  Photos.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null) return;

    jsonList.forEach((photo){

      final foto = new Photo.fromJsonMap(photo);
      list.add(foto);

    });

  }

}

class Photo {

  int uniqueId;

  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String src;
  bool liked;

  Photo({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.src,
    this.liked,
  });

  Photo.fromJsonMap( Map <String, dynamic> json ) {

    id              = json['id'];
    width           = json['width'];
    height          = json['height'];
    url             = json['url'];
    photographer    = json['photographer'];
    photographerUrl = json['photographerUrl'];
    photographerId  = json['photographerId'];
    src             = json['portrait'];
    liked           = json['liked'];

  }

  String getUrl(){

    if(id == null){

      return 'https://www.genius100visions.com/wp-content/uploads/2017/09/placeholder-vertical.jpg';

    }else{

      return 'https://images.pexels.com/photos/$id/pexels-photo-$id.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800';

    }

  }


  
}
