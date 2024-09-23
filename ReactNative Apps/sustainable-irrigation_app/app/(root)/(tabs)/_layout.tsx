import { Stack } from "expo-router";
import { GestureHandlerRootView } from "react-native-gesture-handler";
import { Drawer } from "expo-router/drawer";
import { icons } from "@/constants";
import { Image } from "react-native";
import CustomDrawerContent from "@/components/CustomDrawerContent";

const Layout = () => {
  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <Drawer
        drawerContent={CustomDrawerContent}
        screenOptions={{
          drawerPosition: "right",
          drawerHideStatusBarOnOpen: true,
          drawerActiveBackgroundColor: "#283618",
          drawerActiveTintColor: "#FFFAF0",
        }}
      >
        <Drawer.Screen
          name="home" // This is the name of the page and must match the url from root
          options={{
            drawerLabel: "Home",
            headerShown: false,
            drawerIcon: ({ size, color }) => (
              <Image
                source={icons.home}
                style={{ width: size, height: size, tintColor: color }}
              />
            ),
          }}
        />
        <Drawer.Screen
          name="profile" // This is the name of the page and must match the url from root
          options={{
            drawerLabel: "Profile",
            headerShown: false,
            drawerIcon: ({ size, color }) => (
              <Image
                source={icons.user}
                style={{ width: size, height: size, tintColor: color }}
              />
            ),
          }}
        />

        <Drawer.Screen
          name="settings" // This is the name of the page and must match the url from root
          options={{
            drawerLabel: "Settings",
            headerShown: false,
            drawerIcon: ({ size, color }) => (
              <Image
                source={icons.settings}
                style={{ width: size, height: size, tintColor: color }}
              />
            ),
          }}
        />
      </Drawer>
    </GestureHandlerRootView>
  );
};

export default Layout;
