Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EDC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqiQ8qbQ1G6uJzpLAbbf4sPZSyQhabuZFh8cQQ07tiQ=; b=kwx75gwzAh++2vOf1P1qs6hpFL
	fdFxVKcG2ABhuPYP421o2d2hWvCuI64tJEdRcjmnIU+QjRyMo4YaVczsANxBkheHf0Lw0h+fP1CEa
	sZ3tk8B5FA6FEm3gaXGXVx37SFu+di2vZTpkB5cze5q5kAydEUZNGKu5yLu+yrHiW5RRB8bftskgh
	dzFww1S3n5FWxyGiGlaeDRLXHaO0f/OG7ayANyjPNtX0rrPn7G8Z+XgGReFpm/M2yqbkvbNWlGmJV
	D5lqDqrusz/sk9lXkZc+fWvbYXOmiEuRYRrjRDFGGJ7EQJXpsHB4UlraMnTxbrzn6PNRxzQr9Ov+g
	fEePGwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nGb-00000009kFM-3PS5;
	Thu, 10 Apr 2025 08:28:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2met-00000009cja-0rTK;
	Thu, 10 Apr 2025 07:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744271349;
	bh=ivk3g2xuuWzp02wJHrEL79rm/ijdgS0pYE3iPtcnQ94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbx9V4Z6DWUoU2FXPTLYMh8Baz0STBgWnytWTfreUVWvbr0cTFRO4VZYiZ9al2LOI
	 giTpUXroI3ZQtJur1zlcFZx5s8tBcHfswO1hrY5UjZadLnG9b8c//71sQ4OdNRYjfO
	 YV5yPWulenhUJJ5FlzZF8J5nOl3xYmVaQPYL2UXW+FqmN3DYK2VOpu8tNg/ODZDfyg
	 q1QU1nZ+FRiJCbn2gt5w3137KFG8+LgQ7VWHgJFfkOYZ+9M+y9TzR0/A+Cw40euUat
	 7wDME0UQw4PTNRjrYRfltKx/ixnbDGw3TaCm7oxyQR8QoOP6dmnbBttUUH7onIQpcQ
	 ncq3vrwIqSg/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92A2417E0402;
	Thu, 10 Apr 2025 09:49:08 +0200 (CEST)
Message-ID: <7e77b50c-1808-49fa-a711-956a570ad208@collabora.com>
Date: Thu, 10 Apr 2025 09:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-2-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_004911_395669_49AC3546 
X-CRM114-Status: GOOD (  12.97  )
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

Il 01/04/25 07:48, Cathy Xu ha scritto:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>   .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 220 ++++++++++++++++++
>   1 file changed, 220 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> new file mode 100644
> index 000000000000..cef7e0321722
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Pin Controller
> +
> +maintainers:
> +  - Lei Xue <lei.xue@mediatek.com>
> +  - Cathy Xu <ot_cathy.xu@mediatek.com>
> +
> +description:
> +  The MediaTek's MT8196 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-pinctrl
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +      - description: rt group IO
> +      - description: rm1 group IO
> +      - description: rm2 group IO
> +      - description: rb group IO
> +      - description: bm1 group IO
> +      - description: bm2 group IO
> +      - description: bm3 group IO
> +      - description: lt group IO
> +      - description: lm1 group IO
> +      - description: lm2 group IO
> +      - description: lb1 group IO
> +      - description: lb2 group IO
> +      - description: tm1 group IO
> +      - description: tm2 group IO
> +      - description: tm3 group IO
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: rt
> +      - const: rm1
> +      - const: rm2
> +      - const: rb
> +      - const: bm1
> +      - const: bm2
> +      - const: bm3
> +      - const: lt
> +      - const: lm1
> +      - const: lm2
> +      - const: lb1
> +      - const: lb2
> +      - const: tm1
> +      - const: tm2
> +      - const: tm3

Why is there no EINT iospace?

Regards,
Angelo



