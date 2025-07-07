Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3130CC83F0C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsA4FlLd/89YyhlOj0t4KA7YQY1/UsRkFKuHC8cJcgE=; b=RD80d1AByJ0OP3fnH4WtK0f75y
	IhqDxhshMjzrTjCKgNnnb812oVFKdGGl25vimrLE9c6M9lnGIOe/rZFFMz1x+1qu+NKm9K35g2k6g
	M2hAxwCcokpvx4VTPlKnT4xaZut2Kwqs4OVOayUC3FNuysptDQrepaPwvuuZXws5pViBhfWHaLH7Z
	1G0p/1vM8GxcrxGFXBD5/VSlpl8Qk2onsjfj41Eqcd1RXCgUyjH2/Cl8jj4vl5Zz/MkCMpFByDEKI
	HRLS/edpzOWVeQWj015w+MDvldY+62ANJIkCx58ub0js2Sd0qnh5VkkP5iC8c7Z2rVJyQ70iWTbyU
	DpUWp5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkUc-00000002MRB-1jZ9;
	Mon, 07 Jul 2025 11:58:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYipW-000000026jb-3W9s;
	Mon, 07 Jul 2025 10:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751883129;
	bh=MMB6K1mW7gUPZXcwKZJCapVE2TYR11szvBkVxUwZw/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J+tt0HshewHKye4oVFeYX65dnXG5fwzFdXq9CY8y7Rzmkj8CKkoDGs+4IWFMEzX/u
	 ujj927Kl/dS80B2JQc1LCgY3EdaOInZH9X8UYcO25a0pKdW4BrzNIx4gXHn7PpWRM/
	 2zL9m7cT9kuwFveuHiWXoTl4Fj/lRcoSiZqePxKMVR3JH43xB4jPXCZfxeynZIscr5
	 RP9r1CDj7lNuP6PjE6/pdKgoIJoa3BPDx3qhIFqh7YdXLUjK+H+yB2BWJHbu2PHSqy
	 zolNGX5aktB8qQlAyvnBE0PIIvpyL2bjzy4cN9PxtLbmcxV13hPHF/yF6gfYdaWBdL
	 7/AjVEOGiO6EQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFA0217E0523;
	Mon,  7 Jul 2025 12:12:07 +0200 (CEST)
Message-ID: <e6ab043d-3777-4a44-8f25-89da1d6f61c4@collabora.com>
Date: Mon, 7 Jul 2025 12:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/16] dt-bindings: net: mediatek,net: allow irq names
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250706132213.20412-1-linux@fw-web.de>
 <20250706132213.20412-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250706132213.20412-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_031211_056381_02BF32C3 
X-CRM114-Status: GOOD (  20.56  )
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

Il 06/07/25 15:21, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> In preparation for MT7988 and RSS/LRO allow the interrupt-names
> property.
> In this way driver can request the interrupts by name which is much
> more readable in the driver code and SoC's dtsi than relying on a
> specific order.
> 
> Frame-engine-IRQs (fe0..3):
> MT7621, MT7628: 1 IRQ
> MT7622, MT7623: 3 IRQs (only two used by the driver for now)
> MT7981, MT7986: 4 IRQs (only two used by the driver for now)
> 
> RSS/LRO IRQs (pdma0..3) only on Filogic (MT798x) with count of 4.
> 
> Set boundaries for all compatibles same as irq count.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

I'm fine with that, as long as you don't break the driver's ability to keep
getting the interrupts without any interrupt-names, at least for the currently
supported interrupts.

This commit ain't touching any driver, anyway, and the change is valid IMO, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> v8:
>    - fixed typo in mt7621 section "interrupt-namess"
>    - separated interrupt count from interrupt-names
>    - rephrased description a bit to explain the "why"
> v7: fixed wrong rebase
> v6: new patch splitted from the mt7988 changes
> ---
>   .../devicetree/bindings/net/mediatek,net.yaml | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 766224e4ed86..da7bda20786a 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -42,6 +42,18 @@ properties:
>       minItems: 1
>       maxItems: 8
>   
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: fe0
> +      - const: fe1
> +      - const: fe2
> +      - const: fe3
> +      - const: pdma0
> +      - const: pdma1
> +      - const: pdma2
> +      - const: pdma3
> +
>     power-domains:
>       maxItems: 1
>   
> @@ -135,6 +147,10 @@ allOf:
>             minItems: 3
>             maxItems: 3
>   
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
>           clocks:
>             minItems: 4
>             maxItems: 4
> @@ -166,6 +182,9 @@ allOf:
>           interrupts:
>             maxItems: 1
>   
> +        interrupt-names:
> +          maxItems: 1
> +
>           clocks:
>             minItems: 2
>             maxItems: 2
> @@ -192,6 +211,10 @@ allOf:
>             minItems: 3
>             maxItems: 3
>   
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
>           clocks:
>             minItems: 11
>             maxItems: 11
> @@ -232,6 +255,10 @@ allOf:
>             minItems: 3
>             maxItems: 3
>   
> +        interrupt-names:
> +          minItems: 3
> +          maxItems: 3
> +
>           clocks:
>             minItems: 17
>             maxItems: 17
> @@ -274,6 +301,9 @@ allOf:
>           interrupts:
>             minItems: 4
>   
> +        interrupt-names:
> +          minItems: 4
> +
>           clocks:
>             minItems: 15
>             maxItems: 15
> @@ -312,6 +342,9 @@ allOf:
>           interrupts:
>             minItems: 4
>   
> +        interrupt-names:
> +          minItems: 4
> +
>           clocks:
>             minItems: 15
>             maxItems: 15
> @@ -350,6 +383,9 @@ allOf:
>           interrupts:
>             minItems: 4
>   
> +        interrupt-names:
> +          minItems: 4
> +
>           clocks:
>             minItems: 24
>             maxItems: 24



