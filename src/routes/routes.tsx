import { Route, Routes } from 'react-router-dom';
import { Index } from '../views/index';
import { KeyBoards } from '../views/keyboards';
import { Install } from '../views/install';
import { Configuration } from '../views/configurations';
import { Plugins } from '../views/plugins';

export function Views() {
  return (
    <Routes>
      <Route path="/" element={<Index />} />
      <Route path="/keyboard-shortcuts" element={<KeyBoards />} />
      <Route path="/installation" element={<Install />} />
      <Route path="/configuration" element={<Configuration />} />
      <Route path="/plugins" element={<Plugins />} />
    </Routes>
  );
}
