Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1517C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeqbZ8gL7IKSa34fSG0N17oAXiPh2xQ8hnnmu14TEIc=; b=DTqYyrxtvxIv6o0LDR2RFhwUsK
	oYjD1uXXClODj9QfvtdgWqxHYzUu+nD4LeGbCjDf3eMWNNWoWqfjygvYVmAjtPTfv5YGUTA4SxYTb
	rEw8dyLQ3dqBgxLzAKHfikPCGcH26HBI91G7IiyuGgMi1KPTvt2g61MsRwWCZxr3mfABwg2s1U02l
	mK5HFETLG7UAYRP0QAKpNKJrXrN3cwgkipJCNMHAaLNvfedmPnoGM4WZT6k72nQdyWHrv+XLADsk3
	yPbsZAEkQ8FhGUhCzDiVrR12DC0Fejr27PmKmI74vwtH1fs2/A42xoW+cmuLeH/RL4GTTU9td2ZIY
	5Kd5Z71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkXH-00000002o9d-2MoD;
	Tue, 11 Feb 2025 07:18:23 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkVs-00000002nye-0ITk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:16:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ACF014801C8;
	Tue, 11 Feb 2025 08:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739258213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yeqbZ8gL7IKSa34fSG0N17oAXiPh2xQ8hnnmu14TEIc=;
	b=DMziTgXLFFkMPBIUw0l+qb1cicwXk6RP1JRgVBdieHePTf6A9XxfYQAbHK1mRnWtit1/+c
	lOPY0j0hROIzye3E9Hy0fmr0YIZyqAJO2MTYOjGNH1NDjZhhG48RIDaYrn5f8rrmxT996m
	aCevm5dfQvc94CDLX+BADaqRy/78YpzSKzKyvu6YJL7mPRrFzlldHE+y+Ar59I0FHMylr5
	M7qbxS+Bo3CxTHcghua9xPX/xyc8Qy0xqnd02z119zba+HWR2s9ew+cKqbkLZMQYMbABUP
	7wAyy37HonNmzNaxcYKG143AceSx8qXJtS9cKAGI7vaP92wNUL+3ytlel4rEtA==
Date: Tue, 11 Feb 2025 08:16:51 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20250211-cuddly-system-33432b3ced5f@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
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
 <a199849a-ca36-439d-8246-7addd9a78833@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a199849a-ca36-439d-8246-7addd9a78833@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_231656_429436_D4A6E02C 
X-CRM114-Status: GOOD (  29.92  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello everyone,

Am Mon, Feb 10, 2025 at 06:05:31PM +0100 schrieb Krzysztof Kozlowski:
> On 10/02/2025 17:44, Alexander Dahl wrote:
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
> > diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > new file mode 100644
> > index 0000000000000..e01e867e8c4da
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sam9x60 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> > +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> > +
> > +#include <dt-bindings/clock/at91.h>
> > +
> > +/* old from before bindings splitup */
> > +#define SAM9X60_PMC_MCK		PMC_MCK		/* 1 */
> > +#define SAM9X60_PMC_UTMI	PMC_UTMI	/* 2 */
> > +#define SAM9X60_PMC_MAIN	PMC_MAIN	/* 3 */
> > +
> > +#define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
> 
> IIUC, you want to have bindings per SoC, so why not adding proper
> constants here instead of including entire old binding header? The
> binding header should be entirely abandoned later.

Which binding header should be abandoned entirely?

The bindings per SoC idea was proposed in series v1 feedback.  I'm
neither a binding nor a clock expeert.  As far as I understood it's
important to keep the exact same values as before to not change any
ABI.  The non SoC specific values are still used on older SoCs of the
at91 family, so this is why I used the old constants for now.

These PMC indexes are not the only definitions in
dt-bindings/clock/at91.h however, there are more which are not SoC
specific.

I'd like some thoughts from the Microchip maintainers here,
what's their idea on how to proceed with the at91 clock stuff?

This works for me, but the current state is more or less still an idea
as base for discussion.  Please don't make it overly complicated, this
is not the primary focus of my work.

Thanks and greets
Alex

> 
> 
> Best regards,
> Krzysztof

