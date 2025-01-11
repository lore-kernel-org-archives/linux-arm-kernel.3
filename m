Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA4CE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p277N2zcOSFcrIl+0nU2lR3lgwZBU33+NKTXAlrVPD0=; b=dY93iwwKpi8TxbJrb9K6YJGYM0
	OopoaSuDHdVXE0A2spAmK0q1Mn1wiPO9yvLO55zOYteHFzoJpsCBxCG6ye6Vk+TxX7glB9/zdg5r2
	g3omElqVenwog8zlqUdD+NL+/IVWOkGrOnGGg4mUSAPTPidIuiImuRlml5QqD3r3ww6uQRdrQiVn1
	6bre1aj+4Em8t7TnuEX0q65UVlc/lKv/9APaSbqYfnXqArwI1ukRZ9RxsvlDz4nNOyLQ9pl1Db6CU
	sk7u3nWaJv/JMJQuQ3gtd4cRd3eeyU5rAKkSNCZ0bAebpq4Q28JOkY1X/umbVSISdrXwMtUGkxbHf
	+vXM2+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWeRW-0000000152U-0ttf;
	Sat, 11 Jan 2025 16:34:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWeQF-000000014v3-2tAq;
	Sat, 11 Jan 2025 16:33:18 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C8A5425B0A;
	Sat, 11 Jan 2025 17:33:07 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unQxvsKQvIgB; Sat, 11 Jan 2025 17:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736613183; bh=m33bPEFe8tV+b4Hv2+2AcKBR6ewzDTZegjr1D2kPCaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4INJEUMB2Ada9Fu+aAQjqUet9PPThcZKKuTMzUYBg5gw5wHyCjLtjSARq8Hr7mt9
	 nfUXWpNb6p6JNnEhQvbmp4PFC7xdKlwGeV5sgfzAQw9wteNKhIfTjOemWtbxWrnYuC
	 CacO2aMen8F+07Nun844liml2y1NJQWpIrOoRhGhwDtKzCvMnXJTHpnVGREHYIt7hq
	 vMIi5tcS7Xm0QWOYMJDuCvzlsRXvCG5XQpEINxHwT7mWhsQ3e25pp9NPN3Kt9OL8aM
	 wOH6mpQwq56uaGlAGKBqowHmGNfg5MvCd0EZH9qHNvrTx9QoLyqxVATNLv4M3+bEU2
	 J39OG0OkAyd6Q==
Date: Sat, 11 Jan 2025 16:32:52 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
Message-ID: <Z4KdNGPVpZxJXqxa@pie>
References: <20250108114605.1960-2-ziyao@disroot.org>
 <20250108114605.1960-3-ziyao@disroot.org>
 <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>
 <Z3-T3JwcsW0xYKvk@pie>
 <9caddd6a-fe1b-468a-ba1e-0513e46404dc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9caddd6a-fe1b-468a-ba1e-0513e46404dc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_083316_284726_667DBCDE 
X-CRM114-Status: GOOD (  29.68  )
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

On Fri, Jan 10, 2025 at 08:42:40AM +0100, Krzysztof Kozlowski wrote:
> On 09/01/2025 10:16, Yao Zi wrote:
> > On Thu, Jan 09, 2025 at 09:59:25AM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Jan 08, 2025 at 11:46:02AM +0000, Yao Zi wrote:
> >>> There are two types of clocks in RK3528 SoC, CRU-managed and
> >>> SCMI-managed. Independent IDs are assigned to them.
> >>>
> >>> For the reset part, differing from previous Rockchip SoCs and
> >>> downstream bindings which embeds register offsets into the IDs, gapless
> >>> numbers starting from zero are used.
> >>>
> >>> Signed-off-by: Yao Zi <ziyao@disroot.org>
> >>> ---
> >>>  .../bindings/clock/rockchip,rk3528-cru.yaml   |  67 +++
> >>>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
> >>>  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
> >>>  3 files changed, 761 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> >>>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
> >>>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> >>> new file mode 100644
> >>> index 000000000000..19dbda858172
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> >>> @@ -0,0 +1,67 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Rockchip RK3528 Clock and Reset Controller
> >>> +
> >>> +maintainers:
> >>> +  - Yao Zi <ziyao@disroot.org>
> >>> +
> >>> +description: |
> >>> +  The RK3528 clock controller generates the clock and also implements a reset
> >>> +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> >>> +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> >>> +  module.
> >>> +  Each clock is assigned an identifier, consumer nodes can use it to specify
> >>> +  the clock. All available clock and reset IDs are defined in dt-binding
> >>> +  headers.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: rockchip,rk3528-cru
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  assigned-clocks: true
> >>> +
> >>> +  assigned-clock-rates: true
> >>
> >> Drop both, totally redundant.
> > 
> > Okay, will fix in next version.
> > 
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: External 24MHz oscillator clock
> >>> +      - description: 50MHz clock generated by PHY module
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: xin24m
> >>> +      - const: gmac0
> >>
> >> gmac
> >> (unless you have gmac1 here as well but then please add it now)
> > 
> > RK3528 comes with two onchip gmacs. This input clock is only used for
> > the first one and I think keeping the number would give the reader an
> > extra hint. What do you think about it?
> You don't get the point. What clock is from this module perspective? gmac.

I'm not sure what "from this module perspective" means. If it's about
the source of the input clock, it's also gmac0 and gmac1 has nothing to
do with it. Pointing this out explicitly brings us (and the later
reader) only extra information.

And in the previous series, Conor mentioned[1],

> clocks should be named after how they're used in the IP in question,
> not the name of the source of that clock in the SoC.

Since its usage is exactly to generate clocks required by gmac0, as
confirmed by Heiko, I consider gmac0 appropriate and am willing to
make its description more clear.

Further explanation will be appreciated, thanks for your review.

Best regards,
Yao Zi

[1]: https://lore.kernel.org/linux-rockchip/20241001-name-stooge-7a939f71a08e@spud/

