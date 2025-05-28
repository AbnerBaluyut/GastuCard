import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';
import 'package:gastu_card/core/utils/extensions/string_ext.dart';

import '../../app/styles/dimension.dart';
import '../constants/enums/credit_card_network_enum.dart';

class CommonCreditCard extends StatelessWidget {
  const CommonCreditCard({
    super.key,
    required this.name,
    this.network = CreditCardNetworkEnum.visa,
    this.totalCreditLimit = 0,
    this.totalSpent = 0,
    this.backgroundColor = Colors.black
  });

  final CreditCardNetworkEnum network;
  final String name;
  final double totalSpent;
  final double totalCreditLimit;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: Dimension.elevationLow,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0)
      ),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Dimension.paddingSmall.height(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimension.paddingMedium.width(),
              Expanded(
                child: Text(
                  name.capitalize ?? "",
                  style: TextStyle(
                    fontSize: Dimension.fontMedium,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  maxLines: 2,
                ),
              ),
              Image.asset(network.assetPath, height: 60.0, width: 70.0, fit: BoxFit.cover),
              Dimension.paddingMedium.width(),
            ],
          ),
          Dimension.paddingSmall.height(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.paddingMedium
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Number",
                  style: TextStyle(
                    fontSize: Dimension.fontMedium,
                    color: Colors.white,
                    fontWeight: FontWeight.w400
                  )
                ),
                Text(
                  "•••• •••• •••• ••••",
                  style: TextStyle(
                    fontSize: Dimension.fontExtraLarge,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4.0
                  ),
                ),
              ],
            ),
          ),
          Dimension.paddingSmall.height(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.paddingMedium
            ),
            child: Column(
              spacing: Dimension.spacingExtraSmall,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: Dimension.spacingSmall,
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.white),
                    Expanded(
                      child: Text(
                        "Available Credit: ${totalCreditLimit.toCurrency()}",
                        style: TextStyle(
                          fontSize: Dimension.fontSmall,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: Dimension.spacingSmall,
                  children: [
                    Icon(Icons.trending_up, color: Colors.white),
                    Expanded(
                      child: Text(
                        "Spent: ${totalSpent.toCurrency()}",
                        style: TextStyle(
                          fontSize: Dimension.fontSmall,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Dimension.paddingMedium.height()
        ],
      ),
    );
  }
}