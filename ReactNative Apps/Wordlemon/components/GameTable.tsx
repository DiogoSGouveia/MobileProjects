import { View, Text } from "react-native";
import InputField from "./InputField";
import AnswerCard from "./AnswerCard";
import { GameTableProps } from "@/types/type";
import { useState } from "react";

const label = ["Sprite", "Type1", "Type2", "Gen", "Color"];

const GameTable = ({ data }: GameTableProps) => {
  return (
    <View className="flex flex-row w-full justify-center mt-4 gap-1">
      {label.map((item, index) => (
        <View key={index} className="flex flex-col items-center gap-2">
          <Text className="text-text-light dark:text-text-dark font-josefin500Medium">
            {item}:
          </Text>
          {data
            .map((result, resultIndex) => (
              <AnswerCard key={resultIndex} answer={result.results[index]} />
            ))
            .reverse()}
        </View>
      ))}
    </View>
  );
};

export default GameTable;
