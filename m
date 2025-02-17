Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A650C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIkTLjv0x5vzYMGjyX+qs/DHm8QaxDtzTTiHZ6XTnes=; b=Nt+G4qwLiaWz/3SEeJi5npWSgB
	Hw0pxI+ZdPtiMpcWo69pZka/edK8ue09VZo9jc9t+FQu7SfxqY1d4ho7ucTYbYU381bXfHtiORmqy
	wU5PxedcAnNzcuNaOs96pGcG5FZ0QXqZb/u+wxLlg4IOHgXb59g/mq5PE9KodutSNgOb29PnKXVeb
	/IaJ1u2A7cSeO4KAkonxJpsHi9TViWdrZ2iOG3ZtnEGZVIqjSdN5rdw3gzezKW0fcXeG5Im9eGtiy
	w6H0yfYJDpqzZekl/YlwlNbuw/kqGUkQekhdKwhTSSk9WIUmtdtzA56Qp3SLCM7KGX3EPVoE0eJZt
	8yJcDxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxxh-000000042JE-28eY;
	Mon, 17 Feb 2025 10:02:49 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxjF-00000003zTK-0pR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:47:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A43B214832FC;
	Mon, 17 Feb 2025 10:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739785670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mIkTLjv0x5vzYMGjyX+qs/DHm8QaxDtzTTiHZ6XTnes=;
	b=g/2PvxVfyy82W5RmTyvR0cW4xeyCzTXFvTFVOdmx8NE8C+ve+G/aHZqu97m4m8tn7cSGEo
	2Wynhj1OsQXs7x6qGfua00hJtDKA0j9qcRdg7OfZEWXuh+9hFCYfsf641INL6PB4ebmq0o
	UTCzh7K/xSCUpi8OrOCD+89nna+BRDmMMTzXzxcYZDDBv4Za0xJIRtvZaLkRZmsgMYp4i5
	GzzktdnQtqlkSWY/Q1jCo4Ql58SPsHIbu5bkhok14TW9no6X5fT84eR6iA+3s4UJCyhrbZ
	pb0TvnrMRTqgw9iva+EvegQlqNvRnMGuDKwZH4TLUuz0nmzWhq+kLvoddCzPzQ==
Date: Mon, 17 Feb 2025 10:47:48 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20250217-shortwave-scoreless-38cb49fe5548@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
 <a1dff4af-d771-4424-869f-15d3b6bca013@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1dff4af-d771-4424-869f-15d3b6bca013@tuxon.dev>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_014753_565914_15911522 
X-CRM114-Status: GOOD (  33.77  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, Alexander Dahl <ada@thorsis.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Claudiu,

Am Mon, Feb 17, 2025 at 11:11:44AM +0200 schrieb Claudiu Beznea:
> Hi, Alexander,
> 
> On 10.02.2025 18:44, Alexander Dahl wrote:
> > Before adding even more new indexes creating more holes in the
> > clk at91 drivers pmc_data->chws arrays, split this up.
> > 
> > This is a partial split up only for SoCs affected by upcoming changes
> > and by that PMC_MAIN + x hack, others could follow by the same scheme.
> > 
> > Binding splitup was proposed for several reasons:
> > 
> > 1) keep the driver code simple, readable, and efficient
> > 2) avoid accidental array index duplication
> > 3) avoid memory waste by creating more and more unused array members.
> > 
> > Old values are kept to not break dts, and to maintain dt ABI.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >     v2:
> >     - new patch, not present in v1
> > 
> >  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
> >  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
> >  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
> >  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
> >  4 files changed, 100 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
> >  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
> >  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
> >  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > 
> 
> [ ...]
> 
> > diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > new file mode 100644
> > index 0000000000000..ad69ccdf9dc78
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama7g5 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> > +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> > +
> > +#include <dt-bindings/clock/at91.h>
> > +
> > +/* old from before bindings splitup */
> > +#define SAMA7G5_PMC_MCK0	PMC_MCK		/* 1 */
> > +#define SAMA7G5_PMC_UTMI	PMC_UTMI	/* 2 */
> > +#define SAMA7G5_PMC_MAIN	PMC_MAIN	/* 3 */
> > +#define SAMA7G5_PMC_CPUPLL	PMC_CPUPLL	/* 4 */
> > +#define SAMA7G5_PMC_SYSPLL	PMC_SYSPLL	/* 5 */
> > +
> > +#define SAMA7G5_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
> > +#define SAMA7G5_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
> > +
> > +#define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
> > +
> > +#endif
> 
> I would have expected this to be something like:
> 
> #ifndef __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
> #define __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
> 
> /* Core clocks. */
> #define SAMA7G5_MCK0			1
> #define SAMA7G5_UTMI			2
> #define SAMA7G5_MAIN			3
> #define SAMA7G5_CPUPLL			4
> #define SAMA7G5_SYSPLL			5
> #define SAMA7G5_DDRPLL			6
> #define SAMA7G5_IMGPLL			7
> #define SAMA7G5_BAUDPLL			8

Okay no reference to the old header, but numbers.  Got that.

I'm not sure where you got the 7 and 8 from here, according to my
analysis, sama7g5 does not use those.

> 
> // ...
> 
> #define SAMA7G5_MCK1			13
> 
> #endif /* __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__ */
> 
> Same for the other affected SoCs.
> 
> The content of include/dt-bindings/clock/at91.h would be limited eventually
> only to the PMC clock types.

What does this mean?  The clocks split out are no PMC clocks?  Then
the old PMC_MAIN etc. definitions were named wrong?  All or only some
of them?  Or is this different between older and newer SoC variants of
the at91 family?

From a quick glance in the SAM9X60 datasheet for example the clock
generator provides MD_SLCK, TD_SLCK, MAINCK, and PLL clocks, while the
PMC provides MCK, USB clocks, GCLK, PCK, and the peripheral clocks.

The chws array in drivers/clk/at91/sam9x60.c however gets main_rc_osc
(from clock generator), mainck (clock generator), pllack (clock
generator), upllck (clock generator, UTMI), but also mck (from PMC).

This creates the impression things are mixed up here.  I find all this
quite confusing to be honest.

> The other "#define PMC_*" defines will eventually go to SoC specific
> bindings. "#define AT91_PMC_*" seems to not belong here anyway and these
> would in the end removed, as well.

Okay, you seem to have an idea how this should look like in the long
run.  Are there any plans at Microchip or at91 clock maintainer side
to clean this up in the near future?

I would like to rather put my small changes for otpc on top of a clean
tree, instead of trying to clean up clock drivers and bindings for a
whole family of SoCs and boards, where I can test only one of them.
O:-)

Greets
Alex


