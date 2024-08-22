import { View, Text, Image} from 'react-native'
import React from 'react'
import { Tabs, Redirect} from 'expo-router'

import { icons} from './../../constants'
const TabIcon = (props: any) => {
  const { icon, color, name, focused } = props;
  return (
    <View>
      <Image
        source={icon}
        style={{width: 6, height: 6}}
        resizeMode="contain"
        
      />
    </View>
  )
}


const TabsLayout = () => {
  return (
    <>
      <Tabs>
        <Tabs.Screen name="Home" 
          options={{
            title: 'Home',
            headerShown: false,
            tabBarIcon: ({focused, color, size}) => (
              <TabIcon icon={icons.home} color={color} name="Home" focused={focused} />
            )
          }}

        />
      </Tabs>
    
    </>
  )
}

export default TabsLayout