namespace Lab5Database
{
    static class ConfigurationManager
    {
        public static IConfiguration AppSettings { get; }

        static ConfigurationManager()
        {
            AppSettings = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json").Build();
        }
    }
}