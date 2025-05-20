'use client';

import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface LoanStatusDTO {
  id: number;
  statusname: string;
}

export async function getAllLoanStatuse() {
  const response = await api.get<LoanStatusDTO[]>(`${apiLink}LoanStatus`);
  return response.data;
}

export async function getLoanStatuseById(id: number) {
  const response = await api.get<LoanStatusDTO>(`${apiLink}LoanStatus/${id}`);
  return response.data;
}

export async function createLoanStatuse(data: any) {
  await api.post(`${apiLink}LoanStatus`, data);
}

export async function updateLoanStatuse(data: any) {
  await api.put(`${apiLink}LoanStatus`, data);
}

export async function deleteLoanStatuse(id: number) {
  await api.delete(`${apiLink}LoanStatus/${id}`);
}
