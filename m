Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A15C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48PALNf6FaW6jxdpb8NdGbAhPOU2X7FvJyVVO35TFGI=; b=2/Mo6m4GdA4Q96Oyo8Ut3Ak1OI
	dK6PQC7P1rrJI3T337SewEGUZXC6Evb9Jr1R+zLZqp20SOI3B440fgF8EOcVTntoalIOmjNPZlWwY
	wf9RTnefG0h1fTB2LThd1I/NJiJqYnc+hmm2LnEhkSt7dE+Yh8Cd8bBBvZ3EcJeKmEGK5omQ1sDRR
	lSellKWgLTHzj+xO8TR6vbEP2ljF8gucrHNUe2h0Xz6w35a4vSbPbx80F6EgPDrJ5FydGBoJsRWhK
	w0+/wyc9QvaC+U21P2RP26/qCL7exUYObkbwTTUEL5U3ZDC/okyOKrpKRWfxucxQXqr+2GxnrEp82
	QQ8fG77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlUQ-0000000GOQv-32O3;
	Mon, 03 Aug 2026 05:45:30 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlUO-0000000GOQD-2Bwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=48PALNf6FaW6jxdpb8NdGbAhPOU2X7FvJyVVO35TFGI=; b=ma5weV+VzGltGQtH8g6HPzdtIU
	fl58hisYeqVrPHoJYMrqjnjo66NGlNh98Wy5nKa/9kDiFFRFSDxMkFckP9Fi1soHgsK+YJd7Z8sGK
	OCejII58/JXe9l23vbHd4FKU4fhDYvvFe18P8cGDdzcc3pvltXkzms/ex+8Jg8yY5D1/9YxsmChHn
	aCUs50Dl6WHif3ORBvgsEUOqis83xbj/Qjs8JBnYbk2LPR4c2yUs/HuK3G06MkqfjzvpwLnJOM1AW
	Dlb13O8bNJv6W69jil8Kf38SrI+EJNmlt4JYkmxZh+Lju/oxSihsN0PClmfTZPQmXKjGeT0qijVHg
	IYgbyNnw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wqlUJ-0006BS-1X;
	Mon, 03 Aug 2026 07:45:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wqlUI-000G1r-0p;
	Mon, 03 Aug 2026 07:45:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ARM: dts: nxp: Correct white-space style
Date: Mon, 03 Aug 2026 07:45:21 +0200
Message-ID: <6019329.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28080/Sun Aug  2 08:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_224528_718380_7B58E8E4 
X-CRM114-Status: GOOD (  13.33  )
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

Am Samstag, 1. August 2026, 23:04:21 CEST schrieb Krzysztof Kozlowski:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/imx/e60k02.dtsi                |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/e70k02.dtsi                |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts           |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts      |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx7s-warp.dts             |  2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a.dtsi                | 10 +++++-----
>  9 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nx=
p/imx/e60k02.dtsi
> index aac7b9ef7627..ed59b27834a6 100644
> --- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
> @@ -240,13 +240,13 @@ regulator-state-mem {
>  			};
> =20
>  			/* IR_3V3 */
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -259,7 +259,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -310,7 +310,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-boot-on;
>  			};
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nx=
p/imx/e70k02.dtsi
> index 3bb11c5a6353..dc7ff108aa85 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -243,13 +243,13 @@ regulator-state-mem {
>  				};
>  			};
> =20
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -262,7 +262,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -311,7 +311,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-boot-on;
>  			};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts b/arch/arm/boot/d=
ts/nxp/imx/imx6dl-mamoj.dts
> index ec5a9bf40677..30275319902e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
> @@ -151,7 +151,7 @@ reg_usb_host: regulator-usb-vbus {
>  		enable-active-high;
>  	};
> =20
> -	reg_wl18xx_vmmc:  regulator-wl18xx-vmcc {
> +	reg_wl18xx_vmmc: regulator-wl18xx-vmcc {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vwl1807";
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts b/arch/arm/boo=
t/dts/nxp/imx/imx6q-bosch-acc.dts
> index 929def2bb35e..20b6cc74f622 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
> @@ -177,7 +177,7 @@ reg_usb_h2_vbus: regulator-usb-h2-vbus {
>  		regulator-name =3D "usb_h2_vbus";
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&reg_5p0> ;
> +		vin-supply =3D <&reg_5p0>;
>  		regulator-always-on;
>  	};
> =20
> @@ -207,7 +207,7 @@ reg_dac: regulator-dac {
>  		regulator-name =3D "vref_dac";
>  		regulator-min-microvolt =3D <20000>;
>  		regulator-max-microvolt =3D <20000>;
> -		vin-supply =3D <&reg_5p0> ;
> +		vin-supply =3D <&reg_5p0>;
>  		regulator-boot-on;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6sl-kobo-aura2.dts
> index 657d0f1b6115..47b05207574e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
> @@ -211,14 +211,14 @@ regulator-state-mem {
>  			};
> =20
>  			/* IR_3V3 */
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-always-on;
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -231,7 +231,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -282,7 +282,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-always-on;
>  				regulator-boot-on;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/=
arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
> index 4c655579f43e..64a74719c216 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
> @@ -276,13 +276,13 @@ regulator-state-mem {
>  			};
> =20
>  			/* IR_3V3 */
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -295,7 +295,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -346,7 +346,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-always-on;
>  				regulator-boot-on;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dt=
s/nxp/imx/imx6sll-evk.dts
> index 814401486792..d20d2735cab5 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
> @@ -633,7 +633,7 @@ MX6SLL_PAD_PWM1__PWM1_OUT   0x110b0
>  		>;
>  	};
> =20
> -	pinctrl_wdog1: wdog1grp	{
> +	pinctrl_wdog1: wdog1grp {
>  		fsl,pins =3D <
>  			MX6SLL_PAD_WDOG_B__WDOG1_B   0x170b0
>  		>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts=
/nxp/imx/imx7s-warp.dts
> index 25f38acc5350..b1989013c1a4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
> @@ -272,7 +272,7 @@ &uart1 {
>  	status =3D "okay";
>  };
> =20
> -&uart3  {
> +&uart3 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_uart3>;
>  	assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nx=
p/ls/ls1021a.dtsi
> index e0b9ea6dd510..af518fc08809 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
> @@ -721,7 +721,7 @@ queue-group@2d10000 {
>  					<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> =20
> -			queue-group@2d14000  {
> +			queue-group@2d14000 {
>  				reg =3D <0x0 0x2d14000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> @@ -740,14 +740,14 @@ enet1: ethernet@2d50000 {
>  			ranges;
>  			dma-coherent;
> =20
> -			queue-group@2d50000  {
> +			queue-group@2d50000 {
>  				reg =3D <0x0 0x2d50000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> =20
> -			queue-group@2d54000  {
> +			queue-group@2d54000 {
>  				reg =3D <0x0 0x2d54000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> @@ -766,14 +766,14 @@ enet2: ethernet@2d90000 {
>  			ranges;
>  			dma-coherent;
> =20
> -			queue-group@2d90000  {
> +			queue-group@2d90000 {
>  				reg =3D <0x0 0x2d90000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> =20
> -			queue-group@2d94000  {
> +			queue-group@2d94000 {
>  				reg =3D <0x0 0x2d94000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



