import 'package:flutter/material.dart';
import '../utils/images.dart';

class EzyTravelScreen extends StatefulWidget {
  final String? source;
  final String? destination;
  final String? tripType;
  const EzyTravelScreen(
      {super.key, this.source, this.destination, this.tripType});

  @override
  State<EzyTravelScreen> createState() => _EzyTravelScreenState();
}

class _EzyTravelScreenState extends State<EzyTravelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      appBar: AppBar(
        title: const Text('Ezy Travel'),
        backgroundColor: Colors.lightGreen.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                elevation: 2,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'BLR-Bengaluru to DXB,Dubai',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Departure: Sat, 23 Mar - Return: Sat, 23 Mar',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '(${widget.tripType})',
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 10),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Modify Search',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.green),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.grey,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Sort',
                              style: TextStyle(fontSize: 12),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 20,
                            )
                          ],
                        ),
                        const Text(
                          'Non-Stop',
                          style: TextStyle(fontSize: 12),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Filter',
                              style: TextStyle(fontSize: 12),
                            ),
                            Image.asset(Images.filterIcon,
                                height: 24, width: 24, scale: 4)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildChipDateContainer('May 22-Mar 23', 'From AED 741'),
                    buildChipDateContainer('May 23-Mar 24', 'From AED 721'),
                    buildChipDateContainer('May 24-Mar 25', 'From AED 750'),
                    buildChipDateContainer('May 24-Mar 25', 'From AED 750'),
                    buildChipDateContainer('May 24-Mar 25', 'From AED 750'),
                    buildChipDateContainer('May 24-Mar 25', 'From AED 750'),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '851 Flight Found',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: buildFlightSearchWidget(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  buildFlightSearchWidget() {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              Images.garudaIcon,
              height: 25,
              width: 25,
            ),
            title: const Text(
              'Onward - Garuda Indonesia',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
            trailing: const Text(
              'AED 409',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                '14:35',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset(
                Images.flightIcon,
                scale: 5,
              ),
              const Text('21:55',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'BLR-Bengaluru',
                style: TextStyle(color: Colors.grey),
              ),
              Text('4h 30m\n2 stops',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
              Text('DXB-Dubai', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          widget.tripType == 'Round Trip'
              ? Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                  height: 5,
                )
              : SizedBox(),
          widget.tripType == 'Round Trip'
              ? ListTile(
                  leading: Image.asset(
                    Images.garudaIcon,
                    height: 25,
                    width: 25,
                  ),
                  title: const Text(
                    'Return - Garuda Indonesia',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  trailing: const Text(
                    'AED 359',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              : SizedBox(),
          widget.tripType == 'Round Trip'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '21:55',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      Images.flightIcon,
                      scale: 5,
                    ),
                    const Text('14:35',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )
              : SizedBox(),
          widget.tripType == 'Round Trip'
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'DXB-Dubai',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Text('4h 30m',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    Text('BLR-Bengaluru',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ],
                )
              : SizedBox(),
          const Padding(
              padding: EdgeInsets.all(10),
              child: DashedDivider(
                  color: Colors.grey, dashWidth: 6, dashHeight: 1)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildChipContainer("Cheapest", Colors.green),
                  const SizedBox(
                    width: 5,
                  ),
                  buildChipContainer("Refundable", Colors.blueAccent),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Flight Details',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 10),
                  ),
                  Icon(Icons.keyboard_arrow_down_sharp,
                      color: Colors.deepOrange)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  buildChipDateContainer(String date, String flightName) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: Column(
            children: [
              Text(
                date,
                style: const TextStyle(fontSize: 10),
              ),
              Text(flightName, style: const TextStyle(fontSize: 10))
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  buildChipContainer(String title, Color textAndBodyColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: textAndBodyColor)),
      child: Text(
        title,
        style: TextStyle(fontSize: 10, color: textAndBodyColor),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final Color color;

  const DashedDivider({
    super.key,
    this.dashWidth = 4,
    this.dashHeight = 1,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
