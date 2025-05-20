'use client';

import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface PositionDTO {
  id: number;
  positionname: string;
}

export async function getAllPosition() {
  const response = await api.get<PositionDTO[]>(`${apiLink}Position`);
  return response.data;
}

export async function getPositionById(id: number) {
  const response = await api.get<PositionDTO>(`${apiLink}Position/${id}`);
  return response.data;
}

export async function createPosition(data: any) {
  await api.post(`${apiLink}Position`, data);
}

export async function updatePosition(data: any) {
  await api.put(`${apiLink}Position`, data);
}

export async function deletePosition(id: number) {
  await api.delete(`${apiLink}Position/${id}`);
}
