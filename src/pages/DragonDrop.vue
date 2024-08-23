<template>
  <main>
    <template v-for="column in columns">
      <div v-drop="{ dragData: column, onDragEnter: onDragEnter, onDrop: onDrop }" ></div>
      otro
      <div v-drag="{ dragData: column, dragImage: dragImage, onDragStart: onDragStart }" >{{ column }}</div>
    </template>
  </main>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import type { DragonDropVueDragOptions, DragonDropVueOptions } from 'dragon-drop-vue'

const columns = ref([0, 1, 2, 3, 4, 5, 6])
const dragging = ref<number | undefined>(undefined)

const image = new Image()
image.src = 'src/assets/logo.svg'
const dragImage = {
  image,
  xOffset: 30,
  yOffset: 0,
}

function onDragStart(domEl: HTMLElement, dragEvent: DragEvent, dragOptions: DragonDropVueDragOptions<number>, options: DragonDropVueOptions) {
  dragging.value = dragOptions.dragData
}

function onDragEnter(domEl: HTMLElement, dragEvent: DragEvent, dragOptions: DragonDropVueDragOptions<number>, options: DragonDropVueOptions) {
  // do not allow a draggable element to be dropped on itself
  var dragIndex = this.dragging ?? 0
  var dropIndex = dragOptions.dragData ?? 0
  return dragIndex !== dropIndex
}

function onDrop(domEl: HTMLElement, dragEvent: DragEvent, dragOptions: DragonDropVueDragOptions<number>, options: DragonDropVueOptions) {
  // implement drop behavior
}
</script>
