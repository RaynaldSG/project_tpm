import 'package:flutter/material.dart';

class BottomCard extends StatefulWidget {
  const BottomCard({super.key});

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [_topInfo(), _Caraousel()],
      ),
    );
  }

  Widget _topInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'High Rating Hotel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward,),
          )
        ],
      ),
    );
  }

  Widget _Caraousel() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),  // This is to allow the SingleChildScrollView to handle scrolling
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => _imageCard(),
    );
  }

  Widget _imageCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                'https://cf.bstatic.com/xdata/images/hotel/square240/467524871.jpg?k=23f4ddf9e9e1bc2d6ce41cfb2b1451b39ad69b1d25ce9b76e5e913f8361103dd&o=',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hotel Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text('Yogya'),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700], size: 20),
                      const SizedBox(width: 5),
                      const Text('5.0'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
