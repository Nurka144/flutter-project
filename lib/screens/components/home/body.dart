import 'package:app_mobile_test/constants.dart';
import 'package:app_mobile_test/screens/Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0 * 2.5),
            height: size.height * 0.2,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  height: size.height * 0.2 - 20,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Привет, Нурбек!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 40,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Поиск",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: Colors.black,
                            height: 35,
                          ),
                          onPressed: () {
                            print('search');
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  'Последние просмотренные',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  ProductCard(
                    image: "assets/images/image_1.png",
                    title: "Samantha",
                    country: "Russia",
                    count: 440,
                    onClick: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen()))
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ProductCard(
                    image: "assets/images/image_1.png",
                    title: "Samantha",
                    country: "Russia",
                    count: 440,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ProductCard(
                    image: "assets/images/image_1.png",
                    title: "Samantha",
                    country: "Russia",
                    count: 440,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Последние добавленные',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Products(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          ProductCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            count: 440,
          ),
          ProductCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            count: 440,
          ),
          ProductCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            count: 440,
          ),
          ProductCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            count: 440,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.image,
    this.title,
    this.count,
    this.country,
    this.onClick,
  }) : super(key: key);

  final String title, country, image;
  final int count;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: size.width * .45,
        child: Column(
          children: [
            Image.asset(image),
            GestureDetector(
              onTap: onClick,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$title\n".toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                          TextSpan(
                            text: "$country".toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$$count',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
