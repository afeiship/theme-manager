import { $loadable } from '#';

export default [
  {
    path: '/',
    exact: true,
    component: $loadable.load(() => import('./modules/app/login'))
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
