'use client';

import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface PaymentDTO {
  id: number;
  loanId: number;
  amount: number;
  paymentdate: string;
  paymentTypeId: number;
}

export async function getAllPayment() {
  const response = await api.get<PaymentDTO[]>(`${apiLink}Payment`);
  return response.data;
}

export async function getPaymentById(id: number) {
  const response = await api.get<PaymentDTO>(`${apiLink}Payment/${id}`);
  return response.data;
}
export async function getPaymentByCustomerId(id: number) {
  const response = await api.get<PaymentDTO[]>(`${apiLink}Payment/customer/${id}`);
  return response.data;
}

export async function createPayment(data: any) {
  await api.post(`${apiLink}Payment`, data);
}

export async function updatePayment(data: any) {
  await api.put(`${apiLink}Payment`, data);
}

export async function deletePayment(id: number) {
  await api.delete(`${apiLink}Payment/${id}`);
}
