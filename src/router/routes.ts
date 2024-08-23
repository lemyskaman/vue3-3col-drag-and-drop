export default [
  // {
  //   path: '/',
  //   name: 'home',
  //   component: () => import('@/pages/index.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (About.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import('@/pages/about.vue')
  // },
  {
    path: '/',
    name: 'form',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/SimpleInputsDrag.vue')
  },
  {
    path: '/drag',
    name: 'drag-test',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/DragTest.vue')
  },
    {
    path: '/drag2',
    name: 'drag-test-2',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/DargTest2.vue')
  },
  {
    path: '/columns',
    name: 'columns',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/ThreeColumns.vue')
  },
    {
    path: '/dashboard',
    name: 'dashboard',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/DashboardColumns.vue')
  },
    {
    path: '/dragon',
    name: 'dragon',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/DragonDrop.vue')
  },
    {
    path: '/vanila',
    name: 'vanila',
    // route level code-splitting
    // this generates a separate chunk (About.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('@/pages/VanillaDrag.vue')
  }
]
