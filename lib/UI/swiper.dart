import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class MakeSwiper extends StatelessWidget {
  const MakeSwiper({Key? key, required this.steps}) : super(key: key);

  final List<Widget> steps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            height: 600,
            width: 500,

            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return steps[index];
              },
              loop: true,
              itemCount: steps.length,
              control: const SwiperControl(),
              autoplay: false,
              scrollDirection: Axis.horizontal,
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                color: Colors.grey, activeColor: Color.fromRGBO(253, 103, 4, 1.0),
              ),),

            ),
          ),
        ],
      ),
    );
  }
}
