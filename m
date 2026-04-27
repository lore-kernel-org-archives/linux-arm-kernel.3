Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BC2FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJKIc0zAxeYT5fXYQZbODNvkxb2EkocuhVXOnLkXtms=; b=BUDVAYEvCPO5HJvUfQdeI17hun
	yappyUBwhqrLwGRmmCmy7V+8IkSpwvXNnLfex5tdmcBGOX7VmJeCFW6SYqYcWSntxSupHfR1VwV7+
	teX2JMS8QG2QViHhCNsG0rr35C8P9AYpsPROJr3o4k2ii6qr+VqPJV6VGNIWi+ZJSAJur0bP5zXqE
	aRwjV2Rj3MhfEFG0T2KHNWVfJ2BWkvjIi4hU1m9hPVuR8+BU+3+7KGM1pp+d+61OQ3q7FVuZ1wDbe
	U6gJXI0iOEqn90vVJwT1R/ebHvis+PTYJvr2vqWrJFIW4ZPMwV4WuQQ1oplMB7Av2meDX8Tnas/fu
	rxdQAPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL3L-0000000GuQB-2BI6;
	Mon, 27 Apr 2026 12:27:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL3J-0000000GuPZ-10zH;
	Mon, 27 Apr 2026 12:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VJKIc0zAxeYT5fXYQZbODNvkxb2EkocuhVXOnLkXtms=; b=lzJFGkIw60RjRCW3TwobbaH5Fj
	249d9pmx3QvUnfKLmrRWM6f6Bzx81CeOKPV63v/pPf4fFaD3MB1rLQ5veRg5oSEJENVADDVl2HBEV
	tmahgYfUf2pnlKCqW3SNTOWyu7FbrWpA7ImV7qYH/3qKSdLZ4dvcZYkKWOUXcoe9WSiYsS93YM/pt
	G6MsqMJlz9X7h3fMECBI6QKS78dnwcTXG0pUqZmpeK/I6dBETZ9qOTBIQ4W9WyXfAm1J55dk1FqB4
	0l2OTFifx/b3hlqu6VV32gDpdobLvJYuW0H1jRns8SCrl6gy3Ek25zpVGBWgVgLaG7y6YEXSwsdhz
	sRdqOfpw==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Gray Huang <gray.huang@wesion.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, Gray Huang <gray.huang@wesion.com>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
Date: Mon, 27 Apr 2026 14:27:02 +0200
Message-ID: <5673086.MHq7AAxBmi@phil>
In-Reply-To: <20260325054614.1497147-6-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-6-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052705_280044_966128FE 
X-CRM114-Status: GOOD (  12.48  )
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

Am Mittwoch, 25. M=C3=A4rz 2026, 06:46:13 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Gray Huang:
> The Khadas Edge 2L board provides one USB 3.0 Host port and one
> USB 2.0 port (connected via an internal hub). Enable the
> corresponding DWC3 controllers and PHYs.
>=20
> Signed-off-by: Gray Huang <gray.huang@wesion.com>
> ---
>  .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 003342fd69a7..8ecd00f6645d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -30,6 +30,29 @@ hdmi_con_in: endpoint {
>  		};
>  	};
> =20
> +	vcc5v0_device: regulator-vcc5v0-device {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_device";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		enable-active-high;
> +		gpio =3D <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
> +		vin-supply =3D <&vcc5v0_device>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usb_host_pwren>;
> +	};
> +
>  	vcc_sys: regulator-vcc5v0-sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sys";
> @@ -531,6 +554,12 @@ pcie0_rst: pcie0-rst {
>  		};
>  	};
> =20
> +	usb {
> +		usb_host_pwren: usb-host-pwren {
> +			rockchip,pins =3D <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	wifi {
>  		wifi_reg_on: wifi-reg-on {
>  			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -542,6 +571,24 @@ wifi_wake_host: wifi-wake-host {
>  	};
>  };
> =20
> +&usb_drd1_dwc3 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&u2phy1 {
> +	status =3D "okay";
> +};
> +
> +&u2phy1_otg {
> +	phy-supply =3D <&vcc5v0_host>;
> +	status =3D "okay";
> +};
> +
> +&combphy1_psu {
> +	status =3D "okay";
> +};

same here, u-something and c-something between pinctrl and sdhci
is the wrong place.

Heko

> +
>  &sdhci {
>  	bus-width =3D <8>;
>  	no-sdio;
>=20





