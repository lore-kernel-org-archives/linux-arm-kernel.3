Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ADAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1wO1tJNUWST5/aSO5B+d0Qst9czfwzaKgHwJnlCm8U=; b=Q5zCFkWBoALRZ50wDw9ONYomTq
	tkcrF+hLdgaassDdrOmeSqgMdTxiXzMYwDkO9wtkf5S/ar7Zw8QUUaBNOettBbmeaZhXzB1WfOP/o
	2bR4tle5coVsizfxWW9v4hGvp2iWRC4qODR1HndyLdR23Gi8OgmxGArgfytZvk9ymua2ZCGhkswcG
	YeDI/M++ruNx1bz7GFrqwTWzBeHCTbpRIOn9X5aWdBK15VUUEgabodY6HlrErizhz5EUBkIzrJqgw
	KJgnq3ZG6hVVPU6zsgddCytxDbabhavm4j0dwR8q1h7DApk5nnjMozu2qgt/7RZAjtHJ6GjyUQR6r
	4y4xIa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohtU-0000000FwX2-31YQ;
	Sun, 02 Mar 2025 11:54:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tohrw-0000000FwIb-3W0T;
	Sun, 02 Mar 2025 11:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p1wO1tJNUWST5/aSO5B+d0Qst9czfwzaKgHwJnlCm8U=; b=jNFLVHYGlFE6ZGeuKX7kSTL6m3
	5TMkL2oYxZW/PF9kfo2/t7Y52OJYoAjimFiuALIFyeHLYGC12FOM+bUmkSUcdqN9UUTYStk3sfM6q
	b3oqJHViq35eiD9g0VW6Fw+LOSBBX4KP/ffom4beXhI7HjykR3uWdLTXtc+BW7sTCrTob9yWo/tAR
	RCRFF4z8ZmEzqN1pjrpqUR1LYCZYklM15XDvRED48m8dlTMsuKhOMeynb/TbkDwqEyU5WVgPo0dV0
	1+rfixyDTntDyfH+0m7LPAmDfduBwJm+BiloqDrdr4DaDfHDwfSo3qjHSpjyslEq9kF/ZhWFhOn0R
	rYzKOOAA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tohrn-0001yN-P2; Sun, 02 Mar 2025 12:52:19 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
Date: Sun, 02 Mar 2025 12:52:18 +0100
Message-ID: <116104909.nniJfEyVGO@diego>
In-Reply-To: <3f0cd767-1fd8-4c65-b8b4-e948288cd02a@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se> <Z8GT3rUEyXrTUgtJ@pie.lan>
 <3f0cd767-1fd8-4c65-b8b4-e948288cd02a@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_035228_896528_A7574CC0 
X-CRM114-Status: GOOD (  26.44  )
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

Am Sonntag, 2. M=C3=A4rz 2025, 12:14:48 MEZ schrieb Jonas Karlman:
> Hi Yao Zi,
>=20
> On 2025-02-28 11:46, Yao Zi wrote:
> > On Fri, Feb 28, 2025 at 06:40:10AM +0000, Jonas Karlman wrote:
> >> Add pinctrl and gpio nodes for RK3528 and import rk3528-pinctrl.dtsi
> >> from vendor linux-6.1-stan-rkr5 kernel with the hdmi-pins-idle node
> >> removed due to missing label reference to pcfg_output_low_pull_down.
> >>
> >> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >> ---
> >> This was mostly imported from vendor kernel, however the main commit [=
1]
> >> list 28 signed-off-by tags, unclear who I should use as author and what
> >> signed-off-by tags to include.
> >>
> >> [1] https://github.com/rockchip-linux/kernel/commit/c17d6325959f0ec1af=
901e8a17919163454190a2
> >> ---
> >>  .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 1397 +++++++++++++++++
> >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   82 +
> >>  2 files changed, 1479 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
> >>
> >=20
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boo=
t/dts/rockchip/rk3528.dtsi
> >> index 0fb90f5c291c..d3e2a64ff2d5 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> @@ -4,8 +4,10 @@
> >>   * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
> >>   */
> >> =20
> >> +#include <dt-bindings/gpio/gpio.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/pinctrl/rockchip.h>
> >>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
> >>  #include <dt-bindings/reset/rockchip,rk3528-cru.h>
> >> =20
> >> @@ -17,6 +19,11 @@ / {
> >>  	#size-cells =3D <2>;
> >> =20
> >>  	aliases {
> >> +		gpio0 =3D &gpio0;
> >> +		gpio1 =3D &gpio1;
> >> +		gpio2 =3D &gpio2;
> >> +		gpio3 =3D &gpio3;
> >> +		gpio4 =3D &gpio4;
> >>  		serial0 =3D &uart0;
> >>  		serial1 =3D &uart1;
> >>  		serial2 =3D &uart2;
> >> @@ -166,6 +173,11 @@ cru: clock-controller@ff4a0000 {
> >>  			#reset-cells =3D <1>;
> >>  		};
> >> =20
> >> +		ioc_grf: syscon@ff540000 {
> >> +			compatible =3D "rockchip,rk3528-ioc-grf", "syscon";
> >> +			reg =3D <0x0 0xff540000 0x0 0x40000>;
> >> +		};
> >> +
> >>  		uart0: serial@ff9f0000 {
> >>  			compatible =3D "rockchip,rk3528-uart", "snps,dw-apb-uart";
> >>  			reg =3D <0x0 0xff9f0000 0x0 0x100>;
> >> @@ -264,5 +276,75 @@ saradc: adc@ffae0000 {
> >>  			#io-channel-cells =3D <1>;
> >>  			status =3D "disabled";
> >>  		};
> >> +
> >> +		pinctrl: pinctrl {
> >> +			compatible =3D "rockchip,rk3528-pinctrl";
> >> +			rockchip,grf =3D <&ioc_grf>;
> >> +			#address-cells =3D <2>;
> >> +			#size-cells =3D <2>;
> >> +			ranges;
> >=20
> > I doubt whether the pincontroller should be placed under simple-bus:
> > without a reg property, it doesn't look like a MMIO device.
> >=20
> > Actually it is, although all the registers stay in the ioc grf. Maybe
> > it should be considered as child of the grf.
>=20
> This follows how pinctrl was added for RK3576 and what is proposed for
> RK3562 [2]. I have too little knowledge to know if this needs to change
> or if this should follow similar SoCs.
>=20
> [2] https://lore.kernel.org/r/20250227111913.2344207-15-kever.yang@rock-c=
hips.com

The reg address shouldn't matter here I think.

The "soc"-bus describes the elements contained in the soc (surrounding the
cpu cores) and the pinctrl controller definitly is part of the soc itself.

So when looking at the scope, it does belong there and also the
 gpio-controller elements do have mmio addresses :-)


Heiko



