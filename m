Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B1BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7hIS9x+Ai7jdbN28NdwqGzklhKBW97oOJ4MjLMzD+Y=; b=pKuKTo33NTVYPjl6trtCgZxMIR
	y553gzieDB9SxuRVFJy//lOhXUI9F+8Mt92rEoVExYZONSb5rhVn8p34mDSBbM1RoE4pLw9aS6r8l
	Tbl8olQHvMQT9ekeUEHz42d6jzSwGSMos/IrKzrC8PMf06lfdlfVqjpUWgdIOm8OWbcO3JBmEqFZ+
	pYYYGZpCSuyDYBWB+19LDksA3eORQ02UH8XtOzc6jIBmk7nb841Z1JwWtE3n1Lm4DRRju/C/ZcAKw
	SXXbzZV2NQeLCLDcOfosKxesXV1RhaTWb1ERABb16K47XbvHvS+L7h0aQFmHaQl+oebJvPq/oaGQA
	bMA5XS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmH1e-0000000BbeH-0K3N;
	Sun, 23 Feb 2025 18:48:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmH0A-0000000Bbat-2iAE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 18:46:56 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tmGzp-0000h2-Hx; Sun, 23 Feb 2025 19:46:33 +0100
Message-ID: <7ccf5c8261a1d899e9fc9f1afc3b85952c021de9.camel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to
 overdrive rate
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patchwork-lst@pengutronix.de
Date: Sun, 23 Feb 2025 19:46:31 +0100
In-Reply-To: <Z7rLWJ52aUqGkFiY@dragon>
References: <20250204182737.3361431-1-l.stach@pengutronix.de>
	 <Z7rLWJ52aUqGkFiY@dragon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_104654_702779_9AAFF260 
X-CRM114-Status: GOOD (  23.42  )
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

Hi Shawn,

Am Sonntag, dem 23.02.2025 um 15:16 +0800 schrieb Shawn Guo:
> On Tue, Feb 04, 2025 at 07:27:37PM +0100, Lucas Stach wrote:
> > A lot of other clocks on the i.MX8MP, including the DRAM set up by the
> > bootloader are already running at overdrive clock rates. While this is =
a
> > deviation from the configuration of other i.MX8M* family SoCs, overdriv=
e
> > is the default for most i.MX8MP boards and only some special purpose
> > boards will choose to run the SoC at nominal drive rates.
>=20
> Are any of these special purpose boards in upstream?  If so, does this
> change have any impact on them?
>=20
I'm pretty sure that none of the boards upstream are designed to run at
the nominal drive voltages right now. imx8mp-skov is one example of a
board that's designed to run at nominal voltages, but that is only on
the way to upstream now and Ahmad is aware of this patch and will
adjust the nominal drive DT as needed.

Regards,
Lucas

> Shawn
>=20
> > Up the GPU and
> > NPU clock rates to their overdrive level to be consistent with other
> > clocks set up in the dtsi.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index e0d3b8cba221..aeaa6a5c2f56 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -816,12 +816,12 @@ pgc_mlmix: power-domain@4 {
> >  						assigned-clocks =3D <&clk IMX8MP_CLK_ML_CORE>,
> >  								  <&clk IMX8MP_CLK_ML_AXI>,
> >  								  <&clk IMX8MP_CLK_ML_AHB>;
> > -						assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
> > +						assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> >  									 <&clk IMX8MP_SYS_PLL1_800M>,
> >  									 <&clk IMX8MP_SYS_PLL1_800M>;
> > -						assigned-clock-rates =3D <800000000>,
> > +						assigned-clock-rates =3D <1000000000>,
> >  								       <800000000>,
> > -								       <300000000>;
> > +								       <400000000>;
> >  					};
> > =20
> >  					pgc_audio: power-domain@5 {
> > @@ -2232,9 +2232,9 @@ gpu3d: gpu@38000000 {
> >  			clock-names =3D "core", "shader", "bus", "reg";
> >  			assigned-clocks =3D <&clk IMX8MP_CLK_GPU3D_CORE>,
> >  					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
> > -			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
> > -						 <&clk IMX8MP_SYS_PLL1_800M>;
> > -			assigned-clock-rates =3D <800000000>, <800000000>;
> > +			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> > +						 <&clk IMX8MP_SYS_PLL2_1000M>;
> > +			assigned-clock-rates =3D <1000000000>, <1000000000>;
> >  			power-domains =3D <&pgc_gpu3d>;
> >  		};
> > =20
> > @@ -2247,8 +2247,8 @@ gpu2d: gpu@38008000 {
> >  				 <&clk IMX8MP_CLK_GPU_AHB>;
> >  			clock-names =3D "core", "bus", "reg";
> >  			assigned-clocks =3D <&clk IMX8MP_CLK_GPU2D_CORE>;
> > -			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>;
> > -			assigned-clock-rates =3D <800000000>;
> > +			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>;
> > +			assigned-clock-rates =3D <1000000000>;
> >  			power-domains =3D <&pgc_gpu2d>;
> >  		};
> > =20
> >=20
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> > --=20
> > 2.39.5
> >=20
>=20


