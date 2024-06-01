import 'package:flutter/material.dart';
import 'package:project_tpm/model/HotelDetailModel.dart';

class DetailImageHotel extends StatefulWidget {
  final HotelDetailData hotelDetailData;
  const DetailImageHotel({super.key, required this.hotelDetailData});

  @override
  State<DetailImageHotel> createState() => _DetailImageHotelState();
}

class _DetailImageHotelState extends State<DetailImageHotel> {
  late List<String> imageUrl;
  int _selectedImage = 0;

  @override
  void initState(){
    imageUrl = widget.hotelDetailData.imageUrl!;
    setState(() {
    });
  }

  void _setImage(int index){
    _selectedImage = index;
  }

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
      height: 300,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(imageUrl[_selectedImage],
        fit: BoxFit.cover,),
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
          itemBuilder: (context, index) => _smallItem(index)),
    );
  }
  
  Widget _smallItem(int index){
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){
          setState(() {
            _setImage(index);
          });
        },
        child: Image.network(imageUrl[index]),
      ),
    );
  }
}
