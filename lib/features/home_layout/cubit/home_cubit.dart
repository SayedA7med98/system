
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_stats.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);



  FocusNode phoneFocusNode = FocusNode();

  TextEditingController homeSearchCon = TextEditingController();
  TextEditingController customerSearchCon = TextEditingController();
  TextEditingController clientNameCon = TextEditingController();
  TextEditingController clientAddressCon = TextEditingController();
  TextEditingController clientDebtorCon = TextEditingController();
  TextEditingController clientCreditorCon = TextEditingController();
  TextEditingController clientAccountStatementCon = TextEditingController();
  TextEditingController clientNumberCon = TextEditingController();
  TextEditingController dateCon = TextEditingController();


  TextEditingController productSearchCon = TextEditingController();
  TextEditingController productNameCon = TextEditingController();
  TextEditingController productCodeCon = TextEditingController();
  TextEditingController productClassificationCon = TextEditingController();
  TextEditingController productAmountCon = TextEditingController();
  TextEditingController productUnitCon = TextEditingController();
  TextEditingController productPurchaseCon = TextEditingController();
  TextEditingController productSellingCon = TextEditingController();


  TextEditingController employeeSearchCon = TextEditingController();
  TextEditingController employeeNameCon = TextEditingController();
  TextEditingController employeeSalaryCon = TextEditingController();
  TextEditingController employeeJobCon = TextEditingController();
  TextEditingController employeeEmailCon = TextEditingController();
  TextEditingController employeePhoneCon = TextEditingController();


  TextEditingController clientNameSalesCon = TextEditingController();
  TextEditingController productSalesCon = TextEditingController();
  TextEditingController amountSalesCon = TextEditingController();
  TextEditingController priceSalesCon = TextEditingController();
  TextEditingController totalSalesCon = TextEditingController();
  TextEditingController amountPaidSalesCon = TextEditingController();
  TextEditingController residualSalesCon = TextEditingController();
}