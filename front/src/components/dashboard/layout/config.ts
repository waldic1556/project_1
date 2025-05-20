import type { NavItemConfig } from '@/types/nav';
import { paths } from '@/paths';

export const navItems = [
  { key: 'overview', title: 'Overview', href: paths.dashboard.overview, icon: 'chart-pie' },
  { key: 'customers', title: 'Customers', href: paths.dashboard.customers, icon: 'users' },
  { key: 'employees', title: 'Employees', href: paths.dashboard.employee, icon: 'portrait' },
  { key: 'finances', title: 'Finances', href: paths.dashboard.finances, icon: 'plugs-connected' },
  { key: 'settings', title: 'Settings', href: paths.dashboard.settings, icon: 'gear-six' },
  { key: 'logs', title: 'Logs', href: paths.dashboard.logs, icon: 'gear-six' },
] satisfies NavItemConfig[];
