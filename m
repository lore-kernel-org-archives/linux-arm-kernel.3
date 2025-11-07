Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AEACCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBnEo9kQFWn16Gia7CBsD427l5/li0reZ07Ety+v/ps=; b=wQXYJzrSKjXsh4h9UPv9BLiGSl
	xxKerz2KOGwDV6LA3k3i8wUxxKIhZJMR2QRuY9J4g5gdmGyXtFJiWJKbDbGVPe/EWXWlyBX9rUVyw
	lIifG6pQmBZ9Rlcu3mUzKRDxBDZhO5/Lcfk0FI18J71thfMONecO86e8TGBf0nQJzGV+8wfRD8iAn
	4gfBGl96On5B2Hcw7q8pp6M1wzrm87MOjCiMR3Sq4F2pkdQDWXWtVz9xBMa3Yb4Q7t0+6VDIjCkeY
	m4VtkE0T6eFUflSDkn7mkazS68q3QuqlhsAEIT0jtLqteNbiJBvi2J0pCVYVqjNjdv4YJyecUOpVH
	QtD5LIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNUu-0000000HVTu-1XpM;
	Fri, 07 Nov 2025 14:31:28 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNUr-0000000HVSr-2OfL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1762525882;
 bh=dBnEo9kQFWn16Gia7CBsD427l5/li0reZ07Ety+v/ps=;
 b=ctyfdhXWSNtlsPb9qLHxSuIVxY4q2F4ZPbieiJDDHW2Hh25oBQnnQOeWjK4PdpdXRiYX5aTnH
 S2EK8xvaiZXu/yoQYoYff50ucfLI06kxJ6y3Ej+Os4NQhJusjkHUsSsKfEa0vGjrNt1Ag5xyCUu
 2RzjEThllrgIq2ypNvlBpm/3PnVt9W3EqKNYGFTKYj4X7ZG1xOXTdhK4bMpX9esPoA98IimtBC7
 P9y8ZoJpRa8z5Ij4rmWn8WRR5LfcFlkQc0fgGQoUGGxmcI3pTmGFiZ/R1KfObkSuyNboUJYbq+c
 y7i4eMLUwzCzOr0q43KnkOiYwImFBRfqTpyHk6d162Jg==
X-Forward-Email-ID: 690e02ab07551ffa40a0e268
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.4.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3be7a6e4-4025-42b4-a73f-a9d05e64191d@kwiboo.se>
Date: Fri, 7 Nov 2025 15:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: clock, reset: Add support for rv1126b
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 huangtao@rock-chips.com, finley.xiao@rock-chips.com,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251104030633.2721038-1-zhangqing@rock-chips.com>
 <20251104030633.2721038-3-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251104030633.2721038-3-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_063125_949925_AA68B573 
X-CRM114-Status: GOOD (  14.07  )
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

On 11/4/2025 4:06 AM, Elaine Zhang wrote:
> Add clock and reset ID defines for rv1126b.
> Also add documentation for the rv1126b CRU core.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/rockchip,rv1126b-cru.yaml  |  52 +++
>  .../dt-bindings/clock/rockchip,rv1126b-cru.h  | 392 +++++++++++++++++
>  .../dt-bindings/reset/rockchip,rv1126b-cru.h  | 405 ++++++++++++++++++
>  3 files changed, 849 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1126b-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rv1126b-cru.h

[snip]

> diff --git a/include/dt-bindings/clock/rockchip,rv1126b-cru.h b/include/dt-bindings/clock/rockchip,rv1126b-cru.h
> new file mode 100644
> index 000000000000..d6040058c21f
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rv1126b-cru.h
> @@ -0,0 +1,392 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RV1126B_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RV1126B_H
> +
> +/* pll clocks */
> +#define PLL_GPLL				1

The clock indices should typically start at 0 not 1.

[snip]

> +#define HCLK_RKRNG_NS				362
> +#define HCLK_RKRNG_S_NS				363
> +#define CLK_AISP_PLL_SRC			364
> +
> +/* secure clks */
> +#define CLK_USER_OTPC_S				400

And the indices should typically not contain any jumps in numbers.

Regards,
Jonas

> +#define CLK_SBPI_OTPC_S				401
> +#define PCLK_OTPC_S				402
> +#define PCLK_KEY_READER_S			403
> +#define HCLK_KL_RKCE_S				404
> +#define HCLK_RKCE_S				405
> +#define PCLK_WDT_S				406
> +#define TCLK_WDT_S				407
> +#define CLK_STIMER0				408
> +#define CLK_STIMER1				409
> +#define PLK_STIMER				410
> +#define HCLK_RKRNG_S				411
> +#define CLK_PKA_RKCE_S				412
> +#define ACLK_RKCE_S				413
> +
> +#endif

[snip]

