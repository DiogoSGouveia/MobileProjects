import { SafeAreaView } from "react-native-safe-area-context";
import { Image, Text, View } from "react-native";
import Map from "@/components/Map";
import { useLocationStore } from "@/store";
import { useEffect, useRef, useState } from "react";
import * as Location from "expo-location";
import { icons } from "@/constants";
import TopBar from "@/components/TopBar";
import BottomSheet, { BottomSheetView } from "@gorhom/bottom-sheet";
import { GestureHandlerRootView } from "react-native-gesture-handler";
import CustomButton from "@/components/CustomButton";
import { router } from "expo-router";

//import { useUser } from "@clerk/clerk-expo";

const Home = () => {
  const { setUserLocation } = useLocationStore();

  const [isOnline, setisOnline] = useState(true);

  const [hasPermissions, setHasPermissions] = useState(false);

  useEffect(() => {
    const requestLocation = async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();

      if (status !== "granted") {
        setHasPermissions(false);
      }

      let location = await Location.getCurrentPositionAsync({});

      const address = await Location.reverseGeocodeAsync({
        latitude: location.coords?.latitude!,
        longitude: location.coords?.longitude!,
      });

      setUserLocation({
        address: `${address[0].name}, ${address[0].region}`,
        latitude: location.coords?.latitude!,
        longitude: location.coords?.longitude!,
        // latitude: 37.78825,
        // longitude: -122.4324,
      });
    };
    requestLocation();
  }, []);

  const bottomSheetRef = useRef<BottomSheet>(null);
  return (
    <GestureHandlerRootView>
      <View className="flex-1 bg-general-100">
        <View className="flex  h-screen bg-secondary-500">
          <View className="absolute z-10 top-16 w-full ">
            <TopBar />
          </View>

          <Map />
        </View>
        <BottomSheet
          backgroundStyle={{ backgroundColor: "#F8F0FB" }}
          keyboardBehavior="extend"
          ref={bottomSheetRef}
          snapPoints={["15%", "30%", "40%"]}
          index={0}
        >
          <BottomSheetView style={{ flex: 1, padding: 20 }}>
            <View className="flex flex-row items-center justify-between">
              <View className="flex flex-col">
                <Text className="text-3xl font-RubikBold">
                  Coimbra National Park
                </Text>
                <Text className="text-lg mt-2 font-RubikMedium text-primary-500">
                  Details:
                </Text>
              </View>
              <View
                className={`w-3 h-3 rounded-full ${
                  isOnline ? "bg-success-600" : "bg-red-500"
                } items-center bottom-4 right-4 justify-center`}
              ></View>
            </View>
            <View className="mt-5 flex-row justify-center ">
              <View className="p-5 flex-row rounded-2xl  border-primary-400 border-2">
                <Image source={icons.temperature} className="w-10 h-10" />
                <Text className="text-lg ml-2 mt-2 font-RubikMedium">37ºC</Text>
              </View>
              <View className=" p-5" />
              <View className="p-5 flex-row rounded-2xl border-primary-400  border-2">
                <Image source={icons.humidity} className="w-10 h-10" />
                <Text className="text-lg ml-2 mt-2 font-RubikMedium">20%</Text>
              </View>
            </View>
            <View className=" mt-10">
              <CustomButton
                onPress={() => {
                  router.push("/(root)/park-details");
                }}
                title="More Details"
                bgVariant="secondary"
                textVariant="secondary"
              />
            </View>
          </BottomSheetView>
        </BottomSheet>
      </View>
    </GestureHandlerRootView>
  );
};

export default Home;
