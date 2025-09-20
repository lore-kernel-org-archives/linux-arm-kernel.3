Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5344ACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW17lv89eSJE61jE0VgMo7IK1f6MgMq0qzbJdrYGhAU=; b=t6OHedrNAV2E9gJLpSlBYAOd6i
	9YldOkM/drOectrLmvguMz2KcqyuO4ODigp2RW4bNI3QbP7cCz/Qt88WDWNgCyu7QqpY/7xEhvq6I
	allWQP3Mqn47u6a+PLCGqqcH8cHHUAj+ZOdo/6wneu7T/dGJd6cyhbORkDqcyQENSdpy2eBB9mVrj
	+joGhfV+zokvOkxIq3RpxnSvHp5sYtpLHfx3ptOpbBWqZJgkOmSz8H/bD7ZNeI3nQXsQp+VGvAToY
	RzMgze7YjEseqa+dx5dYaXsRSOdIBaKYKBkY890E1/BVkH3EmlUFmlAsjEYXX9g7HwWIflP9BvFpy
	F/eVrx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrWN-00000004uqb-0Vtu;
	Sat, 20 Sep 2025 06:56:35 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrWK-00000004uq8-2upr;
	Sat, 20 Sep 2025 06:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758350983; bh=AW17lv89eSJE61jE0VgMo7I
	K1f6MgMq0qzbJdrYGhAU=; b=Mu0WT1kUgl5cQlQ5PX2jRN2PMPq/dDr7fRG/j6P0q/F6ULS3KE
	xoivzs0uuNLw4YbnCqJ/RpZ/PfDofasRt6XK59LmkyQwhHfrYQs5bo3vCn4BfUfSMZCWKBpoxJV
	vMP/Z2Sr8hc2GauwgD00WGBgzerVfzWAzFlX2DTdBLXVaGuNIxQ6AhMRvo9an2gF8HJZ+IlipSj
	ZFbt0CEcr+vfPWQLXzlDP1a7ZwX8LCwXd9Zavc+fRk0VUvcp2Vr1vhIGSK2ElWRDGPsIfvXrcrb
	5MpdxFv/SmLCVSnaS9Ly+kcSIAagZt63ASSYPlG0/PYmKuYDp+HZCucRJi734fkCYdQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758350983; bh=AW17lv89eSJE61jE0VgMo7I
	K1f6MgMq0qzbJdrYGhAU=; b=sb2pc5UTtihwQjvou4NnnaSmANU2soJblZAj9CMKygiR43FHTi
	g56bTIeDIQPJ5/5lGPQJtPn7nlgAN0FmJpBw==;
Date: Sat, 20 Sep 2025 13:49:34 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Conor Dooley <conor@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 05/25] dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
Message-ID: <cr5gkkckxan2b2x23knfwb35a4ulngsp6gguqhcku3z6ghzkcn@cq4krj5qxy3r>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <20250917-rda8810pl-drivers-v1-5-74866def1fe3@mainlining.org>
 <20250917-contort-sassy-df07fd7515a0@spud>
 <c905fb3ace281280f1ac11c7fbe8e0aa@mainlining.org>
 <20250918-unharmed-bloating-8b573513fce6@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-unharmed-bloating-8b573513fce6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_235632_876221_1B247193 
X-CRM114-Status: GOOD (  22.54  )
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

On Thu, Sep 18, 2025 at 04:18:25PM +0100, Conor Dooley wrote:
> On Thu, Sep 18, 2025 at 11:11:10AM +0700, Dang Huynh wrote:
> > On 2025-09-18 03:46, Conor Dooley wrote:
> > > On Wed, Sep 17, 2025 at 03:07:22AM +0700, Dang Huynh wrote:
> > > > Add documentation describing the RTC found in RDA8810PL SoC.
> > > > 
> > > > Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> > > > ---
> > > >  .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    | 30
> > > > ++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> > > > b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..3ceae294921cc3211cd775d9b3890393196faf82
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> > > > @@ -0,0 +1,30 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/rtc/rda,8810pl-rtc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: RDA Micro RDA8810PL Real Time Clock
> > > > +
> > > > +maintainers:
> > > > +  - Dang Huynh <dang.huynh@mainlining.org>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: rda,8810pl-rtc
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > 
> > > Your driver implements functions that turn on an alarm irq, but there is
> > > none mentioned here. What's going on there?
> > The RTC doesn't seem to have an AP IRQ associated. I can't find any
> > reference to it on downstream kernel and the docs.
> > 
> > > 
> > > Additionally, there's no clocks property? For an onboard RTC I'd have
> > > expected there to be a clock sourced outside of the block.
> 
> What about the clock?
I'll fix this in v2.

> 
> > > 
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    rtc@1a06000 {
> > > > +      compatible = "rda,8810pl-rtc";
> > > > +      reg = <0x1a06000 0x1000>;
> > > > +    };
> > > > 
> > > > --
> > > > 2.51.0


