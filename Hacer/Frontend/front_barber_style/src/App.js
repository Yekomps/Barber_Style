import './App.css';
import AllServicios from './AllServicios';
import GetEspecificoByIdCat from './GetEspecificoByIdCat'
import GetEspecificoByName from './GetEspecificoByName'
import React, { useState } from 'react';

function App() {
  const [idCatalogo, setIdCatalogo] = useState(''); // Estado para manejar el input del usuario
  const [submittedId, setSubmittedId] = useState(null); // Estado para almacenar el id que será enviado al componente

  const handleInputChangeidCat = (e) => {
    setIdCatalogo(e.target.value); // Actualiza el valor del input
  };

  const handleSubmitidCat = () => {
    setSubmittedId(idCatalogo); // Guarda el id ingresado y envíalo al componente
  };

  const [descripciontiposervicio, setdescripciontiposervicio] = useState(''); // Estado para manejar el input del usuario
  const [submitteddescripciontiposervicio, setSubmitteddescripciontiposervicio] = useState(null); // Estado para almacenar el id que será enviado al componente

  const handleInputChangedescripciontiposervicio = (e) => {
    setdescripciontiposervicio(e.target.value); // Actualiza el valor del input
  };

  const handleSubmitdescripciontiposervicio = () => {
    setSubmitteddescripciontiposervicio(descripciontiposervicio); // Guarda el id ingresado y envíalo al componente
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Consulta de Servicios</h1>
        <h2>Consulta de Todos los Servicios</h2>
        <AllServicios />
        <h2>Consulta Por ID de Catalogo</h2>
        <div>
          <input
            type="text"
            value={idCatalogo}
            onChange={handleInputChangeidCat} // Maneja el cambio en el input
            placeholder="Ingrese el ID del catálogo"
          />
          <button onClick={handleSubmitidCat}>Buscar</button> {/* Botón para enviar el ID */}
        </div>
        {submittedId && <GetEspecificoByIdCat idCatalogo={submittedId} />}

        <h2>consulta Por Nombre de Servicio</h2>
        <div>
          <input
            type="text"
            value={descripciontiposervicio}
            onChange={handleInputChangedescripciontiposervicio} // Maneja el cambio en el input
            placeholder="Ingrese el Nombre del servicio"
          />
          <button onClick={handleSubmitdescripciontiposervicio}>Buscar</button> {/* Botón para enviar el nombre */}
        </div>
        {submitteddescripciontiposervicio && <GetEspecificoByName descripciontiposervicio={submitteddescripciontiposervicio} />}
      </header>
    </div>
  );
}

export default App;
