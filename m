Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hir00uV1h8lrQfzCYxKJAOuHxGSkKGQYvYM4xy1qmY=; b=OmdGqxGV69UbypXwp2VVDd/PJR
	cfpGHjM5jPzyVyNoBbwDOyDi4v0BmgN6FobDhRtc29D3rVYyHHT9bE6VXIkZDnrYXPXXBapglP/np
	T+o+x9oMGVDBAvRdr56tCjsqQ0ETtuix1v9V8kQNQvBIstNpibcWpBpLEhLpZo/ZPx3XdCsUX2HDn
	tDBH8GphOnQMeZUUCJFcmKNcWMaZ9oP5KmU6IoqA8dAWi3Tux2nRN/lhRoJSzE+PyXfsZqGapXIq5
	ij/6nJBsyzEB4pr98PeZCsUvTm0NLF/Xj5qrwIRJDPRCSh7JtzFgSTdAgU2MhTOG4+RUSceDSuZ4m
	pnDHEz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucf59-0000000BpO5-10lS;
	Fri, 18 Jul 2025 07:00:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceq7-0000000BnnL-1TRY;
	Fri, 18 Jul 2025 06:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821101;
	bh=sGbj5FKKg+88/BDygAxdWai9Cf3SHGZigk3s46T72ok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fu23QsMJypE9g+UTg1Qa9uvMU6FeZvBncgIcGIexPNIiog9kWIkqimRqQSHiGziYK
	 3+y9SEAiaPmtjT4oQnCZBLUXo2dF1gsixtdBYWnMNMg1DhqFjDkKMkoO7vjdPqWfyQ
	 78KqzOMmjs513mek6T7pYDbJk1eZKi8pVpiFmSiyS6VzN/hDXPK8GPAsENlz2vNZOH
	 n+bNno/I0fVLR3v5A6eyY0XgNjXkgvnV74G2/W2W6h7sltRV/gedGj8GHBSM93PUoO
	 xyx84itTrjWg6/UuAyz1libm0gzIYB38MR8S20AEsZ70fTBdCwggQyfts7i7N2ubiz
	 IHMZxHkv7uS+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A03DE17E1439;
	Fri, 18 Jul 2025 08:45:00 +0200 (CEST)
Message-ID: <987aeeef-6f3e-4ba3-b04f-a60e0cf201ac@collabora.com>
Date: Fri, 18 Jul 2025 08:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: mediatek: mt8189: Add pinmux macro
 header file
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-3-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711094513.17073-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234503_549900_162672C1 
X-CRM114-Status: GOOD (  13.73  )
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

Il 11/07/25 11:44, Cathy Xu ha scritto:
> Add the pinctrl header file on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 +++++++++++++++++
>   1 file changed, 1125 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> new file mode 100644
> index 000000000000..f9c270ebab89
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> @@ -0,0 +1,1125 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + * Author: Lei Xue <lei.xue@mediatek.com>
> + *         Cathy Xu <ot_cathy.xu@mediatek.com>
> + */
> +
> +#ifndef __MT8189_PINFUNC_H
> +#define __MT8189_PINFUNC_H
> +
> +#include "mt65xx.h"
> +
..snip..

> +#define PINMUX_GPIO27__FUNC_GPIO27 (MTK_PIN_NO(27) | 0)
> +#define PINMUX_GPIO27__FUNC_DP_TX_HPD (MTK_PIN_NO(27) | 1)


> +#define PINMUX_GPIO27__FUNC_mbistreaden_trigger (MTK_PIN_NO(27) | 2)
                                ^^^^^^^^^^^^^^^^^^^
Please fix: this has to be uppercase as much as the other definitions.


> +#define PINMUX_GPIO27__FUNC_MD32_0_GPIO0 (MTK_PIN_NO(27) | 3)
> +#define PINMUX_GPIO27__FUNC_TP_UCTS1_VCORE (MTK_PIN_NO(27) | 4)
> +#define PINMUX_GPIO27__FUNC_CMVREF4 (MTK_PIN_NO(27) | 5)
> +#define PINMUX_GPIO27__FUNC_EXTIF0_ACT (MTK_PIN_NO(27) | 6)
> +#define PINMUX_GPIO27__FUNC_ANT_SEL0 (MTK_PIN_NO(27) | 7)
> +
> +#define PINMUX_GPIO28__FUNC_GPIO28 (MTK_PIN_NO(28) | 0)
> +#define PINMUX_GPIO28__FUNC_EDP_TX_HPD (MTK_PIN_NO(28) | 1)
> +#define PINMUX_GPIO28__FUNC_mbistwriteen_trigger (MTK_PIN_NO(28) | 2)

same here

> +#define PINMUX_GPIO28__FUNC_MD32_1_GPIO0 (MTK_PIN_NO(28) | 3)
> +#define PINMUX_GPIO28__FUNC_TP_URTS1_VCORE (MTK_PIN_NO(28) | 4)
> +#define PINMUX_GPIO28__FUNC_EXTIF0_PRI (MTK_PIN_NO(28) | 6)
> +#define PINMUX_GPIO28__FUNC_ANT_SEL1 (MTK_PIN_NO(28) | 7)
> +
Cheers,
Angelo

