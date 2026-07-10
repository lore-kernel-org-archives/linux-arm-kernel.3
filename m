Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0233FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLRr85CNC1eO28rwGXWbZFk7lEDMqIoxiSt+2izE2og=; b=NKrsujNJMb2BtsL60F9esJROR/
	4Hykvll/v2KV3qCHCEn9Nzzu5shB5AUHUCKn8aaKqPR49huNqB6iIc6YyjQeIk/s3oWXYp/JBaPbD
	+tN7P80DFNGTwufJomjchVWAukbnw4t8qcdzuYNdhC1EILnulNQ4Bte/CTOZQGfKTh3TrPgDOHYN1
	IknhhnTvND9+PZOtwCytRJL1UN1O39Kp+UuxW9bp+yl2U2IogBXo1FLuET+uO4ba9LBfW5Bi2QQko
	Auob3Pbh/n5MhHTETzM5J6WEmFemI5j1E94QJBiWnLtq8bfUkjPDJ1jMDHhm6yOwTQnDnvctltNus
	O9AfkzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH25-00000005cTM-0DZE;
	Fri, 10 Jul 2026 19:37:09 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH21-00000005cSI-3a1o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783712224;
 bh=PLRr85CNC1eO28rwGXWbZFk7lEDMqIoxiSt+2izE2og=;
 b=dWfur9OUXtBUerOGWMefPDfKh6K8m7Mv3+vDPoBQfOx4G6wPfSx0LhdD5BWVrYvx90BmmCjR2
 TiXWdms9w85mxW3aCYWq+aOEP9GUay9dfWFm2NUv2e223+NRjDYxXtMP2Y8WeLLYu1HASkWrl6J
 9WDXg2lajkyH+9IQI9U7DKC0giLG1YQKHKU2tSP9ytj0FFrROGyhI2GxNpHgdioZ8RXg4gxmsHY
 repYMtQ2PZZ8OQjAu/wlk9OD+89N07iC3fY1xM6HB8i+oZblGJ/xOkGAbpbeO6ztvfVDVc9J74v
 5f9mdjsm4UKB3cYI8CTLePYbep2ptxHgaaZhAIEwOw6Q==
X-Forward-Email-ID: 6a5149dcf640ad60663f0665
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2a6f03c3-32e1-4d73-857d-1301d7c39fcc@kwiboo.se>
Date: Fri, 10 Jul 2026 21:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] dt-bindings: clock: rockchip: Add RV1106 CRU
 support
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@nabladev.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Brian Masney <bmasney@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, huang lin <hl@rock-chips.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-2-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-2-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_123706_226231_09483D6D 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Simon,

On 7/6/2026 9:57 PM, Simon Glass wrote:
> Add the clock binding header and schema for the Rockchip RV1106 clock
> and reset unit. The clock IDs match the numbering used by the vendor
> kernel so that existing devicetrees keep working. The header also
> covers the GRF clock controller, which provides the MMC drive and
> sample phase clocks.
> 
> The RV1103 is a package variant of the RV1106 and uses the same CRU.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  .../bindings/clock/rockchip,rv1106-cru.yaml   |  59 ++++
>  .../dt-bindings/clock/rockchip,rv1106-cru.h   | 301 ++++++++++++++++++
>  2 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
> new file mode 100644
> index 000000000000..884a4a8bb0fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rv1106-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RV1106 Clock and Reset Unit
> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  The RV1106 clock controller generates the clock and also implements a
> +  reset controller for SoC peripherals.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rv1106-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xin24m
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon managing the "general register files" (GRF),
> +      if missing pll rates are not changeable, due to the missing pll
> +      lock status.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ff3b0000 {
> +      compatible = "rockchip,rv1106-cru";
> +      reg = <0xff3b0000 0x20000>;
> +      rockchip,grf = <&grf>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/rockchip,rv1106-cru.h b/include/dt-bindings/clock/rockchip,rv1106-cru.h
> new file mode 100644
> index 000000000000..acbf9c1ee6af
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h
> @@ -0,0 +1,301 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co. Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RV1106_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RV1106_H
> +
> +/* pll clocks */
> +#define PLL_APLL		1

Clock indices should start at 0 and be a continuous enumeration.

> +#define PLL_DPLL		2
> +#define PLL_CPLL		3
> +#define PLL_GPLL		4
> +#define ARMCLK			5
> +
> +/* clk (clocks) */
> +#define PCLK_DDRPHY		11

As mentioned above, indices should be a continuous enumeration.

> +#define PCLK_DDR_ROOT		12
> +#define PCLK_DDRMON		13
> +#define CLK_TIMER_DDRMON	14
> +#define PCLK_DDRC		15
> +#define PCLK_DFICTRL		16
> +#define ACLK_DDR_ROOT		17
> +#define ACLK_SYS_SHRM		18
> +#define HCLK_NPU_ROOT		19

[snip]

> +/* mmc phase clocks provided by the grf-cru */
> +#define SCLK_EMMC_DRV		1
> +#define SCLK_EMMC_SAMPLE	2
> +#define SCLK_SDMMC_DRV		3
> +#define SCLK_SDMMC_SAMPLE	4
> +#define SCLK_SDIO_DRV		5
> +#define SCLK_SDIO_SAMPLE	6

For other Rockchip SoCs the grf clocks have been exposed from the CRU,
please take a look at e.g. SCLK_SDMMC_DRV and other similar clocks for
RK3528.

Regards,
Jonas

> +
> +#endif


