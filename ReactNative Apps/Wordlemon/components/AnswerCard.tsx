import { AnswerCardProps } from "@/types/type";
import { Text, View, Image } from "react-native";
import FontAwesome6 from "@expo/vector-icons/FontAwesome6";

const getBgVariantStyle = (variant: string) => {
  switch (variant) {
    case "correct":
      return "bg-accent-correct  border-border-correct";
    case "missing":
      return "bg-accent-missing border-border-missing";
    case "incorrect":
      return "bg-accent-incorrect border-border-incorrect";
    default:
      return "bg-neutral-100 dark:bg-neutral-900 rounded-lg border border-neutral-300 dark:border-neutral-700";
  }
};

const getIconVariantStyle = (variant: string) => {
  switch (variant) {
    case "correct":
      return <FontAwesome6 name="check" size={16} color="#1D5E32" />;
    case "missing":
      return <FontAwesome6 name="question" size={16} color="#8B5E00" />;
    case "incorrect":
      return <FontAwesome6 name="xmark" size={16} color="#8A1F1F" />;
    default:
      return <Image source={{ uri: variant }} className="w-[300%] h-[300%]" />;
  }
};

const AnswerCard = ({ answer, className }: AnswerCardProps) => {
  const bgVariantStyle = getBgVariantStyle(answer);

  const iconVariantStyle = getIconVariantStyle(answer);

  return (
    <View
      className={`p-4 border-2 rounded-lg shadow-lg ${bgVariantStyle} ${className}`}
    >
      <View className="flex justify-center items-center h-5 w-5">
        {iconVariantStyle}
      </View>
    </View>
  );
};

export default AnswerCard;
