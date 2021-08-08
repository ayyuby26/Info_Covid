import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../province_model.dart';

class HomeView extends GetView<HomeController> {
  TextStyle get _headStyl {
    return const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get _titleCardStyl {
    return const TextStyle(
      fontSize: 17,
    );
  }

  Widget get _header {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Info Covid Di Indonesia",
            style: _headStyl,
          ),
          Text(
            "${controller.getDate()}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller;

    _card({
      required String title,
      required String val,
      required Color color,
      required EdgeInsetsGeometry margin,
      Color? textColor,
    }) {
      final _widget = Container(
        margin: margin,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$title",
              style: _titleCardStyl.copyWith(
                color: textColor ?? Colors.white,
              ),
            ),
            Text(
              "$val",
              style: _titleCardStyl.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      );

      return val == "null"
          ? Shimmer.fromColors(
              highlightColor: Colors.black.withOpacity(.05),
              baseColor: Colors.black.withOpacity(.1),
              child: _widget,
            )
          : _widget;
    }

    final _cardWidget = Obx(
      () {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _card(
                    margin: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                    title: "Positif",
                    val: "${controller.nationalData().positif}",
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: _card(
                    margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                    title: "Sembuh",
                    val: "${controller.nationalData().sembuh}",
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _card(
                    margin: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                    title: "Dirawat",
                    val: "${controller.nationalData().dirawat}",
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ),
                Expanded(
                  child: _card(
                    margin: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                    title: "Meninggal",
                    val: "${controller.nationalData().meninggal}",
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header,
            _cardWidget,
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Info Covid Perprovinsi",
                style: _headStyl,
              ),
            ),
            const SizedBox(height: 15),
            _ItemList().titleItemList,
            Expanded(
              child: _ItemList()._itemList,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemList extends HomeView {
  TextStyle get _captionListStyl {
    return const TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  Widget get titleItemList {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Nama Provinsi",
              style: _captionListStyl,
            ),
          ),
          Row(
            children: [
              Text(
                "Positif",
                style: _captionListStyl.copyWith(
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Sembuh",
                  style: _captionListStyl.copyWith(
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                "Meninggal",
                style: _captionListStyl.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get _itemList {
    return Obx(
      () {
        int _itemCount() {
          final _dt = controller.provinceDataList;
          return _dt.isEmpty ? 30 : _dt.length;
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(10, 2, 10, 10),
          itemBuilder: (context, i) {
            ProvinceModel? _data;
            if (controller.provinceDataList.isNotEmpty) {
              _data = controller.provinceDataList[i];
            }
            Widget _valData() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${_data?.provinsi}"),
                  Row(
                    children: [
                      Text(
                        "${controller.numFormat(_data?.kasusPosi)}",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${controller.numFormat(_data?.kasusSemb)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "${controller.numFormat(_data?.kasusMeni)}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }

            final _itemList = Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.1),
                    blurRadius: 5,
                  )
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: _data == null ? Text("") : _valData(),
            );

            return controller.provinceDataList.isNotEmpty
                ? _itemList
                : Shimmer.fromColors(
                    child: _itemList,
                    highlightColor: Colors.black.withOpacity(.05),
                    baseColor: Colors.black.withOpacity(.1),
                  );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: _itemCount(),
        );
      },
    );
  }
}
