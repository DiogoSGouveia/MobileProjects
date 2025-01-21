import { Stack } from "expo-router";

const Layout = () => {
  return (
    <Stack>
      <Stack.Screen name="game-selector" options={{ headerShown: false }} />
      <Stack.Screen name="(games)/wordle" options={{ headerShown: false }} />
    </Stack>
  );
};

export default Layout;
