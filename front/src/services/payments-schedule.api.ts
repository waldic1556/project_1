'use client';

import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface PaymentScheduleDTO {
  id: number;
  loanid: number;
  duedate: string;
  amount: number;
  statusid: number;
}

export async function getAllPaymentSchedules() {
  const response = await api.get<PaymentScheduleDTO[]>(`${apiLink}PaymentSchedule`);
  return response.data;
}

export async function getPaymentSchedulesByLoanId(loanId: number) {
  const response = await api.get<PaymentScheduleDTO[]>(`${apiLink}PaymentSchedule/loan/${loanId}`);
  return response.data;
}

export async function createPaymentSchedule(data: any) {
  await api.post(`${apiLink}PaymentSchedule`, data);
}

export async function updatePaymentSchedule(data: any) {
  await api.put(`${apiLink}PaymentSchedule`, data);
}

export async function deletePaymentSchedule(id: number) {
  await api.delete(`${apiLink}PaymentSchedule/${id}`);
}
