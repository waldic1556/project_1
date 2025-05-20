namespace Dtos
{
    public class PaymentScheduleDto
    {
        public int Id { get; set; }
        public DateOnly Duedate { get; set; }
        public decimal Amount { get; set; }
        public int? Loanid { get; set; }
        public int? Statusid { get; set; }
    }
}