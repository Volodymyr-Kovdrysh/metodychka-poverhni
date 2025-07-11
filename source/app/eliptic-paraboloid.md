# Еліптичний параболоїд

:::{admonition} Означення
:class: tip

Еліптичним параболоїдом називається поверхня, рівняння якої в спеціально-підбраній прямокутній системі координат має вигляд

$$
\frac{x^2}{p} + \frac{y^2}{q} = 2z, p>0, q>0, p\geq q
$$(elparab)

:::

З {eq}`elparab` випливає, що віссю симетрії даної поверхні є вісь $Oz$ площинами симетрії є площини $xOz$ та $yOz$. Зазначимо ще, що якщо $p=q$, то поверхня {eq}`elparab` є поверхнею обертання, яка одержується при обертанні параболи $y^2=2qz$ навколо осі $Oz$

Перетнемо дану поверхню площиною $z=h$. Рівняння лінії перетину при цьому мають вигляд

$$
\dfrac{x^2}{p} + \dfrac{y^2}{q} = 2h, z=h
$$

Якщо $h<0$, то дана площина поверхню {eq}`elparab` не перетинає.

Якщо $h=0$, то площина $xOy$ перетинає поверхню {eq}`elparab` в одній точці, точці $O(0,0,0)$, яка називається вершиною еліптичного параболоїда.

Якщо $h>0$, то в перетині одержуємо еліпс, розміщений у площині $z=h$, канонічне рівняння якого має вигляд

$$
\dfrac{x^2}{(\sqrt{2ph})^2} + \dfrac{y^2}{(\sqrt{2qh})^2} = 1, z=h  
$$

Центр еліпса $(0,0,h)$.

При перетені поверхні {eq}`elparab` площиною $xOz$ дістаємо лінію, рівняння якої мають вигляд $\dfrac{x^2}{p}=2z, y=0$, тобото це є парабола вигляду $x^2=2pz, y=0$

Аналогічно при перетині {eq}`elparab` площиною $yOz$ дістанемо параболу, канонічне рівняння якої має вигляд $y^2=2qz, x=0$.

Отже, параметри $p,q$ це відповідні параметри парабол, які одержуються при перетині даної поверхні площинами $xOz$, $yOz$.

Далі перетнемо {eq}`elparab` площиною $y=t$. В результаті дістанемо лінію, рівняння якої мають вигляд $\dfrac{x^2}{p} + \dfrac{t^2}{q} = 2z, y=t $ $\Leftrightarrow$ $\dfrac{x^2}{p}=2z-\dfrac{t^2}{q}, y=t$ $\Leftrightarrow$ $x^2 = 2p(z-\dfrac{t^2}{2q}), y=t$

Одержане рівняння -- рівняння параболи з центром у точці $0,t,\dfrac{t^2}{2q}$ вісь параболи має рівняння $x=0, y=t$ напрям якої співпадає з напрямом вісі $Oz$. Аналогічно розглядається випадок перетину поверхні {eq}`elparab` площиною $x=t$. В результаті дістанемо параболу рівняння якої має вигляд

$$
y^2=2q\left(z-\dfrac{t^2}{2p}\right)
$$

```{image} img/elparab.png
:alt: el-parab
:class: bg-primary
:width: 100%
:align: center
```
