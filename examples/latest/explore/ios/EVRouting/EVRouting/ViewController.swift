/*
 * Copyright (C) 2019-2022 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import heresdk
import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var mapView: MapView!
    private var routingExample: RoutingExample!
    private var isMapSceneLoaded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.mapScene.loadScene(mapScheme: MapScheme.normalDay, completion: onLoadScene)
    }

    private func onLoadScene(mapError: MapError?) {
        guard mapError == nil else {
            print("Error: Map scene not loaded, \(String(describing: mapError))")
            return
        }

        // Start the example.
        self.routingExample = RoutingExample(viewController: self, mapView: self.mapView!)
        self.isMapSceneLoaded = true
    }

    @IBAction func onAddRouteButtonClicked(_ sender: Any) {
        if isMapSceneLoaded {
            routingExample.addRoute()
        }
    }

    @IBAction func onReachableAreaButtonClicked(_ sender: Any) {
        if isMapSceneLoaded {
            routingExample.showReachableArea()
        }
    }

    @IBAction func onClearMapButtonClicked(_ sender: Any) {
        if isMapSceneLoaded {
            routingExample.clearMap()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        mapView.handleLowMemory()
    }
}
