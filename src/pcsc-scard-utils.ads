--
--  Copyright (c) 2008,
--  Reto Buerki <buerki@swiss-it.ch>
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
--    SCard utilities package. This package contains convenience functions and
--    procedures which can be invoked from the client code for specific
--    conversion or callback operations.
--  </PURPOSE>
--

with PCSC.Thin;
with PCSC.SCard;

use PCSC;

package PCSC.SCard.Utils is

   type Callback is access procedure (ID : in Reader_ID := Null_Reader_ID);
   --  Callback for reader ID handling. Provides a flexible way to access
   --  specific readers inside a Reader_ID_Set.

   function To_Hex_String
     (Given : in Byte_Set := Null_Byte_Set;
      Len   : in Positive)
      return String;
   --  Returns hex-representation string of binary data (Byte_Set). Len defines
   --  the length of the returned string, this is usally two times the length
   --  of the initial byte set (because each byte is represented by two
   --  'chars').

   function To_Hex_String (Given : in Byte_Set := Null_Byte_Set) return String;
   --  Returns hex-representation string of binary data (Byte_Set). The string
   --  length will be the double length of the initial byte set. If a
   --  Null_Byte_Set is passed to this function, "0" string is returned.

   function To_Hex_String
     (Given : in Thin.Byte_Array := Thin.Null_Byte_Array;
      Len   : in Positive)
      return String;
   --  Returns hex-representation string of binary data (Byte_Array). Len
   --  defines the length of the returned string.

   function To_Hex_String (Given : in ATR := Null_ATR) return String;
   --  Returns hex-representation string of an ATR. If a Null_ATR is passed,
   --  "0" is returned.

   function To_String (Reader : in Reader_ID := Null_Reader_ID) return String;
   --  Return string from Reader_ID.

   function To_String (States : in Card_States_Set) return String;
   --  Return string representation of card states.

   function To_String (States : in Reader_States_Set) return String;
   --  Return string representation of reader states.

   function To_String (Given : in Byte_Set := Null_Byte_Set) return String;
   --  Return an array of characters from Byte_Set. Function does not remove
   --  or trim newlines. If Null_Byte_Set is passed for 'Given', a "0" string
   --  is returned.

   function To_Long_Long_Integer (Given : in Byte_Set := Null_Byte_Set)
                                  return Long_Long_Integer;
   --  Return converted Long_Long_Integer value from Byte_Set. Maximal value
   --  which can be converted is Long_Long_Integer'Last. If given Byte_Set
   --  contains a bigger number than Long_Long_Integer'Last, a
   --  "Number_Too_Big" exception will be raised. If a Null_Byte_Set is passed,
   --  0 is returned.


   procedure Action_Info (Text   : in String);
   --  This function is used by all test and example programs of PCSC/Ada:
   --  Pretty print some information about an operation to stdout. After the
   --  action is complete, the Action_Result() function can be used to display
   --  the result code of the operation.

   procedure Action_Result (Result : in String);
   --  Pretty print the result code of an operation to stdout. Before calling
   --  this function, Action_Info() should be used to describe the operation.


   procedure For_Every_Reader
     (Readers : in Reader_ID_Set;
      Call    : in Callback);
   --  Call 'Callback' procedure for every reader in readers list.

   procedure Print_ReaderID (ID : in Reader_ID);
   --  Print out specific reader ID to default output.

end PCSC.SCard.Utils;
