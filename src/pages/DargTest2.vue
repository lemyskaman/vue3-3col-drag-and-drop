<template>
  <div class="row">
    <div class="col-3">
      <h3>Draggable 1</h3>
      <draggable class="list-group" :list="list1" group="people" @change="dragValidate($event,'list1')" item-key="id">
        <template #item="{element}">
          <div class="list-group-item">
            {{ element.name }} {{ element.id }}
          </div>
        </template>
      </draggable>
    </div>

    <div class="col-3">
      <h3>Draggable 2</h3>
      <draggable class="list-group" :list="list2" group="people" @change="dragValidate($event,'list2')" item-key="id">
        <template #item="{element}">
          <div class="list-group-item">
            {{ element.name }} {{ element.id }}
          </div>
        </template>
      </draggable>
    </div>

    <rawDisplayer class="col-3" :value="list1" title="List 1" />

    <rawDisplayer class="col-3" :value="list2" title="List 2" />
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { reactive, computed } from 'vue'
import draggable from 'vuedraggable';


interface Control {
  name: string;
  id: number;
}

interface ControlDefinitions {
  name: string;
  id: number;
  order?: number;
}

const list1: Control[] = [
  { name: 'John', id: 1 },
  { name: 'Joao', id: 2 },
  { name: 'Jean', id: 3 },
  { name: 'Gerard', id: 4 },
];
let  list2: ControlDefinitions[] =  reactive([
  { name: 'Juan', id: 5, order: 1},
  { name: 'Edgard', id: 6, order: 1 },
  { name: 'Johnson', id: 7, order: 1},
];

const dragValidate = (evt: any,list: string) => {
  console.log('drag2')
  console.log(list);
    console.log(evt);

    if (list === 'list2' && evt.added) {
      const existingElement = list2.find(element => element.id === evt.added.element.id);
      console.log(list2)
      console.log(existingElement)

    if (!existingElement) {
      // Element does not exist, so add it
      console.log('adding element')
      list2.push({...evt.added.element, order:  evt.addednewIndex});
    } else {
      // Element exists, so update its order
      console.log('editing elmeent')
      existingElement.order = evt.addednewIndex;
    }
    }

  //console.log(evt.moved.newIndex);

};

//const log = (evt: any) => {
//  console.log(evt);
//};


</script>

<style scoped>

.list-group-item {
  cursor: move;
}
</style>
