import React from "react";
import InputField from "@/components/InputField";
import { Button, Text, View } from "react-native";
import AnswerCard from "@/components/AnswerCard";

const dummyData = [
  { label: "Sprite", answers: ["Ditto", "Pidgey"] },
  { label: "Type1", answers: ["correct", "correct"] },
  { label: "Type2", answers: ["missing", "correct"] },
  { label: "Gen", answers: ["missing", "incorrect"] },
  { label: "Color", answers: ["missing", "incorrect"] },
];

export default function Index() {
  return (
    <View className="flex-1 justify-start items-center bg-background-light dark:bg-background-dark">
      <Text className="text-4xl font-josefin700Bold mt-4">
        <Text className="text-text-light dark:text-text-dark">
          W O R D L E{" "}
        </Text>
        <Text className="text-primary-light dark:text-primary-dark">M O N</Text>
      </Text>
      <Text className="text-xl p-2 text-text-light dark:text-text-dark font-josefin300Light">
        Who's that pokemon?
      </Text>
      <InputField
        label="Guess the Pokemon:"
        placeholder="Enter the Pokemon name"
        onChangeText={(text) => console.log(text)}
      />

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
    </View>
  );
}
