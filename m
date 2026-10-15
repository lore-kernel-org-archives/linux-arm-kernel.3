Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64479CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19Xt6ynQ3lZgWiajCCIQS5nrD0ARL9yYFFtEUFMIEvg=; b=O2l1BeSVuTqf/YzZ6fakS8Ulod
	p6Sev8Itqkpx+NBPawF7k/7CTcqKRA/R3wDHcB4tVX5s5d+b9JIwI14hhzgGFB9bx4oW4SXgYO9iX
	cxdRa2tVMft8mNbHeLcFCdyDvCH3XG0u0U7bd0tX76KHPgLrxdtbQ4sTFb8GlA0AXelUWy7cBMzFi
	URwi6NmtfraLc9E/EJFD1JK/bfvksD2oYd10k25X1NhTS9pYfB25ij1iaZVhOkYCMwfMqeHr3j7iJ
	qP3dn/DgK5T5qGY7MSgHhdCntzJOGkROram0ATOZZotEqF/NzC2xT0JC/9SRpY82mH7xBo3CHcVQe
	qkwUrAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGWg-0000000H6pt-1wBK;
	Thu, 15 Oct 2026 08:09:22 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGWd-0000000H6p1-15xl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=19Xt6ynQ3lZgWiajCCIQS5nrD0ARL9yYFFtEUFMIEvg=; b=Kfv+WYSWgAK7UQBa3Rgk/qmfht
	kl5FF1Cdj0V7Q2N6miwhKRetMw/4ouZteg1M7tOK4GJBoWx0H0EO9J5odJAbOAeAkwKVOOMVOnbX4
	62tEmSWCZ2mox1mGdfZSlNg+lBGeFsCbyDx2mYyG/AiZ9B1kfls14O6CF7TM0tL+WVF/30L9lbyh/
	GXtN73oLX0Wy1S3u08CS8R+7t1Xb81hT2LhONk8KFnr7ANxys9K89njQw9iNehSgI2cYMNHRD41pA
	+R07nmQD1BsVhuIuuuBdqE/HLgg0tY48OIyRLYMQ53IYDNIYP5uOc5hpDNjz3PqHKCHcSN6Z0n2zW
	S1Uf9iHQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGWV-000ERc-1d;
	Thu, 15 Oct 2026 10:09:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGWU-000AW1-2z;
	Thu, 15 Oct 2026 10:09:10 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH v2 3/5] arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
Date: Thu, 15 Oct 2026 10:09:09 +0200
Message-ID: <6836920.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <as-LIGGpmBc1NJYj@SMW015318>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
 <as-LIGGpmBc1NJYj@SMW015318>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28154/Thu Oct 15 08:24:22 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_010919_590070_7195B7F4 
X-CRM114-Status: GOOD (  18.03  )
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

Am Mittwoch, 14. Oktober 2026, 16:01:04 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Frank Li:
> On Wed, Oct 14, 2026 at 09:16:47AM +0200, Alexander Stein wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> >
> > The MIPI-LVDS combo subsystems are peripherals of pixel link MSI
> > bus in i.MX8qxp display controller subsystem.  Add the MIPI-LVDS
> > combo subsystems.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * None
> >
> >  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     |   4 +
> >  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 443 ++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   3 +
> >  3 files changed, 450 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.=
dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > index 647ee3348f494..9916a06669c87 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > @@ -156,10 +156,12 @@ port@1 {
> >
> >  				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
> >  					reg =3D <0>;
> > +					remote-endpoint =3D <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> >  				};
> >
> >  				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> >  					reg =3D <1>;
> > +					remote-endpoint =3D <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> >  				};
> >  			};
> >
> > @@ -211,10 +213,12 @@ port@1 {
> >
> >  				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
> >  					reg =3D <0>;
> > +					remote-endpoint =3D <&mipi_lvds_1_pxl2dpi_dc0_pixel_link1>;
> >  				};
> >
> >  				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
> >  					reg =3D <1>;
> > +					remote-endpoint =3D <&mipi_lvds_0_pxl2dpi_dc0_pixel_link1>;
> >  				};
> >  			};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/=
arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> > new file mode 100644
> > index 0000000000000..67f5392cfc803
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> > @@ -0,0 +1,443 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +#include <dt-bindings/clock/imx8-lpcg.h>
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +/ {
> > +	mipi_lvds_0_ipg_clk: clock-mipi-lvds0-ipg {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <120000000>;
> > +		clock-output-names =3D "mipi_lvds_0_ipg_clk";
> > +	};
> > +
> > +	mipi_lvds_1_ipg_clk: clock-mipi-lvds1-ipg {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <120000000>;
> > +		clock-output-names =3D "mipi_lvds_1_ipg_clk";
> > +	};
> > +};
> > +
> > +&dc0_pl_msi_bus {
> > +	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
> > +		compatible =3D "fsl,imx-irqsteer";
> > +		reg =3D <0x56220000 0x1000>;
> > +		interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-controller;
> > +		interrupt-parent =3D <&gic>;
> > +		#interrupt-cells =3D <1>;
> > +		clocks =3D <&mipi_lvds_0_lis_lpcg IMX_LPCG_CLK_4>;
> > +		clock-names =3D "ipg";
> > +		fsl,channel =3D <0>;
> > +		fsl,num-irqs =3D <32>;
> > +	};
> > +
> > +	mipi_lvds_0_csr: bus@56221000 {
> > +		compatible =3D "simple-pm-bus", "syscon";
> > +		reg =3D <0x56221000 0x1000>;
> > +		clocks =3D <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> > +		clock-names =3D "ipg";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
>=20
> Does any children nodes have address?

AFAIK the children only use the parent's syscon and SCU, so no direct addre=
ss.

> > +		ranges;
> > +
> > +		mipi_lvds_0_pxl2dpi: pxl2dpi {
> > +			compatible =3D "fsl,imx8qxp-pxl2dpi";
> > +			fsl,sc-resource =3D <IMX_SC_R_MIPI_0>;
> > +			power-domains =3D <&pd IMX_SC_R_MIPI_0>;
> > +			status =3D "disabled";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				port@0 {
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +					reg =3D <0>;
> > +
> > +					mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> > +						reg =3D <0>;
> > +						remote-endpoint =3D <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +
> > +					mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> > +						reg =3D <1>;
> > +						remote-endpoint =3D <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +					reg =3D <1>;
> > +
> > +					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> > +						reg =3D <0>;
> > +						remote-endpoint =3D <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +
> > +					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> > +						reg =3D <1>;
> > +						remote-endpoint =3D <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		mipi_lvds_0_ldb: ldb {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			compatible =3D "fsl,imx8qxp-ldb";
>=20
> compatible should be first property, check others

Right, thanks. Will change.

> > +			clocks =3D <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> > +				 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> > +			clock-names =3D "pixel", "bypass";
> > +			assigned-clocks =3D <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
> > +			assigned-clock-parents =3D <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPA=
SS>;
> > +			power-domains =3D <&pd IMX_SC_R_LVDS_0>;
> > +			status =3D "disabled";
> > +
> > +			channel@0 {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				reg =3D <0>;
>=20
> reg should be first one.

Right, thanks. Will change.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



