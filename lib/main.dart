import 'package:app_dev_spring_2025/countries/bloc/events.dart';

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    context.read<CountryBloc>().add(LoadCountriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries List'),
      ), // AppBar

      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountriesInitial || state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountriesLoaded) {
            return Text('Data loaded');
            return ListView.builder(
                // ListView.builder implementation will go here
                );
          } else if (state is CountriesError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ), // BlocBuilder
    ); // Scaffold
  }
}
