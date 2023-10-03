import 'package:flutter/material.dart';

void main() {
  runApp(PaymentMethodPage());
}

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Method',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
          title: Text(
            'Payment Method',
            style: TextStyle(
              color: Color(0xFF5C4ECE),
            ),
          ),
        ),
        body: PaymentMethodList(
          paymentMethods: [
            PaymentMethod(
              title: 'Credit Card',
              image: 'assets/img56.png',
              description: 'MANDIRI ONLY',
            ),
            PaymentMethod(
              title: 'Bank Transfer',
              image: 'assets/img55.png',
              description: 'BCA ONLY',
            ),
            PaymentMethod(
              title: 'DANA',
              image: 'assets/img54.png',
              description: 'YOUR BALANCE: 135000 IDR',
            ),
            // Add more payment methods here...
          ],
        ),
      ),
    );
  }
}

class PaymentMethodList extends StatefulWidget {
  final List<PaymentMethod> paymentMethods;

  PaymentMethodList({
    required this.paymentMethods,
  });

  @override
  _PaymentMethodListState createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  int selectedPaymentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.paymentMethods.length,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 8.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              left: 16.0, right: 16.0, top: index == 0 ? 16.0 : 0.0),
          child: PaymentMethodCard(
            paymentMethod: widget.paymentMethods[index],
            isSelected: index == selectedPaymentIndex,
            onTap: () {
              setState(() {
                selectedPaymentIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}

class PaymentMethod {
  final String title;
  final String image;
  final String description;

  PaymentMethod({
    required this.title,
    required this.image,
    required this.description,
  });
}

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;
  final VoidCallback onTap;

  PaymentMethodCard({
    required this.paymentMethod,
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
                paymentMethod.image,
                width: 60.0,
                height: 60.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentMethod.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      paymentMethod.description,
                      style: TextStyle(
                        fontSize: 14.0,
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
