import 'package:promat/components/custom_appbar.dart';
import 'package:promat/components/product_card.dart';
import 'package:promat/constant/constant.dart';
import 'package:promat/model/home_products_model.dart';
import 'package:promat/riverpod/home_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

final homeRiverpod = ChangeNotifierProvider((ref) => HomeRiverpod());

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(homeRiverpod);
    var read = ref.read(homeRiverpod);
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: CampaignsPageView(read, watch),
          ),
          HomeProductCategories(read.hotDeals),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox Space() => const SizedBox(height: 10);

  // ignore: non_constant_identifier_names
  Stack CampaignsPageView(HomeRiverpod read, HomeRiverpod watch) {
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (newPageValue) => read.setCampaignsIndex(newPageValue),
          controller: read.pageController,
          itemBuilder: (context, index) => Image.asset(
            watch.campaigns[index],
            fit: BoxFit.fill,
          ),
          itemCount: read.campaigns.length,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < read.campaigns.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: campaignsDot(watch, i),
              ),
          ],
        )
      ],
    );
  }

  Align campaignsDot(HomeRiverpod watch, int i) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: 3.allP,
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color:
              watch.campaignsCurrentIndex == i ? Constant.white : Constant.gray,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget HomeProductCategories(CalorieAndWaterPart model) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.categoryTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 20,
            ),
            itemCount: model.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: model.products[index]
                  //product: model.products[index],
                  );
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
