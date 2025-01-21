import { View, Text } from "react-native";
const Header = () => {
  return (
    <>
      <Text className="text-4xl font-josefin700Bold mt-4">
        <Text className="text-text-light dark:text-text-dark">
          W O R D L E{" "}
        </Text>
        <Text className="text-primary-light dark:text-primary-dark">M O N</Text>
      </Text>
      <Text className="text-xl p-2 text-text-light dark:text-text-dark font-josefin300Light">
        Who's that pokemon?
      </Text>
    </>
  );
};

export default Header;
