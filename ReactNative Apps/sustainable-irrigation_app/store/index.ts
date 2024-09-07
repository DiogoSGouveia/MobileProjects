import { LocationStore } from "@/types/type";
import { create } from "zustand";

export const useLocationStore = create<LocationStore>((set) => ({
  userAddress: null,
  userLongitude: null,
  userLatitude: null,

  setUserLocation: ({
    address,
    longitude,
    latitude,
  }: {
    latitude: number;
    longitude: number;
    address: string;
  }) =>
    set(() => ({
      userAddress: address,
      userLongitude: longitude,
      userLatitude: latitude,
    })),
}));
