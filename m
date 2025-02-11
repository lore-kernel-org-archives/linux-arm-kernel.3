Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0ADC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYs4aAcJHRJkvxcIeHsULbx8GQp917z9kJzRH+pky5g=; b=inKfjF+j0PR7mWIAzx307kTkvs
	ZXek9U+HPsEfU+AjhQOBBuq4JT2s97bcAp1ZTSdQCZfrXZwK7FdZLWpx+gzJM9MiODQ5tcHQKjc0R
	l3cdCTDTE33Gdu/rK84THSI9NipVkFOWLNAe9MkLXHlspEulqZybNw1UnwXzBLnsXsNWowrllZ7nB
	0qurUNMkG8nDl2zaLqaVtGSIVr7wU9KJmCu1r8cE26cLOQ1HsM3i8A1a2FyJ9qHvInXOBudbu77cf
	z+TPfVmuPMrx9x/cCt864teb431dFL0/WZMZ7PABRi7C2KcENJO0m+bx6BvZFq48nmPYFRKpEw7VW
	EUjMbrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkgL-00000002pTD-00hh;
	Tue, 11 Feb 2025 07:27:45 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkev-00000002pJa-0XT5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:26:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C04914802D4;
	Tue, 11 Feb 2025 08:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739258774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYs4aAcJHRJkvxcIeHsULbx8GQp917z9kJzRH+pky5g=;
	b=wlhlPoTsjWnIE1TnJpa4gc8z69bjupLBcLpg3tULPnmnMK3ESwl93cxYL3s/uveVJ2eDPV
	WuGtImGJhZf7W0YOdqGxHftl19rIlXL3GDGN3N/5sqB5rNw4FzNQ1FCPqBPyBFe81CGm1W
	MLyJQeg4MHlGJbdu40Xiswyzvo/hKa3Bi/rIkKZtYa/SQOl9m//foimXIAN792EA6mYDyZ
	FYLZ7j4Yrka9oI4oGlHBpF+cplMyk/nRX81AzOrkrY7/MkQc1NFFTtml8iI4wtu7cjqSEc
	WIKLcCYvXrs79+3sCLgUCP6gnJfr1Kuuz32MDKokrhgMLb23D92kdwVmPgC9Iw==
Date: Tue, 11 Feb 2025 08:26:11 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 04/16] dt-bindings: clock: at91: Allow referencing
 main rc oscillator in DT
Message-ID: <20250211-deprive-relocate-353ad26f46b7@thorsis.com>
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
 <20250210164506.495747-5-ada@thorsis.com>
 <89d51ac4-0690-42a7-b5fb-2887363e8a8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d51ac4-0690-42a7-b5fb-2887363e8a8b@kernel.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_232617_328730_C75D20B4 
X-CRM114-Status: GOOD (  25.98  )
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

Hello Krzysztof,

Am Mon, Feb 10, 2025 at 06:07:10PM +0100 schrieb Krzysztof Kozlowski:
> On 10/02/2025 17:44, Alexander Dahl wrote:
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
> >     v2:
> >     - new patch, not present in v1
> > 
> >  include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 3 +++
> >  include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 3 +++
> >  include/dt-bindings/clock/microchip,sama7d65-pmc.h | 3 +++
> >  include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 3 +++
> >  4 files changed, 12 insertions(+)
> > 
> > diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > index e01e867e8c4da..dcd3c74f75b54 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > @@ -16,4 +16,7 @@
> >  
> >  #define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
> >  
> > +/* new from after bindings splitup */
> > +#define SAM9X60_PMC_MAIN_RC	6
> 
> This is confusing me, because:
> 1. You still have holes in IDs

Yes, I was told to maintain the old values for interface stability in
series v1 feedback.

> 2. This should be placed in proper order by ID

Okay, no problem.

> 3. Why not using 4 - the next available empty ID?

The MAIN_RC clock is used on four out of thirteen (?) SoC variants
which all used the same IDs before.  6 is the first ID which is free
on all of sam9x60, sam9x7, sama7g5, and sama7d65.  The last two
already use 4 for a different clock.

The whole splitup is to avoid even more and/or bigger holes, but is it
important where the existent holes are filled?

Technically if the next available empty ID should be used it would be
4 for sam9x60 and sam9x7, 2 for sama7d65, and 6 for sama7g5.  I
thought it would be nice to use the same value instead to make
somewhat compatible to the old approach.

Greets
Alex


