import { TextInputProps } from "react-native";

declare interface InputFieldProps extends TextInputProps {
  label: string;
  icon?: any;
  secureTextEntry?: boolean;
  labelStyle?: string;
  containerStyle?: string;
  inputStyle?: string;
  iconStyle?: string;
  className?: string;
  onPress?: () => void;
}

declare interface AnswerCardProps {
  answer: string;
  size?: string;
}

declare interface GameTableProps {
  data: {
    name: string;
    results: string[];
  }[];
}

declare interface PokemonAttributes {
  sprite: string | null;
  type1: string | null;
  type2: string | null;
  color: string | null;
  gen: string | null;
}

declare interface AttemptsChartProps {
  numberOfAttempts: number;
}
