import 'package:flutter/material.dart';
import 'package:madeh_exam/product_model.dart';
import 'package:madeh_exam/services.dart';

class searchPage extends StatefulWidget {
  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController search = TextEditingController();

  String SearchText = '';
  String image = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                  width: 400,
                  child: TextField(
                    controller: search,
                    onChanged: (value) async {
                      print(value);
                      // await Future.delayed(Duration(seconds: 5));
                      // print(await getData(search.text));
                      SearchText = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        label: Text('Search'),
                        hintText: ' Anywhere, Anytime, Add guest',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  )),
            ),
            FutureBuilder(
              future: getData(SearchText),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic temp = snapshot.data;

                  List<product_model> result = List.generate(temp.length,
                      (index) => product_model.fromMap(temp[index]));

                  return SizedBox(
                    width: double.maxFinite,
                    height: 400,
                    child: ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                              // shape: Border(),
                              leading: Image.network(result[index].thumbnail),
                              title: Text((result[index].id).toString()),
                              subtitle: Text(result[index].title),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              height: 1,
                            ),
                        itemCount: result.length),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text('Error'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
// class HeroSecondExample extends StatelessWidget {
//   HeroSecondExample({super.key, required this.index});
//   int index;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Hero(tag: index, child: Image.network(result[index].thumbnail))
//         ],
//       ),
//     );
//   }
// }