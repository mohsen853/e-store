import 'package:get/get.dart';

validInput(String val,int min,int max,String type){
  if(val.isEmpty){
    return "52".tr;
  }
  if(type=="username"){
    if(!GetUtils.isUsername(val)){
      return "47".tr;
    }
  }
  if(type=="email"){
    if(!GetUtils.isEmail(val)){
      return "48".tr;
    }
  }
  if(type=="phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "49".tr;
    }
  }
  if(type=="price"){
    if(!GetUtils.isNum(val) && double.parse(val)>0){
      return "103".tr;
    }
  }
  if(val.length<min){
    return "${"50".tr}$min";
  }
  if(val.length>max){
    return "${"51".tr}$max";
  }
  return null;
}