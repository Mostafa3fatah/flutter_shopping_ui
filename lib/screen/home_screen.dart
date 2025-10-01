import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screen/welcome_screen.dart';
import 'package:my_app/models/product_images.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Mostafa Mohmed'),
              accountEmail: Text('mostafa3fatah56@gmial.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person_2),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'.tr()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('cart'.tr()),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.local_pizza_outlined),
              title: Text('orders'.tr()),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite'.tr()),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('setting'.tr()),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('language'.tr()),
              onTap: () {
                changeLang();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('log_out'.tr()),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyWelcome()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                    if (!isSearching) {
                      searchController.clear();
                    }
                  });
                },
                icon: Icon(isSearching ? Icons.close : Icons.search))
          ],
          title: !isSearching
              ? Text(
                  'our_products'.tr(),
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                )
              : TextField(
                  controller: SearchController(),
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'search_products'.tr(),
                      border: InputBorder.none),
                )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'featured_products'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 180,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: PageController(viewportFraction: 0.7),
                itemCount: productImage.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            productImage[index],
                            height: 140,
                            width: MediaQuery.of(context).size.width * 0.52,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('product${index + 1}'),
                        Text(
                          "Description here",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Text(
                          product.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'EG${product.price}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${product.name}added to the cart')));
                            },
                            icon: Icon(Icons.add_shopping_cart))
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'hot_offers'.tr(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: offers.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  offers[index]['image']!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Text(
                                  offers[index]['description']!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeLang() {
    if (context.locale == Locale('en')) {
      context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }
}
// ""
