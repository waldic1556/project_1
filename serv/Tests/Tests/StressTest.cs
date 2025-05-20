using Microsoft.AspNetCore.Mvc.Testing;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using Xunit;

namespace Lab5Database.Tests
{
    public class CustomerIntegrationTests : IClassFixture<WebApplicationFactory<Program>>
    {
        private readonly HttpClient _client;

        public CustomerIntegrationTests(WebApplicationFactory<Program> factory)
        {
            _client = factory.CreateClient();
        }

        [Fact]
        public async Task AddAndCleanCustomers_IntegrationTest()
        {
            var createdIds = new List<int>();
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwb3NpdGlvbl9pZCI6IjEiLCJ1bmlxdWVfbmFtZSI6InRoZXNwaWtlciIsIm5iZiI6MTc0Njg1ODU2MywiZXhwIjoxNzQ2ODYyMTYzLCJpYXQiOjE3NDY4NTg1NjMsImlzcyI6IlRhc2tNYW5hZ2VyQVBJIiwiYXVkIjoiVGFza01hbmFnZXJVc2VycyJ9.MomQRW_sqSYrR2_Oa9Pay5dRbBK6m3l2ou8dtPVNX7Q");

            for (int i = 0; i < 10; i++)
            {
                var customer = new
                {
                    name = $"Customer_{i}",
                    phone = $"+380999{i:D6}",
                    type = "1",
                    dateofbirth = "1990-01-01"
                };

                var response = await _client.PostAsJsonAsync("/api/Customer", customer);
                Assert.True(response.IsSuccessStatusCode, $"POST failed at {i}");

                var created = await response.Content.ReadFromJsonAsync<CustomerResponse>();
                if (created != null)
                    createdIds.Add(created.id);
            }

            foreach (var id in createdIds)
            {
                var delete = await _client.DeleteAsync($"/api/Customer/{id}");
                Assert.True(delete.IsSuccessStatusCode, $"DELETE failed for {id}");
            }
        }

        [Fact]
        public async Task ParallelCustomerReads_IntegrationTest()
        {
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwb3NpdGlvbl9pZCI6IjEiLCJ1bmlxdWVfbmFtZSI6InRoZXNwaWtlciIsIm5iZiI6MTc0Njg1ODU2MywiZXhwIjoxNzQ2ODYyMTYzLCJpYXQiOjE3NDY4NTg1NjMsImlzcyI6IlRhc2tNYW5hZ2VyQVBJIiwiYXVkIjoiVGFza01hbmFnZXJVc2VycyJ9.MomQRW_sqSYrR2_Oa9Pay5dRbBK6m3l2ou8dtPVNX7Q");

            int users = 10;
            var tasks = new List<Task>();

            for (int i = 0; i < users; i++)
            {
                tasks.Add(Task.Run(async () =>
                {
                    for (int j = 0; j < 10; j++)
                    {
                        var response = await _client.GetAsync("/api/Customer");
                        Console.WriteLine(response.StatusCode);
                        Console.WriteLine(response.Content);
                        Assert.True(response.IsSuccessStatusCode, $"GET failed for user {i}, try {j} {response.StatusCode} {response.Content}");
                    }
                }));
            }

            await Task.WhenAll(tasks);
        }

        private class CustomerResponse
        {
            public int id { get; set; }
        }
    }
}