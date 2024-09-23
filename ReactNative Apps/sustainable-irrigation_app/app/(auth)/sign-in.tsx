import { SafeAreaView } from "react-native-safe-area-context";
import { ScrollView, Text, View, Image } from "react-native";
import InputField from "@/components/InputField";
import CustomButton from "@/components/CustomButton";
import { icons, images } from "@/constants";
import { Link, router, useRouter } from "expo-router";
import { useSignIn } from "@clerk/clerk-expo";
import { useCallback, useState } from "react";

const SignIn = () => {
  const { signIn, setActive, isLoaded } = useSignIn();
  const router = useRouter();
  const [form, setForm] = useState({
    email: "",
    password: "",
  });

  const onSignInPress = useCallback(async () => {
    if (!isLoaded) {
      return;
    }

    try {
      const signInAttempt = await signIn.create({
        identifier: form.email,
        password: form.password,
      });

      if (signInAttempt.status === "complete") {
        await setActive({ session: signInAttempt.createdSessionId });
        router.replace("/");
      } else {
        // See https://clerk.com/docs/custom-flows/error-handling
        // for more info on error handling
        console.error(JSON.stringify(signInAttempt, null, 2));
      }
    } catch (err: any) {
      console.error(JSON.stringify(err, null, 2));
    }
  }, [isLoaded, form.email, form.password]);

  return (
    <ScrollView className="flex-1 ">
      <View className="flex-1">
        <View className="relative w'full">
          <Image source={images.signUpYard} className="z-0 w-full h-[200px]" />

          <View className="absolute w-full items-center mt-10 top-5">
            <View className="w-24 h-24 rounded-full border-4 border-primary-200 bg-secondary-500 items-center justify-center">
              <Image source={icons.logo} className="w-20 h-20" />
            </View>
          </View>
          <View className="mt-5">
            <Text className="absolute bottom-1 left-5 text-Black text-3xl font-RubikBold">
              Welcome! 🌳
            </Text>
          </View>
        </View>
        <View className="p-5">
          <InputField
            icon={icons.envelope}
            label="Email"
            placeholder="Enter your email"
            placeholderTextColor="#8A8A8A"
            onChangeText={(value) => setForm({ ...form, email: value })}
          />
          <InputField
            label="Password"
            icon={icons.lock}
            secureTextEntry
            placeholder="Enter your password"
            placeholderTextColor="#8A8A8A"
            onChangeText={(value) => setForm({ ...form, password: value })}
          />

          <CustomButton
            title="Sign In"
            bgVariant="primary"
            textVariant="secondary"
            className="mt-10"
            onPress={onSignInPress}
          />
        </View>
      </View>

      <Link
        href="/(auth)/sign-up"
        className="text-lg text-center text-primary-500 mt-10"
      >
        <Text className=" font-RubikLight">Don't have an account? </Text>
        <Text className="text-general-500 font-Rubik">Sign Up!</Text>
      </Link>
      <SafeAreaView />
    </ScrollView>
  );
};

export default SignIn;
