
// src/AllServicios.js

import React, { useEffect, useState } from 'react';

const Servicios = () => {
  const [servicios, setServicios] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('http://localhost:3000/getservicio') 
      .then((response) => response.json())
      .then((data) => {
        setServicios(data.servicio);
        setLoading(false);
      })
      .catch((error) => {
        console.error('Error al cargar datos:', error);
        setLoading(false);
      });
  }, []);

  if (loading) return <p>Cargando datos...</p>;

  return (
    <div>
      <h2>Servicios</h2>
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

export default Servicios;