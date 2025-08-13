import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/home_bloc/home_event.dart';
import '../bloc/home_bloc/home_state.dart';
import '../services/api_service.dart';
import '../widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(apiService: ApiService())..add(const HomeFetchImages(limit: 30)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Picsum Gallery',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeFailure) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 12),
                      Text(
                        'Failed to load images',
                        style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<HomeBloc>().add(const HomeFetchImages(limit: 30)),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.images.length,
                itemBuilder: (context, index) => ImageCard(image: state.images[index]),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
