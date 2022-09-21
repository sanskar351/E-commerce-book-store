package com.paypal;

import java.util.ArrayList;
import java.util.List;

import com.DB.connection;
import com.dao.bookDaoImpl;
import com.dao.cartdaoimpl;
import com.dao.userdaoimpl;
import com.entity.bookdtl;
import com.entity.cartt;
import com.entity.user;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaymentServices {
	private static final String CLIENT_ID = "Ad4C7I2WCZ4zaisDKq3LufSm939wOCWi2HgsZzraf08PR6IoFg7iR6H7HLPqfoskJI_f98vtVzKpSeVG";  // Enter your Paypal Client Id
	private static final String CLIENT_SECRET = "EOs-iEoPAXIrbrs1TW-rEuElaBAQWsXko8ZjXI1Rm9Y5CUIjNyPqTg81jVaon548Pjqpfh0HKw2Mv73_"; // Enter your Secret Key
	private static final String MODE = "sandbox";

	public String authorizePayment(List<cartt> listOfProductInCart) throws PayPalRESTException {

		Payer payer = getPayerInformation(listOfProductInCart.get(0));
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(listOfProductInCart);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		Payment approvedPayment = requestPayment.create(apiContext);
		return getApprovalLink(approvedPayment);

	}

	private Payer getPayerInformation(cartt userFromCart) {
		user user=new userdaoimpl(connection.getcon()).getUserByUserId(userFromCart.getUid());
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(user.getName()).setEmail(user.getEmail()).setLastName("Kumar");

		payer.setPayerInfo(payerInfo);

		return payer;
	}

	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8076/Ebooks/cancel.jsp");
		redirectUrls.setReturnUrl("http://localhost:8076/Ebooks/review_payment");

		return redirectUrls;
	}

	private List<Transaction> getTransactionInformation(List<cartt> cartDetail) {
		
		List<Transaction> listTransaction = new ArrayList();
		//String shippingAddress=new cartdaoimpl(connection.getcon()).getCartByUserId(cartDetail.get(0).getUid()).get;
		Details details = new Details();
		details.setShipping("40");
        details.setSubtotal(new cartdaoimpl(connection.getcon()).totalPriceFromCart(cartDetail.get(0).getUid()));
        details.setTax("10");
    //  System.out.println("total from cart :"+String.valueOf(new cartdaoimpl(connection.getcon()).totalPriceFromCart(cartDetail.get(0).getUid())));
       String total=40+10+new cartdaoimpl(connection.getcon()).totalPriceFromCart(cartDetail.get(0).getUid());
        //System.out.println("Toal: "+total);
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(total+40+10);
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription("Ecommerce");

		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList();

		for(cartt c: cartDetail)
		{
			bookdtl p=new bookDaoImpl(connection.getcon()).getProductById(c.getBid());
			Item item = new Item();
			item.setCurrency("USD");
			item.setName(c.getBookname());
			item.setQuantity("4");
			item.setPrice(c.getPrice());

			items.add(item);
		}
		
		itemList.setItems(items);
		transaction.setItemList(itemList);

		
		listTransaction.add(transaction);

		return listTransaction;
	}

	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}
		System.out.println(approvalLink);
		return approvalLink;
	}

	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}

	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);
	}

}
