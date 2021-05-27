import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

abstract class MapTileProvider {
  String get id;

  /// The image will be used for show on the Map Type Selector
  WidgetBuilder get imageBuilder;

  /// Build your own custom MapTiles
  List<LayerOptions> buildTileLayerOptions();

  String name(BuildContext context);
}

class OSMDefaultMapTile extends MapTileProvider {
  @override
  List<LayerOptions> buildTileLayerOptions() {
    return [
      TileLayerOptions(
        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      ),
    ];
  }

  @override
  String get id => "OSMDefaulMapTile";

  @override
  WidgetBuilder get imageBuilder => (context) => Image.asset(
        "assets/images/OpenMapTiles.png",
        package: "trufi_core",
        fit: BoxFit.cover,
      );

  @override
  String name(BuildContext context) {
    return id;
  }
}
