'use client';

import { apiLink } from "@/constants";
import axios from "axios";
import api from "./axios-api";

export interface LoanTypeDTO {
  id: number;
  typename: string;
}
export async function getAllLoanType() {
  const response = await api.get<LoanTypeDTO[]>(`${apiLink}LoanType`);
  return response.data;
}

export async function getLoanTypeById(id: number) {
  const response = await api.get<LoanTypeDTO>(`${apiLink}LoanType/${id}`);
  return response.data;
}

export async function createLoanType(data: any) {
  await api.post(`${apiLink}LoanType`, data);
}

export async function updateLoanType(data: any) {
  await api.put(`${apiLink}LoanType`, data);
}

export async function deleteLoanType(id: number) {
  await api.delete(`${apiLink}LoanType/${id}`);
}
