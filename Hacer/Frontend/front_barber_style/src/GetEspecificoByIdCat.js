// src/getespecificobyid.js

import React, { useEffect, useState } from 'react';

const ServiciosByIdCat = ({ idCatalogo }) => { // Recibe idCatalogo como prop
  const [servicios, setServicios] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!idCatalogo) setLoading(true); // Si no hay idCatalogo, no hacer la petición

    fetch(`http://localhost:3000/getservicioespecificobyid/${idCatalogo}`) // Modifica la URL para incluir el idCatalogo
      .then((response) => response.json())
      .then((data) => {
        setServicios(Array.isArray(data.servicio) ? data.servicio : [data.servicio]);
        setLoading(false);
      })
      .catch((error) => {
        console.error('Error al cargar datos:', error);
        setLoading(false);
      });
  }, [idCatalogo]); // El useEffect se ejecuta cuando cambia el idCatalogo

  if (loading) return <p>Cargando datos...</p>;

  return (
    <div>
      <h2>Servicios para el catálogo: {idCatalogo}</h2> {/* Mostrar el idCatalogo en el título */}
      <table>
        <thead>
          <tr>
            <th>idCatalogo</th>
            <th>DescripcionCatalogo</th>
            <th>idTipoServicio</th>
            <th>DescripcionTipoServicio</th>
            <th>Valor</th>
            <th>idServicio</th>
            <th>EstadoServicio</th>
          </tr>
        </thead>
        <tbody>
          {servicios.map((servicios) => (
            <tr key={servicios._id}>
              <td>{servicios.idCatalogo}</td>
              <td>{servicios.DescripcionCatalogo}</td>
              <td>{servicios.idTipoServicio}</td>
              <td>{servicios.DescripcionTipoServicio}</td>
              <td>{servicios.Valor}</td>
              <td>{servicios.idServicio}</td>
              <td>{servicios.EstadoServicio}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ServiciosByIdCat;
