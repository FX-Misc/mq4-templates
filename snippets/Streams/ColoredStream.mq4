// Colored stream v2.0

class ColoredStreamData
{
public:
   double Stream[];
};

class ColoredStream
{
public:
   ColoredStreamData _streams[];
   double _data[];

   int RegisterInternal(int id)
   {
      SetIndexBuffer(id + 0, _data);
      return id + 1;
   }

   int RegisterStream(int id, color clr)
   {
      int size = ArraySize(_streams);
      ArrayResize(_streams, size + 1);
      SetIndexStyle(id + 0, DRAW_LINE, STYLE_SOLID, 1, clr);
      SetIndexBuffer(id + 0, _streams[size].Stream);
      return id + 1;
   }

   void Set(double value, int period, int colorIndex)
   {
      _data[period] = value;
      for (int i = 0; i < ArraySize(_streams); ++i)
      {
         if (colorIndex == i)
         {
            _streams[i].Stream[period] = value;
            if (_streams[i].Stream[period + 1] == EMPTY_VALUE)
               _streams[i].Stream[period + 1] = _data[period + 1];   
         }
         else
            _streams[i].Stream[period] = EMPTY_VALUE;
      }
   }
};