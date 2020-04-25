import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';
import 'product_row_item.dart';

class ProductListTab extends StatefulWidget {
  @override
  _ProductListTabState createState() {
    return _ProductListTabState();
  }
}

class _ProductListTabState extends State<ProductListTab> {
  @override
  void initState() {
    // debugPrint('On load...');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();

        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Listings'),
            ),
            SliverSafeArea(
               top: false,
               minimum: const EdgeInsets.only(top: 8),
               sliver: SliverList(
                 delegate: SliverChildBuilderDelegate(
                   (context, index) {
                     if (index < products.length) {
                       return ProductRowItem(
                         index: index,
                         product: products[index],
                         lastItem: index == products.length - 1,
                       );
                     }
                     return null;
                   },
                 ),
               ),
            )
          ],
        );
      },
    );
  }
}