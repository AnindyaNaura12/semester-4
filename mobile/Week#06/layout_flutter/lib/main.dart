import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // --- Langkah 4: Implementasi titleSection ---
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32), // Jawaban Soal 3 (Padding 32)
      child: Row(
        children: [
          Expanded(
            /* soal 1: Menggunakan Expanded agar kolom mengambil sisa ruang */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Jawaban Soal 1
              children: [
                /* soal 2: Container untuk memberi padding bawah pada teks pertama */
                Container(
                  padding: const EdgeInsets.only(bottom: 8), // Jawaban Soal 2
                  child: const Text(
                    'The Beautiful of London',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'London, United Kingdom',
                  style: TextStyle(
                    color: Colors.grey[500], // Jawaban Soal 2 (Warna abu-abu)
                  ),
                ),
              ],
            ),
          ),
          /* soal 3: Ikon bintang dan teks angka 41 */
          Icon(
            Icons.star,
            color: Colors.red[500], // Jawaban Soal 3 (Warna merah)
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'London is the capital city of the United Kingdom and one of the most popular travel destinations in the world. '
        'It is famous for its rich history, beautiful architecture, and iconic landmarks such as Big Ben, Tower Bridge, '
        'and the London Eye. The city offers a unique mix of modern life and historical heritage, making it attractive '
        'for tourists, students, and professionals. With its diverse culture, museums, shopping areas, and public parks, '
        'London provides a vibrant and unforgettable experience for visitors.\n\n'
        'Anindya Naura Putri Azzahra 244107060051',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );
    
    return MaterialApp(
      title: 'Flutter layout: Anindya Naura Putri Azzahra 244107060051', // Ganti dengan Nama & NIM
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // Mengganti 'Hello World' dengan titleSection sesuai gambar terakhir
        body: ListView(
          children: [
            Image.asset(
              'images/london.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}