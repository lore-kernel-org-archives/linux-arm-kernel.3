Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953C5E7C706
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 08:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h44us49OCY+Aqqi8FHfVgT4PgOs8rfwSyPhPjcy/Tf8=; b=zOT7paEWEdCKNURmAN5DZOySFP
	y8CYEDOrY3mTiYgi68hd7xi5mWRneMFLl9568olIRFVu6RUUGtx847ZC/DemAFLGQ5pBRFLRgUdGP
	CE1Q7FhCxJDWfVpvHa8kWsRp1LfzaqtKWsDx5yLweCeYFv9w7x4l979AhJKJe+9dpQFH9zTzNb4bK
	2HBSyqI4/eZLGyStUvHD8mXa2y3iUx9IFlscLdnUwNH5vzs7DLKTycTEzA195xix3h3dPEq43kju7
	gQlKmlkOM30P8oBfi45FphPdrsQnV6/8Fgt3IMUfqxRe9qopYJOf1n9m7v6oUylOsgcDQHDk/fxCi
	IMn9jO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMKZ-0000000Ez7H-1B1Q;
	Mon, 09 Feb 2026 08:09:15 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMKT-0000000Ez5T-2W6t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 08:09:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC952148DD11;
	Mon,  9 Feb 2026 09:09:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1770624543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=h44us49OCY+Aqqi8FHfVgT4PgOs8rfwSyPhPjcy/Tf8=;
	b=d6Liw7qJZ3Ycos6ROe2kxvvXGOomIAdAhB3rdkL2ihEJ8pNKRFAXVVzWrL9xbooWELTicZ
	bnDdxni4KVZwvanGpn3rhpDIEpy1ADE3lhn8dwex04jtqU6CJT575VXySBE06sy5DQFTvi
	Rhqs+Nq3keLKX9Bz2QYdg7qMJwW23R6/AbhIdXqJ9CtjWokrZ0Gw2w0KljOUJSc5/9lG/d
	QmhTNZof/JXXlTzPzZqhqtMYpkg3R9KQEpvazz3kSj+kLjkRtQKaFR1hf1h8NVFA4YooNO
	oFhczojEq700YkPS0ohdDA5cjWNQHyaap4d0zXxHKLGeJYi5wzh1Ik7hVt9bRQ==
Date: Mon, 9 Feb 2026 09:08:56 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing
 main rc oscillator in DT
Message-ID: <20260209-amulet-customize-08ef8dfa1c38@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-4-ada@thorsis.com>
 <b932cdfb-9197-462b-abb8-e7b4c7ecab6f@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b932cdfb-9197-462b-abb8-e7b4c7ecab6f@tuxon.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_000910_287863_B2FFF87D 
X-CRM114-Status: GOOD (  28.27  )
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

Hello Claudiu,

Am Sat, Jan 31, 2026 at 05:44:18PM +0200 schrieb Claudiu Beznea:
> Hi, Alexander,
> 
> On 1/20/26 16:37, Alexander Dahl wrote:
> > The main rc oscillator will be needed for the OTPC to work properly.
> > 
> > The new index introduced here was not used on the four affected SoC
> > clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v3:
> >      - adapt to different base changes, added lines are the same
> >      v2:
> >      - new patch, not present in v1
> > 
> >   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
> >   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
> >   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
> >   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
> >   4 files changed, 4 insertions(+)
> > 
> > diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > index 91f8f863ea076..1f6bb51780d09 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > @@ -10,6 +10,7 @@
> >   #define SAM9X60_PMC_MCK		1
> >   #define SAM9X60_PMC_UTMI	2
> >   #define SAM9X60_PMC_MAIN	3
> > +#define SAM9X60_PMC_MAIN_RC	6
> 
> Why 6 and not another index? In theory, now, you should be able to define
> here all the core clocks IDs (as these are known from the manuals) and
> prepare the driver to allocate memory for all of them such that the driver
> will have to be able to work with old and new device trees w/o further
> changes.

Was the first common free index for these four clocks.  Before split
up would have been nice to have a common index, because it was all
together in include/dt-bindings/clock/at91.h in one file.  After
splitup one could just use the first free index, as Krzysztof already
suggested.

From my reading of the SAM9X60 manual, there's no such thing as core
clock IDs in the manual.  If there is a section in the manual, please
point it out.

From my interpretation for SAM9X60 these clocks are provided by the
clock generator (section 40 in the manual):

- TD_SLCK
- MD_SLCK
- MAINCK
- UPLLCK
- PLLACK

The "main rc oscillator" clock is somewhat internal here, but for OTPC
we must be able to enable it.

MCK (not MAINCK) is generated in the Processor Clock Controller block
of the PMC (section 41 in the manual) from one of the above clocks.

So it's all mixed up from different blocks from Clock Generator and
Power Management Controller already.  These indexes are
arbitrary and just for the driver, right?  Or am I missing something?

Besides, if it is renamed now anyway:

- Why that PMC prefix? (most of these core clocks come from the
  clock controller, not the pmc)

- Why not rename PMC_UTMI to something like xyz_UPLLCK to match the
  datasheet/manual (likewise for the other definitions)?

Greets
Alex

> 
> >   #define SAM9X60_PMC_PLLACK	7
> >   #endif
> > diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > index e1dd41fe75046..657f32ce10071 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > @@ -10,6 +10,7 @@
> >   #define SAM9X7_PMC_MCK		1
> >   #define SAM9X7_PMC_UTMI		2
> >   #define SAM9X7_PMC_MAIN		3
> > +#define SAM9X7_PMC_MAIN_RC	6
> >   #define SAM9X7_PMC_PLLACK	7
> >   #define SAM9X7_PMC_AUDIOPMCPLL	9
> >   #define SAM9X7_PMC_AUDIOIOPLL	10
> > diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > index 09d152da6db44..ddcb236718978 100644
> > --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > @@ -12,6 +12,7 @@
> >   #define SAMA7D65_PMC_MAIN		3
> >   #define SAMA7D65_PMC_CPUPLL		4
> >   #define SAMA7D65_PMC_SYSPLL		5
> > +#define SAMA7D65_PMC_MAIN_RC		6
> 
> E.g. 6 was previously reserved for DDR and IMG PLLs.
> 
> >   #define SAMA7D65_PMC_BAUDPLL		8
> >   #define SAMA7D65_PMC_AUDIOPMCPLL	9
> >   #define SAMA7D65_PMC_AUDIOIOPLL		10
> > diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > index 0303cae56f849..e891715a35173 100644
> > --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > @@ -12,6 +12,7 @@
> >   #define SAMA7G5_PMC_MAIN	3
> >   #define SAMA7G5_PMC_CPUPLL	4
> >   #define SAMA7G5_PMC_SYSPLL	5
> > +#define SAMA7G5_PMC_MAIN_RC	6
> >   #define SAMA7G5_PMC_AUDIOPMCPLL	9
> >   #define SAMA7G5_PMC_AUDIOIOPLL	10
> >   #define SAMA7G5_PMC_MCK1	13
> 

