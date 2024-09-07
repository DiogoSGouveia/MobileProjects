import React, { useEffect, useState } from "react";
import { ActivityIndicator, Text, View, Image } from "react-native";
import MapView, { Marker, PROVIDER_DEFAULT } from "react-native-maps";
import { icons } from "@/constants";
import { useLocationStore } from "@/store";
import { calculateRegion } from "@/lib/map";

const directionsAPI = process.env.EXPO_PUBLIC_DIRECTIONS_API_KEY;

const Map = () => {
  const { userLatitude, userLongitude } = useLocationStore();

  const region = calculateRegion({
    userLatitude,
    userLongitude,
  });

  if (!userLatitude && !userLongitude)
    return (
      <View className="justify-center items-center w-full h-full">
        <ActivityIndicator size="large" color="#FFF" />
      </View>
    );

  return (
    <MapView
      provider={PROVIDER_DEFAULT}
      className="w-full h-full  "
      showsPointsOfInterest={false}
      showsUserLocation={true}
      mapType="standard"
      initialRegion={region}
      showsMyLocationButton={true}
      userInterfaceStyle="light"
    ></MapView>
  );
};

export default Map;
