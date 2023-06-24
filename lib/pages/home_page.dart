import 'package:animated_listview/colors.dart';
import 'package:animated_listview/dummy_data.dart';
import 'package:animated_listview/widgets/place_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  AnimationController? animationController;
  List<PlaceWidget> places = [];

  int index = 0;
  

  _fetchData() {

    int count = PlaceListData.list.length;
    for (var item in PlaceListData.list) {
      final Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController!, curve: Interval( (1 / count) * index, 1, curve: Curves.fastOutSlowIn ))
      );

      PlaceWidget widget = PlaceWidget(
        animation: animation,
        animationController: animationController,
        item: item,
      );
      places.add(widget);
      widget.animationController?.forward();

      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildAppbar(),
        Expanded(
          child: 
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool nnerBoxIsScrolled) {
              return [
                SliverList(delegate: 
                  SliverChildBuilderDelegate(
                    ((context, index)  {
                      return Column(
                        children: [
                          _buildSearchUI()
                        ],
                      );
                    }), childCount: 1
                  )
                ),

                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: FilterTabHeader(
                    _buildFilterUI()
                  )
                )
              ];
            },
            body: _buildContent(),
          ), 
        )
        
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      color: white,
      child: ListView.builder(
        itemCount: places.length,
        padding: EdgeInsets.only(top: 8),
        itemBuilder: ((context, index) {
          return places[index];
      })),
    );
  }

  Widget _buildFilterUI() {
    return Stack(
      children: [
        Container(
          color: white,
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
          child: Row(
            children: [
              Expanded(child: 
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text("400 Places found",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16
                    ),
                  ),
                  
                )
              ),

              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text("Filter", style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16,)),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.sort, color: primary,),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchUI() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          Expanded(child: 
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 8
                  )
                ]
              ),
              margin: EdgeInsets.only(right: 16, top:8, bottom: 8),
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                child: TextField(
                  onChanged: (value) {},
                  style: TextStyle(
                    fontSize: 18
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Location",
                    
                  ),
                ),
              ),
            )
          ),

          //create a search button
          Container(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.4),
                  offset: Offset(0,2),
                  blurRadius: 8
                )
              ]
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Icon(FontAwesomeIcons.magnifyingGlass,
                    size: 20,
                    color: background,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.2),
            offset: Offset(0,2),
            blurRadius: 8
          )
        ]
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top, left: 8 , right: 8
      ),
      child: Row(
        children: [
          Container(
            width: AppBar().preferredSize.height + 40,
            height:  AppBar().preferredSize.height,
            
          ),

          Expanded(
            child: Center(
              child: Container(
                child: Text("Explore", style:  TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w600
                ),),
              ),
            ),
          ),

          Container(
            width: AppBar().preferredSize.height + 40,
            height:  AppBar().preferredSize.height,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(32),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {

                    },
                    borderRadius: BorderRadius.circular(32),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.locationDot),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),       
    );
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _fetchData();
    super.initState();
  }
}


class FilterTabHeader extends SliverPersistentHeaderDelegate {

  final Widget filterUI;
  FilterTabHeader(this.filterUI);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return filterUI;
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  
}