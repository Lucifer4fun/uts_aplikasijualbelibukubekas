import 'package:flutter/material.dart';
import 'package:uts/login.dart';

import 'package:uts/ui/main_view.dart';
import 'package:uts/ui/screens/login_screen.dart';
import 'package:uts/ui/screens/sing_up_screen.dart';
import 'checkout.dart';
import 'package:uts/searching.dart';
import 'data.dart';
import 'package:uts/upload_buku.dart';

class Home extends StatelessWidget {
  // Deklarasikan GlobalKey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // App bar
    final appBar = AppBar(
      elevation: .5,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          // Buka drawer saat tombol ikon menu ditekan
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      title: Text('Toko Buku Bekas'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Tambahkan kode navigasi ke halaman FileUploadScreen di sini
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
        ),
        // Tambahkan IconButton untuk navigasi ke halaman unggah buku
        IconButton(
          icon: Icon(Icons.file_upload), // Ikon unggah buku
          onPressed: () {
            // Tambahkan kode navigasi ke halaman FileUploadScreen di sini
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ],
    );

    /// Create book tile hero
    createTile(Book book) => Hero(
          tag: book.title,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.purple.shade900,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail/${book.title}');
              },
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    /// Create book grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      key: _scaffoldKey, // Tambahkan GlobalKey ke Scaffold
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Toko Buku Bekas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.purple.shade900,
              ),
            ),
            ListTile(
              title: Text('Kembali ke Login'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: Text('Sign Up'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
      ),
      body: grid,
    );
  }
}
