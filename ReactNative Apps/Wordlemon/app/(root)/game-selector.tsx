import Header from "@/components/Header";
import { router } from "expo-router";
import { View, Text, Button } from "react-native";

const GameSelector = () => {
  return (
    <View className="flex-1 justify-start items-center bg-background-light dark:bg-background-dark">
      <Header />

      <Text className="mt-16 text-4xl font-josefin500Medium text-text-light dark:text-text-dark">
        Select a game:
      </Text>
      <Button title="Play Wordle" onPress={() => router.push("/wordle")} />
    </View>
  );
};

export default GameSelector;
