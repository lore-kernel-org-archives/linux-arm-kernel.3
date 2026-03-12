Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1847105A594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1IXt+dIUnvl8ZLP4xRh3dMYxckfctcwte+Py2wZ3iQ=; b=DEkXoZ2zAw6utojVAoj4Wi6ADr
	+7d/xeOPpjKgpecwovIdJDVN5wWJNEezQJ3XsR/sdSyfS2WjH3f9jJtOhLl1Ps6wusllIGUc2Ock5
	M+ijB28lwHLmrxTVQkV13Ig+UIOpG0Aov9/KimSkheFjfFRltux0nchx4L+JvXjFi4s19atPDCw5+
	Hur0jFRjAiykUWKKBeQNKP0gKDjZGc3OSr3HgqwTMcfLigZgpXHFw1AC6hpjZcJEPApD6XxurDHbK
	lKNXtXw6CLTM3YM55gtu3hdO0/z90/aIPKR3WftbVj9FjXFTgF6nhvn5UaMEd4u9unjX6JnokVm83
	7ePTGFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ewK-0000000E14Q-2BqS;
	Thu, 12 Mar 2026 12:14:56 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ewH-0000000E12R-0el1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=I1IXt+dIUnvl8ZLP4xRh3dMYxckfctcwte+Py2wZ3iQ=; b=MwkBwEKJX406TbFR89kTekha7n
	8e5QWlw5zVBXkzi5ddZuZQsrByqBg/K5CpF/rAWIMv2rKSbBkt2/QGb5sRs2lBvqfPQzKqFDele7X
	RJssPmH6dpFCBiIpWd6eMFTPLBqvfzrAAhaWhsnbRVES0b1ePu+2hjS6MUOc9mRnrmbAYhYDlS76G
	WGmtKv1qQ7+CzQw1FT6lqcuIV5QS8hFBG0kNd2bSWCQWUJ+pMEebqXcSsge7Jdf1bY2J4/KJLwaxV
	8KfR/kfX7MT3rzhinq/V1HmWl2EyEdyosDn0K0Eux5Uwhda6d3YcnxM+MRjjSdWWECX04tI02Fjm5
	JrE1z38w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ewC-0009i3-2k;
	Thu, 12 Mar 2026 13:14:48 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ewC-000FKY-0r;
	Thu, 12 Mar 2026 13:14:48 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:14:47 +0100
Message-ID: <4916204.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_051453_673356_D199E03D 
X-CRM114-Status: GOOD (  13.00  )
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

Am Mittwoch, 11. M=E4rz 2026, 17:08:03 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
>  arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> index 6fc82b5eb58c..6d8a57ff56c2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> @@ -806,7 +806,7 @@ &pciea {
>  	pinctrl-0 =3D <&pinctrl_reset_moci>;
>  	phys =3D <&hsio_phy 0 PHY_TYPE_PCIE 0>;
>  	phy-names =3D "pcie-phy";
> -	reset-gpio =3D <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcie_switch>;
>  };
> =20
> @@ -816,7 +816,7 @@ &pcieb {
>  	pinctrl-0 =3D <&pinctrl_pcieb>, <&pinctrl_wifi>;
>  	phys =3D <&hsio_phy 1 PHY_TYPE_PCIE 1>;
>  	phy-names =3D "pcie-phy";
> -	reset-gpio =3D <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8dxl-evk.dts
> index 5c68d33e19f2..bdd1dbc6b322 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -651,7 +651,7 @@ &pcie0 {
>  	phy-names =3D "pcie-phy";
>  	pinctrl-0 =3D <&pinctrl_pcieb>;
>  	pinctrl-names =3D "default";
> -	reset-gpio =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcieb>;
>  	vpcie3v3aux-supply =3D <&reg_pcieb>;
>  	status =3D "okay";
> @@ -662,7 +662,7 @@ &pcie0_ep {
>  	phy-names =3D "pcie-phy";
>  	pinctrl-0 =3D <&pinctrl_pcieb>;
>  	pinctrl-names =3D "default";
> -	reset-gpio =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcieb>;
>  	status =3D "disabled";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boo=
t/dts/freescale/tqma8xxs.dtsi
> index bfc918f18d01..677a05b38391 100644
> --- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> +++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> @@ -407,7 +407,7 @@ &pcieb {
>  	phy-names =3D "pcie-phy";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcieb>;
> -	reset-gpio =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  };
> =20
>  &sai1 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



