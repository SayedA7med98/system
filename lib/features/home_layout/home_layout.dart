import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system/features/home_layout/added_screens/add_client_screen.dart';
import 'package:system/features/home_layout/added_screens/add_employee_screen.dart';
import 'package:system/features/home_layout/added_screens/add_product_screen.dart';
import 'package:system/features/home_layout/added_screens/add_sales_invoice.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:system/features/home_layout/cubit/home_stats.dart';
import 'package:system/features/home_layout/home_screens/batch_registration.dart';
import 'package:system/features/home_layout/home_screens/client_screen.dart';
import 'package:system/features/home_layout/home_screens/employee_screen.dart';
import 'package:system/features/home_layout/home_screens/home_screen.dart';
import 'package:system/features/home_layout/home_screens/inventory_reports.dart';
import 'package:system/features/home_layout/home_screens/product_screen.dart';
import 'package:system/features/home_layout/home_screens/purchase_invoices.dart';
import 'package:system/features/home_layout/home_screens/reports.dart';
import 'package:system/features/home_layout/home_screens/sales_invoice_screen.dart';
import 'package:system/features/home_layout/home_screens/sales_purchase_reports.dart';
import 'package:system/features/home_layout/home_screens/language_screen.dart';
import 'package:system/features/home_layout/home_screens/suppliers_reports.dart';
import 'package:system/features/home_layout/home_screens/suppliers_screen.dart';
import 'package:system/utils/app_theme.dart';
import 'home_screens/profile_screen.dart';


class HomeLayOut extends StatefulWidget {
  const HomeLayOut({super.key});

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  bool clientShowAddForm = false;
  bool productShowAddForm = false;
  bool employeeShowAddForm = false;
  bool salesInvoiceShowAddForm = false;
  void toggleClientForm(bool value) {
    setState(() {
      clientShowAddForm = value;
    });
  }
  void toggleProductForm(bool value) {
    setState(() {
      productShowAddForm = value;
    });
  }
  void toggleEmployeeForm(bool value) {
    setState(() {
      employeeShowAddForm = value;
    });
  }
  void toggleSalesForm(bool value) {
    setState(() {
      salesInvoiceShowAddForm = value;
    });
  }


  int selectedIndex = 0;
  Widget customListTile({required String text, required String image, required int index}){
    return ListTile(
      selectedColor: AppTheme.light,
      selectedTileColor: AppTheme.mainColor,
      leading: ImageIcon(AssetImage(image,),size: 20,),
      title: Text(text,
        style: GoogleFonts.montserrat().copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      selected:selectedIndex==index,
      onTap: (){
        setState(() {selectedIndex = index ;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state) {
        return Scaffold(
          backgroundColor: AppTheme.light,
          body: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.15,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1,color: AppTheme.mainColor),
                  )
                ),
                child: ListView(
                  children: [
                    customListTile(text: 'Home', index: 0,image: 'assets/images/home.png',),
                    customListTile(text: 'Clients', index: 1,image: 'assets/images/customer.png',),
                    customListTile(text: 'Sales Invoices', index: 2,image: 'assets/images/invoice.png',),
                    customListTile(text: 'Employees', index: 3,image: 'assets/images/employee.png',),
                    customListTile(text: 'Suppliers', index: 4,image: 'assets/images/supplier.png',),
                    customListTile(text: 'Products', index: 5,image: 'assets/images/product.png',),
                    customListTile(text: 'Purchase Invoice', index:6,image: 'assets/images/PInvoice.png',),
                    customListTile(text: 'Batch Registration', index: 7,image: 'assets/images/PInvoice.png',),
                    ExpansionTile(
                      leading: ImageIcon(AssetImage('assets/images/reports.png'),size: 20,),
                      title: Text('reports',
                        style: GoogleFonts.montserrat().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      children: [
                        customListTile(text: 'Reports', index: 8,image: 'assets/images/reports.png',),
                        customListTile(text: 'Suppliers Reports', index: 9,image: 'assets/images/reports.png',),
                        customListTile(text: 'Inventory Reports', index: 10,image: 'assets/images/reports.png',),
                        customListTile(text: 'Sales/Purchase Reports', index: 11,image: 'assets/images/reports.png',),
                      ],
                    ),
                    ExpansionTile(
                      leading: ImageIcon(AssetImage('assets/images/setting.png'),size: 20,),
                      title: Text('Settings',
                        style: GoogleFonts.montserrat().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      children: [
                        customListTile(text: 'Language', index: 12,image: 'assets/images/language.png',),
                        customListTile(text: 'Profile', index: 13,image: 'assets/images/profile.png',),
                        ListTile(
                          leading: ImageIcon(AssetImage('assets/images/logOut.png')),
                          title: Text('Log Out'),
                          onTap: (){},
                        ),
                      ],

                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                selectedIndex == 0?HomeScreen():
                selectedIndex == 1?clientShowAddForm ?
                    AddClientScreen(onCancel: () => toggleClientForm(false))
                    :ClientScreen(onAddInvoicePressed: () => toggleClientForm(true)):
                selectedIndex == 2?salesInvoiceShowAddForm?
                    AddSalesInvoice(onCancel: () => toggleSalesForm(false))
                    :SalesInvoiceScreen(onAddInvoicePressed: () => toggleSalesForm(true)):
                selectedIndex == 3?employeeShowAddForm?
                    AddEmployeeScreen(onCancel: () => toggleEmployeeForm(false))
                    :EmployeeScreen(onAddInvoicePressed: () => toggleEmployeeForm(true)):
                selectedIndex == 4?SuppliersScreen():
                selectedIndex == 5?productShowAddForm?
                    AddProductScreen(onCancel: ()=>toggleProductForm(false))
                    :ProductScreen(onAddInvoicePressed: () => toggleProductForm(true)):
                selectedIndex == 6?PurchaseInvoices():
                selectedIndex ==7?BatchRegistration():
                selectedIndex ==8?Reports():
                selectedIndex ==9?SuppliersReports():
                selectedIndex ==10?InventoryReports():
                selectedIndex ==11?SalesPurchaseReports():
                selectedIndex ==12?LanguageScreen():ProfileScreen()
              ),
            ],
          ),
        );
      }
    );
  }
}
