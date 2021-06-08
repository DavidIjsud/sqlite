



import 'package:flutter/material.dart';
import 'package:sqlitetopico/models/user.dart';
import 'package:sqlitetopico/providers/BD/db_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

     TextEditingController tcontrollerCI , tcontrollerNc , tcontrollerAc, tcontrollerC , tcontrollerCiudad;

     initState(){
        Dbprovider.db.initDB();
        this.tcontrollerCI = new TextEditingController( text: "" );
        this.tcontrollerNc = new TextEditingController( text:"");
        this.tcontrollerAc = new TextEditingController( text: "" );
        this.tcontrollerC = new TextEditingController( text: "" );
        this.tcontrollerCiudad = new TextEditingController( text: "" );

     } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
            title: Text("Registro SQLite"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                    children: [
                         
                          TextField(
                               controller:  this.tcontrollerCI,
                               decoration: InputDecoration(
                                    hintText: "Carnet de identidad",
                                    
                               ),
                               keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 25,),
                          TextField(
                               controller:  this.tcontrollerNc,
                               decoration: InputDecoration(
                                    hintText: "Nombre completo",
                               ),
                          ),
                          SizedBox(height: 25,),
                          TextField(
                               controller:  this.tcontrollerAc,
                               decoration: InputDecoration(
                                    hintText: "Apellido Completo",
                               ),
                          ),
                          SizedBox(height: 25,),
                          TextField(
                               controller:  this.tcontrollerC,
                               decoration: InputDecoration(
                                    hintText: "Celular",
                               ),
                               keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 25,),
                          TextField(
                               controller:  this.tcontrollerCiudad,
                               decoration: InputDecoration(
                                    hintText: "Ciudad",
                               ),
                          ),
                          SizedBox( height: 30 ),

                          MaterialButton(
                              minWidth: 200.0,
                              height: 40.0,
                              onPressed: () {
                                
                                    Usuario nuevoUsuario = Usuario( ci: this.tcontrollerCI.text , nombreCompleto : this.tcontrollerNc.text , apellidoCompleto: this.tcontrollerAc.text , celular: this.tcontrollerC.text 
                                         , ciudad:  this.tcontrollerCiudad.text
                                     ); 



                                  Dbprovider.db.nuevoUsuarioTwo(nuevoUsuario)
                                      .then((value) {
                                           if(value == 0){
                                                final snackBar = SnackBar(content: Text('Usuario ya insertado'));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                           }else{
                                              final snackBar = SnackBar(content: Text('Insertado'));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                           }
                                      });
                      

                              },
                              color: Colors.green,
                              child: Text('Registrar', style: TextStyle(color: Colors.white)),
                            ),
                          

                    ],
              ),
            ),
          ),
    );
  }
}