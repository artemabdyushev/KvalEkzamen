   M S B A M L   `   `   `  ����F  BKvalEkzamen, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:KvalEkzamenKvalEkzamen  5          KvalEkzamen.CategoryPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:KvalEkzamen     5        N� Title$  CategoryPage��5	      .��5      � 
������� � ColumnDefinitions 5   
   �� 5      $
��123* �6   �� 5      $
��128* �6   �� 5      $
��123* �6   �� 5      $
��128* �6   �� 5      $	��80* �6   �� 5      $	��80* �6   �� 5      $	��80* �6    � RowDefinitions 5   
   �� 5      $	��21* �6   �� 5      $
��187* �6   .+�5   
   �� -   5        $��CategoryList��5       $��2��6   $��Disabled=�64   $��7��6j   ��5      �� 5      .R�5      �  � Orientation$ 
Horizontal=�6    5      ��5      �� 5!      .R�5"      �� 
����� �$��1q�60   ._�5#      �  5$      �� 5%   "   $��50 �60   �� 5&   "   $��50 �60   �� 5'   "   $��50 �60   �� 5(   "   $��50 �60   �� 5)   "   $��50 �60   �� 5*   "   $��50 �60   �� 5+   "   $��50 �60   �� 5,   "   $��50 �60   .+�5.      �� $��WrapWithOverflow=�6(   $��0��6H   $	��100��6U   ��6a   �� *category_name+ �� StringFormat$. (Название категории: {0}��5/      50      51      53      �� 55   
   -   5        $��Удалить��55   #   $��4��65   �� 56   
   -   5        $��Создать��56   #   $��5��65   �� 57   
   -   5        $ ��Редактировать��57   !   $��6��69   58      59      