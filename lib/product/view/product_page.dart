import 'package:dengun_challenge/app/app.dart';
import 'package:dengun_challenge/product/notifier/product_notifier.dart';
import 'package:dengun_challenge/product/product.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productProvider =
    StateNotifierProvider.autoDispose<ProductNotifier, ProductState>((ref) {
  return ProductNotifier(ref.read(myshopifyRepositoryProvider));
});

class ProductPage extends ConsumerStatefulWidget {
  final String? tag;
  const ProductPage({Key? key, this.tag}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  void initState() {
    ref.read(productProvider.notifier).getProductWithTag(tag: widget.tag!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productNotifier = ref.watch(productProvider);
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Builder(
            builder: (context) {
              if (productNotifier.status == ProductStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (productNotifier.status == ProductStatus.success) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tag: ${widget.tag}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            title: productNotifier.products[index].title,
                            id: productNotifier.products[index].id,
                            imageSrc:
                                productNotifier.products[index].image!.src,
                            productType:
                                productNotifier.products[index].productType,
                            status: productNotifier.products[index].status!
                                .toLowerCase(),
                            createdAt: productNotifier
                                .products[index].createdAt!
                                .split('T')[0],
                            tags: productNotifier.products[index].tags,
                            totalInventory: productNotifier
                                .products[index].variants!.length
                                .toString(),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: productNotifier.products.length,
                      ),
                    ),
                  ],
                );
              } else if (productNotifier.status == ProductStatus.failure) {
                return Center(
                  child: Text(productNotifier.errorMessage!),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
