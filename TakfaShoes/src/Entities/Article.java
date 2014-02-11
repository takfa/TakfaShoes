package Entities;


/**
 * 
 * @author Takfarinas
 *Classe Article stockant les information d'un article
 *et disposant de méthodes basiques pour la récupéaration
 *des informations
 */
public class Article {

	private String name;
	private int price;
	private String pic;
	private String id;
	private String marque;
	private String pointure;
	private String dispo;

	public Article(String name, String price, String pic) {
		this.name=name; 
		try{
			this.price = Integer.parseInt(price);
		}catch (NumberFormatException e){
			System.out.println("Error : "+e.getMessage());
		}

		this.pic = pic;
	}
	public String getName() {
		return name;
	}

	public String getPic() {
		return pic;
	}

	public int getPrice() {
		return price; 
	}

	public boolean equals(Object obj) {
		return name.equals(((Article)obj).name); 
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}
	
	public void setMarque(String marque) {
		this.marque = marque;
	}
	
	public String getMarque() {
		return marque;
	}
	public void setPointure(String pointure) {
		this.pointure = pointure;
	}
	public String getPointure() {
		return pointure;
	}
	
	public void setDispo(String dispo) {
		this.dispo = dispo;
	}
	
	public String getDispo() {
		return dispo;
	}

}
