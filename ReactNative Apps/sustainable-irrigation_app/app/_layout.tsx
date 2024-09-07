import { Stack } from "expo-router";
import * as SplashScreen from "expo-splash-screen";
import { useFonts } from "expo-font";
import { useEffect } from "react";
//import { ClerkLoaded, ClerkProvider } from "@clerk/clerk-expo";
//import { tokenCache } from "@/lib/auth";

//const publishableKey = process.env.EXPO_PUBLIC_CLERK_PUBLISHABLE_KEY;

SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  const [loaded] = useFonts({
    "Rubik-Bold": require("../assets/fonts/Rubik-Bold.ttf"),
    "Rubik-Medium": require("../assets/fonts/Rubik-Medium.ttf"),
    "Rubik-Regular": require("../assets/fonts/Rubik-Regular.ttf"),
    "Rubik-Light": require("../assets/fonts/Rubik-Light.ttf"),
    "Rubik-Black": require("../assets/fonts/Rubik-Black.ttf"),
  });

  useEffect(() => {
    if (loaded) {
      SplashScreen.hideAsync();
    }
  });
  if (!loaded) {
    return null;
  }

  // if (!publishableKey) {
  //   throw new Error(
  //     "Missing Publishable Key. Please set EXPO_PUBLIC_CLERK_PUBLISHABLE_KEY in your .env"
  //   );
  // }

  return (
    // <ClerkProvider publishableKey={publishableKey} tokenCache={tokenCache}>
    //   <ClerkLoaded>
    <Stack>
      <Stack.Screen name="index" options={{ headerShown: false }} />
      <Stack.Screen name="(auth)" options={{ headerShown: false }} />
      <Stack.Screen name="(root)" options={{ headerShown: false }} />
    </Stack>
    //   </ClerkLoaded>
    // </ClerkProvider>
  );
}
