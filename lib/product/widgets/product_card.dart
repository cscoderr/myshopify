import 'package:cached_network_image/cached_network_image.dart';
import 'package:dengun_challenge/app/app_router.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.title,
    this.id,
    this.imageSrc,
    this.productType,
    this.tags,
    this.createdAt,
    this.status,
    this.totalInventory,
  }) : super(key: key);

  final String? title;
  final int? id;
  final String? imageSrc;
  final String? productType;
  final String? tags;
  final String? createdAt;
  final String? status;
  final String? totalInventory;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(MyshopifyPages.details, arguments: id!),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              CachedNetworkImage(
                imageUrl: imageSrc!,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Product Type: '),
                  Text(
                    productType!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Tags: '),
                  Text(
                    tags!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Total Inventory: '),
                  Text(
                    totalInventory!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Status: '),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(MyshopifyPages.details, arguments: id!),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('View Details'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
