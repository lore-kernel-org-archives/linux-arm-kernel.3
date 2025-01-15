Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33144C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahtk6KEr+1ICj0GfTtqVUyOgNdrJMw8vqfEIQ6685zQ=; b=DGOAfTw11vzcsPSDC6IidK/+Fu
	DEPwCbZ4kE6Uu3qv8vICjLRenT1jDECtDmsKACUZy5vbtaM2VSKkrS+Y+De3MbR4kmnsor3Vqnv74
	X2YIan1a1ZdNmk9/jAIbsuHtJI0uKdvILYwX/Q7hq7RGvLVKllcH1I1QDisJKlMz/t5AavPFiJs0i
	8TWM98qBwiv6FhwhVo+3CjbXo6eWH+34h3uAiKVreo1g06QV/S+SlrGUvurNJY0zOrDgMNywtycZ5
	4bzlAXtD5va241xbtW3+wPb2eoAuD3s+v0OtVawK+l4Zpo0T/uO7kEEnR+bkNHJ7OwjlQfihfR/M+
	KP1UkjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY03g-0000000BPbn-0VO2;
	Wed, 15 Jan 2025 09:51:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY02Q-0000000BPOs-1GXT;
	Wed, 15 Jan 2025 09:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63D13A41A62;
	Wed, 15 Jan 2025 09:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A693C4CEE1;
	Wed, 15 Jan 2025 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736934613;
	bh=FAroUXyBDLBEfp+R9giXYoiTywuzUZWagD49ZuybGCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DImkJAVvNmB4HstzP6QyZuwro7ZkhI2z7+UN/VI+l4a53L1EiD7SlRf2B5GDtl0c7
	 28gPdouUlyGvnv2eVpRRjaD8ImWpK0C8W5Cxw47OM7yjjOWfZ4lhDlZ5jkUt71a55j
	 LD+ONvpoPXR5ZYd/GYr1/3TqSVKll2Mq9SJKuoFzubYGHhlBjZThjYrYD3QVCbVIf2
	 MFOIVbBpBxUaAqqL0Chf3SxqbMQA0aKgmhFZ95iVyVFadd+g1hYBq5eemjSR1Xktwt
	 hQ0U3rvJUG0FcPoi3L1CLsHB1I9pzk0PfTL15FKgqik8v6xJsp44WjTJLEKyrcURQW
	 jiouujojobUUQ==
Date: Wed, 15 Jan 2025 10:50:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	wenbin.mei@mediatek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Message-ID: <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115063555.32492-2-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_015014_471926_A620E713 
X-CRM114-Status: GOOD (  18.89  )
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

On Wed, Jan 15, 2025 at 02:35:38PM +0800, Cathy Xu wrote:
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/mt8196-pinfunc.h
> +              directly, for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull down PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8196 pull down RSEL type define value.

Not much improved.


> +            description: |
> +              For pull down type is normal, it doesn't need add RSEL & R1R0.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> +              For pull down type is PD/RSEL, it can add RSEL define to set
> +              different resistance. It can support
> +              "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001" &
> +              "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +              "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" &
> +              "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111" define in
> +              mt8196.

> diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> new file mode 100644
> index 000000000000..bf0c8374407c
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> @@ -0,0 +1,1572 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2025 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + */
> +
> +#ifndef __MT8196_PINFUNC_H
> +#define __MT8196_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)

I do not see how you resolved my comment from v1. In v2 I reminded about
it, so you responded that yopu will change something, but I do not see
any changes.

So explain: how did you resolve my comment?

These two examples where you claim you will change something, but send
the same. I skipped the rest of the patch.

Best regards,
Krzysztof


