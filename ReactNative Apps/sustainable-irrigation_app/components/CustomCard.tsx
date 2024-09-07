import { icons } from "@/constants";
import { View, Text, Image } from "react-native";

const CustomCard = ({
  label,
  icon,
  className,
  value,
}: {
  label: string;
  icon?: any;
  value: string | number;
  className?: string;
}) => {
  return (
    <View
      className={`bg-general-100 w-[200px] h-[200px] rounded-3xl p-4 shadow-md shadow-general-800 justify-start flex-col items-start ${className}`}
    >
      <Text className="text-primary-500 font-RubikMedium text-xl">{label}</Text>

      <View className="flex-row top-8 justify-between items-center w-full left-2">
        <View className="flex flex-col items-center">
          {icon ? (
            <Image source={icon} className="w-10 h-10" />
          ) : (
            <Text>No Icon</Text>
          )}
          <Text className="text-black font-RubikRegular text-xl mt-2">
            {value}
          </Text>
        </View>

        {/*TODO Change for graph*/}
        <Image source={icons.chart} className="w-20 h-20 mr-4" />
      </View>
    </View>
  );
};

export default CustomCard;
