part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<Either<String, ListMovieModel>>(
          future: MovieService.fetchMovie(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const MovieCard(
                    isLoading: true,
                  );
                },
              );
            }
            if (snapshot.hasData) {
              return snapshot.data!.fold(
                (l) => Text(l),
                (r) => GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: r.results!.length,
                  itemBuilder: (context, index) {
                    final data = r.results![index];
                    return MovieCard(
                      data: data,
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
