import 'package:InOut/domain/entities/barang_entity.dart';
import 'package:InOut/presentation/pages/dashboard_screen/widgets/dashboard_export_button.dart';
import 'package:InOut/presentation/pages/dashboard_screen/widgets/dashboard_package_card.dart';
import 'package:flutter/material.dart';

class DashboardPackageSection extends StatelessWidget {
  const DashboardPackageSection({
    super.key,
    required this.barangs,
  });

  final List<BarangEntity> barangs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Packages",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
            ),
            DashboardExportButton(),
          ],
        ),
        const SizedBox(height: 12),
        ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: barangs.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return DashboardPackageCard(
              name: barangs[index].name,
              price: barangs[index].price,
              stock: barangs[index].stock,
              expiredDate: barangs[index].expiredAt,
            );
          },
        ),
        const SizedBox(
          height: 80,
          child: Center(
            child: Opacity(
              opacity: .7,
              child: Text("End of Items"),
            ),
          ),
        ),
      ],
    );
  }
}
