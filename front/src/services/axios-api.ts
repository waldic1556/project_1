import axios from "axios";
import { apiLink } from "@/constants";
import { toast } from "react-toastify";
const api = axios.create({
  baseURL: apiLink,
});

api.interceptors.request.use(
  config => {
    const token = localStorage.getItem("custom-auth-token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  error => Promise.reject(error)
);

api.interceptors.response.use(
  response => response,
  error => {

    console.log(error.response.data.errors);
    if (error.response?.status === 400 && error.response?.data?.errors) {
  
      const messages: string[] = [];
      
      for (const key in error.response?.data.errors) {
        messages.push(...error.response?.data.errors[key]);
      }
      
      
      
      // messages.forEach(msg => toast.error(msg));
    }
    if (error.response?.status === 404) {
      alert("Already added");

    }

    if (error.response?.status === 403) {
      const token = localStorage.getItem("custom-auth-token");

      if (typeof window !== "undefined") {
        if (token) {
          alert("Unauthorized");
          window.location.href = "/";
        } else {
          alert("Please login");
          window.location.href = "/login";
        }
      }
    }

    return Promise.reject(error);
  }
);

export default api;
