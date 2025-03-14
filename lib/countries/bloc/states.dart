import 'package:equatable/equatable.dart';
import 'package:my_first_app/countries/model.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountriesInitial extends CountryState {
  @override
  List<Object> get props => [];
}

class CountriesLoading extends CountryState {
  @override
  List<Object> get props => [];
}

class CountriesLoaded extends CountryState {
  final List<CountryModel> countries;

  const CountriesLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountriesError extends CountryState {
  final String message;

  const CountriesError({required this.message});

  @override
  List<Object> get props => [message];
}
