'use client';

import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface LoanDTO {
  loantypeid: number;
  statusid: number;
  id: number;
  amount: number;
  customerid:number;
  interestrate: number;
  termmonths: number;
  creatintime: string;
};


export async function getAllLoan() {
  const response = await api.get<LoanDTO[]>(`${apiLink}Loan`);
  return response.data;
}

export async function getLoansByCustomerId(id: number) {
  const response = await api.get<LoanDTO[]>(`${apiLink}Loan/customer/${id}`);
  return response.data;
}
export async function getLoanById(id: number) {
  const response = await api.get<LoanDTO>(`${apiLink}Loan/${id}`);
  return response.data;
}

export async function createLoan(data: any) {
  await api.post(`${apiLink}Loan`, data);
}

export async function updateLoan(data: any) {
  await api.put(`${apiLink}Loan`, data);
}

export async function deleteLoan(id: number) {
  await api.delete(`${apiLink}Loan/${id}`);
}
