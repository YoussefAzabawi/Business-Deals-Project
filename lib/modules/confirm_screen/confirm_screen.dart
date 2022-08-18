import 'package:business_deals/modules/settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(ConfirmScreen());
            },
          ),
          backgroundColor:Colors.teal[400],
          title: Text("Profile",style: TextStyle(),

          ),
          centerTitle: true,
        ),
        body:Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Text("Confirmation Code Number",
                      style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Spacer(
                        flex: 1),
                    Expanded(

                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        onChanged: (value){
                          print(value);
                        },

                        validator: (value){
                          if(value!.isNotEmpty && value.length==1){
                            return null;
                          }else if(value.length<1&&value.isNotEmpty){
                            return ' unvalid';
                          } else if(value.length>1&&value.isNotEmpty){
                            return 'unvalid';
                          }
                          else{
                            return 'codenum';
                          }
                        },

                      ),
                    ),
                    Spacer(
                        flex: 1),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        onChanged: (value){
                          print(value);
                        },
                        validator: (value){
                          if(value!.isNotEmpty && value.length==1){
                            return null;
                          }else if(value.length<1&&value.isNotEmpty){
                            return ' unvalid';
                          } else if(value.length>1&&value.isNotEmpty){
                            return 'unvalid';
                          }else{
                            return 'codenum';
                          }

                        },




                      ),
                    ),
                    Spacer(
                        flex: 1),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        onChanged: (value){
                          print(value);
                        },
                        validator: (value){
                          if(value!.isNotEmpty && value.length==1){
                            return null;
                          }else if(value.length<1&&value.isNotEmpty){
                            return ' unvalid';
                          } else if(value.length>1&&value.isNotEmpty){
                            return 'unvalid';
                          }else{
                            return 'codenum';
                          }

                        },

                      ),
                    ),
                    Spacer(
                        flex: 1),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (value){
                          print(value);
                        },
                        onChanged: (value){
                          print(value);
                        },
                        validator: (value){
                          if(value!.isNotEmpty && value.length==1){
                            return null;
                          }else if(value.length<1&&value.isNotEmpty){
                            return ' unvalid';
                          } else if(value.length>1&&value.isNotEmpty){
                            return 'unvalid';
                          }
                          else{
                            return 'codenum';
                          }
                        },

                      ),
                    ),
                    Spacer(
                      flex:1,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 3,),

              SizedBox(
                height: 40,
                width: 350,
                child: RaisedButton(
                  onPressed: (){
                  if(!formKey.currentState!.validate()){
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.orange[300],
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:20
                    ),
                  ),
                ),

              ),
              Spacer(flex: 1,)
            ],
          ),
        ),
      );
  }

}
