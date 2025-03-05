Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3676C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0B3ZSKU8Thdb+DdL5ImydUNO5oj/fKDSuZMh9fQ7K4=; b=fF8kguA0KWGyPpNgWdc3whXv+G
	u5Ed4N7/4EpWw/p2y944h9bfXjvFX+RXSUHLcsOJWD/9XFIlrDu1BksktC3P3Y6KRoSitoOWQJYfy
	Z90zNV+Alvsii4VKOBgG8KEmzPqsw28I4bn/gwNpzMBh0WXlsL7uOWiypaKWEQrAjXIw2YqRvAb8N
	KUJOOoy+AawY5FU/5uQQxitiZ2/Oc3RUAjiPb8IUsX/Hzmsl8VDQFaQshieGlHYx9hxSMbOuJA7Nv
	8ZaV6+PvZYmTgZvWT8bwM29ObECIIYx0JRGN21be3abMjgKbTL0g6XttLyvD/V5JgiSuSvroOK/dp
	/tslonpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoe1-00000008ABT-1qVt;
	Wed, 05 Mar 2025 13:18:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn1J-00000007sGn-2npd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:34:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5691D1007;
	Wed,  5 Mar 2025 03:34:48 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31DF23F673;
	Wed,  5 Mar 2025 03:34:33 -0800 (PST)
Date: Wed, 5 Mar 2025 11:34:30 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] dt-bindings: clk: sunxi-ng: document Allwinner
 A523 CCU
Message-ID: <20250305113430.47166de3@donnerap.manchester.arm.com>
In-Reply-To: <20250304141125.GA2518548-robh@kernel.org>
References: <20250304012805.28594-1-andre.przywara@arm.com>
	<20250304012805.28594-5-andre.przywara@arm.com>
	<20250304141125.GA2518548-robh@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_033437_798214_85C72A6C 
X-CRM114-Status: GOOD (  24.06  )
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

On Tue, 4 Mar 2025 08:11:25 -0600
Rob Herring <robh@kernel.org> wrote:

Hi,

> On Tue, Mar 04, 2025 at 01:27:54AM +0000, Andre Przywara wrote:
> > The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> > the main CCU.
> > 
> > The source clock list differs in some annoying details, and folding this
> > into the existing Allwinner CCU clock binding document gets quite
> > unwieldy, so create a new document for these CCUs.
> > Add the new compatible string, along with the required input clock
> > lists. This conditionally describes the input clock list, to make for
> > an easier patch adding the other CCUs.
> > 
> > Also add the DT binding headers, listing all the clocks with their ID
> > numbers.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../clock/allwinner,sun55i-a523-ccu.yaml      |  77 +++++++
> >  include/dt-bindings/clock/sun55i-a523-ccu.h   | 189 ++++++++++++++++++
> >  include/dt-bindings/reset/sun55i-a523-ccu.h   |  88 ++++++++
> >  3 files changed, 354 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> >  create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
> >  create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > new file mode 100644
> > index 0000000000000..2eacaeaeabac7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A523 Clock Control Unit
> > +
> > +maintainers:
> > +  - Andre Przywara <andre.przywara@arm.com>
> > +
> > +properties:
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun55i-a523-ccu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 4
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    minItems: 4
> > +    maxItems: 4
> > +
> > +required:
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +if:  
> 
> Put this under an allOf and use another 'if' instead of the 'else' 
> clause in the 2nd patch.

Ah, that's a neat idea! What do I do with the clocks and clock-names
above, then? Just have them as "true"?

Krzysztof, would you agree with this approach, and shall I still combine
both in just one patch?

Cheers,
Andre

> > +  properties:
> > +    compatible:
> > +      enum:
> > +        - allwinner,sun55i-a523-ccu
> > +
> > +then:
> > +  properties:
> > +    clocks:
> > +      items:
> > +        - description: High Frequency Oscillator (usually at 24MHz)
> > +        - description: Low Frequency Oscillator (usually at 32kHz)
> > +        - description: Internal Oscillator
> > +        - description: Low Frequency Oscillator fanout
> > +
> > +    clock-names:
> > +      items:
> > +        - const: hosc
> > +        - const: losc
> > +        - const: iosc
> > +        - const: losc-fanout
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    ccu: clock@2001000 {  
> 
> Drop ccu and it's 'clock-controller' not 'clock'.
> 
> > +        compatible = "allwinner,sun55i-a523-ccu";
> > +        reg = <0x2001000 0x1000>;
> > +        clocks = <&osc24M>, <&osc32k>, <&iosc>, <&r_ccu 2>;
> > +        clock-names = "hosc", "losc", "iosc", "losc-fanout";
> > +        #clock-cells = <1>;
> > +        #reset-cells = <1>;
> > +    };
> > +
> > +...  


