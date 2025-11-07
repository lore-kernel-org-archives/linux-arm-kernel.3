Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0482CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtrOP7D+6cn9NXpGOjOJ8EQlpfaQQ1W6MRTCW9ClTm4=; b=Z6Fz9zuxFBfNkxNxNJvHSc0KmP
	XcRQ+/A0CvhqZlw0DqW/tsAxEd3QSm+NymN9X2p9oim4jtmIQ/+0N/Mz+qBVIINWBrDk74mSwtw5e
	UbDpN9ZcJRov20gyu6CTq/fBGYsZWFxFnFwj867ehNKgqzLOs2Iis0JOlCHQihGNgrQufAJbAcGFo
	oPGjIMpyOZJFNKY9QnKSM1aVF4JIF/e1uORky7txKtByr4LJxcfNrgu++hNHcvpYGBPTqSYepNp+n
	GaRUHpzMabftCdtvMf19yXpOMoH0t8Rcs0ADDZRycLZU7KUs0QmTy3X1yvP940+It5l8iYPWrqEV0
	goI4r5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNvy-0000000HYGH-36df;
	Fri, 07 Nov 2025 14:59:26 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNvw-0000000HYCl-0cwL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1762527562;
 bh=JtrOP7D+6cn9NXpGOjOJ8EQlpfaQQ1W6MRTCW9ClTm4=;
 b=GsdV/n3gj2/U8wlqPdx9lCknr4kIrWyYXQ/e1lQpig7GRXMneQWMx1v697TpjzfoZbK18aCEE
 GGyB9eyvyVcC/18fP5Sdwq7dxC3BJmKzN/Q42BYFWW+OIB+R70Dsd2uzum6WMoGhtgsV/iftLzv
 PYYa7ytqvjx0mzlral2yKV11lwBc6ZFeEJJrnIIS5Ofck4hXQSoL1AWtY7mSmh804vXRaBKHQfe
 2+ptNO2dJtTkoToR3tdcBpexON84jD880kOD2dTl7je4MCqE2su2C+7babzP/gKuoj362vIp8lA
 ArjGxHor5tUNmf/GVOv8zQ3u2SzzvcSUusIqtCLNynng==
X-Forward-Email-ID: 690e094607551ffa40a0ed33
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.4.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <48108089-775a-428c-8dd1-a75344823ace@kwiboo.se>
Date: Fri, 7 Nov 2025 15:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6 4/5] dt-bindings: clock: rockchip: Add RK3506
 clock and reset unit
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 huangtao@rock-chips.com, finley.xiao@rock-chips.com
References: <20251107013757.5013-1-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251107013757.5013-1-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_065924_287121_634C76AD 
X-CRM114-Status: GOOD (  22.55  )
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

On 11/7/2025 2:37 AM, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
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

My original question and your reply from v5 follow below.

On 11/7/2025 2:24 AM, zhangqing wrote:
>> Is there a reason why this (and the RV1126B) reset names now include the
>> RESETN name in all reset constant?
>>
>> For RK3528 and prior mainline SoCs the RESETN part of the name has been
>> striped from the constant, suggest we also strip the RESETN part for
>> RK3506 and RV1126B for consistency with other RK SoCs.
>>
> The current practice is to separate the reset id from the clk id.
> 
> Follow with others RK socs(RK3528、RK3588、RK3576.....)

and

On 11/7/2025 2:44 AM, zhangqing wrote:
> The reset id and rst-rk3506.c were automatically generated from our trm 
> using tools, while some of the previous chips were filled in manually.
> 
> It is not recommended to manually modify the content generated by the 
> tool to avoid unnecessary errors.
> 
> It is not necessary to change SRST_HRESETN_CRYPTO to SRST_H_CRYPTO.

Why do we now need to have two part of the indices name to represent it
is a reset, i.e. the SRST_ prefix and the RESETN in middle of the name.

	resets = <&cru SRST_ARESETN_MAC1>;

The example above seem unnecessary verbose with 3x reset:
- resets as prop name
- SRST_ prefix (software? reset) in the indices name
- RESETN in the indices name

Maybe the SRST_ prefix could be dropped if we now have RESETN as part of
the indices name?

Your tool could be updated to strip the verbose naming. For RK3528 I
used a small script/tool to strip away the RESETN name and to generate
the macros used in rst driver.

Regards,
Jonas

[snip]

