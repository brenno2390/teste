import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Início")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MensagemLifecycleScreen(),
              ),
            );
          },
          child: const Text("Abrir Mensagem"),
        ),
      ),
    );
  }
}

class MensagemLifecycleScreen extends StatefulWidget {
  const MensagemLifecycleScreen({super.key});

  @override
  State<MensagemLifecycleScreen> createState() => _MensagemLifecycleScreenState();
}

class _MensagemLifecycleScreenState extends State<MensagemLifecycleScreen> {

  bool mensagemVisivel = true;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Tela iniciada");
    controller.text = "opa eai vei!";
  }

  @override
  void dispose() {
    print("Tela finalizada");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Requisito: Imprimir ao reconstruir
    print("Tela reconstruída");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ciclo de Vida da Mensagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (mensagemVisivel)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "${controller.text}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Edite o campo",
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {

                setState(() {}); 
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  mensagemVisivel = !mensagemVisivel;
                });
              },
              child: Text(mensagemVisivel ? "Esconder" : "Mostrar"),
            ),
            const SizedBox(height: 12),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Fechar tela"),
            ),
          ],
        ),
      ),
    );
  }
}