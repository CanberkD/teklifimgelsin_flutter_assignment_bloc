part of 'form_page_cubit.dart';

@immutable
sealed class FormPageState extends Equatable {
  const FormPageState();
}

final class FormPageInitial extends FormPageState {
  const FormPageInitial();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class FormPageLoading extends FormPageState{

  const FormPageLoading();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class FormPageCompleted extends FormPageState{
    
  FormPageCompleted({
    bool? isContinueButtonActive,
    List<FormButtonModel>? ageButtonList,
    List<FormButtonModel>? spendingHabitList,
    List<FormButtonModel>? spendingHabitsSelectedList,
    List<FormButtonModel>? expectationSelectedList,
    List<FormButtonModel>? expectationList,
    List<String>? titleList,
    int? currentPageIndex
  }): 
  isContinueButtonActive = isContinueButtonActive ?? false,
  ageButtonList = ageButtonList ?? [],
  spendingHabitList = spendingHabitList ?? [],
  spendingHabitsSelectedList = spendingHabitsSelectedList ?? [],
  expectationSelectedList = expectationSelectedList ?? [],
  expectationList = expectationList ?? [],
  titleList = titleList ?? [],
  currentPageIndex = currentPageIndex ?? 0;



  final List<FormButtonModel> ageButtonList;
  final List<FormButtonModel> spendingHabitList;
  final List<FormButtonModel> spendingHabitsSelectedList;
  final List<FormButtonModel> expectationSelectedList;
  final List<FormButtonModel> expectationList;
  final List<String> titleList;
  final int currentPageIndex;
  final bool isContinueButtonActive;


  @override
  List<Object?> get props => [ageButtonList, spendingHabitList, spendingHabitsSelectedList, expectationSelectedList, expectationList, titleList, currentPageIndex];

      FormPageCompleted copyWith({
    List<FormButtonModel>? ageButtonList,
    List<FormButtonModel>? spendingHabitList,
    List<FormButtonModel>? spendingHabitsSelectedList,
    List<FormButtonModel>? expectationSelectedList,
    List<FormButtonModel>? expectationList,
    List<String>? titleList,
    int? currentPageIndex,
    bool? isContinueButtonActive    
  }) {
    return FormPageCompleted(
      ageButtonList: ageButtonList ?? this.ageButtonList,
      spendingHabitList: spendingHabitList ?? this.spendingHabitList,
      spendingHabitsSelectedList: spendingHabitsSelectedList ?? this.spendingHabitsSelectedList,
      expectationSelectedList: expectationSelectedList ?? this.expectationSelectedList,
      expectationList: expectationList ?? this.expectationList,
      titleList: titleList ?? this.titleList,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      isContinueButtonActive: isContinueButtonActive ?? this.isContinueButtonActive
    );
  }


}

final class FormPageError extends FormPageState{
  const FormPageError(this.error);

  final String error;
  
  @override
  List<Object?> get props => throw UnimplementedError();
}