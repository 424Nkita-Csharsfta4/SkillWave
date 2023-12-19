import 'package:bloc/bloc.dart';
import 'package:skillwave/bloc/onboarding_events.dart';
import 'package:skillwave/bloc/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingStates> {
  OnboardingBloc() : super(OnboardingStates()) {
    on<OnboardingEvents>((event, emit) {
      return emit(OnboardingStates(pageIndex: state.pageIndex));
    });
  }
}
