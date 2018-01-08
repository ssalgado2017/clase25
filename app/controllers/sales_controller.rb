class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    valor = sale_params[:value].to_f

    if sale_params[:discount].to_i > 0 && sale_params[:discount].to_i <= 40
      valor = valor * ((100 - sale_params[:discount].to_f) / 100)
    end

    #si es Exento de IVA
    if sale_params[:tax].to_i == 1
      @sale.total = valor
    else
      @sale.total = valor * 1.19
    end


    @sale.save

    #redirect_to sales_path
    redirect_to sales_done_path
  end

  def show
  	redirect_to sales_path
  end

  def done

  end


  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
    # cod (integer) => código de la venta
    # detail (string) => detalle de la venta
    # category (integer) => categoría de la venta (ingreso manual)
    # value (integer) => valor de la venta
    # discount (integer) => porcentaje de descuento aplicado de (1-100).
    # tax (integer) => porcentaje correspondiente al IVA.
    # total (float) => total de la venta después de aplicado descuento e impuesto.
  end



end
