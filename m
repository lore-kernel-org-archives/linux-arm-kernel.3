Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E772ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2LkM0CRhYlayStnyE7Z9rNgLXzgCPJgWeo/c0YwSv0=; b=euFEGV52oOAAlbJAB3nNxHyLpr
	ejm+C923nN5ILH3FYWvkVSyC31q7OkvKAsCDpx5ArNoKiBF72r1VHCXS8E+r9yy7/nfRQRdWboqon
	o2jmN/8LNWhnAKfhUpGV/lN228DRbOYBwuajKv6l9oT8hVm2l85JUXzPuYbTzKO1716hZWoKPdpNP
	wJttG2Uu2QW/DfmCWuTYSJzazjMpfvyGklZZr6bLKsU/LRm5cD438L0ftZDCcnjG7VP4wK85BWpUI
	he3GWG/uqHP6MqqZW5AthGQcjhj1u3DfXwGLyQtH5tZcal82yUe8sCZRd4MqBv09LdWlczNc+XLnh
	Zj5VHy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utl1H-000000068Rx-22Bu;
	Wed, 03 Sep 2025 10:47:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk50-00000005yfg-0NWY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:47:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D7E1595;
	Wed,  3 Sep 2025 02:46:52 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749973F694;
	Wed,  3 Sep 2025 02:46:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 10:46:44 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
Message-ID: <20250903104644.7359a86d@donnerap>
In-Reply-To: <20250903-meticulous-didactic-degu-621fe0@kuoka>
References: <20250903000910.4860-1-andre.przywara@arm.com>
	<20250903000910.4860-2-andre.przywara@arm.com>
	<20250903-meticulous-didactic-degu-621fe0@kuoka>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_024702_215896_81C55B5E 
X-CRM114-Status: GOOD (  32.63  )
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

On Wed, 3 Sep 2025 10:08:33 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

Hi,

> On Wed, Sep 03, 2025 at 01:09:06AM +0100, Andre Przywara wrote:
> > There are four clock controllers in the A523 SoC, but only three are
> > described in the DT binding so far.
> > 
> > Add a description for the CPU CCU, which provides separate clocks for
> > the two CPU clusters and the DSU interconnect.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
> >  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > index 1dbd92febc471..367d26800fd0d 100644
> > --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > @@ -19,6 +19,7 @@ properties:
> >    compatible:
> >      enum:
> >        - allwinner,sun55i-a523-ccu
> > +      - allwinner,sun55i-a523-cpu-ccu
> >        - allwinner,sun55i-a523-mcu-ccu
> >        - allwinner,sun55i-a523-r-ccu
> >  
> > @@ -64,6 +65,30 @@ allOf:
> >              - const: iosc
> >              - const: losc-fanout
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - allwinner,sun55i-a523-cpu-ccu
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: High Frequency Oscillator (usually at 24MHz)
> > +            - description: Low Frequency Oscillator (usually at 32kHz)
> > +            - description: Internal Oscillator
> > +            - description: Peripherals PLL 0 (1200 MHz output)
> > +            - description: Peripherals PLL 0 (600 MHz output)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: hosc
> > +            - const: losc
> > +            - const: iosc
> > +            - const: pll-periph0-2x
> > +            - const: pll-periph0-600m
> > +
> >    - if:
> >        properties:
> >          compatible:
> > diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> > new file mode 100644
> > index 0000000000000..042f2310f64de
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h  
> 
> Filename based on compatible.
> 
> 
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +/*
> > + * Copyright 2025 Arm Ltd.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> > +#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> > +
> > +#define CLK_CPU_L		7
> > +#define CLK_CPU_DSU		8
> > +#define CLK_CPU_B		9  
> 
> I don't see the header being used by the driver and odd numbers (they
> should start from 0 or 1) suggest these are not bindings.

This header is included by the private header (at the end of patch 4/5).
The private header is then included by the driver.
Happy to change that, but that's the pattern used in all the other drivers.

Those numbers represent the publicly exposed clocks, the other clocks are
internal. Having gaps in those numbers is somewhat common in sunxi-ng
(check sun50i-h616-ccu.h). This large gap at the beginning here is mostly
due to the somewhat extreme design of this CCU, which requires quite some
helper clocks to get to the actual ones.
We could sort the identifiers to have the public clocks first, but
that would only be the case until we discover a missed clock (which seems
to happen from times to times). And again, that's the pattern used in the
sibling drivers, so I'd rather stay consistent here.

Cheers,
Andre

> Otherwise please explain in commit msg what exactly are you binding
> here.
> 
> Best regards,
> Krzysztof
> 


