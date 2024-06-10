import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

import 'constructions/constructions_page.dart';
import 'labor/labor_page.dart';
import 'payments/payments_page.dart';
import 'principal.dart';
import 'provider/provider_page.dart';
import 'settings/settings_page.dart';
import 'supplier/supplier_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const Principal(),
    const LaborPage(),
    const SupplierPage(),
    const ProviderPage(),
    const ConstructionsPage(),
    const PaymentsPage(),
    const SettingsPage(),
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationSidebarMenuLight(
              onMenuItemSelected: _onMenuItemSelected,
              selectedIndex: _selectedIndex),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationSidebarMenuLight extends StatelessWidget {
  final Function(int) onMenuItemSelected;
  final int selectedIndex;

  const NavigationSidebarMenuLight({
    super.key,
    required this.onMenuItemSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeW * 0.16667,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xE5FAFAFA),
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildMenuItem('PRINCIPAL', Icons.home, 0, selectedIndex == 0),
          _buildMenuItem('MAO DE OBRA', Icons.home, 1, selectedIndex == 1),
          _buildMenuItem('FORNECEDOR', Icons.home, 2, selectedIndex == 2),
          _buildMenuItem('PRESTADOR', Icons.home, 3, selectedIndex == 3),
          _buildMenuItem('OBRAS', Icons.home, 4, selectedIndex == 4),
          _buildMenuItem('PAGAMENTOS', Icons.home, 5, selectedIndex == 5),
          const Spacer(),
          _buildMenuItem('CONFIGURACAO', Icons.home, 6, selectedIndex == 6),
          _buildMenuItem(
            'SAIR',
            Icons.home,
            7,
            false,
            isActionSimple: true,
            onSimpleTapped: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: sizeH * 0.016667),
      child: Row(
        children: [
          const SizedBox(width: sizeW * 0.0333),
          const Text(
            'EXECUT',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFC81717),
              fontSize: 28,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: sizeW * 0.0111),
          Container(
            width: sizeW * 0.01785,
            height: sizeH * 0.025,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("assets/images/execut_editado.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text, IconData icon, int index, bool isActive,
      {bool isActionSimple = false, void Function()? onSimpleTapped}) {
    return InkWell(
      onTap: () {
        if (isActionSimple == false) {
          onMenuItemSelected(index);
        } else {
          if (onSimpleTapped != null) {
            onSimpleTapped();
          }
        }
      },
      child: Container(
        width: sizeW * 0.1715,
        height: sizeH * 0.05,
        margin: const EdgeInsets.symmetric(vertical: sizeH * 0.005),
        child: Stack(
          children: [
            if (isActive)
              Positioned(
                left: 24,
                top: 0,
                child: Container(
                  width: sizeW * 0.13785,
                  height: sizeH * 0.05,
                  decoration: BoxDecoration(
                    color: const Color(0xFF174DC8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            Positioned(
              left: 40,
              top: 13,
              child: Icon(
                icon,
                color: isActive ? Colors.white : Colors.black,
                size: 22,
              ),
            ),
            Positioned(
              left: 78,
              top: 16,
              child: Text(
                text,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
