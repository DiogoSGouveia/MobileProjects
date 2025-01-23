import { AttemptsChartProps } from "@/types/type";
import { View, Text } from "react-native";

const AttemptsChart = ({ numberOfAttempts }: AttemptsChartProps) => {
  return (
    <View className="flex flex-row justify-center items-center mt-6">
      <Text className="text-text-light dark:text-text-dark font-josefin500Medium text-center text-lg">
        You got it right in {numberOfAttempts} attempt
        {numberOfAttempts > 1 ? "s" : ""}!
      </Text>
    </View>
  );
};

export default AttemptsChart;
