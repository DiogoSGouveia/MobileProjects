import { Button, View, Image } from "react-native";
import InputField from "@/components/InputField";
import GameTable from "@/components/GameTable";
import { useState } from "react";
import Header from "@/components/Header";
import Pokedex from "pokedex-promise-v2";
import { useRouter } from "expo-router";
import { useLocalSearchParams } from "expo-router";
import AnswerCard from "@/components/AnswerCard";
const Wordle = () => {
  const router = useRouter();
  const { solution } = useLocalSearchParams();

  const P = new Pokedex();
  const [pokemonName, setPokemonName] = useState<string>("");
  const [pokemonSprite, setPokemonSprite] = useState<string | null>(null);

  const handleSubmit = () => {
    P.getPokemonByName(pokemonName.toLowerCase()).then((response) => {
      setPokemonSprite(response.sprites.front_default);
    });
  };

  return (
    <View className="flex-1 justify-start items-center bg-background-light dark:bg-background-dark">
      <Header />

      <View className="flex flex-row justify-between items-center">
        <InputField
          label="Guess the Pokemon:"
          placeholder="Enter the Pokemon name"
          onChangeText={(text) => setPokemonName(text)}
        />
        <Button title="Submit" onPress={handleSubmit} />
      </View>
      <GameTable data={pokemonName} />
      {pokemonSprite && <AnswerCard answer={pokemonSprite} />}
    </View>
  );
};

export default Wordle;
