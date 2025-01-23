import {
  Button,
  View,
  Image,
  TouchableOpacity,
  Modal,
  Alert,
  Text,
} from "react-native";
import InputField from "@/components/InputField";
import GameTable from "@/components/GameTable";
import { useEffect, useState } from "react";
import Header from "@/components/Header";
import Pokedex from "pokedex-promise-v2";
import { router, useRouter } from "expo-router";
import { useLocalSearchParams } from "expo-router";
import AnswerCard from "@/components/AnswerCard";
import { PokemonAttributes } from "@/types/type";
import { BlurView } from "expo-blur";
import AttemptsChart from "@/components/AttemptsChart";

const Wordle = () => {
  const P = new Pokedex();
  const [pokemonName, setPokemonName] = useState<string>("");
  const [playerGuess, setPlayerGuess] = useState<PokemonAttributes>({
    sprite: null,
    type1: null,
    type2: null,
    color: null,
    gen: null,
  });

  const [solution, setSolution] = useState<PokemonAttributes>({
    sprite: null,
    type1: null,
    type2: null,
    color: null,
    gen: null,
  });

  const [isAnswerCorrect, setIsAnswerCorrect] = useState<boolean>(false);

  const [resultsHistory, setResultsHistory] = useState<any[]>([]);

  const [startGame, setStartGame] = useState<boolean>(false);

  const handleStartGame = () => {
    setStartGame(true);
    P.getPokemonSpeciesByName("ditto")
      .then((response) => {
        setSolution({
          ...solution,
          color: response.color.name ?? null,
          gen: response.generation.name ?? null,
        });

        return P.getPokemonByName("ditto");
      })
      .then((nameResponse) => {
        setSolution((prevSolution) => ({
          ...prevSolution,
          sprite: nameResponse.sprites.front_default ?? null,
          type1: nameResponse.types[0]?.type.name ?? null,
          type2: nameResponse.types[1]?.type.name ?? null,
        }));
      })
      .catch((error) => {
        console.log("There was an ERROR: ", error);
      });
  };

  const handleSubmit = () => {
    P.getPokemonSpeciesByName(pokemonName.toLowerCase())
      .then((response) => {
        setPlayerGuess((prevGuess) => ({
          ...prevGuess,
          color: response.color.name ?? null,
          gen: response.generation.name ?? null,
        }));

        return P.getPokemonByName(pokemonName.toLowerCase());
      })
      .then((nameResponse) => {
        setPlayerGuess((prevGuess) => ({
          ...prevGuess,
          type1: nameResponse.types[0]?.type.name ?? null,
          type2: nameResponse.types[1]?.type.name ?? null,
          sprite: nameResponse.sprites.front_default ?? null,
        }));

        console.log("Player Guess:", playerGuess);
        console.log("Solution:", solution);
      })
      .catch((error) => {
        console.log("There was an ERROR: ", error);
      });
  };

  useEffect(() => {
    if (playerGuess.sprite) {
      const results = {
        sprite: playerGuess.sprite,
        type1: playerGuess.type1 === solution.type1 ? "correct" : "incorrect",
        type2: playerGuess.type2 === solution.type2 ? "correct" : "incorrect",
        color: playerGuess.color === solution.color ? "correct" : "incorrect",
        gen: playerGuess.gen === solution.gen ? "correct" : "incorrect",
      };

      setResultsHistory((prevHistory) => {
        const isSpriteInHistory = prevHistory.some(
          (history) => history.results[0] === results.sprite
        );
        if (!isSpriteInHistory) {
          return [
            ...prevHistory,
            {
              name: pokemonName,
              results: [
                results.sprite,
                results.type1,
                results.type2,
                results.gen,
                results.color,
              ],
            },
          ];
        }
        return prevHistory;
      });

      if (playerGuess.sprite === solution.sprite) {
        setIsAnswerCorrect(true);
      }

      console.log("Results History:", resultsHistory);
    }
  }, [playerGuess.sprite]);

  return (
    <View className="flex-1 justify-start items-center bg-background-light dark:bg-background-dark">
      <Header />
      {startGame ? (
        <>
          <View className="flex flex-row justify-between items-center">
            <InputField
              label="Guess the Pokemon:"
              placeholder="Enter the Pokemon name"
              onChangeText={(text) => setPokemonName(text)}
              onPress={handleSubmit}
            />
          </View>
          <GameTable data={resultsHistory} />

          <Modal
            animationType="fade"
            transparent={true}
            visible={isAnswerCorrect}
            onRequestClose={() => {
              Alert.alert("Modal has been closed.");
              setIsAnswerCorrect(false);
            }}
          >
            <BlurView
              intensity={20}
              className="flex-1 justify-center items-center "
            >
              <View className="bg-background-light dark:bg-background-dark border border-neutral-300 dark:border-neutral-700 rounded-lg p-4 w-3/4 h-3/4 justify-start items-center">
                <Text className="text-text-light dark:text-text-dark font-josefin700Bold text-center text-2xl mt-10 mb-4">
                  CONGRATULATIONS!
                </Text>
                <Text className="text-text-light dark:text-text-dark font-josefin500Medium text-center text-lg">
                  It was {pokemonName}!
                </Text>
                <AnswerCard answer={solution.sprite ?? ""} size="h-16 w-16" />
                <AttemptsChart numberOfAttempts={resultsHistory.length} />
                <Button
                  title="Back to Home"
                  onPress={() => {
                    setIsAnswerCorrect(false);
                    setResultsHistory([]);
                    router.push("/");
                  }}
                />
              </View>
            </BlurView>
            {/* Finish Modal (Chart, NumOfPeople, Other Stats, etc)} */}
          </Modal>
        </>
      ) : (
        <Button title="Start Game" onPress={() => handleStartGame()} />
      )}
    </View>
  );
};

export default Wordle;
