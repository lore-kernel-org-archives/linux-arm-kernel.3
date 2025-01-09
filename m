Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426F2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6zb0OhlfmF9gSa4+JBxd9Zk/f3SlG4gbriSxMO5M08=; b=gY8/NkeFIG8Tc8ZHJFoMW4Cep/
	DiV5SJXkyThfnyB3eyXsFqS3oEvIs7glZNKDcF9TYI6pwD75IwWdOXpUijVP4tg6mLr0iiR/fihhB
	GdO9avbIROTbctxDwABfzVJZfYySg4hwPN9PeyMtpamHqLfVq7g/2C4f44Qvxaw9nsSQfx8bhZK9J
	umB8Bvt3IxL3WGNImjoYti6h0V8lWgbagIT5dO6mIqcg1vNY1JVrK9cw5VCA1N9NCwnCTeR8YCicG
	TCuUv2SSQ2te2S4IKW59kRSU3eNTNb8WBUcp5g69Mw6T8A/SDwolcflCQasXsnipqSj9Wq1c9Fkfw
	buslJjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVquJ-0000000BkzN-480c;
	Thu, 09 Jan 2025 11:41:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqt6-0000000BkjX-0PG0;
	Thu, 09 Jan 2025 11:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I6zb0OhlfmF9gSa4+JBxd9Zk/f3SlG4gbriSxMO5M08=; b=w+1Ei6El/fwT3nz6n9ABJ/UA0I
	SVxnSWUyGHOcSpm0m+Q3SkfSK/C/KbAV3lb8raug+8klFZ/uG8aO6Bmt3yQNypnWv8YjKEEADhZX5
	aDXlflKxbv6a6e5Wh5nK2yI3xaQUfg6PjU80yL4K2s5LvvApScOb+IzbhvCdSIHjeofqm+pJyjNXK
	ecnMpoo73Yll9B4SlfzOqEYvyqx/T2z5hPxKbRaZrbNQr+Ja09A+OT4DHUh6NgiiDkYrT/DthU2O9
	OuA3FNu3id8ure667EK4D7t2Jadih9jxSuTkpY7gQSYCbjC/EvQLWn72NAvuvZ1rFnlzWmOY3Gr68
	UWczEhHg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVqt0-0001FD-E7; Thu, 09 Jan 2025 12:39:38 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Document clock and reset unit of
 RK3528
Date: Thu, 09 Jan 2025 12:39:37 +0100
Message-ID: <1774158.yIU609i1g2@diego>
In-Reply-To: <Z3-T3JwcsW0xYKvk@pie>
References: <20250108114605.1960-2-ziyao@disroot.org>
 <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>
 <Z3-T3JwcsW0xYKvk@pie>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_033944_160885_65E996BE 
X-CRM114-Status: GOOD (  32.48  )
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

Am Donnerstag, 9. Januar 2025, 10:16:12 CET schrieb Yao Zi:
> On Thu, Jan 09, 2025 at 09:59:25AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, Jan 08, 2025 at 11:46:02AM +0000, Yao Zi wrote:
> > > There are two types of clocks in RK3528 SoC, CRU-managed and
> > > SCMI-managed. Independent IDs are assigned to them.
> > > 
> > > For the reset part, differing from previous Rockchip SoCs and
> > > downstream bindings which embeds register offsets into the IDs, gapless
> > > numbers starting from zero are used.
> > > 
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  .../bindings/clock/rockchip,rk3528-cru.yaml   |  67 +++
> > >  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
> > >  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
> > >  3 files changed, 761 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > >  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
> > >  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > > new file mode 100644
> > > index 000000000000..19dbda858172
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > > @@ -0,0 +1,67 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip RK3528 Clock and Reset Controller
> > > +
> > > +maintainers:
> > > +  - Yao Zi <ziyao@disroot.org>
> > > +
> > > +description: |
> > > +  The RK3528 clock controller generates the clock and also implements a reset
> > > +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> > > +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> > > +  module.
> > > +  Each clock is assigned an identifier, consumer nodes can use it to specify
> > > +  the clock. All available clock and reset IDs are defined in dt-binding
> > > +  headers.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: rockchip,rk3528-cru
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  assigned-clocks: true
> > > +
> > > +  assigned-clock-rates: true
> > 
> > Drop both, totally redundant.
> 
> Okay, will fix in next version.
> 
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: External 24MHz oscillator clock
> > > +      - description: 50MHz clock generated by PHY module

you could adjust the description to something like
	50MHz clock generated by PHY module only for gmac0
or so, to make it more clear where that signal goes to.

> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: xin24m
> > > +      - const: gmac0
> > 
> > gmac
> > (unless you have gmac1 here as well but then please add it now)
> 
> RK3528 comes with two onchip gmacs. This input clock is only used for
> the first one and I think keeping the number would give the reader an
> extra hint. What do you think about it?

I would agree here. Looking through the TRM registers, gmac0 gets _only_
supplied from that external input, while gmac1 only gets supplied from
a number of internal sources (different sources for gmac1-specific clocks)

Heiko



