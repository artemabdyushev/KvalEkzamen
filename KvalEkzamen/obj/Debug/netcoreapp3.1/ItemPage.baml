   M S B A M L   `   `   `  ����F  BKvalEkzamen, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:KvalEkzamenKvalEkzamen  5          KvalEkzamen.ItemPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:KvalEkzamen     5        N� Title$  ItemPage��5	      .��5      � 
������� � ColumnDefinitions 5   
   �� 5      $
��123* �6   �� 5      $
��128* �6   �� 5      $
��123* �6   �� 5      $
��128* �6   �� 5      $	��80* �6   �� 5      $	��80* �6   �� 5      $	��80* �6    � RowDefinitions 5   
   �� 5      $	��21* �6   �� 5      $
��187* �6   .+�5   
   �� -   5        $��ItemList��5       $��2��6   $��Disabled=�60   $��7��6f   ��5      �� 5      .R�5      �  � Orientation$ 
Horizontal=�6    5      ��5      �� 5!      .R�5"      �� 
����� �$��1q�60   ._�5#      �  5$      �� 5%   "   $��50 �60   �� 5&   "   $��50 �60   �� 5'   "   $��50 �60   �� 5(   "   $��50 �60   �� 5)   "   $��50 �60   �� 5*   "   $��50 �60   �� 5+   "   $��50 �60   �� 5,   "   $��50 �60   .+�5.      �� $��WrapWithOverflow=�6(   $��0��6H   $	��100��6U   ��6a   �� *	item_name+ �� StringFormat$( "Название товара: {0}���� 5/      $��WrapWithOverflow=�6(   $��1��6H   $	��100��6U   ��6a   �� *category_name+$. (Название категории: {0}���� 50      $��WrapWithOverflow=�6(   $��2��6H   $	��100��6U   ��6a   �� *cost+$ Цена: {0}���� 51      $��WrapWithOverflow=�6(   $��3��6H   $	��100��6U   ��6a   �� *
about_item+$ Описание: {0}���� 52      $��WrapWithOverflow=�6(   $��4��6H   $	��100��6U   ��6a   �� *rate_index_item+$ Рейтинг: {0}���� 53      $��WrapWithOverflow=�6(   $��5��6H   $	��100��6U   ��6a   �� *name_producer+$6 0Название производителя: {0}��54      55      56      58      �� 5:   
   -   5        $��Удалить��5:   #   $��4��65   �� 5;   
   -   5        $��Создать��5;   #   $��5��65   �� 5<   
   -   5        $ ��Редактировать��5<   !   $��6��69   5=      5>      