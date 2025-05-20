'use client';

import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface PaymentTypeDTO {
  id: number;
  typename: string;
}

export async function getAllPaymentType() {
  const response = await api.get<PaymentTypeDTO[]>(`${apiLink}PaymentType`);
  return response.data;
}

export async function getPaymentTypeById(id: number) {
  const response = await api.get<PaymentTypeDTO>(`${apiLink}PaymentType/${id}`);
  return response.data;
}

export async function createPaymentType(data: any) {
  await api.post(`${apiLink}PaymentType`, data);
}

export async function updatePaymentType(data: any) {
  await api.put(`${apiLink}PaymentType`, data);
}

export async function deletePaymentType(id: number) {
  await api.delete(`${apiLink}PaymentType/${id}`);
}
