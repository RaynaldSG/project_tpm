import 'package:flutter/material.dart';

class DetailImageHotel extends StatefulWidget {
  const DetailImageHotel({super.key});

  @override
  State<DetailImageHotel> createState() => _DetailImageHotelState();
}

class _DetailImageHotelState extends State<DetailImageHotel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _bigImage(),
        _smallImageBuilder(),
      ],
    );
  }

  Widget _bigImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
            'https://images.pexels.com/photos/5371575/pexels-photo-5371575.jpeg?auto=compress&cs=tinysrgb&w=600'),
      ),
    );
  }

  Widget _smallImageBuilder() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal, 
          itemCount: 5,
          itemBuilder: (context, index) => _smallItem()),
    );
  }
  
  Widget _smallItem(){
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Image.network('https://images.pexels.com/photos/5371575/pexels-photo-5371575.jpeg?auto=compress&cs=tinysrgb&w=600'),
      ),
    );
  }
}
