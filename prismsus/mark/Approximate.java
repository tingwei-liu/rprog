package math;
import java.text.*;
public class Approximate {

	public static double funct(double x,double y){
		double function = -y + Math.pow(Math.E, -x);
		return function;
	}
	
	public static double fundirx(double x, double y){
		double function = -Math.pow(Math.E, -x);
		return function;
	}
	
	public static double fundiry(double x, double y){
		double function = -1;
		return function;
	}
	
	public static void Euler(int start, int initial, int num, double step)
	{
		double x =start, y= initial;
		DecimalFormat dig = new DecimalFormat();
		DecimalFormat dig2 = new DecimalFormat();
		dig.setMaximumFractionDigits(2);
		dig2.setMaximumFractionDigits(5);
		System.out.println(x + "\t" + y);
		
		for(int i=1; i<=num; i++){
			double k = funct(x,y);
			y= y + step * funct( x+step/2 , y + k*step/2);
			x = x + step;
			System.out.println(dig.format(x) + "\t" + dig2.format(y));
		}
	}
	
	public static void Taylor(int start, int initial, int num, double step)
	{
		double x = start, y= initial;
		DecimalFormat dig = new DecimalFormat();
		DecimalFormat dig2 = new DecimalFormat();
		dig.setMaximumFractionDigits(2);
		dig2.setMaximumFractionDigits(5);
		System.out.println("\n" + x + "\t" + y);
		
		for(int i=1; i<=num; i++){
			double fun = funct(x,y);
			double funder = fundirx(x,y) + fundiry(x,y)*funct(x,y);
			y = y + step*fun + 0.5*step*step*funder;
			x = x + step;
			System.out.println(dig.format(x) + "\t" + dig2.format(y));
		}
	}
	
	public static void RK4(int start, int initial, int num, double step)
	{
		double x = start, y= initial;
		DecimalFormat dig = new DecimalFormat();
		DecimalFormat dig2 = new DecimalFormat();
		dig.setMaximumFractionDigits(2);
		dig2.setMaximumFractionDigits(5);
		System.out.println("\n" + x + "\t" + y);
		
		for(int i=1; i<=num; i++){
			double w1 = funct(x,y);
			double w2 = funct(x+step/2, y+w1*step/2);
			double w3 = funct(x+step/2, y+w2*step/2);
			double w4 = funct(x+step, y+w3*step);
			y = y + step/6*(w1+2*w2+2*w3+w4);
			x = x + step;
			System.out.println(dig.format(x) + "\t" + dig2.format(y));
		}
	}
	
	public static void main(String[] args)
	{
		int xzero = 0;
		int yzero = 4;
		int num = 80;
		double stepsize = 0.05;
		
		Euler(xzero, yzero, num, stepsize);
		Taylor(xzero, yzero, num, stepsize);
		RK4(xzero, yzero, num, stepsize);
	}
}
