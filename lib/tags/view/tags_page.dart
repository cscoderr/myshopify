import 'package:dengun_challenge/app/app.dart';
import 'package:dengun_challenge/app/app_router.dart';
import 'package:dengun_challenge/tags/notifier/tags_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tagsProvider = StateNotifierProvider<TagsNotifier, TagsState>((ref) {
  return TagsNotifier(ref.read(myshopifyRepositoryProvider));
});

class TagsPage extends ConsumerStatefulWidget {
  const TagsPage({Key? key}) : super(key: key);

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends ConsumerState<TagsPage> {
  @override
  void initState() {
    ref.read(tagsProvider.notifier).tags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tagNotifier = ref.watch(tagsProvider);
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopify'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: ref.read(tagsProvider.notifier).onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: color,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Showing ${tagNotifier.tags.length} tags',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (tagNotifier.status == TagsStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (tagNotifier.status == TagsStatus.success) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            color: color.withOpacity(0.8),
                            shadowColor: color,
                            child: ListTile(
                              onTap: () => Navigator.of(context).pushNamed(
                                  MyshopifyPages.product,
                                  arguments: tagNotifier.tags[index].name!),
                              title: Text(
                                tagNotifier.tags[index].name!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemCount: tagNotifier.tags.length,
                      );
                    } else if (tagNotifier.status == TagsStatus.failure) {
                      return Center(
                        child: Text(tagNotifier.errorMessage),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
