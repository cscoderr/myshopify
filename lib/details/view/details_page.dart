import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dengun_challenge/app/app.dart';
import 'package:dengun_challenge/details/details.dart';
import 'package:dengun_challenge/details/notifier/details_notifier.dart';
import 'package:dengun_challenge/details/widgets/slider_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final detailsProvider =
    StateNotifierProvider.autoDispose<DetailsNotifier, DetailsState>((ref) {
  return DetailsNotifier(ref.read(myshopifyRepositoryProvider));
});

class DetailsPage extends ConsumerStatefulWidget {
  final Object? productId;
  const DetailsPage({Key? key, this.productId}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  late CarouselController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
    ref.read(detailsProvider.notifier).getProduct(
          id: int.parse(
            widget.productId!.toString(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final detailsNotifier = ref.watch(detailsProvider);
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Builder(builder: (context) {
        if (detailsNotifier.status == DetailsStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (detailsNotifier.status == DetailsStatus.success) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      aspectRatio: 1.8,
                    ),
                    itemCount: detailsNotifier.product!.images!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        CachedNetworkImage(
                      imageUrl:
                          detailsNotifier.product!.images![itemIndex].src!,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SliderIndicator(
                    carouselController: _controller,
                    currentIndex: 0,
                    length: detailsNotifier.product!.images!.length,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    detailsNotifier.product!.title!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.33,
                      aspectRatio: 2.5,
                    ),
                    itemCount: detailsNotifier.product!.variants!.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) =>
                            Center(
                      child: Card(
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            detailsNotifier.product!.variants![index].title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            "\$" +
                                detailsNotifier
                                    .product!.variants![index].price!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.amber,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Product Type',
                    text: detailsNotifier.product!.productType!,
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Vendor',
                    text: detailsNotifier.product!.vendor!,
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Tags',
                    text: detailsNotifier.product!.tags!,
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Handle',
                    text: detailsNotifier.product!.handle!,
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Status',
                    text: detailsNotifier.product!.status!,
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Last Updated',
                    text: detailsNotifier.product!.updatedAt!.split('T')[0],
                  ),
                  const SizedBox(height: 10),
                  DetailsTile(
                    title: 'Date',
                    text: detailsNotifier.product!.createdAt!.split('T')[0],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
