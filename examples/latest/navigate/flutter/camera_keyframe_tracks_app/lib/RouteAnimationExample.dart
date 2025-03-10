/*
 * Copyright (C) 2019-2022 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */
import 'package:camera_keyframe_tracks_app/helper/RouteCalculator.dart';
import 'package:here_sdk/animation.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:here_sdk/routing.dart' as routes;

class RouteAnimationExample {
  final HereMapController _hereMapController;
  late RouteCalculator _routeCalculator;
  routes.Route? route;

  RouteAnimationExample(HereMapController hereMapController)
      : _hereMapController = hereMapController {
    _routeCalculator = RouteCalculator(_hereMapController);
    _routeCalculator.createRoute();
  }

  void stopRouteAnimation() {
    _hereMapController.camera.cancelAnimations();
  }

  void animateToRoute(routes.Route route) {
    // Untilt and unrotate the map.
    double bearing = 0;
    double tilt = 0;
    // We want to show the route fitting in the map view without any additional padding.
    Point2D origin = Point2D(0, 0);
    Size2D sizeInPixels = Size2D(_hereMapController.viewportSize.width, _hereMapController.viewportSize.height);
    Rectangle2D mapViewport = Rectangle2D(origin, sizeInPixels);

    // Animate to route.
    MapCameraUpdate update = MapCameraUpdateFactory.lookAtAreaWithGeoOrientationAndViewRectangle(route!.boundingBox,
        GeoOrientationUpdate(bearing, tilt),
        mapViewport);
    MapCameraAnimation animation = MapCameraAnimationFactory.createAnimationFromUpdate(
        update, const Duration(milliseconds: 3000), EasingFunction.inCubic);
    _hereMapController.camera.startAnimation(animation);
  }
}
