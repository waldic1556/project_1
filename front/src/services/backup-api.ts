import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

const baseUrl = '/api/backup';

export interface BackupFile {
  fileName: string;
  createdAt: string;
}

export async function listBackups(): Promise<BackupFile[]> {
  const response = await api.get<BackupFile[]>(`${apiLink}backup/list`);
  return response.data;
}

export async function createBackup(): Promise<string> {
  const response = await api.post(`${apiLink}backup/create`);
  return response.data;
}

export async function deleteBackup(fileName: string): Promise<string> {
  const response = await api.delete(`${apiLink}backup/delete/${fileName}`);
  return response.data;
}

export async function restoreBackup(fileName: string): Promise<string> {
  const response = await api.post(`${apiLink}backup/restore/${fileName}`);
  return response.data;
}
