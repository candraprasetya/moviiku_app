part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final bool isLoading;
  final bool isPoster;
  final Result? data;

  const MovieCard({
    Key? key,
    this.isLoading = false,
    this.isPoster = true,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color grey = const Color.fromARGB(255, 240, 239, 239);
    return isLoading
        ? VxBox()
            .rounded
            .color(grey)
            .sizePCT(context: context, widthPCT: 36, heightPCT: 24)
            .make()
            .shimmer()
        // : GestureDetector(
        //     onTap: () {
        //       context.go('/detail/${data!.id}');
        //     },
        //     child: Container(
        //       width: MediaQuery.of(context).size.width * 0.36,
        //       height: MediaQuery.of(context).size.height * 0.24,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           image: DecorationImage(
        //               fit: BoxFit.cover,
        //               image: NetworkImage(data!.posterPath!.isEmpty
        //                   ? "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png"
        //                   : "https://image.tmdb.org/t/p/w500/${data!.posterPath!}"))),
        //     ),
        //   );
        : VxBox()
            .rounded
            .bgImage(
              DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data!.posterPath!.isEmpty
                      ? "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png"
                      : "https://image.tmdb.org/t/p/w500/${data!.posterPath!}")),
            )
            .make()
            .onTap(() {
            context.go('/detail/${data!.id}');
          });
  }
}
