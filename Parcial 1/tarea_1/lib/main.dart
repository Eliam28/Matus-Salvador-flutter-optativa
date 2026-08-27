import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

       appBar: AppBar(
        title: const Text("Mi primera app"),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
       ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            
            SizedBox(height: 20),

            const Text(
              "Formulario de alumnos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),

            SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),

              child: Column(
                children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Escriba su nombre",
                        labelText: "Nombre",
                        border: OutlineInputBorder()
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      decoration: InputDecoration(
                        hintText: "Escriba su apellido",
                        labelText: "Apellido",
                        border: OutlineInputBorder()
                      ),
                    ),

                    const SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () => {}, 
                      child: Text("Guardar"),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(200, 50)
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: 35),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () => {}, 
                    icon: const Icon(Icons.favorite),
                    color: Colors.red,
                    iconSize: 50,
                  ),

                  IconButton(
                    onPressed: () => {}, 
                    icon: const Icon(Icons.add),
                    color: Colors.green,
                    iconSize: 50,
                  ),
                  
                  IconButton(
                    onPressed: () => {}, 
                    icon: const Icon(Icons.home),
                    color: Colors.deepPurpleAccent,
                    iconSize: 50,
                  ),

                ],
              ),
            ),

            SizedBox(height: 20),

            const Text(
              "Esta es mi imagen",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(height: 20),

            Image.network(
              "https://images.cults3d.com/AWtDvIxrgVDuhgK4jJkMo9EnguM=/516x516/filters:no_upscale():format(webp)/https://fbi.cults3d.com/uploaders/14252721/illustration-file/f1543ab6-c3c2-42f7-ac0d-57654a4b0e01/Xavier's-School-logo-2.png",
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
        
      ),
    );
  }
}