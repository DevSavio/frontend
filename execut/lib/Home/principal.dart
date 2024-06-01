import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Execut Construções e Reformas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF202224),
                          fontSize: 36,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.11,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _buildInfoCard(
                              title: 'Total Mão de Obra',
                              value: '40,689',
                              icon: Icons.home,
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _buildInfoCard(
                              title: 'Total Mão de Obra',
                              value: '40,689',
                              icon: Icons.home,
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _buildInfoCard(
                              title: 'Total Mão de Obra',
                              value: '40,689',
                              icon: Icons.home,
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _buildInfoCard(
                              title: 'Total Mão de Obra',
                              value: '40,689',
                              icon: Icons.home,
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      _buildOrderList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4F4),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 54,
            offset: Offset(6, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF000000),
                    size: 38,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 54,
            offset: Offset(6, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildOrderItem(
              title: 'OBRA',
              address: 'ENDEREÇO',
              date: 'DIA INICIAL',
              providers: 'PESTADORES',
              amount: 'VALOR',
              status: 'STATUS',
              statusColor: Colors.black,
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ...getConstructions(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getConstructions() {
    return List.generate(
      10,
      (index) => _buildOrderItem(
        title: 'OBRA',
        address: 'ENDEREÇO',
        date: 'DIA INICIAL',
        providers: 'PESTADORES',
        amount: 'VALOR',
        status: 'STATUS',
        statusColor: const Color(0xFF00B69B),
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String address,
    required String date,
    required String providers,
    required String amount,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom:
              BorderSide(width: 1.0, color: Color.fromARGB(255, 180, 184, 185)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCell(label: title, localWidth: 200.0),
            buildCell(label: address, localWidth: 350.0),
            buildCell(label: date, localWidth: 120.0),
            buildCell(label: providers, localWidth: 120.0),
            buildCell(label: amount, localWidth: 120.0),
            buildCell(
                label: status, localWidth: 200.0, statusColor: statusColor),
          ],
        ),
      ),
    );
  }

  Widget buildCell(
      {required String label, double localWidth = 100.0, Color? statusColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: localWidth,
        child: Text(
          label,
          style: TextStyle(
            color: statusColor ?? Colors.black,
            fontSize: 14,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderText(String text, double localWidth) {
    return Container(
      color: Colors.red,
      width: localWidth,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
