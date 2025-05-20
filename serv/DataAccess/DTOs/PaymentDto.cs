namespace Dtos
{
    public class PaymentDto
    {
        public int? Id { get; set; }
        public DateOnly Paymentdate { get; set; }
        public decimal Amount { get; set; }
        public int LoanId { get; set; }
        public int PaymentTypeId { get; set; }
    }
}