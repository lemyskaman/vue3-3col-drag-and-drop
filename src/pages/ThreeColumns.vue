<script lang="ts" setup>
import { reactive, computed } from 'vue'
import { ref } from 'vue';


interface ControlDefinitions {
  type: string;
  name: string;
  label: string;
  id: number;
  order?: number;
  formBuilderConfig: {
    visibleProperties: Boolean
  };
}



let list1= [
  { type:'text', name:'firstName',label: 'First Name', id: 1,  formBuilderConfig:{visibleProperties:false}},
  { type:'text',name:'lastName',label: 'Last Name', id: 2, formBuilderConfig:{visibleProperties:false}},
  { type:'number',name:'age',label: 'Age', id: 3, formBuilderConfig:{visibleProperties:false}},
  { type:'date',name:'startDate',label: 'Start Date', id: 4, formBuilderConfig:{visibleProperties:false}},
];

let  list2: ControlDefinitions[] =  reactive(  [
{ type:'text',name:'lastName',label: 'Last Name', id: 2 },
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



  if (destiny === 'form' && origin== 'list1' && draggedItemIndex!== null ) {

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

  console.log('Form List', list2);
};


const handleDragEnd = () => {
    draggedItemIndex = null
      origin = null; // Reset the dragged item index
};


const toggleProperties = (item:ControlDefinitions) => {
  console.log(item)
}
</script>

<template>

  <div class="collapse py-2" id="collapseTarget">
    This is the toggle-able content!
  </div>
  <div class="row">

    <div class="card column column-small" >
      <h5 class="card-header">Components</h5>
      <div class="card-body">

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
                <label for="controlInput{{item.id}}">{{ item.name }}</label>
                <input type="text" class="form-control" id="controlInput{{item.id}}" :placeholder=item.label readonly>
             </div>
          </div>

      </div>
    </div>
    <div class="card column column-center " >
      <h5 class="card-header">Form</h5>
      <div class="card-body">

        <div class="sortable-list">
             <div
               v-for="(item, index) in list2"
               :key="index"
               :draggable="true"
               class="sortable-item"
               @click="toggleProperties(item)"
               @dragend="handleDragEnd"
               @dragover="handleDragOver"
               @dragstart="handleDragStart(index,'list2')"
               @drop="handleDrop($event,item,index, 'form')"
               >
               <label for="formInput{{item.id}}">Input name: {{ item.name }} <br> InputLabel: {{ item.label }}</label>
               <input type="text" class="form-control" id="formInput{{item.id}}" :placeholder=item.label readonly>
             </div>
          </div>

      </div>
    </div>
    <div class="card column column-small" >
      <h5 class="card-header">Properties </h5>
      <div class="card-body" >
        <div
               v-for="(item, index) in list2"
                item.formBuilderConfig.visibleProperties
               :key="index"
               :draggable="true"
               class="sortable-item"
               @dragend="handleDragEnd"
               @dragover="handleDragOver"
               @dragstart="handleDragStart(index,'list2')"
               @drop="handleDrop($event,item,index, 'form')"
               >
              <div v-if="item.formBuilderConfig?.visibleProperties">
                <label for="controlInput{{item.id}}">Label For Item: {{ item.name }} </label>
               <input type="text" class="form-control" id="controlInput{{item.id}}" placeholder="Set A Value"  v-model="item.label">
              </div>

             </div>
      </div>
    </div>

  </div>
</template>

<style scoped lang="scss">

.sortable-list{
  display: flex;
  flex-direction: column;
  gap: 10px;
  min-height: 50px;
}

.sortable-list div {

  padding: 10px;
  margin-bottom: 5px;
  background-color: #f0f0f0;
  border: 1px solid #ccc;
  cursor: grab;
  transition: background-color 0.2s ease;
}


* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
  height: 600px; /* Should be removed. Only for demonstration */
}

.column-small {
  width: 20%;
}

.column-center {
  width: 60%;

}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
</style>
