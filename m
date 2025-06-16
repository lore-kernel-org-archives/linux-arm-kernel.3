Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F9BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gebr3x5cFjIyCpTF84QP5T9DzSmcTlWVArnM0v5gIds=; b=n1EK9nkg/ujusDdPodSXyNM8wX
	oX3g5AdvrJFeao0pwl7Pouz8XF+Csi2Wy11CWpzYvXOEAY3e6mJ0bPeKLeSnqdczq+Qt0saa0uQfa
	5eLSiJvEdC97EWmBtWaOzTmNo3GEXWIvv420WVSyWRS8Z1rnU4I7T9/Knp/525RbwYOVI2iEMgxOl
	mnwSfJ7GPDWrCIl0pUwJpuCHz9LtaYPWO//Z946GDv8aOSLfYPcjOk7GDoIELarVqHfC9zoAny2RE
	NxCFKaHQoKEI51kZ1akhO+hW3sc0vSq6HtQGwqbX3HBHWnDmEt2o2XpnQzjdxil7h5Lo/rxnJDuRV
	c+JrF/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7jo-00000004A8u-0hVD;
	Mon, 16 Jun 2025 11:10:52 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6hc-000000041Oc-49Hc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Gebr3x5cFjIyCpTF84QP5T9DzSmcTlWVArnM0v5gIds=; b=Y6qj1fNlPUCcGLc2S2OKITAYfD
	t8Vq9th3zdfOzL0wLypb1BZLPdnCf98+I0dEfsr0Gg321OLl15OxRBjiAHKl08oDh6wupQwlUXmBb
	jtAuTtuci6wK/o3NrcxNunay6KfgKF61x0YUa9ddxGzMFHqoxbdKbtsP60wc+jmvF/SpFQjophpmB
	lPf9nHz3TxunhONX8dsrSjl4jsVJiweY9gunoo2Yva7vFNVdjhwtXfEv7B+CUK1821LD8YopzFFTr
	mk7oCd1CLBqjiollkRyrd/FM7Jm8NDI+Xcf5TzfmXVCWn1yioMccMvQxgfdWauq6Q6j1inSzj0WjG
	nA4OYb0g==;
Date: Mon, 16 Jun 2025 12:03:51 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Davis <afd@ti.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth
 <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250616120351.3479442f@akair>
In-Reply-To: <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-2-5278026b7498@bootlin.com>
	<53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_030433_034729_610AC80B 
X-CRM114-Status: GOOD (  20.42  )
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

Am Mon, 9 Jun 2025 18:34:10 -0500
schrieb Andrew Davis <afd@ti.com>:

> On 6/9/25 10:43 AM, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation. Add description for Bone, BoneBlack and BoneGreen
> > variants.
> > 
> > Add several compatible that were missing from the binding.
> > 
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> > 
> > Change in v2:
> > - New patch
> > ---
> >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > index 3603edd7361d..c43fa4f4af81 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > @@ -104,12 +104,50 @@ properties:
> >         - description: TI AM33 based platform
> >           items:
> >             - enum:
> > +              - bosch,am335x-guardian
> >                 - compulab,cm-t335
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - moxa,uc-2101
> >                 - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                 - novatech,am335x-lxm
> > +              - oct,osd3358-sm-refdesign
> > +              - tcl,am335x-sl50
> >                 - ti,am335x-bone
> >                 - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-pocketbeagle
> > +              - ti,am335x-shc
> >                 - ti,am3359-icev2
> > +              - vscom,onrisc
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone variants based on TI AM335  
> 
> Do we really need these "bone variants" split out from the above
> list of TI AM33 based boards? We don't do that for any of the other
> boards, you get a SoC and a Board compatible, every classification
> in-between is just unneeded.
> 

We have something like this for the Pandaboards models. But
e.g. the i.MX Udoo Neo stuff which just differs in what is populated
does not have this. So I do not see a clear pattern. It could be useful
for userspace to store some board-specific configurations which might be
the same for a family of boards. So if people shout out loud that these
are needs, lets kep them.

Regards,
Andreas



