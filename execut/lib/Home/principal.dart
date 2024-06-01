import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: sizeW * 0.8571425,
          height: sizeH * 1.0,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
          child: Stack(
            children: [
              const Positioned(
                left: 29,
                top: 40,
                child: Text(
                  'ULTIMAS OBRAS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Positioned(
                left: 339,
                top: 91,
                child: Text(
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
              ),
              Positioned(
                left: 29,
                top: 200,
                child: _buildInfoCard(
                  title: 'Total Mão de Obra',
                  value: '40,689',
                  imageUrl: "https://via.placeholder.com/60x60",
                ),
              ),
              Positioned(
                left: 321,
                top: 200,
                child: _buildInfoCard(
                  title: 'Total Pagamentos',
                  value: '\$89,000',
                  imageUrl: "https://via.placeholder.com/60x60",
                ),
              ),
              Positioned(
                left: 613,
                top: 200,
                child: _buildInfoCard(
                  title: 'Total Recursos',
                  value: '2040',
                  imageUrl: "https://via.placeholder.com/60x60",
                ),
              ),
              Positioned(
                left: 905,
                top: 200,
                child: _buildInfoCard(
                  title: 'Total Obras',
                  value: '10293',
                  imageUrl: "https://via.placeholder.com/60x60",
                ),
              ),
              Positioned(
                left: 29,
                top: 474,
                child: _buildOrderList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required String title,
      required String value,
      required String imageUrl}) {
    return Container(
      width: sizeW * 0.1857142,
      height: sizeH * 0.161,
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
        padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.0114285, vertical: sizeH * 0.016),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Opacity(
                opacity: 0.30,
                child: Image.network(imageUrl, width: sizeW * 0.0428571, height: sizeH * 0.06),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    return Column(
      children: [
        _buildOrderHeader(),
        _buildOrderItem(
          title: 'Apple Watch',
          address: '6096 Marjolaine Landing',
          date: '12.09.2019',
          amount: '\$34,295',
          status: 'Delivered',
          statusColor: const Color(0xFF00B69B),
        ),
        _buildOrderItem(
          title: 'Apple Watch',
          address: '6096 Marjolaine Landing',
          date: '12.09.2019',
          amount: '\$34,295',
          status: 'Pending',
          statusColor: const Color(0xFFFCBE2D),
        ),
        _buildOrderItem(
          title: 'Apple Watch',
          address: '6096 Marjolaine Landing',
          date: '12.09.2019',
          amount: '\$34,295',
          status: 'Rejected',
          statusColor: const Color(0xFFFD5454),
        ),
      ],
    );
  }

  Widget _buildOrderHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.0114285, vertical: sizeH * 0.016),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderItem('OBRA'),
          _buildHeaderItem('ENDEREÇO'),
          _buildHeaderItem('PRESTADORES'),
          _buildHeaderItem('VALOR'),
          _buildHeaderItem('STATUS'),
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Nunito Sans',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String address,
    required String date,
    required String amount,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.0114285, vertical: sizeH * 0.016),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOrderText(title),
          _buildOrderText(address),
          _buildOrderText(date),
          _buildOrderText('423'), // Fixed number as per the original code
          _buildOrderText(amount),
          _buildStatusBox(status, statusColor),
        ],
      ),
    );
  }

  Widget _buildOrderText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Nunito Sans',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildStatusBox(String status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.00857128, vertical: sizeH * 0.008),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13.5),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
