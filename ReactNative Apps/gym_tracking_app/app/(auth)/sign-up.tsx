import {Text, View} from 'react-native';
import React, {useState} from 'react';
import { ScrollView } from 'react-native-gesture-handler';
import InputField from '@/components/InputField';

const SignUp = () => {
    const [form, setForm] = useState({
        email: '',
        password: '',
        confirmPassword: '',
    });

    const [error, setError] = useState({
        email: '',
        password: '',
        confirmPassword: '',
    });


    return (
 
            <View className='flex-1 bg-white'>
                <InputField
            label="Name"
            placeholder="Enter your name"
            placeholderTextColor="#BBBBBD"
            icon={icons.person}
            value={form.name}
            onChangeText={(value) => setForm({ ...form, name: value })}
          />
            </View>
      
    );
    }

    export default SignUp;
