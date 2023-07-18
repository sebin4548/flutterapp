import 'package:flutter/material.dart';
// Transform.translate(
//                     offset: const Offset(0, -20),
//                     child: const CurrencyCard(
//                       name: "Bitcoin",
//                       code: "btc",
//                       amount: "22222",
//                       icon: Icons.currency_bitcoin,
//                       isInverted: true,
//                     ),
//                   ),

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int num;
  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.num,
  });
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, -20.0 * num),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInverted ? _blackColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: isInverted ? Colors.white : _blackColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          amount,
                          style: TextStyle(
                            color: isInverted ? Colors.white : _blackColor,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          code,
                          style: TextStyle(
                            // color: Colors.white.withOpacity(0.8),
                            color: isInverted
                                ? Colors.white.withOpacity(0.8)
                                : _blackColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                    offset: const Offset(-5, 12),
                    child: Icon(
                      icon,
                      color: isInverted ? Colors.white : _blackColor,
                      size: 88,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
