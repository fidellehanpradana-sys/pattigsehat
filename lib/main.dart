import 'package:flutter/material.dart';

void main() {
  runApp(const PattigSehat());
}

class PattigSehat extends StatelessWidget {
  const PattigSehat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PattigSehat',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF7F9FF),
      ),
      home: const BerandaPage(),
    );
  }
}

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int selectedNav = 0;
  int selectedMenu = 0;

  final Color biru = const Color(0xFF0875F9);
  final Color navy = const Color(0xFF10134F);

  Widget menuAtas(IconData icon, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedMenu = index;
          });
        },
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: selectedMenu == index
                ? const Color(0xFFDCE9FF)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Icon(
            icon,
            size: 38,
            color: selectedMenu == index ? biru : const Color(0xFF5353A8),
          ),
        ),
      ),
    );
  }

  Widget kartu({
    required IconData icon,
    required String judul,
    required String deskripsi,
    required Color warna,
    bool kecil = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9BB7F5).withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: kecil ? 75 : 85,
            height: kecil ? 75 : 85,
            decoration: BoxDecoration(
              color: warna.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: warna, size: kecil ? 43 : 48),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  judul,
                  style: TextStyle(
                    color: navy,
                    fontSize: kecil ? 18 : 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  deskripsi,
                  style: TextStyle(
                    color: kecil ? navy : const Color(0xFF565EAE),
                    fontSize: kecil ? 23 : 16,
                    fontWeight: kecil ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 35, color: Color(0xFF5555B2)),
        ],
      ),
    );
  }

  Widget duaKartu({required Widget kiri, required Widget kanan}) {
    return Row(
      children: [
        Expanded(child: kiri),
        const SizedBox(width: 12),
        Expanded(child: kanan),
      ],
    );
  }

  Widget navbarBawah() {
    return Container(
      height: 95,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
        boxShadow: [
          BoxShadow(color: Colors.blue.withOpacity(0.08), blurRadius: 15),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemNavbar(Icons.home_rounded, 'Beranda', 0),
          itemNavbar(Icons.bar_chart_rounded, 'Statistik', 1),

          // Tombol tambah
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu tambah dipilih')),
              );
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: biru,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: biru.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 45),
            ),
          ),

          itemNavbar(Icons.notifications, 'Notifikasi', 2),
          itemNavbar(Icons.settings, 'Pengaturan', 3),
        ],
      ),
    );
  }

  Widget itemNavbar(IconData icon, String nama, int index) {
    bool aktif = selectedNav == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNav = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: aktif ? biru : const Color(0xFF8588AE)),
          const SizedBox(height: 5),
          Text(
            nama,
            style: TextStyle(
              color: aktif ? biru : const Color(0xFF8588AE),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (aktif)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 45,
              height: 3,
              decoration: BoxDecoration(
                color: biru,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF0866E8), const Color(0xFF388BFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(55),
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '9:41',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_alt, color: Colors.white),
                          SizedBox(width: 8),
                          Icon(Icons.wifi, color: Colors.white),
                          SizedBox(width: 8),
                          Icon(Icons.battery_full, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            '100%',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PattigSehat',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 29,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 43,
                              color: Color(0xFF5555A9),
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // MENU ATAS
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      children: [
                        menuAtas(Icons.grid_view_rounded, 0),
                        menuAtas(Icons.directions_walk, 1),
                        menuAtas(Icons.nightlight_round, 2),
                        menuAtas(Icons.favorite_border, 3),
                        menuAtas(Icons.directions_run, 4),
                        menuAtas(Icons.restaurant, 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // KONTEN BERANDA
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Beranda',
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // BANNER SELAMAT DATANG
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFDCEAFF), Color(0xFFC8DCFF)],
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.directions_run,
                            size: 85,
                            color: Color(0xFF0875F9),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: navy,
                                  fontSize: 17,
                                  height: 1.5,
                                ),
                                children: const [
                                  TextSpan(text: 'Selamat datang di '),
                                  TextSpan(
                                    text: 'pattigsehat',
                                    style: TextStyle(
                                      color: Color(0xFF0875F9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nsolusi kesehatan sekolah. Mari wujudkan lingkungan sekolah lebih sehat',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // BERAT DAN TINGGI BADAN
                    duaKartu(
                      kiri: kartu(
                        icon: Icons.fitness_center,
                        judul: 'Berat Badan',
                        deskripsi: '80 kg',
                        warna: const Color(0xFF2585FF),
                        kecil: true,
                      ),
                      kanan: kartu(
                        icon: Icons.monitor_weight,
                        judul: 'Tinggi Badan',
                        deskripsi: '168 cm',
                        warna: const Color(0xFF7045F5),
                        kecil: true,
                      ),
                    ),

                    const SizedBox(height: 16),

                    kartu(
                      icon: Icons.local_fire_department,
                      judul: 'Riwayat Penyakit',
                      deskripsi: 'Lihat riwayat kesehatan Anda',
                      warna: Colors.deepOrange,
                    ),

                    const SizedBox(height: 15),

                    kartu(
                      icon: Icons.bed,
                      judul: 'Pola Tidur',
                      deskripsi: 'Pantau kualitas tidur Anda',
                      warna: const Color(0xFF2585FF),
                    ),

                    const SizedBox(height: 16),

                    duaKartu(
                      kiri: kartu(
                        icon: Icons.air,
                        judul: 'Kalori Harian',
                        deskripsi: '2.300 kkal',
                        warna: const Color(0xFF16C58B),
                        kecil: true,
                      ),
                      kanan: kartu(
                        icon: Icons.water_drop,
                        judul: 'Air Harian',
                        deskripsi: '2.0 L',
                        warna: const Color(0xFF2585FF),
                        kecil: true,
                      ),
                    ),

                    const SizedBox(height: 16),

                    kartu(
                      icon: Icons.directions_walk,
                      judul: 'Langkah Kaki',
                      deskripsi: 'Pantau aktivitas harian Anda',
                      warna: const Color(0xFF2585FF),
                    ),

                    const SizedBox(height: 16),

                    kartu(
                      icon: Icons.directions_run,
                      judul: 'Olahraga Harian',
                      deskripsi: 'Catat aktivitas olahraga Anda',
                      warna: const Color(0xFF7045F5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // NAVBAR BAWAH
      bottomNavigationBar: navbarBawah(),
    );
  }
}
