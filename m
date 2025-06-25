Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EBBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCb5y6kIpf2MhssQIye+N9DhLzgcRaaTzBfrQUdRj7c=; b=H2HxKEKl6bs8Zg1/2owf5+UlM7
	NPvs0mcTjWWkg3ziKob59ImDi77tJ5Ggn8JRx7lLdus737kstzWeABg2QlspQKzMJELtVJX9kwSh3
	W7ielFmG8I7j/EqahNwKmkgzUFFb3rrfwmqUeR+VA32BVaCKy6Wll02AXY9nqVYJJYFDuSs8dKoGk
	KkW5xsuZTlzqJE6cdkNH1qn/QvYNelgKGHxBiCik+VWFEsg7U8egfSol4CgvRkO6LjN7Sb+2AsDvN
	BRkIX/QrDxeCCEThYOQ5MIA9tqeL0J0voNblkRk4vlLsTL7H4YVgPEHf5PRiLHaLOax5rl9tNv/iv
	Ai2DHpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYNa-0000000A2pl-41rI;
	Wed, 25 Jun 2025 22:14:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW3D-00000009m4E-498s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B27AFA475EC;
	Wed, 25 Jun 2025 19:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F43C4CEEE;
	Wed, 25 Jun 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880694;
	bh=UaTI7XKP1pORbiVLuaFJ3J5Oj/8204WawFn35LhQVUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhzsdkLclaUjfYa0T65Fqy/kgwwK8KXUh/ZR6WFaKHRqnDji+475X+s0Sliv0VM+x
	 preRfA/yZHFWSg2RQbJRIoA3YEV2yaaQheaR2txdVUiuQni9dWSchTL3Qfle5+EU9U
	 EdGpUhFFOZFmhNLIYxdu4r/NXEc3gg2yOkudJtaQrBloX4t38E2v6lqk87bb9M6CBQ
	 pmCpI+3fufALozfZBdXVcL0+Y3ms+xcp5uovXVg0i/gZ+sBd0Mnm/fyGu5N6nT89HN
	 C1i0hQ4p+Hgd1F97qJbARCoyRamH8PQfZ5bndryLEOQIzHqEKdF2OkXitza6ZrpB0m
	 Ah6d0jKHgCv9w==
Date: Wed, 25 Jun 2025 14:44:53 -0500
From: Rob Herring <robh@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Davis <afd@ti.com>, Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250625194453.GA2093083-robh@kernel.org>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
 <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
 <20250610100544.4beb07e2@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610100544.4beb07e2@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_124456_157499_39CAF9FB 
X-CRM114-Status: GOOD (  23.88  )
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

On Tue, Jun 10, 2025 at 10:05:44AM +0200, Kory Maincent wrote:
> Le Mon, 9 Jun 2025 18:34:10 -0500,
> Andrew Davis <afd@ti.com> a écrit :
> 
> > On 6/9/25 10:43 AM, Kory Maincent wrote:
> > > Add several compatible strings that were missing from the binding
> > > documentation. Add description for Bone, BoneBlack and BoneGreen
> > > variants.
> > > 
> > > Add several compatible that were missing from the binding.
> > > 
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > > 
> > > Change in v2:
> > > - New patch
> > > ---
> > >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38
> > > ++++++++++++++++++++++ 1 file changed, 38 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > 3603edd7361d..c43fa4f4af81 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -104,12 +104,50 @@
> > > properties:
> > >         - description: TI AM33 based platform
> > >           items:
> > >             - enum:
> > > +              - bosch,am335x-guardian
> > >                 - compulab,cm-t335
> > > +              - grinn,am335x-chilisom
> > > +              - gumstix,am335x-pepper
> > > +              - moxa,uc-2101
> > >                 - moxa,uc-8100-me-t
> > > +              - myir,myc-am335x
> > > +              - myir,myd-am335x
> > >                 - novatech,am335x-lxm
> > > +              - oct,osd3358-sm-refdesign
> > > +              - tcl,am335x-sl50
> > >                 - ti,am335x-bone
> > >                 - ti,am335x-evm
> > > +              - ti,am335x-evmsk
> > > +              - ti,am335x-pocketbeagle
> > > +              - ti,am335x-shc
> > >                 - ti,am3359-icev2
> > > +              - vscom,onrisc
> > > +          - const: ti,am33xx
> > > +
> > > +      - description: TI bone variants based on TI AM335  
> > 
> > Do we really need these "bone variants" split out from the above
> > list of TI AM33 based boards? We don't do that for any of the other
> > boards, you get a SoC and a Board compatible, every classification
> > in-between is just unneeded.
> 
> As omap maintainers prefer. I did that to have the least amount of change in
> the devicetree. We could have U-boot using these compatible but after a quick
> check it seems not.

I agree with both. The intermediate compatibles that TI in particular 
went crazy on have proven to be not useful. However, between having to 
fix existing .dts files and keeping them, I would just keep them.

Rob

