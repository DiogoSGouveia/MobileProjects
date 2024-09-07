import { SafeAreaView } from "react-native-safe-area-context";
import { ScrollView, Text, View, Image, Alert } from "react-native";
import InputField from "@/components/InputField";
import CustomButton from "@/components/CustomButton";
import { icons, images } from "@/constants";
import { Link, router } from "expo-router";
import ReactNativeModal from "react-native-modal";
//import { useSignUp } from "@clerk/clerk-expo";
import { useState } from "react";

const SignUp = () => {
  const [showSuccessModal, setShowSuccessModal] = useState(false);

  const [form, setForm] = useState({
    name: "",
    email: "",
    password: "",
  });

  const [verification, setVerification] = useState({
    state: "default",
    error: "",
    code: "",
  });

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
              Create an Account!
            </Text>
          </View>
        </View>
        <View className="p-5">
          <InputField
            icon={icons.user}
            label="Name"
            placeholder="Enter your name"
            placeholderTextColor="#8A8A8A"
            onChangeText={(value) => setForm({ ...form, name: value })}
          />

          <InputField
            label="Email"
            icon={icons.envelope}
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
            title="Sign Up"
            bgVariant="primary"
            textVariant="secondary"
            className="mt-10"
          />
        </View>
      </View>

      <Link
        href="/(auth)/sign-in"
        className="text-lg text-center text-primary-500 mt-10"
      >
        <Text className=" font-RubikLight">Already have an account? </Text>
        <Text className="text-general-500 font-Rubik">Sign In!</Text>
      </Link>

      <ReactNativeModal
        isVisible={verification.state === "pending"}
        onModalHide={() => {
          if (verification.state === "success") setShowSuccessModal(true);
        }}
      >
        <View className="bg-white px-7 py-9 rounded-2xl min-h-[300px]">
          <Text className="text-2xl font-JakartaExtraBold mb-2">
            Verification
          </Text>
          <Text className="mb-5 font-Jakarta">
            A verification code has been sent to {form.email}. Please enter the
            code below.
          </Text>
          <InputField
            label="Verification Code"
            icon={icons.lock}
            placeholder="Enter your verification code"
            placeholderTextColor="#BBBBBD"
            keyboardType="numeric"
            value={verification.code}
            onChangeText={(value) =>
              setVerification({ ...verification, code: value })
            }
          />
          {verification.error && (
            <Text className="text-red-500 text-sm mt-1">
              {verification.error}
            </Text>
          )}

          <CustomButton title="Verify Email" className="mt-5 bg-success-500" />
        </View>
      </ReactNativeModal>

      <ReactNativeModal isVisible={showSuccessModal}>
        <View className="bg-white px-7 py-9 rounded-2xl min-h-[300px]">
          <Image
            source={icons.privacy}
            className="w-[110px] h-[110px] mx-auto my-5"
          />

          <Text className="text-center text-3xl font-JakartaSemiBold">
            Verified
          </Text>
          <Text className="text-base text-center text-gray-400 mt-2">
            Your account is verified successfully.
          </Text>
          <CustomButton
            title="Continue Home"
            onPress={() => {
              setShowSuccessModal(false);
              router.push("/(root)/(tabs)/home");
            }}
            className="mt-5"
          />
        </View>
      </ReactNativeModal>
    </ScrollView>
  );
};

export default SignUp;
