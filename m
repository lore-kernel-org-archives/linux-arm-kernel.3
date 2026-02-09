Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356B5E78D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IZQ4COQKPXn9DHaU1hZteGEj7qfkW1soHzUGkYDH58=; b=Ldr2IvRT3blUror9QxGfklKCWA
	LwGQr0FFYM6LzJfuDOfAQ5AR8NOVATsf0S4bRcCq+qqkIQYw4/F34+4Wv/mCLjW4K6UNhw5kSOGPP
	FXK5qwIJ1NqJdD4DFt5WhuaONoszk10Z5AnMpDw9NX0xh0PSjf033YRd2v/tYvCgb+WE6ESvZGRmO
	vfrrJjwmIrKKP8Y6/V+FnLPBkjg3MoHedzQ6C3R4kQZ4dep5wCO8wOyBXHoSZ68lpIgIkZCsiwe3Z
	34N7nqpWbX/4FXnRfSuNfL5hWaIeSBwTSM+VaWZAkGNwHHkwwwyRrMJuHf+X68jiyIp5MfloIRYsC
	G4ZV4Chw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpU7F-0000000Fgjw-3nMN;
	Mon, 09 Feb 2026 16:28:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpU7D-0000000FgjU-0Nvm;
	Mon, 09 Feb 2026 16:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5IZQ4COQKPXn9DHaU1hZteGEj7qfkW1soHzUGkYDH58=; b=oYif8k3yTZnZIcyM4COKRbCgoV
	W3TYLbDNyqPT1CA6CQ7rIdUQOD7Mvp1SuqLSLkHh62A1fxd8wjYe148jCsoqzpjJPPirB7SZNthL1
	lBCUfvEWMN+KtPbK9GGd0SsFQPSFudqZIncwSLImb9CPoLAKwpq5A3yAgAzelBEjwNNmrV5vyt+tC
	s+sZ+h7CxmAdPaUqmY2zD5bWsHBECk/mmSSA5/1VwLqdJWoEtgIHIacmkWng2QxOmiYuCFPsVfGmz
	Csp4vG66he2ip+9+C9kYPZPueO34rS5Y1//W7CjpQqHpQyv8WnF4G7RiXWTPssEz6OWRIXcagWOon
	m/Pe0XBw==;
Received: from i53875a32.versanet.de ([83.135.90.50] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpU78-007nOC-2C; Mon, 09 Feb 2026 17:27:54 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add pinctrl for clk-generator GPIO on
 rk3588-tiger
Date: Mon, 09 Feb 2026 17:27:51 +0100
Message-ID: <5539724.6PsWsQAL7t@diego>
In-Reply-To: <c8816ada-bb46-4c15-a3a8-a06dac5acdbd@cherry.de>
References: <20260205102104.394991-1-heiko@sntech.de>
 <20260205102104.394991-4-heiko@sntech.de>
 <c8816ada-bb46-4c15-a3a8-a06dac5acdbd@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_082759_211271_639714B5 
X-CRM114-Status: GOOD (  27.25  )
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

Am Donnerstag, 5. Februar 2026, 17:49:15 Mitteleurop=C3=A4ische Normalzeit =
schrieb Quentin Schulz:
> Hi Heiko,
>=20
> On 2/5/26 11:21 AM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > While specific driver in the Linux-Kernel handles GPIOs gracefully with=
out
> > matching pinctrl entries, this might not be true for other operating
> > systems. So having pinctrl entries makes the hardware-description
> > more complete.
> >=20
> > The somewhat similar rk3588-jaguar board has a pinctrl entry already,
> > so also add one for rk3588-tiger.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk3588-tiger.dtsi
> > index 259fb125e13f..91057b166690 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> > @@ -58,6 +58,8 @@ pcie_refclk: pcie-clock-generator {
> >   		clock-frequency =3D <100000000>;
> >   		clock-output-names =3D "pcie3_refclk";
> >   		enable-gpios =3D <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKR=
EQN_M1_L */
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pcie30x4_clkreqn_m1_l>;
> >   		vdd-supply =3D <&vcca_3v3_s0>;
> >   	};
> >  =20
> > @@ -357,6 +359,12 @@ module_led_pin: module-led-pin {
> >   		};
> >   	};
> >  =20
> > +	pcie30x4 {
> > +		pcie30x4_clkreqn_m1_l: pcie30x4-clkreqn-m1-l {
> > +			rockchip,pins =3D <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
> So this is interesting because it made me double-check the schematics=20
> and I think we did a mistake on Jaguar.
>=20
> This one here is fine as this SoC pin is connected to the PDn pin of the=
=20
> IC which has an internal Pull-Up, so the state is defined.
>=20
> However, on Jaguar this signal controls a transistor and there's no=20
> external Pull-Up or Pull-Down between the SoC and the transistor gate so=
=20
> we probably should not have pull_none for the pinconf. The default reset=
=20
> state of this pin in Pull-Up so maybe we should go with that such that=20
> there's no difference between the reset default and the time between=20
> application of the pinconf by the core and asserting of the pin by the=20
> driver. What do you think?

Looking at the datasheet for the PI6C557-05B, both nPD and OE are
described as having an "internal pull up resistor", so the pinconf side
should not matter?


> As for Tiger, this is fine, so:
>=20
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Heiko



