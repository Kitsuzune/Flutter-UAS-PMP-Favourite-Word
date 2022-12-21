import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:favoritword/provider/favorite_provider.dart';
import 'package:favoritword/screens/favorite.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(200).toList();
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
          title: Row(
            children: <Widget>[
              const Text('Kata-Kata Bahasa Inggris Teratas'),
              Align(
              alignment: Alignment.center,
              child:
                IconButton(
                  icon: const Icon(
                    Icons.plus_one_rounded,
                    color: Colors.white,
                  ),
                  onPressed: (){},
                  ),
                ) ,
            ],
          )
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(Icons.favorite, color: Colors.blue)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const FavoritePage(),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favorit'),
      ),


    );
  }
}