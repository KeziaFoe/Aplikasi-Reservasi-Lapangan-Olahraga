import 'package:flutter/material.dart';

void main() {
  runApp(PromoPage());
}

class PromoPage extends StatefulWidget {
  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  int selectedPromoIndex = -1; // Indeks promo yang dipilih

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promo',
      theme: ThemeData(
        primaryColor: Colors.white, // Warna putih untuk AppBar
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Warna putih untuk AppBar
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black, // Warna hitam untuk icon
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Promo',
            style: TextStyle(
              color: Color(0xFF5C4ECE), // Warna tulisan PromoPage
            ),
          ),
        ),
        body: PromoList(
          promos: [
            Promo(
              title: 'Discount up to 50%',
              description: 'Valid for e-wallets only, promo can be used until 31 July 2023',
              discount: 20,
              image: 'assets/img53.png',
            ),
            Promo(
              title: 'Discount 5000 IDR',
              description: 'Valid for e-wallets only, promo can be used until 31 July 2023',
              cashback: 50000,
              minimumPurchase: 200000,
              image: 'assets/img53.png',
            ),
            // Tambahkan promo lainnya di sini...
          ],
          selectedPromoIndex: selectedPromoIndex,
          onPromoSelected: (index) {
            setState(() {
              selectedPromoIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class PromoList extends StatelessWidget {
  final List<Promo> promos;
  final int selectedPromoIndex;
  final Function(int)? onPromoSelected;

  PromoList({
    required this.promos,
    required this.selectedPromoIndex,
    this.onPromoSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: promos.length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: index == 0 ? 16.0 : 0.0),
          child: PromoCard(
            promo: promos[index],
            isSelected: index == selectedPromoIndex,
            onTap: () {
              if (onPromoSelected != null) {
                onPromoSelected!(index);
              }
            },
          ),
        );
      },
    );
  }
}

class Promo {
  final String title;
  final String description;
  final int discount;
  final int cashback;
  final int minimumPurchase;
  final String image;

  Promo({
    required this.title,
    required this.description,
    this.discount = 0,
    this.cashback = 0,
    this.minimumPurchase = 0,
    required this.image,
  });
}

class PromoCard extends StatelessWidget {
  final Promo promo;
  final bool isSelected;
  final VoidCallback onTap;

  PromoCard({
    required this.promo,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                promo.image,
                width: 60.0,
                height: 60.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      promo.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(promo.description),
                    SizedBox(height: 8.0),
                    if (promo.discount > 0)
                      Text(
                        '*especially new user',
                        style: TextStyle(
                          color: Colors.red, // Warna merah untuk tulisan
                        ),
                      ),
                    if (promo.minimumPurchase > 0)
                      Text(
                        '*especially new user',
                        style: TextStyle(
                          color: Colors.red, // Warna merah untuk tulisan
                        ),
                      ),
                  ],
                ),
              ),
              Radio<bool>(
                value: true,
                groupValue: isSelected,
                onChanged: (_) {},
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
