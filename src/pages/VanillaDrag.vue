<script lang="ts" setup>
import { reactive, computed } from 'vue'
import { ref } from 'vue';

const renderComponent = ref(true);

const forceRerender = async () => {
  // Remove MyComponent from the DOM
  renderComponent.value = false;

    // Wait for the change to get flushed to the DOM
    await nextTick();

    // Add the component back in
  renderComponent.value = true;
};
interface ControlDefinitions {
  name: string;
  id: number;
  order?: number;
}

let list1= [
  { name: 'John', id: 1 },
  { name: 'Joao', id: 2 },
  { name: 'Jean', id: 3 },
  { name: 'Gerard', id: 4 },
];
let  list2: ControlDefinitions[] =  reactive(  [
  { name: 'Juan', id: 5, order: 1},
  { name: 'Edgard', id: 6, order: 2 },
  { name: 'Johnson', id: 7, order: 3},
]);



let draggedItemIndex: number | null = null;
let origin: string | null = null;
const handleDragStart = (index: number, list:string) => {
  draggedItemIndex = index;
  origin = list;
};

const handleDragOver = (event: DragEvent) => {
  event.preventDefault();


};

const handleDrop = (evt: DragEvent, item: ControlDefinitions, index: number, destiny: string) => {



  if (destiny === 'form' && origin== 'list1' && draggedItemIndex!== null) {

    const draggedItem = list1[draggedItemIndex];


    list2.splice(index, 0, draggedItem);
    console.log('handledrop', item, index, origin,draggedItem);
    console.log(list2)
    draggedItemIndex = null
      origin = null; // Reset the dragged item index
  }

  if (destiny === 'form' && origin== 'list2' && draggedItemIndex!== null && draggedItemIndex!== index) {
    // Reorder or sort elements within list2

     const draggedItem = list2[draggedItemIndex];// Remove the dragged item


    list2.splice(draggedItemIndex, 1);
    list2.splice(index,1)

    list2.splice(index, 0, draggedItem);
    list2.splice(draggedItemIndex,0,item);

    console.log(list2);
    draggedItemIndex = null;
    origin = null; // Reset the dragged item index

  }


};


const handleDragEnd = () => {
    draggedItemIndex = null
      origin = null; // Reset the dragged item index
};

const logClick = () => {
  list2.push({name:"lemys",id:3000})
  console.log(list2)
}

</script>




<template>





  <div class="row">
        <div class="col-3">
          <h3>Components</h3>
          <div class="sortable-list">
             <div
               v-for="(item, index) in list1"
               :key="index"
               :draggable="true"
               class="sortable-item"
               @dragend="handleDragEnd"
               @dragover="handleDragOver"
               @dragstart="handleDragStart(index,'list1')"
               @drop="handleDrop($event,item,index, 'components')"
               >
               {{ item.name }}
             </div>
          </div>
        </div>
  </div>
  <div class="row">
        <div class="col-3">
          <h3>Form</h3>
          <div class="sortable-list">
             <div

               v-for="(item, index) in list2"
               :key="index"
               :draggable="true"
               class="sortable-item"

               @dragend="handleDragEnd"
               @dragover="handleDragOver"
               @dragstart="handleDragStart(index,'list2')"
               @drop="handleDrop($event,item,index, 'form')"
               >
               {{ item.name }}
             </div>
          </div>
        </div>
  </div>

</template>

<style lang="scss" scoped>
.sortable-list{
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.sortable-list div {
  padding: 10px;
  margin-bottom: 5px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  cursor: grab;
  transition: background-color 0.2s ease;
}
</style>
