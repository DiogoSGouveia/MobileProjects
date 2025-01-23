import { InputFieldProps } from "@/types/type";
import { Ionicons } from "@expo/vector-icons";
import {
  Image,
  Keyboard,
  KeyboardAvoidingView,
  Platform,
  TextInput,
  TouchableOpacity,
  TouchableWithoutFeedback,
} from "react-native";
import { View, Text } from "react-native";
import MaterialCommunityIcons from "@expo/vector-icons/MaterialCommunityIcons";

const InputField = ({
  onPress,
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
        <View className="flex flex-row justify-center items-center gap-2 h-14">
          <TextInput
            className={`p-4 font-josefin500Medium text-[15px] bg-neutral-100 dark:bg-neutral-900 rounded-lg border border-neutral-300 dark:border-neutral-700 focus:border-primary w-5/6 h-full justify-start items-center ${inputStyle} text-left text-text-light dark:text-text-dark`}
            secureTextEntry={secureTextEntry}
            placeholder={placeholder}
            {...props}
          />
          <TouchableOpacity
            className="rounded-lg border dark:bg-neutral-100 bg-neutral-900 border-neutral-300 dark:border-neutral-700 p-0 aspect-square h-full justify-center items-center"
            onPress={onPress}
          >
            <MaterialCommunityIcons name="pokeball" size={24} color="#ffb703" />
          </TouchableOpacity>
        </View>
      </View>
    </TouchableWithoutFeedback>
  </KeyboardAvoidingView>
);

export default InputField;
