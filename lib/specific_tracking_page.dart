import 'package:flutter/material.dart';

class DesignerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> designers = [
    {
      'name': 'David Borg',
      'title': 'Flying wings',
      'rank': 1,
      'color': Colors.blue
    },
    {
      'name': 'Lucy',
      'title': 'Growing up trouble',
      'rank': 2,
      'color': Colors.orange
    },
    {
      'name': 'Jerry Cool West',
      'title': "Sculptor's diary",
      'rank': 3,
      'color': Colors.red
    },
    {
      'name': 'Bold',
      'title': 'Illustration of little girl',
      'rank': 4,
      'color': Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildGradientHeader(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: designers.length,
              itemBuilder: (context, index) {
                return _buildDesignerCard(designers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientHeader() {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Designer",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text("Category", style: TextStyle(color: Colors.white70)),
              SizedBox(width: 20),
              Text("Attention", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesignerCard(Map<String, dynamic> designer) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: designer['color'],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            designer['name'],
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Title: ${designer['title']}",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildStat('2342', 'Popularity'),
                  SizedBox(width: 15),
                  _buildStat('4738', 'Like'),
                  SizedBox(width: 15),
                  _buildStat('136', 'Followed'),
                ],
              ),
              Text(
                "${designer['rank']} Ranking",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
