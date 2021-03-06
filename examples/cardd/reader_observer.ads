--
--  Copyright (c) 2008,
--  Reto Buerki <reet@codelabs.ch>
--
--  This file is part of PCSC/Ada.
--
--  PCSC/Ada is free software; you can redistribute it and/or modify
--  it under the terms of the GNU Lesser General Public License as published
--  by the Free Software Foundation; either version 2.1 of the License, or
--  (at your option) any later version.
--
--  PCSC/Ada is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Lesser General Public License for more details.
--
--  You should have received a copy of the GNU Lesser General Public License
--  along with PCSC/Ada; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
--  MA  02110-1301  USA
--
--  <PURPOSE>
--    Simple reader observer example.
--  </PURPOSE>
--

with PCSC.SCard;
with PCSC.SCard.Monitor;

use PCSC;

package Reader_Observer is

   type Instance is new SCard.Monitor.Observer with null record;

   overriding
   procedure Notify
     (O         : Instance;
      Condition : SCard.Reader_Condition);
   --  Implementation of a reader monitor observer.

end Reader_Observer;
