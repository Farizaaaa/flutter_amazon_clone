/***
 * USER DETAILS MODEL:2
 * ==================
 * !1.create a class UserDetailsModel
 *  class UserDetailsModel{}
 * !2.declare two variables:name,address
 *   final String name;
 *   final String address;
 * !3.initialize it using the constructor:make it required
 *   UserDetailsModel({required this.name,required this.address});
 * !4.create getJson:getter function to return json file model
 *   Map<String, dynamic> getJson() => {"name":name,"address":address};
 * !5.create getModelFromJson :named constructor function to set json type file
 *   - return type factory
 *   - class.fnNmae
 *   *factory UserDetailsModel.getModelFromJson(Map<String ,dynamic> json)
 *      {
 *       return UserDetailsModel(name:json["name"], address:json["address"]);
 *     }
 * 
 * PRODUCT MODEL:9
 * =============
 * String:url,productName,uid,sellerName
 * 
 * 
 * 
 * 
 */