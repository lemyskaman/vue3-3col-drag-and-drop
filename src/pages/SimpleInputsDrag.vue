
<script setup lang="ts">
import { ref } from 'vue';
import draggable from 'vuedraggable';
import { VCard, VSheet,VTextField } from 'vuetify/components'
import BaseInputText from '@/components/BaseInputText.vue'

const drag=ref(false);

const myArray = ref(  [
  {
    controlType:"first Name"

  },
  {
    controlType:"last Name"
  },
  {
    controlType:"email 3"
  }
]);

</script>

<template>
<h1>El formulario</h1>
  <v-sheet class="mx-auto"  max-width="300">
    <v-text-field

      label="User name"
    ></v-text-field>
  </v-sheet>
  <draggable
  v-model="myArray"
  group="people"
  @start="drag=true"
  @end="drag=false"
  item-key="id">

  <template #item="{element}">
    <base-input-text v-model="element.controlType" type="text"  ></base-input-text>

   </template>
</draggable>
</template>

<style scoped lang="scss">

</style>
