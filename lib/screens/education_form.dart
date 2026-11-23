import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _educationName = "";
  String _category = "Formal"; // default
  String _institution = "";
  String _yearStart = DateTime.now().year.toString();
  String _yearEnd = "";

    final List<String> _categories = [
    'Formal',
    'Informal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Education Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Education Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Edukasi",
                    labelText: "Nama Edukasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _educationName = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama edukasi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori Edukasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories
                    .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                      ))
                    .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Institution ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Universitas Indonesia, Universitas Pancasila, dll",
                    labelText: "Institusi Penyelenggara Edukasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === year_start ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tidak bisa melewati tahun sekarang",
                    labelText: "Tahun Mulai Edukasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _yearStart = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty || int.tryParse(value) == null || value.startsWith('-')) {
                      return "Tahun mulai tidak boleh kosong dan harus merupakan tahun yang valid!";
                    }
                    if (int.parse(_yearStart) > DateTime.now().year) {
                      return "Tahun mulai tidak bisa lebih besar dari tahun sekrang";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tidak bisa lebih kecil dari tahun mulai",
                    labelText: "Tahun selesai Edukasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _yearEnd = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty || int.tryParse(value) == null || value.startsWith('-')) {
                      return "Tahun selesai tidak boleh kosong dan harus merupakan tahun yang valid!";
                    }
                    int yearEndInt = int.parse(_yearEnd);
                    if (yearEndInt < int.parse(_yearStart)) {
                      return "Tahun selesai tidak bisa lebih kecil dari tahun mulai";
                    }
                    return null;
                  },
                ),
              ),

              // === save button ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                        WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edukasi berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('Nama Edukasi: $_educationName'),
                                Text('Kategori: $_category'),
                                Text('Institusi Penyelenggara: $_institution'),
                                Text('Tahun Mulai: $_yearStart'),
                                Text('Tahun Selesai: $_yearEnd'),
                                ],
                              ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}