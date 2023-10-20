import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  //{ id: 'home', name: 'HOME', icon: 'home', route: '/main/home' },
  { id: 'projects', name: 'PROJECTS', route: '/main/projects', icon: 'folder' },
  { id: 'tasks', name: 'TASKS', route: '/main/tasks', icon: 'playlist_add_check' },
  { id: 'record', name: 'RECORD', route: '/main/record', icon: 'history' },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];
