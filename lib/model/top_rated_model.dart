class Rating {
  final String image;
  final String hotelname;
  final String hotellocation;
  final String price;
  final double rating;
  final int reviews;

  Rating(
    this.image,
    this.hotelname,
    this.hotellocation,
    this.price,
    this.rating,
    this.reviews,
  );

  static List<Rating> dataSample = <Rating>[
    Rating(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe91lmkQ2L86B_0m3dPKjzK3lt13pD_BHxwg&s',
        'Hotel 1',
        'Makola, Ghana',
        '\$25.00',
        4.5,
        1000),
    Rating(
        'https://cdn.pixabay.com/photo/2016/11/17/09/28/hotel-1831072_640.jpg',
        'tusefkk Hotel',
        'Ashaiman, Ghana',
        '\$18.00',
        4.5,
        1000),
    Rating(
        'https://media.istockphoto.com/id/472899538/photo/downtown-cleveland-hotel-entrance-and-waiting-taxi-cab.jpg?s=612x612&w=0&k=20&c=rz-WSe_6gKfkID6EL9yxCdN_UIMkXUBsr67884j-X9o=',
        'Movenpick Hotel',
        'Circle, Ghana',
        '\$24.00',
        4.5,
        1000),
    Rating(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe91lmkQ2L86B_0m3dPKjzK3lt13pD_BHxwg&s',
        'Movenpick Hotel',
        'Makola, Ghana',
        '\$20.00',
        4.5,
        1000),
  ];
}
