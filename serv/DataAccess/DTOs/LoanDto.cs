namespace Dtos
{
    public class LoanDto
    {
        public int Id { get; set; }
        public decimal Amount { get; set; }
        public decimal Interestrate { get; set; }
        public int Termmonths { get; set; }
    }
}