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
  placeholder,
  ...props
}: InputFieldProps) => (
  <KeyboardAvoidingView behavior={Platform.OS === "ios" ? "padding" : "height"}>
    <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
      <View className="mt-4 mb-2 w-full">
        <Text
          className={`text-lg font-josefin500Medium mb-3 text-text-light dark:text-text-dark ${labelStyle} `}
        >
          {label}
        </Text>
        <View
          className={`flex flex-row justify-start items-center relative bg-neutral-100 dark:bg-neutral-900 rounded-lg border border-neutral-300 dark:border-neutral-700 focus:border-primary ${containerStyle}`}
        >
          {icon && (
            <Image source={icon} className={`w-6 h-6 ml-4 ${iconStyle}`} />
          )}
          <TextInput
            className={`rounded-full p-4 font-josefin500Medium text-[15px] w-3/4 ${inputStyle} text-left text-text-light dark:text-text-dark`}
            secureTextEntry={secureTextEntry}
            placeholder={placeholder}
            {...props}
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  </KeyboardAvoidingView>
);

export default InputField;
