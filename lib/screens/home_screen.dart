import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== App Bar Custom =====
                Center(
                  child: Text(
                    'Finance Mate',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ===== Total Balance =====
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Total Balance',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rp17.850.000',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ===== Title =====
                Text(
                  'My Cards',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                // ===== Banner Cards =====
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AtmCard(
                        bankName: 'Bank A',
                        cardNumber: '**** 2345',
                        balance: 'Rp12.500.000',
                        color1: Colors.yellow,
                        color2: Colors.lightBlue,
                      ),
                      AtmCard(
                        bankName: 'Bank B',
                        cardNumber: '**** 8765',
                        balance: 'Rp5.350.000',
                        color1: Colors.lightBlue,
                        color2: Colors.yellowAccent,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ===== Grid Menu =====
                Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),

                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    GridMenuItem(
                      icon: Icons.health_and_safety,
                      label: 'Health',
                      iconColor: Colors.green,
                    ),
                    GridMenuItem(
                      icon: Icons.travel_explore,
                      label: 'Travel',
                      iconColor: Colors.blueAccent,
                    ),
                    GridMenuItem(
                      icon: Icons.fastfood,
                      label: 'Food',
                      iconColor: Colors.orangeAccent,
                    ),
                    GridMenuItem(
                      icon: Icons.event,
                      label: 'Event',
                      iconColor: Colors.purpleAccent,
                    ),
                    GridMenuItem(
                      icon: Icons.shopping_bag,
                      label: 'Shopping',
                      iconColor: Colors.pinkAccent,
                    ),
                    GridMenuItem(
                      icon: Icons.home,
                      label: 'Bills',
                      iconColor: Colors.redAccent,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ===== Transaction List =====
                Text(
                  'Recent Transactions',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(transaction: transactions[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
