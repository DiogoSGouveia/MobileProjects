import { Stack } from "expo-router";
import { useFonts } from "@expo-google-fonts/poppins";

export default function RootLayout() {
  let [fontsLoaded] = useFonts({
    "PoppinsRegular": require("@expo-google-fonts/poppins/Poppins_400Regular.ttf"),
    "PoppinsBold": require("@expo-google-fonts/poppins/Poppins_700Bold.ttf"),
    "PoppinsItalic": require("@expo-google-fonts/poppins/Poppins_400Regular_Italic.ttf"),
    "PoppinsBoldItalic": require("@expo-google-fonts/poppins/Poppins_700Bold_Italic.ttf"),
  });

  if (!fontsLoaded) {
    return null; // or a loading indicator
  }
  return <Stack>
    <Stack.Screen name="index" options={{headerShown: false}} />
    <Stack.Screen name="(auth)" options={{headerShown: false}} />
    <Stack.Screen name="(root)" options={{headerShown: false}} />
  </Stack>
}
