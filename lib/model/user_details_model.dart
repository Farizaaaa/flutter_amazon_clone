class UserDetailsModel{
  final String name;
  final String address;
  UserDetailsModel({required this.name,required this.address,});

  Map<String ,dynamic> getjson()=>{
    name: "Aadhi", address: "somewhere"

  };
}
