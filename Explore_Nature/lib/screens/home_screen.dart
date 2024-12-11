import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/data/candi_data.dart'; // Mengimpor data candiList
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart'; // Mengimpor ProfileScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController =
      TextEditingController(); // Controller untuk pencarian
  List<Candi> _filteredCandiList =
      candiList; // Daftar candi yang ditampilkan berdasarkan pencarian

  @override
  void initState() {
    super.initState();
  }

  void _filterCandiList() {
    setState(() {
      _filteredCandiList = candiList
          .where((candi) => candi.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Candi'),
        backgroundColor: Color.fromARGB(
            255, 54, 165, 6), // Warna hijau untuk keseragaman tema
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // Ikon pencarian
            onPressed: () {
              showSearch(
                context: context,
                delegate: CandiSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundImage:
                  AssetImage('images/sewu.jpeg'), // Menambahkan gambar profil
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen(), // Arahkan ke halaman Profile
                ),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Logika refresh atau pemanggilan data terbaru
          setState(() {
            // Menggunakan setState untuk mengupdate tampilan, misalnya menyegarkan data candi
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Menampilkan 2 kolom
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75, // Menyesuaikan rasio gambar dengan teks
            ),
            itemCount: _filteredCandiList
                .length, // Menampilkan data yang sudah difilter
            itemBuilder: (context, index) {
              final candi = _filteredCandiList[
                  index]; // Mengambil data candi berdasarkan index
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
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 5, // Memberikan efek elevasi pada kartu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // Membuat sudut kartu melengkung
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Menampilkan gambar candi
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.asset(
                            candi.imageAsset,
                            fit: BoxFit.cover,
                            height: 182,
                            width: double.infinity,
                          ),
                        ),
                        // Menampilkan nama candi
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

                        // Menampilkan lokasi candi
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
                        // Menampilkan tahun pembangunan candi
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
                        // Menampilkan tipe candi
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
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Indeks halaman aktif
        onTap: (index) {
          // Arahkan ke halaman yang sesuai berdasarkan tab yang dipilih
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Pencarian candi dengan delegate
class CandiSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = candiList
        .where(
            (candi) => candi.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final candi = results[index];
        return ListTile(
          title: Text(candi.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(candi: candi),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = candiList
        .where(
            (candi) => candi.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final candi = suggestions[index];
        return ListTile(
          title: Text(candi.name),
          onTap: () {
            query = candi.name;
            showResults(context);
          },
        );
      },
    );
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }
}
