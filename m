Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DF105A591
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5fSkpm82zOxya1RopIR/Lxk9itoH32e4XGykJ9nNBU=; b=pA9MtMuK0GrWPbpwt776croLKU
	3viKiEH+TNBdwDx0jgtMl9iWu+1Z7q7StIs9MiiTbZrjIpWwJbXdfb2Ttq79Ejnxhr9hfvHLRI3o4
	TqKU/iMKeZxF2SPFni7Kymtg7FvBSRiIcb0Kx2ScwFMTg2UocKlbwEhsiiQ4isHER10UrySxKuuwC
	uf0wPYxIHcRnZp/nFrc4/1pZTV6eLsyjih4kN9aHqSQxyWTn8ncI/pvCHBLnJUtPwHUY3P3/Qdg5s
	DZewe21DQW92ZI9AUTGdDKnuVKFB/whHtg+u3cgyuHoCn+eyN1jBIYhjeWzaLALamJVoJS6eJgceR
	f6PNo7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ewx-0000000E1I5-3yj1;
	Thu, 12 Mar 2026 12:15:35 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ewu-0000000E1Gu-41iT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=F5fSkpm82zOxya1RopIR/Lxk9itoH32e4XGykJ9nNBU=; b=ADja2E23BvN1IsNMuK+b1rOfWe
	U3myHXKU350xw6XoULuyeIPxUljUaDXQAY+Oe3qMcUvlITYRXS7q3IHkAdYuv8OZE9rgoOlNOylfA
	K9VfONJOWVdLRdhf9H7+e6QdSkypjmA1eZgk2E+RTLwzuEuGzoQttVFO52bIeUMPCgVRaVVgF90sg
	tCrnG6VUG1rEBRWg3SZ8lytpmmtr/qxSgczZuY1vlFTXOUxlztEDOrHScovzR7yhLEMF8BsFM65KP
	36A+l/WvlEZ3wKjPbj4+ViikGg5uet4jGiZ1TPd/2N5HDmaJRtxlWNvGXRyV/4ZR+qgfnoGcuPry1
	CrjuJ3kA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ewq-0009rx-1S;
	Thu, 12 Mar 2026 13:15:28 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ewp-000Ll7-2g;
	Thu, 12 Mar 2026 13:15:27 +0100
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
Subject: Re: [PATCH 08/12] arm64: dts: imx8mm: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:15:26 +0100
Message-ID: <10169374.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-8-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-8-ea1cc09fba84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_051533_145970_38A82F67 
X-CRM114-Status: GOOD (  12.68  )
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

Am Mittwoch, 11. M=E4rz 2026, 17:08:04 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi  | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi               | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts        | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts   | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi     | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts      | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts      | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts      | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts      | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi            | 2 +-
>  17 files changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b=
/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> index ea1d5b9c6bae..5642139ebaec 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> @@ -301,7 +301,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 21 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 21 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk_gated>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> index 472c584fb3bd..6a874f3ec22a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> @@ -919,7 +919,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio1 5 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 5 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 0>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mm-evk.dtsi
> index 8be44eaf4e1e..31052ca1971e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -533,7 +533,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 21 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 21 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
> index 299752aa8277..7eca9127bb9e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
> @@ -209,7 +209,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio5 21 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 21 GPIO_ACTIVE_LOW>;
>  	fsl,max-link-speed =3D <1>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>, <&clk IMX8MM_CLK_PCIE1=
_CTRL>;
>  	assigned-clock-rates =3D <10000000>, <250000000>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts b/arch/=
arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
> index 370558a8ba46..e5b8415dbe0f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
> @@ -137,7 +137,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio3 20 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 20 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts =
b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
> index 6043e7d16306..0165ae04c6ae 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
> @@ -205,7 +205,7 @@ &pcie0 {
>  	assigned-clock-rates =3D <10000000>, <250000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio4 9 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 9 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/a=
rch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
> index 2ecc8b3c67da..a5f3dfe06a4a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
> @@ -182,7 +182,7 @@ &pcie0 {
>  	assigned-clock-rates =3D <10000000>, <100000000>, <250000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio3 22 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 22 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/=
arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
> index 8dcc5cbcb8f6..ce785b103a57 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
> @@ -90,7 +90,7 @@ &pcie_phy {
> =20
>  /* PCIe slot on X36 */
>  &pcie0 {
> -	reset-gpio =3D <&expander0 14 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&expander0 14 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 3>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
> index 320806d3d073..bb441fd4aa23 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
> @@ -122,7 +122,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
> index 266038fbbef9..184fdfb26cd5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
> @@ -147,7 +147,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> index 2aa6c1090fc7..1e84c365b2cf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> @@ -167,7 +167,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> index 53004c4a13aa..e0982b4cb663 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
> @@ -152,7 +152,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> index 272c2b223d16..a31bd864c022 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
> @@ -726,7 +726,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio5 2 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 2 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> index 468c7e993c52..4c839dfa3ce0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
> @@ -626,7 +626,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio4 5 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 5 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
> index 636daa3d6ca2..ea67654c9ded 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
> @@ -559,7 +559,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> index 99572961d9e1..7028d028657a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
> @@ -623,7 +623,7 @@ &pcie_phy {
>  &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
> -	reset-gpio =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
>  	clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
>  		 <&clk IMX8MM_CLK_PCIE1_AUX>;
>  	assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8mm-verdin.dtsi
> index 1594ce9182a5..3b656f8a81b6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -672,7 +672,7 @@ &pcie0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
>  	/* PCIE_1_RESET# (SODIMM 244) */
> -	reset-gpio =3D <&gpio3 19 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 19 GPIO_ACTIVE_LOW>;
>  };
> =20
>  &pcie_phy {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



