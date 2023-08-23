import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/enums/arguments.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/enums/button_list_items.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/navigation/route_names.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/model/form_button_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/model/form_result_model.dart';

part 'form_page_state.dart';

class FormPageCubit extends Cubit<FormPageState> {
  
  PageController? pageController = PageController();
  int selectedAgeIndex = -1;

  FormPageCompleted formPageCompleted = FormPageCompleted();

  FormPageCubit() : super(const FormPageInitial()){
    init();
  }

  Future<void> init() async {

    emit(const FormPageLoading());

    formPageCompleted = FormPageCompleted(
      ageButtonList: getAgeButtonList(), 
      spendingHabitList: getSpendingHabitList(), 
      expectationList: getExpectationList(),
      titleList: getTitleList()
    );
    emit(formPageCompleted);

  }

  List<FormButtonModel> getAgeButtonList() {
    
    //Set default button list. This list can be retrieved from the http request if necessary.
    List<FormButtonModel> ageButtonList =
      [
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '18 ve altı', sequence: 1, onPressed: (){ageButtonPressed(0);}),
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '19 - 25', sequence: 1, onPressed: (){ageButtonPressed(1);}),
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '26 - 35', sequence: 1, onPressed: (){ageButtonPressed(2);}),
        FormButtonModel(id: ButtonListItems.age, isSelected: false, text: '36 ve üzeri', sequence: 1, onPressed: (){ageButtonPressed(3);}),
      ];
      
    //If no button has been selected, loop is not necessery. All of them can remain in the false state.
    //If any button is selected, for loop starts. All of them isSelected value equals false except selected one.
    if(selectedAgeIndex != -1){
      for(int i = 0; i < ageButtonList.length; i++){
        ageButtonList[i].isSelected = false;
        if(i == selectedAgeIndex){
          ageButtonList[i].isSelected = true;
        }
      }
    }

    return ageButtonList;
  }

  List<FormButtonModel> getSpendingHabitList() {
    
    //Set default button list. This list can be retrieved from the http request if necessary.
    List<FormButtonModel> spendingHabitsList =
      [
        FormButtonModel(id: ButtonListItems.travel, isSelected: false, text: 'Seyahat', sequence: 0, onPressed: (){spendingHabitsButtonPressed(0);}),
        FormButtonModel(id: ButtonListItems.onlineShopping, isSelected: false, text: 'Online Alışveriş', sequence: 0, onPressed: (){spendingHabitsButtonPressed(1);}),
        FormButtonModel(id: ButtonListItems.dining, isSelected: false, text: 'Yeme/İçme', sequence: 0, onPressed: (){spendingHabitsButtonPressed(2);}),
        FormButtonModel(id: ButtonListItems.grocery, isSelected: false, text: 'Gıda/Market', sequence: 0, onPressed: (){spendingHabitsButtonPressed(3);}),
        FormButtonModel(id: ButtonListItems.bill, isSelected: false, text: 'Fatura', sequence: 0, onPressed: (){spendingHabitsButtonPressed(4);}),
        FormButtonModel(id: ButtonListItems.other, isSelected: false, text: 'Diğer', sequence: 0, onPressed: (){spendingHabitsButtonPressed(5);}),
      ];

    return spendingHabitsList;
  }

   List<FormButtonModel> getExpectationList() {
    //Set default button list. This list can be retrieved from the http request if necessary.
    List<FormButtonModel> expectationList =
      [
        FormButtonModel(id: ButtonListItems.point, isSelected: false, text: 'Puan', sequence: 0, onPressed: (){expectationsButtonPressed(0);}),
        FormButtonModel(id: ButtonListItems.mile, isSelected: false, text: 'Mil', sequence: 0, onPressed: (){expectationsButtonPressed(1);}),
        FormButtonModel(id: ButtonListItems.saleCashback, isSelected: false, text: 'İndirim', sequence: 0, onPressed: (){expectationsButtonPressed(2);}),
        FormButtonModel(id: ButtonListItems.installment, isSelected: false, text: 'Taksit İmkanı', sequence: 0, onPressed: (){expectationsButtonPressed(3);}),
      ];
    
    return expectationList;
  }

  List<String> getTitleList(){
    
    //Set default button list. This list can be retrieved from the http request if necessary.
    List<String> titleList = [
      "Kaç yaşındasın?", 
      "Harcama alışkanlıkların neler?", 
      "Kredi kartından beklentilerini sırala"
    ];

    return titleList;
  }
  
  Future<void> continueClicked(BuildContext? context) async {
    if((state as FormPageCompleted).currentPageIndex != formPageCompleted.titleList.length - 1){ //Form is not completed.
      await pageController!.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
    else{//Form completed.
      if(context != null){
        formCompleted(context);
      }
    }
  }

  void goBackClicked() async{
    
    await pageController!.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);

  }

  void onPageChanged(int index){
    
    formPageCompleted = formPageCompleted.copyWith(currentPageIndex: index);
    
    //Update continue button activity with emit.
    changeContinueButtonActiveState();

  }

  void ageButtonPressed(int index){
      
    if(!(formPageCompleted.ageButtonList[index].isSelected)){
      selectedAgeIndex = index;
      continueClicked(null);
    }
    else{
      selectedAgeIndex = -1;
    }

    //Set default button list with the new selectedIndex value.
    formPageCompleted = formPageCompleted.copyWith(ageButtonList: getAgeButtonList());
    //Update continue button activity with emit.
    changeContinueButtonActiveState();

  }

  void spendingHabitsButtonPressed(int index){

    //Get list of current state.
    List<FormButtonModel> spendingHabitsList = List.of(formPageCompleted.spendingHabitList);
    List<FormButtonModel> spendingHabitsSelectedList = List.of(formPageCompleted.spendingHabitsSelectedList);
    
    //Change value of isSelected.
    spendingHabitsList[index].isSelected = !spendingHabitsList[index].isSelected;
    
    if(spendingHabitsList[index].isSelected){
      spendingHabitsSelectedList.add(spendingHabitsList[index]);
      int sequence = spendingHabitsSelectedList.indexOf(spendingHabitsList[index]) + 1;
      spendingHabitsList[index].sequence = sequence;
    }
    else{ //Selection remove
      //Remove the selection from the list of spendingHabitsSelectedList.
      spendingHabitsSelectedList.removeWhere((element) => element == spendingHabitsList[index]);
      //Changing sequence number.
      spendingHabitsList[index].sequence = 0;
      //Reorder the sequence of the chosen ones.
      for(int i = 0; i < spendingHabitsSelectedList.length; i++){
        int sequence = spendingHabitsSelectedList.indexOf(spendingHabitsSelectedList[i]) + 1; //Find the index of the selected item in the list of spendingHabitsSelectedList.
        spendingHabitsList.firstWhere((element) => element == spendingHabitsSelectedList[i]).sequence = sequence; //Set the value.
      }
    }
    
    formPageCompleted = formPageCompleted.copyWith(spendingHabitList: spendingHabitsList, spendingHabitsSelectedList: spendingHabitsSelectedList);
    
    //Update continue button activity.
    changeContinueButtonActiveState();  

  }

  void expectationsButtonPressed(int index){
    
    //Get list of current state.
    List<FormButtonModel> expectationsList = List.of(formPageCompleted.expectationList);
    List<FormButtonModel> expectationsSelectedList = List.of(formPageCompleted.expectationSelectedList);
    
    //Change value of isSelected.
    expectationsList[index].isSelected = !expectationsList[index].isSelected;

    //If button selected, add to selectedList and set the sequence number. Sequance number increase +1 beacause of user view. 
    if(expectationsList[index].isSelected){
      expectationsSelectedList.add(expectationsList[index]);
      int sequence = expectationsSelectedList.indexOf(expectationsList[index]) + 1;
      expectationsList[index].sequence = sequence;
    }
    else{ //Selection remove.
      //Remove the selection from the list of expactationsSelectedList.
      expectationsSelectedList.removeWhere((element) => element == expectationsList[index]);
      expectationsList[index].sequence = 0;
      //Reorder the sequence of the chosen ones.
      for(int i = 0; i < expectationsSelectedList.length; i++){
        int sequence = expectationsSelectedList.indexOf(expectationsSelectedList[i]) + 1; //Find the index of the selected item in the list of expactationsSelectedList.
        expectationsList.firstWhere((element) => element == expectationsSelectedList[i]).sequence = sequence; //Set the value.
      }
    }

    formPageCompleted = formPageCompleted.copyWith(expectationList: expectationsList, expectationSelectedList: expectationsSelectedList); //emit in changeContinueButtonActiveState();
    
    //Update continue button activity with emit.
    changeContinueButtonActiveState();

  }

  void changeContinueButtonActiveState(){
    //This function is updating the clickability of the continue button according to the page index and selected item list.
    //After that emit with new values. New values added to formPageCompleted state before this function. 

    if(state is FormPageCompleted){
      if(formPageCompleted.currentPageIndex  == 0){
        formPageCompleted = formPageCompleted.copyWith(isContinueButtonActive: selectedAgeIndex != -1 ? true : false);
      }
      else if(formPageCompleted.currentPageIndex == 1){
        formPageCompleted = formPageCompleted.copyWith(isContinueButtonActive: formPageCompleted.spendingHabitsSelectedList.isNotEmpty ? true : false);
      }
      else{
        formPageCompleted = formPageCompleted.copyWith(isContinueButtonActive: formPageCompleted.expectationSelectedList.isNotEmpty ? true : false);
      }
    }
    emit(formPageCompleted);
  }

  void formCompleted(BuildContext context){
    //TeklifimGelsin
    
    //For reach to values of current state. 
    FormPageCompleted currentState =  state as FormPageCompleted;
    
    //Create Form Result model with current state.
    FormResultModel formResultModel = FormResultModel(
      age: selectedAgeIndex+1, 
      spendingHabitsList: currentState.spendingHabitList,
      expectationsList: currentState.expectationList,
    );

    //Push OfferListingPage with formResultModel.
    Navigator.pushNamed(context, ProjectRoutes.offerListingPage.name, arguments: {Arguments.formResultModel: formResultModel});
  }
}
