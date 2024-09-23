import { useAuth, useUser } from "@clerk/clerk-expo";
import {
  DrawerContentScrollView,
  DrawerItem,
  DrawerItemList,
} from "@react-navigation/drawer";
import { useRouter } from "expo-router";
import { View, Text } from "react-native";
import { useSafeAreaInsets } from "react-native-safe-area-context";

export default function CustomDrawerContent(props: any) {
  const { signOut } = useAuth();
  const handleSignOut = () => {
    signOut();

    router.push("/(auth)/sign-in");
  };

  const { user } = useUser();
  const router = useRouter();
  const { top, bottom } = useSafeAreaInsets();
  return (
    <View className="flex-1 bg-general-100">
      <DrawerContentScrollView {...props} scrollEnabled={false}>
        <View className="flex-row  items-center p-3 mb-5 border-b border-primary-500">
          <Text className="font-RubikBold text-lg">
            {" "}
            Welcome{", "}
            {user?.firstName ||
              user?.emailAddresses[0].emailAddress.split("@")[0]}
          </Text>
        </View>

        <DrawerItemList {...props} />
        <DrawerItem label={"Logout"} onPress={handleSignOut} />
      </DrawerContentScrollView>

      <View
        className="flex-row justify-center items-center bg-secondary-500 p-3"
        style={{ marginBottom: 20 + bottom }}
      >
        <Text className="text-general-100 font-RubikMedium">Version 1.0.0</Text>
      </View>
    </View>
  );
}
