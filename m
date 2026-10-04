Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA33CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBef/T7kqIDXgJTIB3F2cHjk1f6Ku17sV1wYZEl8TXA=; b=u8+T3ZJ/Nqj9/rIyYWLAZ3FUfY
	BO0FZ+heJpJcO+asebFHMu4+SvXmhBTxDcMshO+v515kqEu99WAIi/hmZDaG8A6TGkP27LcPqzvCn
	iazvYtoQ/8bgWKIR69WAh5/3P/ysXY2JNAK0swYDX3NxhXF+cdhkLDxUNGaTEsoQZyITRvv8OSZ14
	se3KvW9XsF7dzCpeAxCZVRqTnNdDv3CoUfqdMuBK8lXocShkKssyybAL7o9+Sh+hFPGOpbuM64YdK
	BZfBhW4M+Sj35hRBQWU1lsjLPddnycotdOA/HVXx2NCOplFqi81TAeup1Bar6VL9Iil2mo+DzFIHG
	x+ZKTYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDV7Q-0000000FSBJ-0p7N;
	Sun, 04 Oct 2026 22:55:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDV7J-0000000FSAo-0R7o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:55:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72DDA152B;
	Sun,  4 Oct 2026 15:55:31 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 221903F763;
	Sun,  4 Oct 2026 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791154534; bh=RDHP23Rz1AtuQ5UyF09iEJjPkzDkAng7PEW+9RHDvPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JaTtcy6oNNVU5GcCEw5dj7YeY8yWboSgWEZODnBbbiKJSEl7l0oge7rFRLXTsCpYk
	 YmGZEzDhfwv4qczCg8+cwyzbuQHSmlQ3k73krrHLbi2ahyPjA9O+gPKvpSq72umIm2
	 oIDa2hTHT2elg/B9Zuvpz0Y/y02NjWaoII8vDTLE=
Date: Mon, 5 Oct 2026 00:50:36 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: sun55i-a523-ccu: Add A523
 CPU CCU clock controller
Message-ID: <20261005005036.7fd5e60e@ryzen.lan>
In-Reply-To: <20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
References: <20260925225112.14081-1-andre.przywara@arm.com>
	<20260925225112.14081-3-andre.przywara@arm.com>
	<20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_155537_326588_EA765225 
X-CRM114-Status: GOOD (  28.70  )
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

On Tue, 29 Sep 2026 10:42:29 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

Hi Krzysztof,

thanks for the review!

> On Sat, Sep 26, 2026 at 12:51:10AM +0200, Andre Przywara wrote:
> > There are four clock controllers in the A523 SoC, but only three are
> > described in the DT binding so far.
> > 
> > Add a description for the CPU CCU, which provides separate clocks for
> > the two CPU clusters and the DSU interconnect.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../clock/allwinner,sun55i-a523-ccu.yaml      | 38 ++++++++++++++++++-
> >  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 +++++++
> >  2 files changed, 50 insertions(+), 1 deletion(-)
> >  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > index 58be701a720ea..8d5481fb63ae8 100644
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
> > @@ -35,12 +36,23 @@ properties:
> >  
> >  required:
> >    - "#clock-cells"
> > -  - "#reset-cells"
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> >  
> > +if:
> 
> This goes to the allOf block.

OK.

> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: allwinner,sun55i-a523-cpu-ccu
> > +then:
> > +  properties:
> > +    "#reset-cells": false
> > +else:
> > +  required:
> > +    - "#reset-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -64,6 +76,30 @@ allOf:
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
> Filename should match compatible.

Is that a new requirement? We never did this for the Allwinner clock or
reset bindings, all headers are named like sun<x>i-<soc>-<name>-ccu.h.
And I think especially since we have sun55i-a523-mcu-ccu.h and
sun55i-a523-r-ccu.h, I think we should stay consistent, at least for
the existing SoCs.

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
> 
> Indices start from 0 or 1

This is also something very common for Allwinner clocks: the CCU has
clocks that are not exposed to the DT, because they are internal
clocks we need to model the clock tree. We number them logically,
and often the basic clocks are not exposed. See sun50i-a64-ccu.h,
sun50i-h616-ccu.h, sun8i-h3-ccu.h, to just name a few (there are many
more). The other clocks are named in the internal headers, in the
clock driver directory.

Cheers,
Andre

 
> 
> Best regards,
> Krzysztof
> 
> 


