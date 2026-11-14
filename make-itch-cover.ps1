Add-Type -AssemblyName System.Drawing.Common
$w=630; $h=500
$bmp=[System.Drawing.Bitmap]::new($w,$h)
$g=[System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode=[System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint=[System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
function Fill-RoundRect($graphics,$brush,$x,$y,$width,$height,$radius){
  $path=[System.Drawing.Drawing2D.GraphicsPath]::new(); $d=$radius*2
  $path.AddArc($x,$y,$d,$d,180,90); $path.AddArc(($x+$width-$d),$y,$d,$d,270,90)
  $path.AddArc(($x+$width-$d),($y+$height-$d),$d,$d,0,90); $path.AddArc($x,($y+$height-$d),$d,$d,90,90)
  $path.CloseFigure(); $graphics.FillPath($brush,$path); $path.Dispose()
}
$rect=[System.Drawing.Rectangle]::new(0,0,$w,$h)
$grad=[System.Drawing.Drawing2D.LinearGradientBrush]::new($rect,[System.Drawing.Color]::FromArgb(13,43,37),[System.Drawing.Color]::FromArgb(30,91,68),35)
$g.FillRectangle($grad,$rect)
$grad.Dispose()

# Soft festive lights and snow dots
$rng=[Random]::new(18)
for($i=0;$i -lt 52;$i++){
  $d=$rng.Next(3,12); $x=$rng.Next(0,$w); $y=$rng.Next(0,$h)
  $a=$rng.Next(25,90)
  $b=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb($a,255,231,172))
  $g.FillEllipse($b,$x,$y,$d,$d); $b.Dispose()
}

# Text panel and title
$shadow=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(80,5,22,19))
Fill-RoundRect $g $shadow 24 30 385 318 28
$shadow.Dispose()
$smallFont=[System.Drawing.Font]::new('Segoe UI',13,[System.Drawing.FontStyle]::Bold)
$titleFont=[System.Drawing.Font]::new('Segoe UI',34,[System.Drawing.FontStyle]::Bold)
$titleFont2=[System.Drawing.Font]::new('Segoe UI',50,[System.Drawing.FontStyle]::Bold)
$copyFont=[System.Drawing.Font]::new('Segoe UI',17,[System.Drawing.FontStyle]::Regular)
$gold=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255,211,117))
$cream=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255,248,224))
$muted=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(223,235,214))
$g.DrawString('A FESTIVE IDLE GAME',$smallFont,$gold,48,55)
$g.DrawString('GINGERBREAD',$titleFont,$cream,44,95)
$g.DrawString('CLICKER',$titleFont2,$cream,40,145)
$g.DrawString('Tap, bake, and grow your bakery.',$copyFont,$muted,48,232)
$g.DrawString('Catch the golden gingerbread!',$copyFont,$muted,48,263)

# Gingerbread person, icing outline then cookie dough
$dough=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(153,76,35))
$icing=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(255,224,173))
$dark=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(58,30,23))
$berry=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(190,42,54))
$mint=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(57,158,104))
$white=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::White)
$penI=[System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(255,224,173),36)
$penD=[System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(153,76,35),24)
$penI.StartCap=[System.Drawing.Drawing2D.LineCap]::Round; $penI.EndCap=[System.Drawing.Drawing2D.LineCap]::Round
$penD.StartCap=[System.Drawing.Drawing2D.LineCap]::Round; $penD.EndCap=[System.Drawing.Drawing2D.LineCap]::Round
$g.DrawLine($penI,466,252,422,286); $g.DrawLine($penI,466,252,506,286)
$g.DrawLine($penD,466,252,422,286); $g.DrawLine($penD,466,252,506,286)
$g.DrawLine($penI,459,344,439,405); $g.DrawLine($penI,478,344,500,405)
$g.DrawLine($penD,459,344,439,405); $g.DrawLine($penD,478,344,500,405)
$g.FillEllipse($icing,419,191,96,96); $g.FillEllipse($dough,426,198,82,82)
Fill-RoundRect $g $icing 422 252 112 119 35; Fill-RoundRect $g $dough 429 259 98 105 29
# icing eyes, smile, buttons, and gumdrop bow
$g.FillEllipse($white,445,226,13,13); $g.FillEllipse($white,482,226,13,13)
$g.FillEllipse($dark,450,230,6,6); $g.FillEllipse($dark,487,230,6,6)
$smile=[System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(255,224,173),4)
$g.DrawArc($smile,451,237,32,19,10,160); $smile.Dispose()
$g.FillEllipse($berry,464,282,15,15); $g.FillEllipse($mint,464,313,15,15); $g.FillEllipse($berry,464,341,15,15)
$g.FillEllipse($berry,445,187,19,11); $g.FillEllipse($mint,471,187,19,11); $g.FillEllipse($gold,461,183,12,18)

# Bottom ribbon
$ribbon=[System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(235,10,36,31))
Fill-RoundRect $g $ribbon 35 426 560 48 18
$ribbon.Dispose()
$footerFont=[System.Drawing.Font]::new('Segoe UI',17,[System.Drawing.FontStyle]::Bold)
$g.DrawString('TAP  •  BAKE  •  UPGRADE',$footerFont,$gold,179,438)

$bmp.Save((Join-Path (Get-Location).Path 'itch-cover.png'),[System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
