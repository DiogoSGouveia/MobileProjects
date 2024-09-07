import { InputFieldProps } from "@/types/type";
import {
  Image,
  Keyboard,
  KeyboardAvoidingView,
  Platform,
  TextInput,
  TouchableWithoutFeedback,
} from "react-native";
import { View, Text } from "react-native";

const InputField = ({
  label,
  labelStyle,
  icon,
  secureTextEntry = false,
  containerStyle,
  inputStyle,
  iconStyle,
  className,
  ...props
}: InputFieldProps) => (
  <KeyboardAvoidingView behavior={Platform.OS === "ios" ? "padding" : "height"}>
    <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
      <View className="my-2 w-full">
        <Text className={`text-lg font-Rubik  mb-2 ${labelStyle} `}>
          {label ? label : " "}
        </Text>
        <View
          className={`flex flex-row justify-start items-center relative bg-white rounded-full border border-neutral-100 focus:border-primary-700 ${containerStyle}`}
        >
          {icon && (
            <Image source={icon} className={`w-6 h-6 ml-4 ${iconStyle}`} />
          )}
          <TextInput
            className={`rounded-full p-4 font-RubikMedium text-[15px] flex-1 ${inputStyle} text-left `}
            secureTextEntry={secureTextEntry}
            placeholder="Enter your name"
            {...props}
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  </KeyboardAvoidingView>
);

export default InputField;
