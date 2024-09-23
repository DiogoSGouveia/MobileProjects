import React from "react";
import { View, Text, TouchableOpacity } from "react-native";
import InputField from "./InputField"; // Assuming you have an InputField component
import CustomButton from "./CustomButton"; // Assuming you have a CustomButton component
import { CustomCalendarProps } from "@/types/type";

const CustomCalendar: React.FC<CustomCalendarProps> = ({
  days = ["M", "T", "W", "T", "F", "S", "S"],
  onDayPress = () => {},
  startTime = "",
  endTime = "",
  onTimeChange = () => {},
  onSave = () => {},
}) => {
  return (
    <View className="w-[416px] h-[375px] bg-general-100 rounded-3xl mt-8 p-4 shadow-sm shadow-general-800 self-center items-center flex-col">
      <Text className="text-primary-500 font-RubikMedium text-xl">
        Schedule Watering Time
      </Text>

      <View className="flex-row justify-between items-center w-full p-3 mt-5">
        {days.map((day, index) => (
          <TouchableOpacity
            key={index}
            className="flex flex-col items-center"
            onPress={() => onDayPress(day)}
          >
            <Text className="text-black font-RubikBold text-xl mt-2">
              {day}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      <View className="flex-row justify-between items-center w-full bottom-4">
        <InputField
          containerStyle="w-[150px] bg-primary-500"
          placeholder="Start Time"
          value={startTime}
          onChangeText={(value) => onTimeChange("start", value)}
        />
        <Text className="text-black font-RubikBold text-xl mt-10">To</Text>
        <InputField
          containerStyle="w-[150px] bg-primary-500"
          placeholder="End Time"
          value={endTime}
          onChangeText={(value) => onTimeChange("end", value)}
        />
      </View>

      <CustomButton
        title="Save"
        bgVariant="secondary"
        textVariant="secondary"
        className="mt-10"
        onPress={onSave}
      />
    </View>
  );
};

export default CustomCalendar;
