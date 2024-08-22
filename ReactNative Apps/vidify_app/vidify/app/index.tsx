import { Link } from 'expo-router';
import { styled } from 'nativewind';
import { View, Text } from 'react-native';


const StyledView = styled(View);
const StyledText = styled(Text);

export default function Index() {
  return (
    <StyledView className="flex-1 items-center justify-center bg-white">
      <StyledText className="text-3xl font-pblack">Vidify</StyledText>
      <Link href="/home" style={{color: 'blue'}}> Go to Home </Link>
    </StyledView>
  );
}
