import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  late int NoRooms;
  late String amenities;
  late int contactInformation;
  late String hotelDesc;
  late String hotelID;
  late String hotelName;
  late Timestamp location;
  late int rating;

  HotelModel(
    this.NoRooms,
    this.amenities,
    this.contactInformation,
    this.hotelDesc,
    this.hotelID,
    this.hotelName,
    this.location,
    this.rating,
  );

  HotelModel.fromHotelDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    NoRooms = documentSnapshot["NoRooms"];
    amenities = documentSnapshot["amenities"];
    contactInformation = documentSnapshot["contactInformation"];
    hotelDesc = documentSnapshot["hotelDesc"];
    hotelID = documentSnapshot.id;
    hotelName = documentSnapshot["hotelName"];
    location = documentSnapshot["location"];
    rating = documentSnapshot["rating"];
  }
}
