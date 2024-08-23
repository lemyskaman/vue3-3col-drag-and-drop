<template>
  <div class="row">
    <div class="col-3">
      <h3>Draggable 1</h3>
      <draggable class="list-group" :list="list1" group="people" @change="log" item-key="id">
        <template #item="{element}">
          <div class="list-group-item">
            {{ element.name }} {{ element.id }}
          </div>
        </template>
      </draggable>
    </div>

    <div class="col-3">
      <h3>Draggable 2</h3>
      <draggable class="list-group" :list="list2" group="people" @change="log" item-key="id">
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

<script lang="ts">
import { defineComponent } from 'vue';

import draggable from 'vuedraggable';
import RawDisplayer from '@/components/RawDisplayer.vue'

interface Element {
  name: string;
  id: number;
}


export default defineComponent({
  name: 'TwoLists',
  components: {
    RawDisplayer,
    draggable,
  },
  setup() {
    const list1: Element[] = [
      { name: 'John', id: 1 },
      { name: 'Joao', id: 2 },
      { name: 'Jean', id: 3 },
      { name: 'Gerard', id: 4 },
    ];
    const list2: Element[] = [
      { name: 'Juan', id: 5 },
      { name: 'Edgard', id: 6 },
      { name: 'Johnson', id: 7 },
    ];

    const log = (evt: any) => {
      console.log(evt);
    };

    return {
      list1,
      list2,
      log,
    };
  },
});
</script>
