import { Text, View } from "react-native";

import "../global.css";
import { Redirect } from "expo-router";

export default function Home() {
  return (
    <Redirect href="/(auth)/welcome" />
  );
}
