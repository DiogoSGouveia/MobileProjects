import { SplashScreen, Stack } from "expo-router";

const Layout = () => {
  return (
    <Stack>
      <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
      <Stack.Screen name="park-details" options={{ headerShown: false }} />
    </Stack>
  );
};

export default Layout;
