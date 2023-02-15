part of 'screens.dart';

class DetailScreen extends StatelessWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          BlocConsumer<PoinCubit, int>(
            listener: (context, state) {
              if (state > 1000) {
                Commons.showSnackbar(
                    context, 'Kamu Berhasil Mengumpulkan 1000 Poin');
              }
            },
            builder: (context, state) {
              return '$state'
                  .richText
                  .bold
                  .withTextSpanChildren([' Poin'.textSpan.normal.make()])
                  .bold
                  .makeCentered()
                  .pOnly(right: 16);
            },
          ),
        ],
      ),
      body: FutureBuilder<dartz.Either<String, Result>>(
          future: MovieService.fetchDetailMovie(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return snapshot.data!.fold(
                (l) => Text(l),
                (r) => VStack(
                  [
                    VxBox(
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${r.backdropPath}"))
                        .sizePCT(context: context, widthPCT: 100, heightPCT: 30)
                        .make()
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
