import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trial2/services/db_data_model.dart';
import 'package:trial2/services/constants.dart';

class FirestoreDB {
  static Future<int> createUserDetails(String firstName, String lastName,
      String dob, String phoneNumber, String gender) async {
    await firebaseFirestore.collection("users").add({
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'phoneNumber': phoneNumber,
      'gender': gender
    });
    return 1;
  }

  static Stream<List<HotelModel>> HotelCardsStream(hotelID) {
    return firebaseFirestore
        .collection('hotel')
        // .orderBy("createdOn", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      // QuerySnapshot contains all the instances stored
      List<HotelModel> cardsList = [];
      for (var cards in query.docs) {
        final cardsInstance = HotelModel.fromHotelDocumentSnapshot(documentSnapshot: cards);
        cardsList.add(cardsInstance);
      }
      return cardsList;
    });
 }

static Future<int> createBookingDetails(String additionalRequest, int amount,
      int bookingID, Timestamp checkInDate, Timestamp checkOutDate, String hotelID, String paymentStatus, int roomID, String status, String userID) async {
    await firebaseFirestore.collection("booking").add({
      'bookingID': bookingID,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'hotelID': hotelID,
      'paymentStatus': paymentStatus,
      'roomID': roomID,
      'status': status,
      'userID': userID,
        'additionalRequest': additionalRequest,
          'amount': amount,
    });
    return 1;
  }
  
static Future<int> createBookmarkDetails(
      int bookmarkID, String hotelID, String userID) async {
    await firebaseFirestore.collection("booking").add({
      'bookmarkID': bookmarkID,
      'hotelID': hotelID,
      'userID': userID,
    });
    return 1;
  }
    
static Future<int> createrRolesDetails(
      String description, String roleName, int roleID) async {
    await firebaseFirestore.collection("booking").add({
      'description': description,
      'roleName': roleName,
      'roleID': roleID,
    });
    return 1;
  }

  static Future<int> createHotelDetails(int NoRooms, String amenities,
      int contactInformation, String hotelDesc,  String hotelID, String hotelName, GeoPoint location, int rating) async {
    await firebaseFirestore.collection("booking").add({
      'NoRooms': NoRooms,
      'amenities': amenities,
      'contactInformation': contactInformation,
      'hotelDesc': hotelID,
      'hotelName': hotelName,
      'location': location,
      'rating': rating,
      'hotelID':hotelID
    });
    return 1;
  }


  static Future<int> createPaymentDetails(int amount, int bookingID,
      Timestamp paymentDate, String paymentID,  String hotelID, String hotelName, String paymentMethod, Timestamp transactionDate) async {
    await firebaseFirestore.collection("booking").add({
      'amount': amount,
      'bookingID': bookingID,
      'paymentDate': paymentDate,
      'paymentID': paymentID,
      'hotelID': hotelID,
      'hotelName': hotelName,
      'paymentMethod': paymentMethod,
      'transacrionDate': transactionDate,
    });
    return 1;
  }

static Future<int> createReviewDetails(Timestamp reviewDate, int rating,
      String userID,  String hotelID, String reviewDesc, int reviewID
      ,) async {
    await firebaseFirestore.collection("booking").add({
      'reviewDate': reviewDate,
      'rating': rating,
      'userID': userID,
      'hotelID': hotelID,
      'reviewDesc': reviewDesc,
      'reviewID': reviewID,
    });
    return 1;
  }
  
  static Future<int> createRoomDetails(int roomID, bool availabitily,
      int pricePerNight,  String hotelID, String roomDesc, String roomType
      ,) async {
    await firebaseFirestore.collection("booking").add({
      'roomID': roomID,
      'availability': availabitily,
      'pricePerNight': pricePerNight,
      'hotelID': hotelID,
      'roomDesc': roomDesc,
      'roomType': roomType,
    });
    return 1;
  }
  
  
}
