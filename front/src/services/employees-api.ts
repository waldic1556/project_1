'use client';



import { apiLink } from "@/constants";
import axios from "axios";
import api from "./axios-api";
export interface EmployeeDTO {
  id: number;
  name: string;
  login: string;
  position: string;
}

export async function getAllEmployee() {
  const response = await api.get<EmployeeDTO[]>(`${apiLink}Employee`);
  return response.data;
}

export async function getEmployeeById(id: number) {
  const response = await api.get<EmployeeDTO>(`${apiLink}Employee/${id}`);
  return response.data;
}

export async function createEmployee(data: any) {
  await api.post(`${apiLink}Employee`, data);
}

export async function updateEmployee(data: any) {
  await api.put(`${apiLink}Employee`, data);
}

export async function deleteEmployee(id: number) {
  await api.delete(`${apiLink}Employee/${id}`);
}
