Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA58DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5M7Vwq3vPNXFx3Y80ZtwPFH+1emkyTe/+TzCV6/qris=; b=CXKLARf6flq9HYtQoh3FX4hJvC
	xoPSdiF49bPMphGsHc82gTa3nVqDPHNz4uNr5PyU30nW0Q0TvqIWRK+b8sB28XWPE/S57HoQ/CDOL
	+qDYi1Vtpcl5ExxEj43bo73JWpZ8OzjHwaux5cEfcSWyWK1zSKHvFHz5QbUWPxhcQMhzEkaa6LGq3
	76XOPkglOKw4KLYpgysyGBbYzsDlyFPBNFwActQHtxFfVe45aPGEQhHf+wm3R4cYfUzjKJu25AwSK
	/oPPorDl6rYUe/Iuf6pleuqRey4ERK0DRb6+vyURlYlFxmO3v75E49vlI448nGtCmwDMd59RpCjll
	P4Go+jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUoM-0000000Cvi3-0q5W;
	Mon, 24 Feb 2025 09:31:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUT0-0000000CpYT-054y;
	Mon, 24 Feb 2025 09:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5M7Vwq3vPNXFx3Y80ZtwPFH+1emkyTe/+TzCV6/qris=; b=R+QVTnMSw7oi9Bpt0LYcT9UKq4
	S6qh/hExWGY2MjGrAJXZ/UJskhRHgBhj7NUc8YCb3yyXdogA+XM46XRTwGYtaqlpzCddUycQ8lzsc
	sEzsEzeaR1HNprpcfA6U1gcWl0A4r2udHsy5rky6or/YSAao6UgyyY10qEc8ZFiX1IPVFvpAWy7qE
	EOBGQxYwKIh4P4TOHMiTHxf24QgzXBFZQWRYKsdUsFQZZBbe9X3WuP+FDdIivF+dF/rYq7QkMdHcV
	zwgrnMRfH8orgTr+O/6F04Xv+AyGhBl178+B/g5mZgDJXW1U9WCwepbxYIHlhJIE0X69qJ/C9JGKR
	lmKWR6uA==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmUSw-0006ts-IJ; Mon, 24 Feb 2025 10:09:30 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <ziyao@disroot.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Document clock and reset unit of
 RK3528
Date: Mon, 24 Feb 2025 10:09:29 +0100
Message-ID: <49730692.MN2xkq1pzW@diego>
In-Reply-To: <20250217061142.38480-6-ziyao@disroot.org>
References: <20250217061142.38480-5-ziyao@disroot.org>
 <20250217061142.38480-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_010934_060266_4375CFFE 
X-CRM114-Status: GOOD (  20.96  )
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

Am Montag, 17. Februar 2025, 07:11:42 MEZ schrieb Yao Zi:
> There are two types of clocks in RK3528 SoC, CRU-managed and
> SCMI-managed. Independent IDs are assigned to them.
> 
> For the reset part, differing from previous Rockchip SoCs and
> downstream bindings which embeds register offsets into the IDs, gapless
> numbers starting from zero are used.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/clock/rockchip,rk3528-cru.yaml   |  64 +++
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
>  3 files changed, 758 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> new file mode 100644
> index 000000000000..5a3ec902351c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3528 Clock and Reset Controller
> +
> +maintainers:
> +  - Yao Zi <ziyao@disroot.org>
> +
> +description: |
> +  The RK3528 clock controller generates the clock and also implements a reset
> +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> +  module.
> +  Each clock is assigned an identifier, consumer nodes can use it to specify
> +  the clock. All available clock and reset IDs are defined in dt-binding
> +  headers.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3528-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:

I do think this needs a
    minItems: 1
    maxItems: 2
or similar.

xin24m is the main oscillator everything else is supplied from, so is
absolutely required, but that gmac0 supply comes from an (probably)
optional clock supply from a mac phy?

So is possibly not available on a system without ethernet hardware?


Heiko



