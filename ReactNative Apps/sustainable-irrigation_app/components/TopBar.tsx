import { icons } from "@/constants";
import { View, Image, Text, TouchableOpacity } from "react-native";
import { DrawerActions, useNavigation } from "@react-navigation/native";
const TopBar = () => {
  const navigation = useNavigation();
  return (
    <View className="shrink flex-row justify-center items-center px-5">
      <TouchableOpacity
        className="absolute left-5 bg-secondary-500 bg-opacity-50 p-3 rounded-full"
        activeOpacity={0.8}
      >
        <Image
          source={icons.warning}
          className="w-5 h-5"
          style={{ tintColor: "#F8F0FB" }}
        />
      </TouchableOpacity>

      <TouchableOpacity
        className=" bg-secondary-500 bg-opacity-50 p-3 rounded-full flex-row"
        activeOpacity={0.8}
      >
        <Text className="text-general-100 font-RubikMedium ml-3">
          Yard Location
        </Text>
        <Image
          source={icons.down}
          className="w-5 h-5 ml-2 mr-1"
          style={{ tintColor: "#F8F0FB" }}
        />
      </TouchableOpacity>

      <TouchableOpacity
        className="absolute top-0 right-5  bg-secondary-500 bg-opacity-50 p-3 rounded-full"
        activeOpacity={0.8}
        onPress={() => navigation.dispatch(DrawerActions.openDrawer())}
      >
        <Image
          source={icons.menuBurger}
          className="w-5 h-5"
          style={{ tintColor: "#F8F0FB" }}
        />
      </TouchableOpacity>
    </View>
  );
};
export default TopBar;
