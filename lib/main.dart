import 'package:flutter/material.dart';

void main() {
  runApp(const VaniBillApp());
}

class VaniBillApp extends StatelessWidget {
  const VaniBillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VaniBill',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFFDFCFA),
      ),
      home: const LoginScreen(),
    );
  }
}

// ─── COLORS ───────────────────────────────────────
const kBrown = Color(0xFF5E5240);
const kBrownDark = Color(0xFF4A4132);
const kCream = Color(0xFFFDFCFA);
const kCreamDark = Color(0xFFF5F3F0);
const kTextPrimary = Color(0xFF2C2416);
const kTextSec = Color(0xFF6B5D4F);
const kSuccess = Color(0xFF10B981);
const kError = Color(0xFFEF4444);
const kInfo = Color(0xFF3B82F6);
const kWhite = Color(0xFFFFFFFF);

// ═══════════════════════════════════════════════════
// LOGIN SCREEN
// ═══════════════════════════════════════════════════
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 28),

              // ── Logo + App Name ──
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: kBrown,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kBrown.withOpacity(0.30),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'V',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'VaniBill',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: kTextPrimary,
                      letterSpacing: -0.6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Billing in 10 Seconds',
                    style: TextStyle(fontSize: 14, color: kTextSec),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ── Feature Card ──
              Container(
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kBrown.withOpacity(0.08)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    _FeatureItem(
                      icon: '📷',
                      title: 'Scan products',
                      sub: 'Instantly',
                    ),
                    _FeatureItem(icon: '💬', title: 'Auto SMS', sub: 'bills'),
                    _FeatureItem(
                      icon: '🚀',
                      title: '10-second',
                      sub: 'billing',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ── Mobile Number Label ──
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Mobile Number',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // ── Input Field ──
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBrown.withOpacity(0.15),
                    width: 1.5,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.phone_android, color: kTextSec, size: 18),
                    const SizedBox(width: 10),
                    const Text(
                      '+91 98765 43210',
                      style: TextStyle(fontSize: 16, color: kTextSec),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "We'll send a 6-digit OTP via SMS",
                  style: TextStyle(fontSize: 12, color: kTextSec),
                ),
              ),

              const Spacer(),

              // ── Send OTP Button ──
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OTPScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: kBrown,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: kBrown.withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: kTextSec),
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        color: kTextPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Feature Item Widget ──
class _FeatureItem extends StatelessWidget {
  final String icon, title, sub;
  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 26)),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kTextPrimary,
            ),
          ),
          Text(sub, style: const TextStyle(fontSize: 11, color: kTextSec)),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════
// OTP SCREEN
// ═══════════════════════════════════════════════════
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 28),

              // ── Logo + App Name ──
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: kBrown,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kBrown.withOpacity(0.30),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'V',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'VaniBill',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: kTextPrimary,
                      letterSpacing: -0.6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Billing in 10 Seconds',
                    style: TextStyle(fontSize: 14, color: kTextSec),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ── Feature Card ──
              Container(
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kBrown.withOpacity(0.08)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    _FeatureItem(
                      icon: '📷',
                      title: 'Scan products',
                      sub: 'Instantly',
                    ),
                    _FeatureItem(icon: '💬', title: 'Auto SMS', sub: 'bills'),
                    _FeatureItem(
                      icon: '🚀',
                      title: '10-second',
                      sub: 'billing',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── OTP Sent Notice ──
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kSuccess.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kSuccess.withOpacity(0.20)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: kSuccess, size: 16),
                    const SizedBox(width: 10),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: kTextPrimary,
                        ),
                        children: [
                          const TextSpan(text: 'OTP sent to '),
                          TextSpan(
                            text: '+91 94435 45545',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: kBrown,
                            ),
                          ),
                          const TextSpan(text: ' via SMS'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── Enter OTP Label ──
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // ── OTP Boxes ──
              Row(
                children: List.generate(
                  6,
                  (i) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: i < 5 ? 8 : 0),
                      height: 54,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: i == 0 ? kBrown : kBrown.withOpacity(0.15),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: i == 0
                            ? Container(width: 2, height: 20, color: kBrown)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ── Resend Row ──
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resend OTP in 28s',
                    style: TextStyle(fontSize: 12, color: kTextSec),
                  ),
                ],
              ),

              const Spacer(),

              // ── Verify Button ──
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: kBrown,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: kBrown.withOpacity(0.25),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: kTextSec),
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        color: kTextPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════
// DASHBOARD SCREEN
// ═══════════════════════════════════════════════════
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCreamDark,
      body: SafeArea(
        child: Column(
          children: [
            // ── Body ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Header ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Good Afternoon,',
                              style: TextStyle(
                                fontSize: 14,
                                color: kTextSec,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'testsing',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: kTextPrimary,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.notifications_outlined,
                            color: kTextPrimary,
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Stat Cards ──
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.6,
                      children: [
                        _StatCard(
                          icon: Icons.description_outlined,
                          iconBg: kInfo.withOpacity(0.10),
                          iconColor: kInfo,
                          value: '0',
                          label: "Today's Bills",
                        ),
                        _StatCard(
                          icon: Icons.currency_rupee,
                          iconBg: kSuccess.withOpacity(0.10),
                          iconColor: kSuccess,
                          value: '₹0',
                          label: "Today's Revenue",
                        ),
                        _StatCard(
                          icon: Icons.trending_down,
                          iconBg: kError.withOpacity(0.10),
                          iconColor: kError,
                          value: '₹0',
                          label: "Today's Expenses",
                        ),
                        _StatCard(
                          icon: Icons.account_balance_wallet_outlined,
                          iconBg: kSuccess.withOpacity(0.10),
                          iconColor: kSuccess,
                          value: '₹0',
                          label: "Net Profit",
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Quick Actions ──
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 14),

                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.95,
                      children: [
                        _ActionCard(
                          icon: Icons.qr_code_scanner,
                          title: 'Scan Product',
                          sub: 'AI recognition',
                        ),
                        _ActionCard(
                          icon: Icons.add_circle_outline,
                          title: 'Manual Bill',
                          sub: 'Direct entry',
                        ),
                        _ActionCard(
                          icon: Icons.list_alt_outlined,
                          title: 'Inventory',
                          sub: 'Stock control',
                        ),
                        _ActionCard(
                          icon: Icons.people_outline,
                          title: 'Customers',
                          sub: 'Ledger book',
                        ),
                        _ActionCard(
                          icon: Icons.description_outlined,
                          title: 'Quotes',
                          sub: 'Estimates',
                        ),
                        _ActionCard(
                          icon: Icons.receipt_long_outlined,
                          title: 'Expenses',
                          sub: 'Daily costs',
                        ),
                        _ActionCard(
                          icon: Icons.history_outlined,
                          title: 'Invoices',
                          sub: 'History',
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Recent Transactions ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recent Transactions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kTextPrimary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: kBrown.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kBrown,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ── Transaction Tiles ──
                    _TxnTile(
                      name: 'Ravi Kumar',
                      type: 'INVOICE',
                      date: 'Mar 2, 2026 • 2:15 PM',
                      amount: '₹1,250.00',
                      status: 'PAID',
                      statusColor: kSuccess,
                      isInvoice: true,
                    ),
                    const SizedBox(height: 10),
                    _TxnTile(
                      name: 'Meena Textiles',
                      type: 'QUOTE',
                      date: 'Mar 2, 2026 • 11:30 AM',
                      amount: '₹3,800.00',
                      status: 'SENT',
                      statusColor: kInfo,
                      isInvoice: false,
                    ),
                    const SizedBox(height: 10),
                    _TxnTile(
                      name: 'Walk-in Customer',
                      type: 'INVOICE',
                      date: 'Mar 1, 2026 • 5:45 PM',
                      amount: '₹450.00',
                      status: 'PAID',
                      statusColor: kSuccess,
                      isInvoice: true,
                    ),
                    const SizedBox(height: 10),
                    _TxnTile(
                      name: 'Lakshmi Weavers',
                      type: 'QUOTE',
                      date: 'Mar 1, 2026 • 3:20 PM',
                      amount: '₹12,500.00',
                      status: 'DRAFT',
                      statusColor: kTextSec,
                      isInvoice: false,
                    ),

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),

            // ── Bottom Nav ──
            _BottomNav(currentIndex: 0),
          ],
        ),
      ),
    );
  }
}

// ── Stat Card Widget ──
class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg, iconColor;
  final String value, label;

  const _StatCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: kTextPrimary,
              letterSpacing: -0.4,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: kTextSec,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Action Card Widget ──
class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title, sub;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBrown.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.015), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: kCreamDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: kBrown, size: 20),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: kTextPrimary,
            ),
          ),
          Text(
            sub,
            style: TextStyle(fontSize: 10, color: kTextSec.withOpacity(0.80)),
          ),
        ],
      ),
    );
  }
}

// ── Transaction Tile Widget ──
class _TxnTile extends StatelessWidget {
  final String name, type, date, amount, status;
  final Color statusColor;
  final bool isInvoice;

  const _TxnTile({
    required this.name,
    required this.type,
    required this.date,
    required this.amount,
    required this.status,
    required this.statusColor,
    required this.isInvoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBrown.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: isInvoice ? kCreamDark : kInfo.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              isInvoice ? Icons.receipt_outlined : Icons.description_outlined,
              color: isInvoice ? kBrown : kInfo,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: kTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: isInvoice
                            ? kBrown.withOpacity(0.08)
                            : kInfo.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: isInvoice ? kBrown : kInfo,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        date,
                        style: const TextStyle(fontSize: 11, color: kTextSec),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: kTextPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: statusColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Bottom Nav Widget ──
class _BottomNav extends StatelessWidget {
  final int currentIndex;
  const _BottomNav({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: kWhite,
        border: Border(top: BorderSide(color: kBrown.withOpacity(0.08))),
      ),
      child: Row(
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'Home',
            active: currentIndex == 0,
          ),
          _NavItem(
            icon: Icons.qr_code_scanner,
            label: 'Scan',
            active: currentIndex == 1,
          ),
          _NavItem(
            icon: Icons.bar_chart,
            label: 'Reports',
            active: currentIndex == 2,
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: 'Profile',
            active: currentIndex == 3,
          ),
        ],
      ),
    );
  }
}

// ── Nav Item Widget ──
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: active ? kBrownDark : kTextSec.withOpacity(0.60),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              color: active ? kBrownDark : kTextSec.withOpacity(0.60),
            ),
          ),
        ],
      ),
    );
  }
}
