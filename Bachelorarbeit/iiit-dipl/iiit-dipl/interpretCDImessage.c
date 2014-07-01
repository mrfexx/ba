#include "mex.h"

// Change to undef to exclude warning messages.
#define MEXVER

#define STX 2
#define ETX 3
#define TAB 9


const char* sAnaFieldNames[aNumberOfFields] =
{
      "unit",
      "actual_temp",
      "low_alarm",
      "high_alarm",
      "analyte_unavailable",
      "value"
};



typedef struct
{
      unsigned char unit;
      unsigned char actual_temp;
      unsigned char low_alarm;
      unsigned char high_alarm;
      unsigned char analyte_unavailable;
      double value;
} analyte;




unsigned char CPIP_crc(unsigned char *start_adr, int count)
{
      int i;
      unsigned char crc=0, idx;
      unsigned char *byte_ptr=start_adr;
      
      for(i=0; i<count; i++)
      {
            idx = (crc ^ (*byte_ptr)) & 0x0f;
            crc = ((crc>>4) & 0x0f) ^ CPIP_crc_table[idx];
            idx = (crc ^ (*byte_ptr>>4)) & 0xf;
            crc = ((crc>>4) & 0xf) ^ CPIP_crc_table[idx];
            ++byte_ptr;
      }
      
      return crc;
}


unsigned hextodec(char *sHex, unsigned index, int iNum)
{
      unsigned iDec=0, k;
      
      for (k=index; k<index+iNum; k++)
            iDec = iDec*16 + ((sHex[k]>='0' & sHex[k]<='9')? sHex[k]-'0' : sHex[k]-'A'+10);
      
      return iDec;
}
