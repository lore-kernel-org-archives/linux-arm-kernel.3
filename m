Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A72D609C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyxKs+KHPcd6JCGKDM5nONfpeJupnL+SBPURReFBlX0=; b=CPWCvOMpMvqi9nKSL3lFYkwG2U
	CJkUU/md/HENLl3FvDas1u7nUwMNFmcsmHkIfm0ZMG5KCj6369qI5i/scPopFh1dP0zRqzl7CAkFP
	6dkNZLxadtXTX16bcpZMtkmuGNbCUMElkUzIERXCriM9hLjMjUrUmhoMMx+q22nH/vBTRpXgRQVtK
	7oKHGCzl8r4RQjwX/pg/yVzp5W/qbcwy1DBxyeZcyUKJkUvfAWU+byB0gr4nvxH+Y7NRDoc6KdVKa
	GsO+XfrFCDCPdni+vZMfd59k4LmAaAd8Tm3kdB6X5T14XJfZV9Hjlzgt+ihTIQ8FenHBecm/Q6A5N
	ZUlWJS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEdX-0000000CjeY-2tdI;
	Wed, 27 Nov 2024 09:47:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEcU-0000000CjOo-2SsT;
	Wed, 27 Nov 2024 09:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SyxKs+KHPcd6JCGKDM5nONfpeJupnL+SBPURReFBlX0=; b=o3SkBXnw0CRR3bOAH60oImlOxB
	DDqJSD8yu3c0BzZEooC7g7Y8X0LB4qWYuNRZQL3IiGloekYO/RVVFn6kzGR8ua01nkIH1rsZgeujg
	blf75qx+LuC+vqJoaKwpM6SQAlxol0Tk9KnaD+tT4hs1af5m9TYtlR2wU/5S4Kx58OT3SR4rkFwL2
	MpxyXstlgb9BRD1rbmCH44ygBrNJAFQPQlO5QyneF50/mKhhVZYzxVIbO9nUSRsyQGYRSe9zcmy80
	+/fU6ZcLpmSsTw6y8boBg318e0AXNmwGV7WLJChlrk1Lg/h2yhn2+qPKM2oMKtoqyxu80BSKY3q+I
	pyvyHm7Q==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tGEcT-0007EQ-5U; Wed, 27 Nov 2024 10:46:01 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add overlay for tiger-haikou video-demo
 adapter
Date: Wed, 27 Nov 2024 10:46:00 +0100
Message-ID: <4636112.cEBGB3zze1@diego>
In-Reply-To: <c53b4149-fc8c-4357-a881-de07d6ebf7ac@cherry.de>
References: <20241106123758.423584-1-heiko@sntech.de>
 <20241106123758.423584-4-heiko@sntech.de>
 <c53b4149-fc8c-4357-a881-de07d6ebf7ac@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_014602_627101_2ECD9AB7 
X-CRM114-Status: GOOD (  21.31  )
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

Hi Quentin,

Am Mittwoch, 6. November 2024, 14:18:49 CET schrieb Quentin Schulz:
> On 11/6/24 1:37 PM, Heiko Stuebner wrote:
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index 09423070c992..0c4ee6a767b8 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile

[...]

> > +&dsi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> Shouldn't those be in the SoC dtsi? Is there any world where this would 
> be different per board?

It's more of a we need that here to _compile_ the dtbo, so one gets
to duplicate them, as the dtbo is not compiled _against_ the dtb, hence
dtc does not know about the parent #address-cells value.


> > +	status = "okay";
> > +
> > +	panel@0 {
> > +		compatible = "leadtek,ltk050h3148w";
> > +		reg = <0>;
> > +		backlight = <&backlight>;
> > +		iovcc-supply = <&vcc1v8_video>;
> > +		reset-gpios = <&pca9670 0 GPIO_ACTIVE_LOW>;
> > +		vci-supply = <&vcc2v8_video>;
> > +
> > +		port {
> > +			mipi_panel_in: endpoint {
> > +				remote-endpoint = <&dsi0_out_panel>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dsi0_in {
> > +	dsi0_in_vp3: endpoint {
> > +		remote-endpoint = <&vp3_out_dsi0>;
> > +	};
> > +};
> > +
> > +&dsi0_out {
> > +	dsi0_out_panel: endpoint {
> > +		remote-endpoint = <&mipi_panel_in>;
> > +	};
> > +};
> > +
> > +&i2c6 {
> > +	/* OV5675, GT911, DW9714 are limited to 400KHz */
> > +	clock-frequency = <400000>;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> 
> Mmmm why the address and size cells properties here? They should already 
> be part of the SoC dtsi no?

same as above

> > +&pwm0 {
> > +	pinctrl-0 = <&pwm0m1_pins>;
> > +	pinctrl-names = "default";
> 
> The other two pin muxes for PWM0 are either:
> - the pin used for CAN
> - the pin routed to an internal component (unexposed to Q7) and used as 
> a GPIO
> 
> so please move the pinctrl to the Tiger SoM DTSI.

the pwm0-pinctrl is actually already set in the tiger.dtsi, so
I'll just remove it from here.

> > +	status = "okay";
> > +};
> > +
> > +&vp3 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> 
> Shouldn't those be in the SoC dtsi?

same as dsi and i2c #adress-cells


Heiko



