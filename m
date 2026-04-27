Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A6AFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=333EQ5bhO0fiPprY5W+7dmdDUISQgxlb4XBMWTWf1m8=; b=gl8mjLN2GHwDoPdE4mc3839MhR
	qnIkzItwsK9LTH7UziY9Od+oop/2NSmIGVWMPALFNxumf/fwv2UGf4cDL0PRPsNvWq8tMp0Jap0Jj
	XGiFZBN/+h9piRHje0mkxtTQ2shdzM1DoWCdAAF87Y1R/OLvpwK9pAeADGi5eo4U4evDWBj7eCRqP
	yp59BoTP3rnTqqvIycOSJazM1+jqQ1g0uIQprlxiodADkV0MGSOP+uKypwKnSXcM5LRSJlr9v1+Nd
	f35v5Lo/T2wCym5HZ3bevJiGYrCHO+D+azCKinjkGVKqkk38TaZGIa6YrjIIvUluwYzdo52+jzehu
	bDLNrJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL2B-0000000Gu8F-3cfy;
	Mon, 27 Apr 2026 12:25:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL29-0000000Gu7Z-2kAt;
	Mon, 27 Apr 2026 12:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=333EQ5bhO0fiPprY5W+7dmdDUISQgxlb4XBMWTWf1m8=; b=tJP4z/UUPvD4UlrBsuvfNDoHl1
	lnd9XxfkZ9/k7Q1jEt3qnr97Ju8L2hZWMCqwqm5clCWWyXa0Yt+75weS0s4u+VhV4KQ9/kKO8aNnH
	8n0j+UqFH9arwRD0QkRtkv7VvuQy7/JZNA1byei+XKLHqyX3SsyWrpYTiMfSXY5k2rQnf8b3Lpi9J
	w73mwCzLIio74WloxRpy1ShWqeUgEGqzTX36VqhhloA1PZNaiJekSlR8UKjL11bz03AVIfEeavbsJ
	DzrHdOvW9qhEwC4aZHe85TODVRtwSNyZot6t8/jO14hwKhmUKo92tdo/Sa7FMCCKoJPMpr0BIlQzW
	ZUGZ2RBg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Gray Huang <gray.huang@wesion.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, Gray Huang <gray.huang@wesion.com>
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Add AP6275P wireless support for Khadas
 Edge 2L
Date: Mon, 27 Apr 2026 14:25:51 +0200
Message-ID: <4059489.Mh6RI2rZIc@phil>
In-Reply-To: <20260325054614.1497147-3-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
 <20260325054614.1497147-3-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052553_744598_EFFB68D0 
X-CRM114-Status: GOOD (  15.96  )
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

Am Mittwoch, 25. M=C3=A4rz 2026, 06:46:10 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Gray Huang:
> The Khadas Edge 2L board uses the Ampak AP6275P (BCM43752) PCIe
> Wi-Fi 6 module.
>=20
> Enable the pcie0 controller and add the Wi-Fi module as its child
> node. Additionally, enable the HYM8563 RTC to provide the 32.768kHz
> LPO clock required by the Wi-Fi module, along with the necessary
> CombPHY and fixed regulator.
>=20
> Signed-off-by: Gray Huang <gray.huang@wesion.com>

Please make this 2 patches:
=2D add the rtc
=2D add the wifi using the rtc

> ---
>  .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 71 ++++++++++++++++++-
>  1 file changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arc=
h/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> index 5781deae00d9..09cb0f0d6dcf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
> @@ -47,7 +47,19 @@ vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
> -
> +	vcc_wifi_reg_on: regulator-wifi-reg-on {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&wifi_reg_on>;
> +		pinctrl-names =3D "default";
> +		regulator-name =3D "wifi_reg_on";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		vin-supply =3D <&vcc_1v8_s3>;
> +	};
>  };
> =20
>  &cpu_l0 {
> @@ -431,6 +443,63 @@ regulator-state-mem {
>  	};
>  };
> =20
> +&combphy0_ps {
> +	status =3D "okay";
> +};

also please sort also phandles alphabetically, i.e. pcie2 between
c-something and i2c is the wrong place :-)


Heiko

> +
> +&pcie0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_rst>;




