import 'package:business_deals/modules/confirm_screen/confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ChangeNumScreen extends StatefulWidget {
  @override
  State<ChangeNumScreen> createState() => _ChangeNumScreenState();
}
class _ChangeNumScreenState extends State<ChangeNumScreen> {
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading:IconButton(
          onPressed: (){
            Navigator.of(context).pop(ChangeNumScreen());
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.teal[400],
        title: Text("Profile") ,
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
                  Text("Change Phone Number",
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
                    flex: 1,
                  ),
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon:Icon (Icons.phone_android,size: 20,
                        ),
                        labelText: "Phone Number",

                      ),
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (value){
                        print(value);
                      },
                      onChanged: (value){
                        print(value);
                      },

                      validator: (value){
                        if(value!.isNotEmpty && value.length==11){
                          return null;
                        }else if(value.length<11&&value.isNotEmpty){
                          return 'please Enter full value';
                        } else if(value.length>11&&value.isNotEmpty){
                          return 'please Enter correct value';
                        }
                        else{
                          return 'please enter phone number';
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
              child: RaisedButton(onPressed: (){
                if(!formKey.currentState!.validate()){
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmScreen(),
                  ),
                );
              },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.orange[300],
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20,

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
