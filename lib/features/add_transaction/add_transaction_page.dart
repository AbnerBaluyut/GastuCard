import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:go_router/go_router.dart';

import '../../app/styles/dimension.dart';
import '../../shared/widgets/common_elevated_button.dart';
import '../../shared/widgets/common_scaffold.dart';
import 'components/add_transaction_appbar.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {

  bool isInstallment = false;
  int months = 3;

  final List<String> _categories = [
    'Food',
    'Bills',
    'Shopping',
    'Transport',
    'Groceries',
    'Travel',
    'Health & Fitness',
    'Education',
    'Entertainment',
    'Subscriptions',
    'Gifts & Donations',
    'Pets',
    'Home',
    'Electronics',
    'Beauty',
    'Kids',
  ];

  @override
  Widget build(BuildContext context) {
    
    return CommonScaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AddTransactionAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- Select Card ---
            const Text("Select Card", style: TextStyle(fontWeight: FontWeight.bold)),
            Dimension.spacingSmall.height(),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: "Visa",
              items: ['Visa', 'MasterCard', 'BPI Gold'].map((card) {
                return DropdownMenuItem(value: card, child: Text(card));
              }).toList(),
              onChanged: (value) {},
            ),
            Dimension.spacingLarge.height(),


            // --- Amount ---
            const Text("Amount", style: TextStyle(fontWeight: FontWeight.bold)),
            Dimension.spacingSmall.height(),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
                hintText: "Enter amount",
              ),
            ),
            Dimension.spacingLarge.height(),



            // --- Category ---
            const Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
            Dimension.spacingSmall.height(),
            DropdownButtonFormField<String>(
              value: "Bills",
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: _categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {},
            ),
            Dimension.spacingLarge.height(),



            // --- Date ---
            const Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
            Dimension.spacingSmall.height(),
            TextFormField(
              readOnly: true,
              onTap: () async {
                final now = DateTime.now();
                await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(now.year - 2),
                  lastDate: now,
                );
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
                hintText: "Select date",
              ),
            ),
            Dimension.spacingLarge.height(),



            // --- Installment Switch ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Installment?", style: TextStyle(fontWeight: FontWeight.bold)),
                Switch(
                  value: isInstallment,
                  activeColor: Colors.teal,
                  inactiveThumbColor: Colors.grey,
                  onChanged: (val) {
                    setState(() => isInstallment = val);
                  },
                ),
              ],
            ),
            // --- Installment Fields ---
            if (isInstallment) ...[
              Dimension.spacingSmall.height(),
              const Text("Months", style: TextStyle(fontWeight: FontWeight.bold)),
              Dimension.spacingSmall.height(),
              DropdownButtonFormField<int>(
                value: months,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: [3, 6, 9, 12, 18, 24].map((m) {
                  return DropdownMenuItem(value: m, child: Text("$m months"));
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => months = val);
                },
              ),
              

              Dimension.spacingLarge.height(),
              const Text("Interest Rate (%)", style: TextStyle(fontWeight: FontWeight.bold)),
              Dimension.spacingSmall.height(),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "e.g. 1.5",
                  border: OutlineInputBorder(),
                  suffixText: "%",
                ),
                onChanged: (val) {
                  // Save interest rate to a variable and recalculate
                },
              ),

              Dimension.spacingLarge.height(),
              const Text("Processing Fee", style: TextStyle(fontWeight: FontWeight.bold)),
              Dimension.spacingSmall.height(),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(),
                  hintText: "e.g. 200.00",
                ),
              ),
              Dimension.spacingSmall.height(),
              // Optional: show calculated monthly amount here
              Text("Monthly payment: ₱X.XX", style: TextStyle(color: Colors.teal.shade700, fontSize: Dimension.fontMedium, fontWeight: FontWeight.w500)),
            ],
            Dimension.spacingLarge.height(),
             // --- Note ---
            const Text("Note (optional)", style: TextStyle(fontWeight: FontWeight.bold)),
            Dimension.spacingSmall.height(),
            TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a short note",
              ),
            ),

            
            Dimension.spacingExtraLarge.height(),
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: CommonElevatedButton(
                custom: Row(
                  spacing: Dimension.spacingSmall,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.save, size: 24.0, color: Colors.white),
                    const Text(
                      "Save Transaction",
                      style: TextStyle(
                        fontSize: Dimension.fontMedium,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.teal.shade900,
                borderRadius: BorderRadius.circular(100.0),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.paddingMedium
                ),
                overlayColor: Colors.grey,
                onButtonPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}