Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE10C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZlEK75K9WQhYz2x3M19iYyZj+5jfTWERyBRejvq9Ko=; b=Fqmx0iqXEV0UW58faZzYIHK3xa
	a76Er3azrmsIKB3J6zFSGs7iWE+EK85OXJc/qgAm+nGbLS/wBVqkVGSVxYeR5eubDLsOIV4ki3gdq
	VitAnFKludimJd2/1VvbKGux/ecUdZnZgwy6TUfwMTa80YAz3JG0rM6SynfXx+oJfpHJpGHCS11iV
	u4J19ZyelfXpmUhHzJmzrLl+urjSPafvYs8QQU/cp1+FZsJS6GhOMUiIGxhnTy2u2imT5DV6y81Vv
	s0cGJWzmV9aiP9FFffhwWD4doTXRUNAIh0H1jV3Zyehtictz6GlMDZQpUtA1bm7nE9qlLl7O/L+Oe
	4O0eAY0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRaX-00000006aSt-2VGS;
	Tue, 17 Jun 2025 08:22:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRWB-00000006Zcr-0BCm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 379CDA49E6C;
	Tue, 17 Jun 2025 08:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52636C4CEE3;
	Tue, 17 Jun 2025 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148285;
	bh=MZSo/B8Ueewbot0Zq1gP0vpAO0AFWWY0WjE6mYewrUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntI+UmjbdXl+CUqRVIrx5ytxcPaeqqksAqWWehytGvsOdDFnNV4QeCLk/h6aqMztQ
	 uq3h+7hl7OQxKR1c2ePzoA3so2p3lggM+/l96ZAapytKZ+PaZcORVibq1WKH0e8ip5
	 kUefxhTQf8a+4kvckopwj1vUyU1ZQgt0edTbiBkx2hvjzdyuaR8MztDBCkYP1I3oTJ
	 nBo0ksWTh4vUzTEWdV/tNjunHO8iaNSBHCLTqgMfCn12avLzfVwRNJ3L5KE0gB4giu
	 yxcB4lydVduiSywwJl0ztpPa3PaH+sVCqLqHBSfudEDFML/g9prmblmJleUSjGdlhu
	 iw94oQeG9st7Q==
Date: Tue, 17 Jun 2025 10:18:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250617-manipulative-discerning-fennec-bbd829@kuoka>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-4-5278026b7498@bootlin.com>
 <20250609-helpful-immodest-0f195cdbcbf2@spud>
 <20250609224502.1fce742c@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609224502.1fce742c@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_011807_146997_99DDA32A 
X-CRM114-Status: GOOD (  13.43  )
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

On Mon, Jun 09, 2025 at 10:45:02PM GMT, Kory Maincent wrote:
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > c43fa4f4af81..774c13157caa 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7 @@
> > > properties:
> > >        - description: TI bone green variants based on TI AM335
> > >          items:
> > >            - enum:
> > > +              - ti,am335x-bone-green-eco
> > >                - ti,am335x-bone-green-wireless
> > >            - const: ti,am335x-bone-green
> > >            - const: ti,am335x-bone  
> > 
> > Why is this hunk here?
> 
> Do you mean that the binding change should be in another patch?

Yes, as requested by checkpatch and documented in DT submitting patches.
Your question above, suggests you did not run checkpatch, so please
confirm you run it before posting new versions.

Best regards,
Krzysztof


