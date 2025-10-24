Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90208CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnB157sjc0UjisDzzbLz1eliS/AcBa+zJwKSjptZKPI=; b=HTOphP7wI82vCL5Xtz5eTGir1n
	3K8KjIxnpPb9ewGeCP2moYCJQNiDvndjUaCb5wtQOtZn3jR1DK3gVr45TR7iMtZ6fmWdfm2J0b1VH
	jZ48PBfYmXCqTpDfr4pERfrgSoVXi8jILxbTTMEvcpmF1xuNZsl9yPor6atxE0XpvapDf3PggoeHb
	qP0RwHjeIE3l39XsYvYdntH6UKxhO31xtifoYAlUipF/qgEV6TEYb/LOiptl5XJuPpLeg/z1SvCP5
	dw5dawKNVb3W77Mb7JCRwbOkEp4acP8Lnx1dfhAqIYOgE98ouNC+PXOovrhk9WFjMCq9qNICUrw+f
	/8xjmbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGmH-00000009Lgs-0xvf;
	Fri, 24 Oct 2025 12:20:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGmE-00000009LgJ-3bS7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:20:16 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGmD-0000ek-3D; Fri, 24 Oct 2025 14:20:13 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Maxime Chevallier
 <maxime.chevallier@bootlin.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Matthew Gerlach
 <matthew.gerlach@altera.com>,  kernel@pengutronix.de,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 06/10] arm64: dts: socfpga: agilex5: add dwxgmac
 compatible
In-Reply-To: <b486bb52-7e95-44d3-ac65-1c28d4d0e40e@kernel.org> (Dinh Nguyen's
	message of "Fri, 24 Oct 2025 07:00:36 -0500")
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
	<20251024-v6-12-topic-socfpga-agilex5-v5-6-4c4a51159eeb@pengutronix.de>
	<b486bb52-7e95-44d3-ac65-1c28d4d0e40e@kernel.org>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Fri, 24 Oct 2025 14:20:09 +0200
Message-ID: <87zf9g7apy.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_052014_897643_E692670A 
X-CRM114-Status: GOOD (  23.27  )
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


Hi Dinh,

On 2025-10-24 at 07:00 -05, Dinh Nguyen <dinguyen@kernel.org> wrote:

> Hi Steffen,
> 
> On 10/24/25 06:49, Steffen Trumtrar wrote:
> > The gmac0/1/2 are also compatible to the more generic "snps,dwxgmac"
> > compatible. The platform code checks this to decide if it is a GMAC or
> > GMAC4 compatible IP core.
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> > diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > index 4ccfebfd9d322..d0c139f03541e 100644
> > --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> > @@ -536,7 +536,8 @@ qspi: spi@108d2000 {
> >     		gmac0: ethernet@10810000 {
> >   			compatible = "altr,socfpga-stmmac-agilex5",
> > -				     "snps,dwxgmac-2.10";
> > +				     "snps,dwxgmac-2.10",
> > +				     "snps,dwxgmac";
> >   			reg = <0x10810000 0x3500>;
> >   			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> >   			interrupt-names = "macirq";
> > @@ -649,7 +650,8 @@ queue7 {
> >     		gmac1: ethernet@10820000 {
> >   			compatible = "altr,socfpga-stmmac-agilex5",
> > -				     "snps,dwxgmac-2.10";
> > +				     "snps,dwxgmac-2.10",
> > +				     "snps,dwxgmac";
> >   			reg = <0x10820000 0x3500>;
> >   			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> >   			interrupt-names = "macirq";
> > @@ -762,7 +764,8 @@ queue7 {
> >     		gmac2: ethernet@10830000 {
> >   			compatible = "altr,socfpga-stmmac-agilex5",
> > -				     "snps,dwxgmac-2.10";
> > +				     "snps,dwxgmac-2.10",
> > +				     "snps,dwxgmac";
> >   			reg = <0x10830000 0x3500>;
> >   			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> >   			interrupt-names = "macirq";
> > 
> 
> I just sent a patch for this yesterday:
> 
> https://lore.kernel.org/all/20251023214012.283600-1-dinguyen@kernel.org/
>

ah, I missed that, than this patch is unneccessary.

> I'll make sure to include you on future submissions.
> 
> I didn't add it to the bindings document though.
>

As I always get complains from dt-check bot, I remembered to add it ;)


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

