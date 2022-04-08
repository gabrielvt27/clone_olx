import 'package:clone_olx/screens/myads/components/active_ad_tile.dart';
import 'package:clone_olx/screens/myads/components/pending_ad_tile.dart';
import 'package:clone_olx/screens/myads/components/sold_ad_tile.dart';
import 'package:clone_olx/stores/myads_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key, this.initialPage = 0}) : super(key: key);

  final int initialPage;

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAdsStore myAdsStore = MyAdsStore();
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Anúncios"),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(
              child: Text('ATIVOS'),
            ),
            Tab(
              child: Text('PENDENTES'),
            ),
            Tab(
              child: Text('VENDIDOS'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TabBarView(
          controller: tabController,
          children: [
            Observer(
              builder: (context) {
                if (myAdsStore.activeAds.isEmpty) return Container();

                return ListView.builder(
                  itemCount: myAdsStore.activeAds.length,
                  itemBuilder: (context, index) {
                    return ActiveAdTile(ad: myAdsStore.activeAds[index]);
                  },
                );
              },
            ),
            Observer(
              builder: (context) {
                if (myAdsStore.pendingAds.isEmpty) return Container();

                return ListView.builder(
                  itemCount: myAdsStore.pendingAds.length,
                  itemBuilder: (context, index) {
                    return PendingAdTile(ad: myAdsStore.pendingAds[index]);
                  },
                );
              },
            ),
            Observer(
              builder: (context) {
                if (myAdsStore.soldAds.isEmpty) return Container();

                return ListView.builder(
                  itemCount: myAdsStore.soldAds.length,
                  itemBuilder: (context, index) {
                    return SoldAdTile(ad: myAdsStore.soldAds[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
