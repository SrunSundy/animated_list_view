class PlaceListData {

  String imagePath;
  String title;
  String sub;
  double distance;
  double rating;
  int reviews;
  int perNight;

  PlaceListData({

    this.imagePath = '',
    this.title = "",
    this.sub = "",
    this.distance = 1,
    this.rating = 4,
    this.reviews = 100,
    this.perNight = 100
  }
  );


  static List<PlaceListData> list = [
    PlaceListData(
      imagePath: "assets/images/hotel_1.png",
      title: 'Grand Royal Hotel',
      sub: 'Phnom Penh, Cambodia',
      distance: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    PlaceListData(
      imagePath: "assets/images/hotel_2.png",
      title: 'Morok Denyor Hotel',
      sub: 'Kompong Thom, Cambodia',
      distance: 2.0,
      reviews: 20,
      rating: 4.4,
      perNight: 180,
    ),
    PlaceListData(
      imagePath: "assets/images/hotel_3.png",
      title: 'Sopheap Neary Hotel',
      sub: 'London, Cambodia',
      distance: 2.0,
      reviews: 100,
      rating: 4.4,
      perNight: 180,
    ),
    PlaceListData(
      imagePath: "assets/images/hotel_4.png",
      title: 'Bongkalaw hotel Koh Rong',
      sub: 'Koh Rong, Cambodia',
      distance: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 300,
    ),
    PlaceListData(
      imagePath: "assets/images/hotel_5.png",
      title: 'The Internal Build Hotel',
      sub: 'Phnom Penh, Cambodia',
      distance: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 120,
    )
  ];
}