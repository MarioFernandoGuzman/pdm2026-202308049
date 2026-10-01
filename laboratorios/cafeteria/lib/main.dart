import 'package:flutter/material.dart';

void main() {
  runApp(const MiCafeteriaApp());
}

class MiCafeteriaApp extends StatelessWidget {
  const MiCafeteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafetería',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MiPedidoScreen(),
    );
  }
}

class MiPedidoScreen extends StatefulWidget {
  const MiPedidoScreen({super.key});

  @override
  State<MiPedidoScreen> createState() => _MiPedidoScreenState();
}

class _MiPedidoScreenState extends State<MiPedidoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pedido'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Interfaz preparada para insertar los productos.'),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nombre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Q${precio.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: onRemove,
              ),
              Text('$cantidad', style: const TextStyle(fontSize: 18)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: onAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}