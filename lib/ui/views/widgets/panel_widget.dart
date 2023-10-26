import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        controller: controller,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/icon/arrow_up.png',
              ),
              const Text(
                'More Info',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFDA1D1D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          //TO DO: Add the map API
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Text(
                "Jolibee alta cita fkj aturas aveiwn askldjf werasf",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: DataTable(
                columns: [
                  DataColumn(
                    label: Text('Description'),
                  ),
                  DataColumn(
                    label: Text(' '),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Type of Foods')),
                    DataCell(Text('various')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Average Price')),
                    DataCell(Text('100 PhP')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Distance')),
                    DataCell(Text('1 km')),
                  ])
                ])
          ),
            ElevatedButton(
              onPressed: () {
              // Handle the button click here
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFDA1D1D),
              ),
              child: Text(
                "Let's go",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            ),
            ),

        ],
      );
}
