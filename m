Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3225FD6B6C0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzkcjRxagUY36d1VDj7H15a6opD55PTVefEIMiGCuaU=; b=tnrmydeef2pyJqF95a+eSYMwr+
	gmCybdfSq3qbZG0iGKmVRa2/O38SwwFz2k3e0QydLRMOQ+UBVBNx+lH2UXsDi/hxPt3P8MOF8ts1A
	QH5OB5qnC7yp+Gquy6cs8q1CtDFTzhC6gcShMMntVGJuAnpduIa2u6t0qb33QnI6toUYFWwu1eBuc
	juHlkOcLAG0s1PZiAJkUNmE7FtzcTsKaDcD0dygl+5ryxZDHsl2GCtsG/f0SKAS0fVrf/m8oOvxbu
	XyOKOxieMoZvDdhljuqDwg8jr5O3xY4XlX900CphzFIdKRtTPfXaWc7rI2Poy/u841tHsL5dmpfKd
	geIJjN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Dtz-00000001TyV-2cAH;
	Wed, 30 Oct 2024 18:58:43 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DsL-00000001TlF-2xZk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 18:57:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13520C0006;
	Wed, 30 Oct 2024 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730314617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzkcjRxagUY36d1VDj7H15a6opD55PTVefEIMiGCuaU=;
	b=lUebFpWwx1tewUnpH2diNVSx+7wBPUQD5JnQhUsryh4AKx7xfoLVUZUvG54jmuF71U8P7W
	C/Kyzn4GgW7cSpODleV0fKNh1/czzOwAH6XMC3Kmp03nS5dsOZ2ffhsc+MNpeJe/k2/Ozc
	g+Z6C/BVZe4hUsg5W42CdU3uVG9QGOjr7mcV3YWn2o3I67YyYAe8yjQRmJh6V8tnNv2SR1
	G/zNZ1ZOUq/oZrqgoAro60YpBuqspb4nLwt6uUUME3hO+vPeO2stab7xN7jMxURRlRBk3J
	eijp4Tnz4BDf1xkgXVtJCx+1GLwybFyx3QKw/iLTHYJsyQMY9NCzrsYXfYO47g==
Date: Wed, 30 Oct 2024 19:56:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
	Claudiu <claudiu.beznea@tuxon.dev>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S SoC
Message-ID: <20241030185655bfd883a8@mail.local>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_115701_907764_94083992 
X-CRM114-Status: GOOD (  26.96  )
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

On 30/10/2024 16:50:43+0100, Geert Uytterhoeven wrote:
> Hi Mike, Stephen, Alexander,
> 
> On Wed, Oct 30, 2024 at 12:01 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> > IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> > input pins. The logic to control this clock (and pass it to RTC)
> > is inside the VBATTB IP. For this, the clk-vbattb driver was added
> > (patches 01-03/12).
> >
> > Patches:
> > - 01-03/10: add VBATTB support that provides the RTC clock
> > - 04-05/10: add the RTC driver
> > - 06-09/10: update the device trees with proper nodes to enable RTC
> > -    10/10: enable proper config flags for RTC to work on RZ/G3S SoC
> >
> > Merge strategy, if any:
> > - clock patches (01-03/10) need to go though the same tree because of
> >   patch 03/10 using the devm_clk_hw_register_gate_parent_hw() introduced
> >   in patch 02/12
> 
> Once Mike/Stephen are happy with 02, I can queue patches 01-03 in
> renesas-clk.
> 
> > - RTC patches (04-05/10) can go though RTC tree
> > - DTS and defconfig patches can go though Renesas tree
> 
> Patches 06 and 08 I can queue in renesas-devel soon.
> For 07 and 09, I am waiting for feedback from Alexandre on the RTC
> DT bindings.

I'll take 4 and 5 this cycle.

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

