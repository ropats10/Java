package MyPackage;


public class Selected_Chocolate
{

	int product_id,selected_quan,total_price,chocolate_price;

	public String selected_chocolate_name;

	public Selected_Chocolate(){};

	public Selected_Chocolate(int id,String selected_chocolate_name,int chocolate_price,int selected_quan,int total_price)
	{
		this.product_id=id;
		this.selected_chocolate_name=selected_chocolate_name;
		this.selected_quan=selected_quan;
		this.total_price=total_price;
		this.chocolate_price=chocolate_price;

	}



	public int getProduct_id()
	{
		return product_id;
	}

	public void setProduct_id(int product_id)
	{
		this.product_id=product_id;
	}

	public int getSelected_quan()
	{
		return selected_quan;
	}

	public void setSelected_quan(int selected_quan)
	{
		this.selected_quan=selected_quan;
	}

	public int getTotal_price()
	{
		return total_price;
	}

	public void setTotal_price(int total_price)
	{
		this.total_price=total_price;
	}

	public int getChocolate_price()
	{
		return chocolate_price;
	}

	public void setChocolate_price(int chocolate_price)
	{
		this.chocolate_price=chocolate_price;
	}

	public String getSelected_chocolate_name()
	{
		return selected_chocolate_name;
	}

	public void setSelected_chocolate_name(String selected_chocolate_name)
	{
		this.selected_chocolate_name=selected_chocolate_name;
	}


}

