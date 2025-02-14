import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surveyscout/controllers/client/project_controller.dart';
import 'package:surveyscout/routes/app_routes.dart';

class ChooseRecruitmentScreen extends StatelessWidget {
  final ProjectController controller = Get.find<ProjectController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Proyek'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Langkah 1',
              style: TextStyle(
                color: Color(0xFF705D54),
                fontSize: 24,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Siapa yang Anda butuhkan dalam proyek ini?',
              style: TextStyle(
                color: Color(0xFFA3948D),
                fontSize: 12,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24),
            _buildCard(
              icon: Icons.search,
              title: 'Surveyor',
              description:
              'Membantu mencari data melalui observasi, wawancara, dan/atau metode lainnya hingga merekapnya.',
            ),
            SizedBox(height: 16),
            _buildCard(
              icon: Icons.person,
              title: 'Responden',
              description:
              'Menjadi narasumber proyek Anda. Adapun, perekapan dilakukan secara mandiri.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.brown[50],
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.brown[200],
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.brown[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
