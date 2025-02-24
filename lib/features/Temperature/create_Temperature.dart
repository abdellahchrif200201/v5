

import 'package:devti_agro/core/widgets/Custom_dropdown/DropDown.dart';
import 'package:devti_agro/core/widgets/Custom_form_element/FomElement.dart';
import 'package:flutter/material.dart';


class CreateTemperature extends StatefulWidget {
  @override
  _CreateTemperatureState createState() => _CreateTemperatureState();
}

class _CreateTemperatureState extends State<CreateTemperature> {


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text('Create Temperature'),
        iconTheme: IconThemeData(
          color: Colors.black, // Change this to the desired color
        ),
      )
      ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Infos générales',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              FormElement(hint: "nom de cleient",label: "Nom",),
              const SizedBox(height: 16),
              Dropdown(dropDownItem: ["zon1" , "zone3" ],hint: "select  zone",label: "zone",),
              const SizedBox(height: 16),


              FormElement(hint: "nom de produit",label: "Nom",),
              const SizedBox(height: 50.0),
              GestureDetector(
                onTap: () => print("this is submit button"),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border : Border.all()
                  ),
                  width: double.infinity,
                  child: Text("Save" , style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center,),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}




