import CustomButton from "@/components/CustomButton";
import CustomCalendar from "@/components/CustomCalendar";
import CustomCard from "@/components/CustomCard";
import InputField from "@/components/InputField";
import { icons, images } from "@/constants";
import { router } from "expo-router";
import {
  View,
  Text,
  SafeAreaView,
  Image,
  Touchable,
  TouchableOpacity,
  ScrollView,
} from "react-native";

const ParkDetails = () => {
  return (
    <ScrollView className="flex-1 bg-general-100">
      <Image
        source={images.parkImg}
        className="z-0 w-full h-[250px] rounded-b-3xl"
      />
      <TouchableOpacity className="absolute pl-5" onPress={() => router.back()}>
        <Image
          source={icons.back}
          className="w-10 h-10  top-16 px-5 bg-general-100 rounded-full "
        />
      </TouchableOpacity>
      <View className="w-full h-24 rounded-l-full bottom-12 left-24 border-2 border-general-100 bg-general-100 justify-start items-center shadow-md shadow-general-800 flex-row">
        <Image source={icons.cloudy} className="w-10 h-10 ml-10" />
        <View className="flex flex-col">
          <Text className="text-xl w-3/4 font-RubikMedium ml-10">
            Coimbra National Park
          </Text>
        </View>
      </View>
      <View className="flex-row justify-between p-2 ">
        <CustomCard label="Humidity" icon={icons.humidity} value={20} />

        <CustomCard
          label="Temperature"
          icon={icons.temperature}
          value={"30ºC"}
        />
      </View>

      <CustomCalendar
        days={["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}
        onDayPress={(day) => console.log("Pressed day:", day)}
        startTime="08:00 AM"
        endTime="05:00 PM"
        onTimeChange={(type, value) =>
          console.log(`${type} time changed to: ${value}`)
        }
        onSave={() => console.log("Save pressed!")}
      />

      <View className="w-10 h-10 "></View>
    </ScrollView>
  );
};
export default ParkDetails;
