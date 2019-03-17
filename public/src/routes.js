import { $loadable } from '#';

export default [
  {
    path: '/',
    component: $loadable.load(() => import('./modules/app/admin'))
  },
  {
    path: '/modules/options/index',
    component: $loadable.load(() => import('./modules/options/index'))
  },
  {
    path: '/modules/themes/index',
    component: $loadable.load(() => import('./modules/themes/index'))
  }
];
