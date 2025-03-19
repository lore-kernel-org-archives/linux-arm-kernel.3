Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A596C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rw+f9/0oWfJPL5BafdAk8H8AdIxBBtfNNmHXGxv1VA4=; b=qEd01xR1H/FVMIl7xQZEXEkJah
	Tk2QNph6siTJCYPdqKaOvVJSdshJF6Knat8T1SEf1pQ1xaWZJpASSi6GfocRcA+Xv43EbqboueqOy
	79qQ4Lbi00q7EOpLKunXmh7BV+iGxT7XJW1EXzQoafLSV2lShOuyces6Xlry5KFPYgSUajmSMNzv/
	RUuUZccBhlNxtzEu1F5whNevj9sM/XQNCvgrRpmaQrbsuBy4QGJUtOPLGjeioR0ieOp0QPtpIYO10
	Lgf9wZwxql6wgN9WuWxMdf3+uyFkfClPMrLqT4na5XK/UVpuWt/XCS0IEeM4WHdL5HBn0abWFcJON
	sEygQubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3AU-0000000AYcc-1851;
	Wed, 19 Mar 2025 23:49:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv38l-0000000AXfg-30UR;
	Wed, 19 Mar 2025 23:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Rw+f9/0oWfJPL5BafdAk8H8AdIxBBtfNNmHXGxv1VA4=; b=EGRGJb6HMeCSbau9OQWDTncAhJ
	+O9UgyhkLxHvEy0KVDW/TZ/D/E+dfg5Ob3QYk3Qg/LqL2SWkdKV/VUja+GYPrCn/geobH/wM9kmqS
	3d0yUMw3dK9rEihAFBKaSni2xJZYvUkC1l+rBNMk/+YcOyyb8Y+DjAtOqSF9ktdgbIOZ1/HujUhX0
	u3KJmC8dxsNAQIk04ONAsCT87Jh/yfhUJY+QDqez/buP1Z0WF8w5OqD3L9fdt8Y4ymU7pTeR6jKSs
	cC0mJtq+zeyrHykhlgwpGdsGWMmmrIk94WXWcUNnzxm09jYtPHJAP5XbDEClru/9TH58yIPdlMmpc
	sodb0RoQ==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tv38b-0001z5-GP; Thu, 20 Mar 2025 00:47:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Thu, 20 Mar 2025 00:47:52 +0100
Message-ID: <2499436.jE0xQCEvom@phil>
In-Reply-To: <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se>
References: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
 <20250318120003.2340652-2-amadeus@jmu.edu.cn>
 <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_164803_774968_2DCB8F89 
X-CRM114-Status: GOOD (  25.68  )
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

Am Donnerstag, 20. M=C3=A4rz 2025, 00:26:14 MEZ schrieb Jonas Karlman:
> Hi Chukun,
>=20
> On 2025-03-18 13:00, Chukun Pan wrote:
> > Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
> > RK3328, but the driver does not support interrupts yet.
>=20
> The device tree should describe the hardware, not what the driver
> support, so interrupts should probably be included.
>=20
> However, looking closer at TRM for i.e. RK3328, RK3568 and RK3588 it
> look like the following description is not a true description of the
> hardware.
>=20
> Each PWM controller seem to support 4 channels, here (and for older RK
> SoCs) we instead describe each channel and not the controller.

Yep, that is something that did go wrong in the very early days.
And all other Rockchip socs also have the same issue - even back
to the rk3066.

So yes, at some point we should overhaul the thing.

But I think this is more involved, as right now everything is aimed
at the current single-channel status quo.


Heiko


> Maybe something like following would better represent the hardware:
>=20
> 	pwm0: pwm@ffa90000 {
> 		compatible =3D "rockchip,rk3528-pwm";
> 		reg =3D <0x0 0xffa90000 0x0 0x10000>;
> 		clocks =3D <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> 		clock-names =3D "pwm", "pclk";
> 		interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> 	};
>=20
> 	pwm1: pwm@ffa98000 {
> 		compatible =3D "rockchip,rk3528-pwm";
> 		reg =3D <0x0 0xffa98000 0x0 0x10000>;
> 		clocks =3D <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> 		clock-names =3D "pwm", "pclk";
> 		interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> 	};
>=20
> Regards,
> Jonas
>=20
> >=20
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3528.dtsi
> > index 1af0d036cf32..621fc19ac0b3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > @@ -465,6 +465,86 @@ uart7: serial@ffa28000 {
> >  			status =3D "disabled";
> >  		};
> > =20
> > +		pwm0: pwm@ffa90000 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa90000 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm1: pwm@ffa90010 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa90010 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm2: pwm@ffa90020 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa90020 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm3: pwm@ffa90030 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa90030 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm4: pwm@ffa98000 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa98000 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm5: pwm@ffa98010 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa98010 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm6: pwm@ffa98020 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa98020 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pwm7: pwm@ffa98030 {
> > +			compatible =3D "rockchip,rk3528-pwm",
> > +				     "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xffa98030 0x0 0x10>;
> > +			clocks =3D <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> > +			clock-names =3D "pwm", "pclk";
> > +			#pwm-cells =3D <3>;
> > +			status =3D "disabled";
> > +		};
> > +
> >  		saradc: adc@ffae0000 {
> >  			compatible =3D "rockchip,rk3528-saradc";
> >  			reg =3D <0x0 0xffae0000 0x0 0x10000>;
>=20
>=20





