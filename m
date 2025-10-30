Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F8BCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11fSyszQtR3jkoioIebSh0k83RLr07LvekxLFqOoF38=; b=WAhydI1lBcx5OVq/3QG/ubgEKI
	RdRK33TlrVn/L77WhbyD+WTm2wc8nmdTcGt8wF7GLfwDW43w4d5my0puoEwJwOpYJzXcdvu9PSyia
	PQuwJcfUs0YvjA75uKaaU7kqckwBuft4urq0cKf6VtPvgQX3fRBG2RoADC4vWEmNTj3vjlMTYHf0B
	eoBvgwEh+oeLsoFl9fo+STDpRpC28kNcJeoaFsDRzpH04Fo1LxStLfzf+qSk4YuniFsoNsmtzqFkh
	4hjcgLZhbiwRGxmAq8rgniPZQe37Wew31VUzOOP16z+3I+Qz00/5YhcWjntdWBPj3QFQkAdyroCl6
	Saqm0/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET7s-00000004Fzw-1QKE;
	Thu, 30 Oct 2025 13:55:42 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET7p-00000004Fz0-30He
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761832535;
 bh=11fSyszQtR3jkoioIebSh0k83RLr07LvekxLFqOoF38=;
 b=sBgRnRYrk2oKseVnJ4UzP52fTOQi5GyvgUilCQouBBvBKMm4+yUYkwnJszGSst7/WvSLbchQq
 u5VzeTFr5nKBlu/M9Qus8BhCyEjJNxoxBC3P63IzgDUdo1dhRxHOjiP0L6tV/3y5M624iiXBWrD
 nsuUaUWAxi2tir6rnlaFgRbsMsVBxetWE5dwJPmx5PJNNeQ+t3Hl1dBiTvQJDkVJSdL8gjXrncJ
 +ZRyR8FYWrjQu57KY01NwHH6uDYgioVhiFj35yWksQdY+3YNiZFxzk3oxYTOxuteKOvceGi3qH3
 qKQYNEipIhyc+iYErQgRvcOo6mFz9aM7ZeWJIi/vVLoQ==
X-Forward-Email-ID: 69036e450fa9097cfdeb6e32
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.4.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <241e4a1d-039c-4738-b492-6325ad354b2e@kwiboo.se>
Date: Thu, 30 Oct 2025 14:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] dt-bindings: clock: rockchip: Add RK3506 clock and
 reset unit
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 huangtao@rock-chips.com, finley.xiao@rock-chips.com
References: <20251027084147.4148739-1-zhangqing@rock-chips.com>
 <20251027084147.4148739-7-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251027084147.4148739-7-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065538_097020_3AFAA2EA 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Elaine,

On 10/27/2025 9:41 AM, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  51 ++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 547 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h

[snip]

> diff --git a/include/dt-bindings/reset/rockchip,rk3506-cru.h b/include/dt-bindings/reset/rockchip,rk3506-cru.h
> new file mode 100644
> index 000000000000..f38cc066009b
> --- /dev/null
> +++ b/include/dt-bindings/reset/rockchip,rk3506-cru.h
> @@ -0,0 +1,211 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023-2025 Rockchip Electronics Co., Ltd.
> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_REST_ROCKCHIP_RK3506_H
> +#define _DT_BINDINGS_REST_ROCKCHIP_RK3506_H
> +
> +/* CRU-->SOFTRST_CON00 */
> +#define SRST_NCOREPORESET0_AC		0
> +#define SRST_NCOREPORESET1_AC		1
> +#define SRST_NCOREPORESET2_AC		2
> +#define SRST_NCORESET0_AC		3
> +#define SRST_NCORESET1_AC		4
> +#define SRST_NCORESET2_AC		5
> +#define SRST_NL2RESET_AC		6
> +#define SRST_ARESETN_CORE_BIU_AC	7
> +#define SRST_HRESETN_M0_AC		8
> +
> +/* CRU-->SOFTRST_CON02 */
> +#define SRST_NDBGRESET			9
> +#define SRST_PRESETN_CORE_BIU		10
> +#define SRST_RESETN_PMU			11
> +
> +/* CRU-->SOFTRST_CON03 */
> +#define SRST_PRESETN_DBG		12
> +#define SRST_POTRESETN_DBG		13
> +#define SRST_PRESETN_CORE_GRF		14
> +#define SRST_RESETN_CORE_EMA_DETECT	15
> +#define SRST_RESETN_REF_PVTPLL_CORE	16
> +#define SRST_PRESETN_GPIO1		17
> +#define SRST_DBRESETN_GPIO1		18
> +
> +/* CRU-->SOFTRST_CON04 */
> +#define SRST_ARESETN_CORE_PERI_BIU	19
> +#define SRST_ARESETN_DSMC		20
> +#define SRST_PRESETN_DSMC		21
> +#define SRST_RESETN_FLEXBUS		22
> +#define SRST_ARESETN_FLEXBUS		23
> +#define SRST_HRESETN_FLEXBUS		24
> +#define SRST_ARESETN_DSMC_SLV		25
> +#define SRST_HRESETN_DSMC_SLV		26
> +#define SRST_RESETN_DSMC_SLV		27
> +
> +/* CRU-->SOFTRST_CON05 */
> +#define SRST_ARESETN_BUS_BIU		28
> +#define SRST_HRESETN_BUS_BIU		29
> +#define SRST_PRESETN_BUS_BIU		30
> +#define SRST_ARESETN_SYSRAM		31
> +#define SRST_HRESETN_SYSRAM		32
> +#define SRST_ARESETN_DMAC0		33
> +#define SRST_ARESETN_DMAC1		34
> +#define SRST_HRESETN_M0			35
> +#define SRST_RESETN_M0_JTAG		36
> +#define SRST_HRESETN_CRYPTO		37

Is there a reason why this (and the RV1126B) reset names now include the
RESETN name in all reset constant?

For RK3528 and prior mainline SoCs the RESETN part of the name has been
striped from the constant, suggest we also strip the RESETN part for
RK3506 and RV1126B for consistency with other RK SoCs.

Regards,
Jonas

[snip]

