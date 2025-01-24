import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    console.log("Hello from MapController!");
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });

    // Add markers to the map
    this.#addMarkersToMap();

    // Adjust the map to fit all markers
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 0, maxZoom: 0, duration: 0 })
    window.addEventListener('resize', () => {
      this.map.resize();
    });
  }
}
