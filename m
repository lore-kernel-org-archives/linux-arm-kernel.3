Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FF0F99C63
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX7xe87h18UEYQ/QaaM5hIYsx/fVizMj3KUfwM6/Tug=; b=C2ljEW5elc3VfYFZPs03JZ6Mvs
	zsfObgnyA/bwcgiORCrYBT4vLkV3C53LSpTawJeFiV+LyD97XXaoYbHFcIu1V1bT2vNZVtZZaa1nS
	zUStsaRuzglIXqul6v51RK/NMHkcpPTcZGceWKASR1KqSbnWTm74rfy1M0EcRA+FjEak6jyxGFQ9l
	ZG5d4f+wm9x9OrVIqTeELxEf18NVU8R8Zvth+Rhbs3i8vDesRDR0ZoOOeiw1B4DCS5Sgj5eWl48Y4
	Ci8L18QGWobYThcLES6P1wRs7QBD/PoN1ASLRBgzJHVBcsOIOSBSmfJrOJCYoJFOP4wAZrnlxijVZ
	REiTF3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDsM5-00000004YCL-1Knf;
	Fri, 17 Apr 2026 23:12:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDsM2-00000004YBw-1oOY;
	Fri, 17 Apr 2026 23:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OX7xe87h18UEYQ/QaaM5hIYsx/fVizMj3KUfwM6/Tug=; b=Hn//9lpmGlH/Sc8sWAr5U3iWyQ
	NdJXhECA0sDzP0ZaPV7oR0N+RP3vOmv4KuQhI5bw0fGkWWSYdV6Yx7aaaOanfQKy7DiosBurauOp6
	Jn/7ZXX+7hzCub21m5S+KWpmwi2BYO9JC2IxosgodA1+jSqQdVAlBjahUyipHKOwwNWobtUhGrulU
	8N4gs506pZYhPgBU/nMSvr3QT/C2qql2AJPCXfEXmNTW5/jwK2BKO2IjL+mO2/sAHrQ9a7NVdClYa
	zNvvajE8AkebH6vp9ysuIg4FfNLEaRY5NKpaMCftH1YhlfSMXuXmEwSjX590+w5idM/HPkfXLMPkU
	dqoOlbMQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
Date: Sat, 18 Apr 2026 01:12:00 +0200
Message-ID: <2282688.C4sosBPzcN@phil>
In-Reply-To: <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2000470.6tgchFWduM@phil>
 <62f51359-9d91-4107-917b-cd722c7321c2@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_161206_499001_697C6F3B 
X-CRM114-Status: GOOD (  34.30  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Cristian,

Am Freitag, 17. April 2026, 18:34:17 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
> > the comments below apply sort of to all patches in that series.
> >=20
> > Am Freitag, 17. April 2026, 11:24:39 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >> The board exposes the GPIO4_C6 line to control the voltage bias on the
> >> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
> >> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
> >>
> >> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
> >> property and drop the line from the vcc_5v0_hdmi regulator to allow
> >> adjusting the bias when transitioning between TMDS and FRL operating
> >> modes.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 9 ++++---=
=2D-
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi=
 b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> >> index 749f0a54b478..93ae37699366 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> >> @@ -140,10 +140,7 @@ regulator-state-mem {
> >> =20
> >>  	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
> >>  		compatible =3D "regulator-fixed";
> >> -		enable-active-high;
> >> -		gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> >> -		pinctrl-names =3D "default";
> >> -		pinctrl-0 =3D <&hdmi_con_en>;
> >> +		regulator-always-on;
> >>  		regulator-min-microvolt =3D <5000000>;
> >>  		regulator-max-microvolt =3D <5000000>;
> >>  		regulator-name =3D "vcc_5v0_hdmi";
> >=20
> > I think this regulator was sort of a complete hack, to set that
> > gpio to some sort of default state, by declaring it as hdmi-pwr-supply.
> >=20
> > Only 2 rk3576 boards seem, to use that hack, so I think as that "regula=
tor"
> > is completely functionless now, the whole thing could be removed?
>=20
> Ack, let's just drop it.
>=20
> >=20
> >=20
> >> @@ -231,6 +228,8 @@ &gpu {
> >>  };
> >> =20
> >>  &hdmi {
> >> +	pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_e=
n>;
> >> +	frl-enable-gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
> >=20
> > this should be sorted the other way around I think.
> >=20
> > Also please provide a pinctrl-names property too. If for whatever reason
> > the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
> > board DTs are staying in the "old" compatible mode until they are adapt=
ed.
>=20
> Just to make sure I fully understand, the convention is that=20
>=20
>   pinctrl-names =3D "default";
>=20
> should be always provided, even when the node overrides an existing pinct=
rl-0
> property?
>=20
> E.g. in rk3576.dtsi we have:
>=20
>   hdmi: hdmi@27da0000 {
>     ...
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
>     ...
>   }
>=20
> Hence I omitted pinctrl-names which doesn't change and just appended
> &hdmi_frl_en to pinctrl-0's original value.

correct, please always provide a pinctrl-names entry when setting a new
pinctrl-0 .

The background is, imagine you have a base:

pinctrl-names =3D "default";
pinstrl-0 =3D <....>;

and override pinctrl-0 in a board.

Now a newer binding introduces a 2nd pinctrl state "foo". Of course
we're backwards compatible, and both are valid and the driver checks
what states are defined.

So the base sets:
pinctrl-names =3D "default", "foo";
pinctrl-0 =3D <...>;
pinctrl-1 =3D <...>;

in your (old) board you override pinctrl-0, but the driver still sees
the new variant with 2 pinctrl states, where it should've stayed with
the legacy 1-state, until the board-dts might get adapted in the future.


And I know, we're likely not doing that everywhere, and also in most
cases it won't really matter, but still it is safer and sets the better
precedent :-) .


> >>  	status =3D "okay";
> >>  };
> >> =20
> >> @@ -655,7 +654,7 @@ &pcie0 {
> >> =20
> >>  &pinctrl {
> >>  	hdmi {
> >> -		hdmi_con_en: hdmi-con-en {
> >> +		hdmi_frl_en: hdmi-frl-en {
> >=20
> > pinctrl names should ideally match the naming in schematics, for exampl=
e the
> > "HDMI0_TX_ON_H" for jaguar and tiger. This makes it way easier to> go f=
rom DT
> > to schematics and back.
>=20
> I opted for a more descriptive name that could be used consistently acros=
s all
> boards, given that not all schematics are publicly available.
>=20
> You make a fair point though, we should probably stick with the pretty te=
rrible
> hdmi[N]_tx_on_h naming instead.

yep, we're doing that everywhere else already too, and sticking to the
schematics naming, also prevents any discussions about how something
should be named ;-) .


Heiko



