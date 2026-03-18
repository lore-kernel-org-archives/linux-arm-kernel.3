Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B1103E171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b39Gt0uJXkj7zOPGzDWf1HDdFLtL9d3MxxAcwDR3hd0=; b=kyC5HE/xM48s7qLMpaS4njm1n2
	60n1TfQbWnMh3r2NCF2fZJZ34sJFcJi9F+kaArrQxzJ+OxPqTuPK6LoAk/YkM6JG0kqwcWB693Rwp
	nfOtmDQ9wDuFIfCr3ziKGacZKkPBjC+q3BdMlxkdJd6cCNFtNjpAbNSXXUN2zDK2YiwkLAuxWRPF/
	VyVKT3S/4T4ILnpOqjrQGp29/E7Tf97lKTWbegg3ygcPRf/+Gg3HToGi1spJ4dhRlLaKhe0lgZknw
	PTPzqAQ6cDAkZx+R9pjnr+wWqkmnAWYwoY5jAFPKDG2BVkatL/zCelOI1vCFIbZ+JHEjcuFpU3ZgU
	O/ZdMF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qB5-00000008P2K-1KGj;
	Wed, 18 Mar 2026 12:39:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qB1-00000008Oy5-2gEr;
	Wed, 18 Mar 2026 12:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837545;
	bh=6O3O+gKjtbmkLIDWzLlSL/IeC7Z4ijv0QDVu07Nn/1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nFllDv3RrabAZKhJ3YrwJkdR0eaLcjzcNJtBQwGjhYl3k5Qtf8aEvaZfVNr6fqmSk
	 U+5neotyg2VkCVkycaKWg1cRfEnklZlKEtLz4Y5HW4VQQt0mnZAF3/1J/0B3gXLQDt
	 z/G2UQtuEUwuCtcHpBl94rqzHwBdzsF2QPbUrMMd01ZJ2T4qpaYz54NoY3DEe9GGIa
	 a+BLv6Niaf5DH8f7IsOw2aA6z/PhqJJO1Bb3JhiA+KMG+wpvHl68sVrQjUTItnv0lI
	 W3A9XwIx1FXNKx0X/WdqP8sef24iuTRuDRbmUQgl7+B+xqU91HKSnTj+vG1gCJUXel
	 bqEcJcKEB/bCw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3293917E1525;
	Wed, 18 Mar 2026 13:39:04 +0100 (CET)
Message-ID: <39a5c651-4921-422e-aaeb-552a27f04098@collabora.com>
Date: Wed, 18 Mar 2026 13:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: pinctrl: mt65xx: Document MT6392
 pinctrl
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Julien Massot
 <julien.massot@collabora.com>, Val Packett <val@packett.cool>,
 Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-5-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-5-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053907_854012_8F95E235 
X-CRM114-Status: GOOD (  16.37  )
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

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> Add a compatible for the pinctrl device of the MT6392 PMIC, a variant
> of the already supported MT6397.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
>   include/dt-bindings/pinctrl/mt6392-pinfunc.h  | 39 +++++++++++++++++++
>   2 files changed, 40 insertions(+)
>   create mode 100644 include/dt-bindings/pinctrl/mt6392-pinfunc.h

Please rename the header to mediatek,mt6392-pinfunc.h

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index aa71398cf522..1468c6f87cfa 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -17,6 +17,7 @@ properties:
>       enum:
>         - mediatek,mt2701-pinctrl
>         - mediatek,mt2712-pinctrl
> +      - mediatek,mt6392-pinctrl
>         - mediatek,mt6397-pinctrl
>         - mediatek,mt7623-pinctrl
>         - mediatek,mt8127-pinctrl
> diff --git a/include/dt-bindings/pinctrl/mt6392-pinfunc.h b/include/dt-bindings/pinctrl/mt6392-pinfunc.h
> new file mode 100644
> index 000000000000..c65278c8103d
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt6392-pinfunc.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef __DTS_MT6392_PINFUNC_H
> +#define __DTS_MT6392_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define MT6392_PIN_0_INT__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define MT6392_PIN_0_INT__FUNC_INT (MTK_PIN_NO(0) | 1)
> +#define MT6392_PIN_0_INT__FUNC_TEST_CK2 (MTK_PIN_NO(0) | 5)
> +#define MT6392_PIN_0_INT__FUNC_TEST_IN1 (MTK_PIN_NO(0) | 6)
> +#define MT6392_PIN_0_INT__FUNC_TEST_OUT1 (MTK_PIN_NO(0) | 7)
> +
> +#define MT6392_PIN_1_SRCLKEN__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_SRCLKEN (MTK_PIN_NO(1) | 1)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_CK0 (MTK_PIN_NO(1) | 5)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_IN2 (MTK_PIN_NO(1) | 6)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_OUT2 (MTK_PIN_NO(1) | 7)
> +
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_RTC_32K1V8 (MTK_PIN_NO(2) | 1)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_CK1 (MTK_PIN_NO(2) | 5)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_IN3 (MTK_PIN_NO(2) | 6)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_OUT3 (MTK_PIN_NO(2) | 7)
> +
> +#define MT6392_PIN_3_SPI_CLK__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
> +#define MT6392_PIN_3_SPI_CLK__FUNC_SPI_CLK (MTK_PIN_NO(3) | 1)
> +
> +#define MT6392_PIN_4_SPI_CSN__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
> +#define MT6392_PIN_4_SPI_CSN__FUNC_SPI_CSN (MTK_PIN_NO(4) | 1)
> +
> +#define MT6392_PIN_5_SPI_MOSI__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
> +#define MT6392_PIN_5_SPI_MOSI__FUNC_SPI_MOSI (MTK_PIN_NO(5) | 1)
> +
> +#define MT6392_PIN_6_SPI_MISO__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
> +#define MT6392_PIN_6_SPI_MISO__FUNC_SPI_MISO (MTK_PIN_NO(6) | 1)
> +#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_IN4 (MTK_PIN_NO(6) | 6)
> +#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_OUT4 (MTK_PIN_NO(6) | 7)
> +
> +#endif /* __DTS_MT6392_PINFUNC_H */


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

