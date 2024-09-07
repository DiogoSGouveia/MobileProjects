import { SafeAreaView } from "react-native-safe-area-context";
import { Image, Text, TextInput, View } from "react-native";
import InputField from "@/components/InputField";
import { icons, images } from "@/constants";
import CustomButton from "@/components/CustomButton";
import { router } from "expo-router";

const Welcome = () => {
  return (
    <SafeAreaView className="flex h-full items-center justify-between-bg-primary-100">
      <View className="flex-1 mt-10 items-center justify-center p-5">
        <Image
          source={images.welcomeImg}
          className="w-[300px] h-[300px]"
          resizeMode="contain"
        />

        <View className="flex flex-row items-center justify-center w-full mt-10">
          <Text className="text-primary-500  text-2xl font- mx-10 text-center font-RubikBold">
            Effortless plant care at your fingertips!
          </Text>
        </View>
        <Text className="text-lg text-center font-RubikLight text-primary-400 mx-7 mt-3">
          Nurture your plants from anywhere in the world.
        </Text>
      </View>
      <CustomButton
        title="Next"
        onPress={() => {
          router.replace("/(auth)/sign-in");
        }}
        bgVariant="primary"
        textVariant="secondary"
        className="mt-10 mb-10 w-11/12"
      />
    </SafeAreaView>
  );
};

export default Welcome;
