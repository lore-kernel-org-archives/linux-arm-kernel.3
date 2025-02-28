Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE819C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iplQ7sXRRMB+d4BYh+wD8NJDMthJtlIttIrvpK1F3E=; b=3tplLqGfgrO0RYMnkj0DVf8Tkc
	G5lz9bWOocTZVDidExkdSt5WHPj07Ra7HHabqHTKugqsd6CXCmJgf20tvrKThLAaCeCv0a1xaaChN
	9Dv33VvV0tFMh1Mmp2jxk9I4v0LmZ1WSC+2n8G3llFxWs3DIFrnJmyu9g8QiKfykfvPsfliOoQ/iE
	nP7Ff5TOgWUxs9QzRWDUbrMWwujfW1oHpVFsfUJRvvov/7j447IKZ1GYqW8x8IvFtly4Rn6o9R6Sh
	EY90Ur/4Li+f3qBJrzGBRbJiML6kd4xZhsJtQP5NQmK5LBAkqy6FN+1LCSt7S/093HcSZ7UkyaM9s
	lieZ7uAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxe9-0000000Abk4-17Jz;
	Fri, 28 Feb 2025 10:31:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxTZ-0000000AZO9-2xSG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:20:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxTE-0000p1-HQ; Fri, 28 Feb 2025 11:19:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxTE-003HFg-0g;
	Fri, 28 Feb 2025 11:19:52 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnxTE-005Ghl-0F;
	Fri, 28 Feb 2025 11:19:52 +0100
Date: Fri, 28 Feb 2025 11:19:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <20250228101952.g6tae3ni5xrhjk3y@pengutronix.de>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
 <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
 <20250227-monumental-whale-of-security-b1c84e-mkl@pengutronix.de>
 <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022013_749927_BF14BD44 
X-CRM114-Status: GOOD (  39.47  )
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

Hi,

On 25-02-27, Frank Li wrote:
> On Thu, Feb 27, 2025 at 11:57:54AM +0100, Marc Kleine-Budde wrote:
> > On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
> > >
> > > On 21.02.2025 21:56, Frank Li wrote:
> > > > On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
> > > >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > >>
> > > >> AIPS5 is actually AIPSTZ5 as it offers some security-related
> > > >> configurations. Since these configurations need to be applied before
> > > >> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
> > > >> be their parent instead of keeping AIPS5 and adding a child node for
> > > >> AIPSTZ5. Also, because of the security configurations, the address space
> > > >> of the bus has to be changed to that of the configuration registers.
> > > > The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
> > > > config address part in your drivers.
> > > >
> > > > Frank
> > >
> > > Any concerns/anything wrong with current approach?
> > >
> > >
> > > I find it a bit awkward to have the whole bus address space
> > > in the DT given that we're only interested in using the access
> > > controller register space.
> > >
> > >
> > > I'm fine with the approach you suggested but I don't see a
> > > reason for using it?
> >
> > Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
> > Applications Processor Reference Manual, Rev. 3, 08/2024), the
> > AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
> > different than the bus configuration. Why not model it as part of the
> > bus?
> >
> > > >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > >> index e0d3b8cba221..a1d9b834d2da 100644
> > > >> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > >> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > >> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
> > > >>  			};
> > > >>  		};
> > > >>
> > > >> -		aips5: bus@30c00000 {
> > > >> -			compatible = "fsl,aips-bus", "simple-bus";
> > > >> -			reg = <0x30c00000 0x400000>;
> > > >> +		aips5: bus@30df0000 {
> >                        ^^^^^^^^^^^^
> > > >> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
> > > >> +			reg = <0x30df0000 0x10000>;
> > > >> +			power-domains = <&pgc_audio>;
> > > >>  			#address-cells = <1>;
> > > >>  			#size-cells = <1>;
> > > >> +			#access-controller-cells = <0>;
> > > >>  			ranges;
> > > >>
> > > >>  			spba-bus@30c00000 {
> >                         ^^^^^^^^^^^^^^^^^
> >
> > This looks very strange: The aips5 bus starts at 0x30df0000 and has a
> > child bus starting at 0x30c00000?
> 
> @30df0000 should match controller reg's address.
> 
> subnode address 0x30c00000,  should be descript in "ranges", which 1:1 map.
> 
> So it should be reasonable. another example:
> i2c@1000 {
> 
> 	device@1c <- which use difference address space.
> }
> 
> The similar case also happen at pcie.

I'm not really convinced that pcie and i2c are good examples here. I2C
does have an other addressing scheme by nature and the hotplug-able pcie
is dependeds on the pcie device memory map of course.

Here we're talking about an access control IP core on a bus which is
static.

But.. it looks like from DT abstraction it's fine because STM did
something similiar with their st,stm32mp25-rifsc or st,stm32-etzpc
albeit it does look strange and I don't know why we have to limit the
address space since it was already mapped but used by the fsl,aips-bus
driver.

Regards,
  Marco


> 
> Frank
> 
> >
> > regards,
> > Marc
> >
> > --
> > Pengutronix e.K.                 | Marc Kleine-Budde          |
> > Embedded Linux                   | https://www.pengutronix.de |
> > Vertretung Nürnberg              | Phone: +49-5121-206917-129 |
> > Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
> 
> 
> 
> 

