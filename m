Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178BBC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WzGUY491awzdAlZM6EGgKTchb38mELIBf7/JrkbOFI=; b=PC9eGWBlBJLhgabXOFRnKqFnr+
	kz5DfNdC4EbRRH9/Iuw8XllHhzmWdYThKTFE4//+9tl7GymAXgqdiFyhL3D9ksMrLLTE/T4c1tUvW
	oIBZxnF50+ib7GkkeRxt/c0OhWsE9rF1ediBQHP73efSl8C3lX8k4R/TuekvtTU5r0UbifEJY3nDL
	Na9ZR+UnztEuxz+C61jINMEBEO/LZi4Cv1fjPfjsUYba3rSBw7x90SL51amL0nPW9LmVe2rGQSvQZ
	sdHy+vG6pvlCiwTUZDX4PUdZuI5cQJFUPWrx2g1dcvuBqLqIxI8BFWg/8eqjB0NneEIgIU9KgQk0J
	ttQFaiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPfZ-00000004DSJ-0J6l;
	Tue, 04 Mar 2025 10:38:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPdw-00000004Cxm-32fL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:36:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A01C3FEC;
	Tue,  4 Mar 2025 02:37:09 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01D2B3F5A1;
	Tue,  4 Mar 2025 02:36:53 -0800 (PST)
Date: Tue, 4 Mar 2025 10:36:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] dt-bindings: clk: sunxi-ng: document Allwinner
 A523 CCU
Message-ID: <20250304103650.704fd28b@donnerap.manchester.arm.com>
In-Reply-To: <20250304-resilient-spiritual-crane-30d4e1@krzk-bin>
References: <20250304012805.28594-1-andre.przywara@arm.com>
	<20250304012805.28594-5-andre.przywara@arm.com>
	<20250304-resilient-spiritual-crane-30d4e1@krzk-bin>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_023656_865814_725E6105 
X-CRM114-Status: GOOD (  26.51  )
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

On Tue, 4 Mar 2025 09:25:24 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

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
> 
> Drop, redundant.
> 
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    minItems: 4
> > +    maxItems: 4  
> 
> Drop both and instead you need to list the items.

> 
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
> Drop, you have here only one device, no need for if:then.

I know, and I do understand the redundancy of the minItems/maxItems above,
but as I wrote in the commit message, this paves the way for the follow up
patch and makes both more readable.
Apart from helping with the review, I didn't want to conflate both devices
into one patch, I think I saw people complaining about that in the past.

If you are fine with having them both added all in one go, I am happy to
just squash the patches.

Cheers,
Andre

> 
> Best regards,
> Krzysztof
> 


