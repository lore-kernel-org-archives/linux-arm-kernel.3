Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C7ED44D71
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaeGzukjSkkdIXrI/sRrKa+8hdtWtX3cTAwGr+R/Sm4=; b=ekvmitXubjpwGSJtg4htUNOIro
	N5MP3INrbymgFExWsocwFFh9vOsoudtdkMLZqoLMmUFH8gkXbTTE7zw1DtxZBkiHhU+UdRTnNnHZd
	BXHShagUH7UUlYD32LM2QhZFKxWU4bQBknB8RQwWt11dGPuSgYBwHwppVRGKiGEOI2uVp5FWJ7JTl
	CLmzCF51XS1h3h9VlEibT2WKbRlwJrnUa26iaB9cO+brQWzu+01+hqCu0jKj/AlRgb+3UL44vTBkv
	yfWzg5zUmRucUghBb5H3zK8cD5gi5AnksnWLKXl5B+0mRCQHp2ku2m4kMXROfGAl+kfbAXljYcGaj
	j2Gm4hZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gXN-00000003Vun-34jj;
	Wed, 06 Nov 2024 13:57:33 +0000
Received: from out-175.mta0.migadu.com ([91.218.175.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gJy-00000003Srg-2iut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:43:44 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1730900620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KaeGzukjSkkdIXrI/sRrKa+8hdtWtX3cTAwGr+R/Sm4=;
	b=SLsnzVlC8dWSFPPdbsnuJcGZmSOiL8iSO7F5qRMO93o6+E5pEPed06GD8EF7pJ8tdipCnP
	cBVI61BME5zB+mvqd3sAA/J/4DSIDAUUB3GqebuDmO4O9YBnau6+006pQKdPu0Z0Hg7F2f
	AvXcqKdvMmFYMGGjlenQMJ2HSZn7lwZfoTqRpwX3VNjQc9aE6YZEiWjhinBgBdo2rmQ7an
	Mp9/Zvr5cVEVVJpntrbhHZwNHhWDkAwpOkGJoYZjxCnrTB0jbVgiMPifjhkkZc79s1Zfws
	zmf3kh6djxbkTomT/+J2m+PKqi46pBCgDVpypjPBqwFmuQcNHshU9Lnai65ABg==
Content-Type: multipart/signed;
 boundary=d325a75fd624665202bd836b8054801c6e1beb170779c0c55314142a3ace;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 06 Nov 2024 14:43:36 +0100
Message-Id: <D5F525WYXDO1.3I92CTU67RVF6@cknow.org>
Cc: <quentin.schulz@cherry.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: add mipi dcphy nodes to
 rk3588
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>
References: <20241106123758.423584-1-heiko@sntech.de>
 <20241106123758.423584-2-heiko@sntech.de>
In-Reply-To: <20241106123758.423584-2-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054342_843462_48A9FCE3 
X-CRM114-Status: GOOD (  15.02  )
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

--d325a75fd624665202bd836b8054801c6e1beb170779c0c55314142a3ace
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 6, 2024 at 1:37 PM CET, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> Add the two MIPI-DC-phy nodes to the RK3588, that will be used by the
> DSI2 controllers and hopefully in some future also for camera input.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 51ba7563f7d0..8c95c56e8097 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -576,6 +576,16 @@ sys_grf: syscon@fd58c000 {
>  		reg =3D <0x0 0xfd58c000 0x0 0x1000>;
>  	};
> =20
> +	mipidcphy0_grf: syscon@fd5e8000 {
> +		compatible =3D "rockchip,rk3588-dcphy-grf", "syscon";
> +		reg =3D <0x0 0xfd5e8000 0x0 0x4000>;
> +	};
> +
> +	mipidcphy1_grf: syscon@fd5ec000 {
> +		compatible =3D "rockchip,rk3588-dcphy-grf", "syscon";
> +		reg =3D <0x0 0xfd5ec000 0x0 0x4000>;
> +	};
> +
>  	vop_grf: syscon@fd5a4000 {
>  		compatible =3D "rockchip,rk3588-vop-grf", "syscon";
>  		reg =3D <0x0 0xfd5a4000 0x0 0x2000>;
> @@ -2878,6 +2888,38 @@ usbdp_phy0: phy@fed80000 {
>  		status =3D "disabled";
>  	};
> =20
> +	mipidcphy0: phy@feda0000 {
> +		compatible =3D "rockchip,rk3588-mipi-dcphy";
> +		reg =3D <0x0 0xfeda0000 0x0 0x10000>;
> +		rockchip,grf =3D <&mipidcphy0_grf>;
> +		clocks =3D <&cru PCLK_MIPI_DCPHY0>,
> +			 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> +		clock-names =3D "pclk", "ref";
> +		resets =3D <&cru SRST_M_MIPI_DCPHY0>,
> +			 <&cru SRST_P_MIPI_DCPHY0>,
> +			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
> +			 <&cru SRST_S_MIPI_DCPHY0>;
> +		reset-names =3D "m_phy", "apb", "grf", "s_phy";
> +		#phy-cells =3D <0>;
> +		status =3D "disabled";
> +	};
> +
> +	mipidcphy1: phy@fedb0000 {
> +		compatible =3D "rockchip,rk3588-mipi-dcphy";
> +		reg =3D <0x0 0xfedb0000 0x0 0x10000>;
> +		rockchip,grf =3D <&mipidcphy1_grf>;
> +		clocks =3D <&cru PCLK_MIPI_DCPHY1>,
> +			 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> +		clock-names =3D "pclk", "ref";
> +		resets =3D <&cru SRST_M_MIPI_DCPHY1>,
> +			 <&cru SRST_P_MIPI_DCPHY1>,
> +			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
> +			 <&cru SRST_S_MIPI_DCPHY1>;
> +		reset-names =3D "m_phy", "apb", "grf", "s_phy";
> +		#phy-cells =3D <0>;
> +		status =3D "disabled";
> +	};

No power-domains property?
RK3588 TRM v1.0 part 1 page 1097 has ALIVE(PD_BUS) for
MIPI_DC_PHY0~MIPI_DC_PHY1

Cheers,
  Diederik
> +
>  	combphy0_ps: phy@fee00000 {
>  		compatible =3D "rockchip,rk3588-naneng-combphy";
>  		reg =3D <0x0 0xfee00000 0x0 0x100>;


--d325a75fd624665202bd836b8054801c6e1beb170779c0c55314142a3ace
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZytyjAAKCRDXblvOeH7b
bn3bAP0a67joM+6d9CLYveao1RDKHB27FIWdlPfAWU00XESHxQD9EqDyGe3+QvqV
XoBO2e1oqQ/iO4szViGc6LynQn/oGgk=
=y9hB
-----END PGP SIGNATURE-----

--d325a75fd624665202bd836b8054801c6e1beb170779c0c55314142a3ace--

