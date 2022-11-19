import 'package:flutter/material.dart';
import '../widgets.dart';

class MyStocks extends StatefulWidget {
  const MyStocks({Key? key}) : super(key: key);

  @override
  State<MyStocks> createState() => _MyStocksState();
}

class _MyStocksState extends State<MyStocks> {
  bool _down = false;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          CurrentMoney(
            currentMoney: 5463,
            currentProfit: '-455원 (7.7%)',
          ),
          const SizedBox(
            height: 10.0,
          ),
          const currentPriceButton('현재가'),
          const Nationality('국내'),
          const InvestStock(
            image: '삼성.png',
            stockName: '삼성전자',
            stockNumbers: '1',
            stockPrice: '1,475',
            loss: '-60(3.9%)',
          ),
          const SizedBox(
            height: 2.0,
          ),
          const Nationality('해외'),
          const InvestStock(
              image: '테슬라.png',
              loss: '-210(4.7&)',
              stockName: '테슬라',
              stockNumbers: '0.011814',
              stockPrice: '4,174'),
          const Divider(
            height: 20.0,
            color: Colors.black,
          ),
        ],
      ),
      Container(
        color: Colors.grey[900],
        height: 115,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "관심주식",
                  style:
                  TextStyle(color: Colors.white, fontSize: 20),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "편집하기",
                    style:
                    TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //const DrownDown(),
            GestureDetector(
              onTap: (){
                setState(() {
                  // Toggle light when tapped.
                  _down = !_down;
                });
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("기본", style: TextStyle(fontSize: 15),),
                  const Spacer(),
                  Icon(
                    _down ? Icons.arrow_downward : Icons.arrow_upward,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 10,)
                ],
              ),
            )
          ],
        ),
      ),
      Visibility(
        visible: !_down,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stock(
              img: "테슬라",
              curPrice: 98907,
              change: 1.6,
            ),
            const SizedBox(height: 10),
            Stock(
              img: "삼성",
              curPrice: 8812,
              change: -2.1,
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
      const Divider(
        height: 20.0,
        color: Colors.black,
        thickness: 2.0,
      ),
      const DemandStock(),
      const SendOpinion(),
      Divider(
        height: 20.0,
        color: Colors.grey[100],
      ),
      const Docs(),
    ]);
    ;
  }
}

class FinancialInfo extends StatelessWidget {
  const FinancialInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
          child: const Text(
            '토스증권',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                '코스피',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                '2,204.82',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
