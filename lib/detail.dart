import 'package:flutter/material.dart';
import 'package:uts/checkout.dart';
import 'chatdetail/chatdetailpage.dart';
import 'popup.dart'; // Assuming you have the PopupForm widget defined in popup.dart
import 'data.dart';
import 'rating_bar.dart';

class Detail extends StatelessWidget {
  final Book book;

  Detail(this.book);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      title: Text('Toko Buku Bekas'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    final topLeft = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: book.title!,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.purple.shade900,
              child: Image(
                image: AssetImage(book.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '${book.pages} halaman',
            style: TextStyle(color: Colors.white30, fontSize: 12),
          ),
        ),
      ],
    );

    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            book.title!,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Text(
            'oleh ${book.writer}',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              book.price! as String,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            RatingBar(rating: book.rating!, color: Colors.white),
          ],
        ),
        SizedBox(height: 32.0),
        MaterialButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: const Text('Pembelian Buku Bekas'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        // Add your logic here
                        Navigator.pop(context);
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatDetailPage()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons
                                .phone), // Ganti dengan ikon yang diinginkan
                            const SizedBox(
                                width: 10), // Jarak antara ikon dan teks
                            const Text('Hubungi Penjual'),
                          ],
                        ),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        // Add your logic here
                        Navigator.pop(context);
                        // Navigator ke halaman pembayaran atau detail pembelian
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyApp(), // Ganti CheckoutPage dengan halaman berikutnya
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons
                              .shopping_bag), // Ganti dengan ikon yang diinginkan
                          const SizedBox(
                              width: 10), // Jarak antara ikon dan teks
                          const Text('Beli Sekarang'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
          minWidth: 160.0,
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('BELI', style: TextStyle(fontSize: 13)),
        ),
      ],
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 2, child: topLeft),
              Expanded(flex: 3, child: topRight),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              book.description!, // Deskripsi buku
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );

    final bottomContent = SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  topContent,
                  bottomContent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
