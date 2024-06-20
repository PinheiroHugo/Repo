# Usa la imagen oficial de Odoo 17 como base
FROM odoo:17.0

# Instala cualquier dependencia del sistema necesario
USER root
RUN apt-get update && apt-get install -y \
    # Agrega aquí cualquier dependencia adicional que necesites
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Cambia a usuario Odoo
USER odoo

# Copia el archivo de configuración de Odoo
COPY ./config_odoo/odoo.conf /etc/odoo/odoo.conf

# Copia los módulos personalizados al directorio de addons
COPY ./extra_addons /mnt/extra-addons

# Expon el puerto 8069
EXPOSE 8069

# Establece el punto de entrada
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
