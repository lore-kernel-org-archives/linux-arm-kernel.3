Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A06E95394
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=258RcRsPMpMT2Qz5JVwYK0I4JavHEDB9+KA3oXvdIms=; b=TrqpLZEs3dmiXtk8Pfgqd8VHmV
	YD6e45RUyjECFQOSH4Y+nZvHnV7Au4XGjH1e6f1j0FeA/rkefadg2wlZyX9WKX0Oi78zn0q1csXC1
	RSWNeExz2uvP+52E+oOSg3yYpyeekdyayeNk5feaJik3xrjfNHSWklzV/D+STLxiClsp2uFtCyzcR
	Jy4JAkNljxJkU8e7d/tKctmQu2naZWVuNxsvEheJQ1bmVrl9Spu4D62RmvEE79+lp0bp1VKmnCOwF
	0kchdi6ydlWKT8JYIw+iUbpzSubPGQDRYm2UeG6G+ozfy/z4Zq/qiC/ExKEbauOMr9ph0awxv/bPI
	zjh4JnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnc5H-00000008Rr1-0Npb;
	Wed, 04 Feb 2026 12:34:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnc5E-00000008Rqb-2kxU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0540F4169C;
	Wed,  4 Feb 2026 12:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46458C4CEF7;
	Wed,  4 Feb 2026 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208451;
	bh=AHCivJDP5GD4OkZ5utB49/t1kFWdOSJ8prtPUFvZDG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiToyLjjCR1nTGa50S+wkB8PvJazj2qYOSlcD/TRBD0REFefCrv0GR/ITEIQWBBKr
	 ZTMgraWW5tzNmc6J84Kbctoen0pRB/76UckTZ3Y8sWjIaeOO/sEx84pKV1tBeOJibd
	 VnMHyLqxHktn+OetUF07woScFMr9Fd1gPJjQDp1lLiNq4Sodx5s2nvjE2d+NsGDl6x
	 F8WP1Dj1nDwYgoYn3e1bJJ/NuBw/j5uNFIQP3Jy+ZeJ0sa0dBdj6QWr6F0WPNHai7N
	 sMIuECPEIE++t78svtxJ9mK27FhxbdcDbuncQ5yU/wz8WJq44Ag8bJ8maSjFazkq8z
	 JSjYzFdXEMF1g==
Date: Wed, 4 Feb 2026 18:03:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3 03/10] arm: dts: imx6qdl: Add Root Port node and PERST
 property
Message-ID: <gshz5zc7qkfkqkla2mkpu7jjf3sctrqf5jo5vszzgxzpegxzni@yhdqkykyn2ar>
References: <20260203015614.2957479-1-sherry.sun@nxp.com>
 <20260203015614.2957479-4-sherry.sun@nxp.com>
 <mp25jwvoimpesfwtpmyeltdpbu7aznahxvkcn6jxg5jqzxck4i@pium66rnpdd3>
 <VI0PR04MB12114DBBE58AB89BEEDC28C019298A@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114DBBE58AB89BEEDC28C019298A@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_043412_735775_023A2F5C 
X-CRM114-Status: GOOD (  24.12  )
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

On Wed, Feb 04, 2026 at 06:44:07AM +0000, Sherry Sun wrote:
> > On Tue, Feb 03, 2026 at 09:56:07AM +0800, Sherry Sun wrote:
> > > Since describing the PCIe PERST# property under Host Bridge node is
> > > now deprecated, it is recommended to add it to the Root Port node, so
> > > creating the Root Port node and add the reset-gpios property in Root
> > > Port.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
> > >  arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
> > >  3 files changed, 21 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > > b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > > index ba29720e3f72..fe9046c03ddd 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > > @@ -754,11 +754,16 @@ lvds0_out: endpoint {  &pcie {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_pcie>;
> > > +	/* This property is deprecated, use reset-gpios from the Root Port
> > > +node. */
> > >  	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
> > 
> > You should just remove this property.
> 
> Hi Manivannan,
> 
> Actually I have discussed with Frank about this in V1, Frank suggested add
> comments here instead of removing the old property, just in case the dts
> used by old kernel to avoid function break. Or maybe we can at least keep it
> for some kernel release, then remove it later.
> 

If the new DT breaks the old kernel, then the kernel needs to be upgraded. But
typically, one would update both kernel + DT or just the kernel, not just DT.

- Mani

> Best Regards
> Sherry
> > 
> > >  	vpcie-supply = <&reg_pcie>;
> > >  	status = "okay";
> > >  };
> > >
> > > +&pcie_port0 {
> > > +	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>; };
> > > +
> > >  &pwm1 {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_pwm1>;
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > index 76e6043e1f91..eeb376193398 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > @@ -289,6 +289,17 @@ pcie: pcie@1ffc000 {
> > >  				 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
> > >  			clock-names = "pcie", "pcie_bus", "pcie_phy";
> > >  			status = "disabled";
> > > +
> > > +			pcie_port0: pcie@0 {
> > > +				compatible = "pciclass,0604";
> > > +				device_type = "pci";
> > > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > > +				bus-range = <0x01 0xff>;
> > > +
> > > +				#address-cells = <3>;
> > > +				#size-cells = <2>;
> > > +				ranges;
> > > +			};
> > >  		};
> > >
> > >  		aips1: bus@2000000 { /* AIPS1 */
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > > b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > > index c5b220aeaefd..6b12cab7175f 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > > @@ -45,10 +45,15 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ
> > 	0x000b1
> > >  };
> > >
> > >  &pcie {
> > > +	/* This property is deprecated, use reset-gpios from the Root Port
> > > +node. */
> > >  	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
> > >  	status = "okay";
> > >  };
> > >
> > > +&pcie_port0 {
> > > +	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>; };
> > > +
> > >  &sata {
> > >  	status = "okay";
> > >  };
> > > --
> > > 2.37.1
> > >
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

