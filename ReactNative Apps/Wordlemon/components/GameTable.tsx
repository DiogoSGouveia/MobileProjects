import { View, Text } from "react-native";
import InputField from "./InputField";
import AnswerCard from "./AnswerCard";
import { GameTableProps } from "@/types/type";
import { useState } from "react";

const dummyData = [
  { label: "Sprite", answers: ["Ditto", "Pidgey"] },
  { label: "Type1", answers: ["correct", "correct"] },
  { label: "Type2", answers: ["missing", "correct"] },
  { label: "Gen", answers: ["missing", "incorrect"] },
  { label: "Color", answers: ["missing", "incorrect"] },
];

const GameTable = (data: GameTableProps) => {
  return (
    <View className="flex flex-row w-full justify-center mt-4 gap-1">
      {dummyData.map((item, index) => (
        <View key={index} className="flex flex-col items-center gap-2">
          <Text className="text-text-light dark:text-text-dark">
            {item.label}:
          </Text>
          {item.answers.map((answer, answerIndex) => (
            <AnswerCard key={answerIndex} answer={answer} />
          ))}
        </View>
      ))}
    </View>
  );
};

export default GameTable;
