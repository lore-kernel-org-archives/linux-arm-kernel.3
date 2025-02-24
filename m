Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FEFC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pzZ+yQ9qjODtJTG2NK3F9wYEK1qZou6QqVFP1WtAT0=; b=20/2hhAbY6/jhk7GQItpIoUlcb
	/L5PB0rqYSvvqHLwJDaDmzPIVCnMMFe7wi+g9jUhlCLfDHwoLv/WFMLWeTwtoPrfwUH4NGzrHKgn7
	friZwThO/umOOrV9MBZ+SzoZFyZMl/GRs3RZqouZrqax06u68ngVhd3+gvwz0JzlJmNJ2JrsZliOh
	eIoAb8Z029vJmWkMC7VsihXO3skoxWu/8xgYEzMGH2hyDYQXTLTIbOsgGZ3Q1YoLLOGivGDlTD6o7
	MU+8zo9tDit7eyYTk4czXP06YLI6daTX3WvfgHsoJKr2wKHTbdMtOnmxN9v2dngv5AL7UOAnGkAPP
	fG+fNbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcWv-0000000EgLv-3g5N;
	Mon, 24 Feb 2025 17:46:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcMf-0000000EeEO-3RlP;
	Mon, 24 Feb 2025 17:35:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8F22F20648;
	Mon, 24 Feb 2025 18:35:26 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpJm_5OANzFD; Mon, 24 Feb 2025 18:35:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740418522; bh=i22IAVTAO3pfY8ToQVg8JT04CAxa2kXTVUFL+IbTL4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QGUA3CWNEtsRmDhqYaetzRpV0soYfzkz79PxMxPeaRXJWW4GyiEwwFeTT45fLax0/
	 Lut4N6ImQA4vC+2KCo8dj7hzusdpwlsInDUv5G2+Tb5Kmm+DdTZPkLsMpxqZJ4zq21
	 ZWKvvM+UJm2OWg6y01Mnx9U0XxSyP5ZpMOcNSMkaaYG/qX8u6H4NG5Yqmh10QmL8ZC
	 e8IJgCZwx0Pe89RPOJ+kqL4yVZMegp6ERK9TXvsnnEwCKU0M6bq1b54gnLKvDRuiW7
	 +p+naZHib8SsDhKaoVeTWTMM4mhvRVquQfwRK6bpzKcpMPMXSkDp3dAruNd7Tud1jr
	 7RlyLgyRbn0YQ==
Date: Mon, 24 Feb 2025 17:35:04 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
Message-ID: <Z7ytqSQkwwi3RmB9@pie.lan>
References: <20250217061142.38480-5-ziyao@disroot.org>
 <20250217061142.38480-6-ziyao@disroot.org>
 <49730692.MN2xkq1pzW@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49730692.MN2xkq1pzW@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093534_282753_D44EA458 
X-CRM114-Status: GOOD (  27.65  )
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

On Mon, Feb 24, 2025 at 10:09:29AM +0100, Heiko Stübner wrote:
> Am Montag, 17. Februar 2025, 07:11:42 MEZ schrieb Yao Zi:
> > There are two types of clocks in RK3528 SoC, CRU-managed and
> > SCMI-managed. Independent IDs are assigned to them.
> > 
> > For the reset part, differing from previous Rockchip SoCs and
> > downstream bindings which embeds register offsets into the IDs, gapless
> > numbers starting from zero are used.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/clock/rockchip,rk3528-cru.yaml   |  64 +++
> >  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
> >  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
> >  3 files changed, 758 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> >  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
> >  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > new file mode 100644
> > index 000000000000..5a3ec902351c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip RK3528 Clock and Reset Controller
> > +
> > +maintainers:
> > +  - Yao Zi <ziyao@disroot.org>
> > +
> > +description: |
> > +  The RK3528 clock controller generates the clock and also implements a reset
> > +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> > +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> > +  module.
> > +  Each clock is assigned an identifier, consumer nodes can use it to specify
> > +  the clock. All available clock and reset IDs are defined in dt-binding
> > +  headers.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3528-cru
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> 
> I do think this needs a
>     minItems: 1
>     maxItems: 2
> or similar.
> 
> xin24m is the main oscillator everything else is supplied from, so is
> absolutely required, but that gmac0 supply comes from an (probably)
> optional clock supply from a mac phy?
> 
> So is possibly not available on a system without ethernet hardware?

I don't think so. By the CRU commit message[1] in the vendor driver, the
"phy module" should mean the integrated phy for GMAC0,

	The io-in clocks are module phy output clock, gating child
	clocks by disabling phy output but not CRU gate.

	Add gmac0 clocks. They are all orphans if clk_gmac0_io_i is not
	registered by GMAC driver. But it's fine that GMAC driver only
	get it but not to set/get rate.

(gmac0 is called "clk_gmac0_io_i" in the vendor driver).

Taking that both the upstream and downstream Rockchip GMAC glue (GMAC
driver) takes some care of the integrated phy, if the clock is an
out-of-SoC supply, the second paragraph sounds less sensible: the clock
should be registered by the external PHY instead of the GMAC driver in
this case.

And there cannot be a case that an integrated clocksource is missing.

> 
> 
> Heiko
> 
> 

Thanks,
Yao Zi

[1]: https://github.com/rockchip-linux/kernel/commit/16f512f1e10375dc48aa6c26cedeb7079aba01de

