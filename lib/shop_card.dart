import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final name;
  final image;
  final onTap;
  final type;
  final discount;
  const ShopCard({ Key? key, required this.name, required this.image, required this.onTap, this.type, this.discount }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 5, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.44,
              height: MediaQuery.of(context).size.width * 0.44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade50,
                image: DecorationImage(
                  image: AssetImage(image,),
                  fit: BoxFit.cover,

                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
            const SizedBox(height: 10,),
            type  != null  ? Text(type!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey[700]),) : const SizedBox(),
            const SizedBox(height: 10,),
          ]
      ),
    );
  }
}