import 'package:amazon_clone_app/common/widgets/loader.dart';
import 'package:amazon_clone_app/features/Admin/models/sales.dart';
import 'package:amazon_clone_app/features/Admin/services/admin_services.dart';
import 'package:amazon_clone_app/features/Admin/widgets/category_products_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int? totalSales;
  List<Sales>? earnings;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  void getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarning'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Padding(
          padding: const EdgeInsets.only(left : 10.0, top: 10.0),
          child: Column(
              children: [
                Text(
                  '\$$totalSales',
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 250,
                  child: CategoryProductsChart(
                    seriesList: [
                      charts.Series(
                        id: 'Sales',
                        data: earnings!,
                        domainFn: (Sales sales, _) => sales.label,
                        measureFn: (Sales sales, _) => sales.earning,
                      ),
                    ],
                  ),
                ),
              ],
            ),
        );
  }
}
