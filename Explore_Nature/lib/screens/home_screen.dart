import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart'; 
import 'package:wisata_candi/data/candi_data.dart'; // import data candiList
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart'; // panggil DetailScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Candi'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage:
                  AssetImage('images/sewu.jpeg'), // Menambahkan gambar profil
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),

          //Menambahkan logo profil di pojok kanan menggunakan icon
          // IconButton(
          //   icon: Icon(Icons.account_circle_outlined),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ProfileScreen(),
          //       ),
          //     );
          //   },
          // ),
          //Menggunakan gesturedetector tampilin logo
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ProfileScreen(),
          //       ),
          //     );
          //   },
          //   child: const CircleAvatar(
          //     radius: 20,
          //     backgroundImage: AssetImage(
          //         'images/singosari.jpeg'), // Menambahkan gambar profil
          //   ),
          // )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Menampilkan 2 kolom
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, // Menyesuaikan rasio gambar dengan teks
        ),
        itemCount: candiList.length, // Jumlah item diambil dari candiList
        itemBuilder: (context, index) {
          final candi = candiList[index]; // Mengambil candi berdasarkan index
          return GestureDetector(
            onTap: () {
              // Arahkan ke halaman Detail saat item di-klik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(candi: candi),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar candi
                  Image.asset(
                    candi.imageAsset,
                    fit: BoxFit.cover,
                    height: 182,
                    width: double.infinity,
                  ),
                  // Nama Candi
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      candi.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ': ${candi.location}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Dibangun',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ': ${candi.built}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.house,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Tipe',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        ': ${candi.type}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
