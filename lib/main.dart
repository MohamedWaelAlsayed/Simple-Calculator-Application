import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyCalculator2(),
));
}
class MyCalculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return null;
  }

}
class MyCalculator2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyCalculator2State();
  }

}
class _MyCalculator2State extends State<MyCalculator2>{
  dynamic text="0";
  double number1=-1;
  double number2=-1;
  var result="";
  dynamic finalresulat="0";
 dynamic operation =null;
  dynamic previousoperation=null;
  double number3=0;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("Calculator"),centerTitle: true,backgroundColor: Colors.teal,),
       backgroundColor: Colors.black,
       body: Container(
         margin: EdgeInsets.only(bottom: 20,top: 20),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [

              Row(
                children: [

                  Expanded(child:
                  Text(text,
                    style:
                    TextStyle(color: Colors.white,
                        fontSize: 60,),
                   maxLines: 1,
                   textAlign: TextAlign.right,
                  )
                  )
                ],
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

               children: [
         BuildContainter("C", Colors.teal,Colors.white,1),
         BuildContainter("+/-", Colors.teal,Colors.white,1),
                 BuildContainter("%", Colors.teal, Colors.white,1),
                 BuildContainter("/", Colors.lightGreen, Colors.white,1)
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

               children: [
                 BuildContainter("7", Colors.white,Colors.black,1),
                 BuildContainter("8", Colors.white,Colors.black,1),
                 BuildContainter("9", Colors.white,Colors.black,1),
                 BuildContainter("x", Colors.lightGreen,Colors.white,1),

               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

               children: [
                 BuildContainter("4", Colors.white,Colors.black,1),
                 BuildContainter("5", Colors.white,Colors.black,1),
                 BuildContainter("6", Colors.white,Colors.black,1),
                 BuildContainter("-", Colors.lightGreen,Colors.white,1),

               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 BuildContainter("1", Colors.white,Colors.black,1),
                 BuildContainter("2", Colors.white,Colors.black,1),
                 BuildContainter("3", Colors.white,Colors.black,1),
                 BuildContainter("+", Colors.lightGreen,Colors.white,1),

               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 BuildContainter("0", Colors.white,Colors.black,0),
                 BuildContainter(".", Colors.white,Colors.black,1),
                 BuildContainter("=", Colors.lightGreen,Colors.white,1),

               ],
             )
           ],
         ),
       ),
     )
     ;
  }
  Widget BuildContainter(String txt,Color color,Color color2,int x){
    Container container=null;
    if(x==0){
      return Container(
//      color: Colors.white,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10,),
        child:
        RaisedButton(onPressed: (){
 Caclucate(txt);
        },child: Text(txt,
          style: TextStyle(color: color2,fontSize: 45,
          ),
        ),

          padding:EdgeInsets.only(left: 75,right: 75,top: 10,bottom: 10) ,
          shape: StadiumBorder(),
          color: color,),

      );
    }else {
      return Container(
//      color: Colors.white,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10,),
        child:
        RaisedButton(onPressed: () {
   Caclucate(txt);
        },
          child: Text(txt,
            style: TextStyle(color: color2, fontSize: 40,
            ),
          ),

          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
          color: color,),

      );
    }
  }
  void Caclucate ( String txtbtn){
 if (txtbtn=="C"){
    text="0";
  number1=-1;
   number2=-1;
    result="";
  finalresulat="0";
    operation =null;
    previousoperation=null;
 }else if (operation=="=" && txtbtn=="="){
   if(previousoperation=="+")
     finalresulat=Add();
   else if(previousoperation=="-")
     finalresulat=Sub();
     else if(previousoperation=="x")
       finalresulat=Mul();
     else if(previousoperation=="/")
       finalresulat=Div();

 }
 else if(operation=="=" && txtbtn=="%"){
   number1=number1/100;
   finalresulat=number1.toString();
 }
 else if(txtbtn=="+" || txtbtn=="-" || txtbtn=="x" || txtbtn=="/" || txtbtn=="="){
   if(number1==-1){
     number1=double.parse(result.toString());}
     else {

       number2=double.parse(result.toString());
   }

     switch(operation){
       case "+":
         finalresulat=Add();
         break;
       case "-":
         finalresulat=Sub();
         break;
       case "x":
         finalresulat=Mul();
         break;
       case "/":
         finalresulat=Div();
         break;
     }
     previousoperation=operation;
     operation=txtbtn;
      if (!(txtbtn=="="))
      result="";


 }
 else if (operation=="=" && txtbtn=="+/-"){
   if(number1.toString().contains("-")){
     number1=double.parse(number1.toString().substring(1));
     result=number1.toString();
   finalresulat=DoesContainDot();}
   else{
     number1=double.parse(("-"+number1.toString()));
     result=number1.toString();
   finalresulat=DoesContainDot();
   }
  }else if(txtbtn=="%"){

   number3=double.parse(result);

   result=(number3/100).toString();
   finalresulat=result;

 }else if(txtbtn=="."){
   if(!(result.toString().contains(".")))
     result=result.toString()+".";
   finalresulat=result;
 }
 else if (txtbtn=="+/-"){
   if (result.toString().startsWith("-"))
     result=result.substring(1);
   else
   result="-"+result.toString();

   finalresulat=result;

 }
 else{
   result=result+txtbtn;
   finalresulat=result;
 }
 setState(() {
   text=finalresulat;
 });
  }
  String Add(){
    result=(number1+number2).toString();
    number1=double.parse(result.toString());
    return DoesContainDot();
  }
  String Sub(){
    result=(number1-number2).toString();
    number1=double.parse(result.toString());
    return DoesContainDot();
  }
  String Mul(){
    result=(number1*number2).toString();
    number1=double.parse(result.toString());
    return DoesContainDot();
  }
  String Div(){
    result=(number1/number2).toString();
    number1=double.parse(result.toString());
    return DoesContainDot();
  }
  String DoesContainDot(){
    List <String> splitnumber=result.toString().split(".");
    if(!(int.parse(splitnumber[1])>0)){
      return splitnumber[0];
    }
      return result;

  }

}

