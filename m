Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF9F105A594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL3Jsg1Kcl2JT56d/AZo0uTATM276sQcJqfKBYcoHw0=; b=WIdArBLatp+wrxZIYQnJq44seL
	7JJJj5vhi9ceecjGGQ4EGZqUZArO+LH9UvgVVdqH7HD8sWH5fW1/CAXITe5SkNv2NDFaQ8It5vhXR
	oXNOlNfWUKZNizWDas7c6JEPJntWrFgkR4lYoIw8G9YrtNov84ixB+W35NqISs+T4/HD99oFXQ0ev
	RuZtgmRQOCVouoazkLH99uGwyB2iDQnHu4GQzDR8Tzl8WExMTK2dUsKq05U+S849IEu0tq/0tHqWc
	zs/Iv26LARhrt2U8CBJIZpfKpVf3gStZ/mN5Q+0v4vCUycdawD6YKDuzeas/MQ7M1kKYVb4jnkBBi
	t1FfNtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0exO-0000000E1Pu-3Gkg;
	Thu, 12 Mar 2026 12:16:02 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0exK-0000000E1Of-1t4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=nL3Jsg1Kcl2JT56d/AZo0uTATM276sQcJqfKBYcoHw0=; b=ZMsKOsdv5anD+Fofc1NpW131No
	9lrMTrNxHlpG4pZBHESqAoIH9cidf6Bl+lg8Dsl4uu4xY5yQj9gLKMAIMWOBT0py8jRKl2Xd77OSm
	C0XULe8XwSMAvdHAZ5bT93nDHnQQpkbLRJ6a2wSsK7yozD5eOOPiEQd5IcnTJzgHYP57Tyh/DyO5/
	nSSy0QUvcmc6V40zy80EhvzL7uiP4paIivWl7OvFBS4O7asJzUJPXdHKUqelE3ttVirxBjAiOkw1g
	d3rtTHE265nJBwyEkH8ggoLCgKp2EtkWuLCsUaBxPoyVvPBJ/tex78IL+PQWtWMXGzShSuarFwKQE
	xNhmcNkQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0exG-0009ww-0t;
	Thu, 12 Mar 2026 13:15:54 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0exF-000Oxj-2C;
	Thu, 12 Mar 2026 13:15:53 +0100
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
Subject: Re: [PATCH 10/12] arm64: dts: imx8mq: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:15:52 +0100
Message-ID: <3858513.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-10-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-10-ea1cc09fba84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_051558_491406_A9F99834 
X-CRM114-Status: GOOD (  13.77  )
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

Am Mittwoch, 11. M=E4rz 2026, 17:08:06 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts                | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts        | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi         | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mq-evk.dts
> index d48f901487d4..54826420740c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -369,7 +369,7 @@ mipi_dsi_out: endpoint {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio5 28 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 28 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  		 <&pcie0_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
> @@ -392,7 +392,7 @@ &pcie0_ep {
>  &pcie1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
> -	reset-gpio =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  		 <&pcie0_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts =
b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
> index d8cf1f27c3ec..2296ff065467 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts
> @@ -243,7 +243,7 @@ &i2c3 {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  		 <&pcie0_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/=
arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> index 3ae3824be027..09f2fb1ad57b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
> @@ -195,7 +195,7 @@ mipi_dsi_out: endpoint {
>  &pcie1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
> -	reset-gpio =3D <&gpio3 23 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 23 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  		 <&pcie1_refclk>,
>  		 <&clk IMX8MQ_CLK_PCIE2_PHY>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/ar=
ch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> index 0165f3a25985..aa54182def4f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> @@ -93,7 +93,7 @@ &led2 {
> =20
>  /* PCIe slot on X36 */
>  &pcie0 {
> -	reset-gpio =3D <&expander0 14 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&expander0 14 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  		 <&pcieclk 3>,
>  		 <&pcieclk 2>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> index c7bbba45f368..f3d0ebe98d5e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> @@ -547,7 +547,7 @@ &usb_dwc3_1 {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 3 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE1_ROOT>,
>  	         <&pcie0_refclk>,
>  	         <&clk IMX8MQ_CLK_PCIE1_PHY>,
> @@ -559,7 +559,7 @@ &pcie0 {
>  &pcie1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
> -	reset-gpio =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  	         <&pcie1_refclk>,
>  	         <&clk IMX8MQ_CLK_PCIE2_PHY>,
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



