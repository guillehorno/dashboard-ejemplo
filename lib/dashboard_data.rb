class DashboardData
  def initialize
    #Codigo para inicializar la clase

    # Productos harcodeados para la demo
    @productos_harcoded = [
      'Disco Duro SSD',
      'GoPro Session',
      'ChromeCast',
      'Led ViewSonic',
      'Amazon Fire Tv Stick',
      'Notebook Dell',
      'Reloj Solar Seiko',
      'Lentes de Sol Carrera',
      'Polera estampada',
      'Lente de Sol Strong',
      'Samsung Gear VR',
      'Roomba aspiradora',
      'Playstation 4',
      'Perfume 500ml',
      'Samsung Edge',
      'Ipad Pro',
      'Parrilla a carbon FG',
      'Trotadora electrica'
    ]
    @datos_venta_iniciales = []
  end

  def abrir_conexion_mysql
    Mysql2::Client.new(:host => "HOST", :username => "USERNAME", :password => "SECRET", :port => 3306, :database => "BASE_DE_DATOS" )
  end

  #Ejemplo de metodo que busca de la base de datos. Asume que hay una tabla llamada ventas que contiene un id de
  #producto. Esta query hace el join de las 2 tablas y ordena por fecha, las ultimas 15.
  def get_ultimas_15_ventas
    db = abrir_conexion_mysql
    query = "SELECT * FROM ventas INNER JOIN productos ON (ventas.producto_id = productos.id) ORDER BY ventas.fecha DESC LIMIT 15 "
    resultado = db.query(query)

    productos = resultado.map do |fila|
      fila = {
        :label => fila['nombre_producto'],
        :value => fila['ventas.monto']
      }
    end
  end

  def get_montos_ventas
    if @datos_venta_iniciales.length > 15
      @datos_venta_iniciales.shift
    end
    @datos_venta_iniciales << { x: Time.now.to_i, y: rand(500000..2000000)}
    @datos_venta_iniciales
  end

  def get_ultimas_10_ventas_fixed
    random_prod = @productos_harcoded.shuffle.first(10)
    prod_cantidad = random_prod.map do |prod|
      {:label => prod, :value => rand(1..5)}
    end
  end
end
