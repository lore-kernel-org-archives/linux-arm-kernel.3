Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F078103E171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QF+Mc0F+aOnGEPMzgcMrjlqOHUTfrQBIkePOLMRwMs=; b=CUSlWa9PY7DSAjNXeFOSWxuTPK
	TdU3wQrhr+YoztlbTg5NECOG0a/XyFFIo/UsnSQxRDfH9tPz4YZUamVUbWMbK+12//s7NvH9AmR4F
	z/jl0uVwBywPNXEXkW0AZ8FwFdI5RC9+NieDB6Eu+ffYcc498+rzPvZTEawUXijmiMmG4uYRtQIl0
	hXgy8jZqwXedHfqIQ7/EWldnW1J6nSepENgVj/srkxQi7CMug8qCKiKdZ9d45ozmM+oyJs9Q7S4Gq
	2Yy1pxeQAtroBJNg70q3gtu9Km1muND9+QdP01Dj3zYoXk+OKUwPiHoq9LeTN9qy311+QXHrUJRmS
	4r6wvDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBL-00000008PFU-2O39;
	Wed, 18 Mar 2026 12:39:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qB4-00000008Ozm-0zGz;
	Wed, 18 Mar 2026 12:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837547;
	bh=/9GsD8Paw2FG8zbS8w+TdnFQsZUhCwbrgaXvCp6ENE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oavHusXkCkB7Kqa5VC0x2RW+xdZIuSLE32GVO8SOJWcjAeukEHxn/HEle9dvPQjZo
	 YpmhpbYQVnKYqeeVNjitJTwB0xV3NmVNNNHFDGYnJ+6/iVWpp17z03ZLMHHP2w5lAP
	 8CX2myd0Eu0aRHM1KQkcsBtgmfMMHCLU3xWiUxQFf4P1NWXRy3HYZN/XjjyNUy9mtA
	 TQ5v/x+GT5ZnIHt8KpnaFukD4BZbBaLM5YRLy9tIvYJNuYneJkphNfV7+oMw+2Pxro
	 lzUU8XFTTB4MOGPiglYKWWa6PtnxlSvNOQVlN71YVkhj05JkR4VF4Zzm5wlJgoRPI5
	 ItYnGPP27d/9A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1426617E1330;
	Wed, 18 Mar 2026 13:39:07 +0100 (CET)
Message-ID: <8e1ce45b-e001-40a5-9b20-b113e3e6ed54@collabora.com>
Date: Wed, 18 Mar 2026 13:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392
 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Julien Massot <julien.massot@collabora.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-2-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-2-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053910_428297_AE9EBB66 
X-CRM114-Status: GOOD (  12.38  )
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
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the currently supported bindings for the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 6a89b479d10f..22b09e148d7c 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>             - mediatek,mt6358
>             - mediatek,mt6359
>             - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>         - items:
>             - enum:
>                 - mediatek,mt6366
> @@ -68,6 +72,10 @@ properties:
>                 - mediatek,mt6331-rtc
>                 - mediatek,mt6358-rtc
>                 - mediatek,mt6397-rtc
> +          - items:
> +              - enum:
> +                  - mediatek,mt6392-rtc
> +              - const: mediatek,mt6323-rtc
>             - items:
>                 - enum:
>                     - mediatek,mt6366-rtc
> @@ -92,6 +100,7 @@ properties:
>                 - mediatek,mt6328-regulator
>                 - mediatek,mt6358-regulator
>                 - mediatek,mt6359-regulator
> +              - mediatek,mt6392-regulator
>                 - mediatek,mt6397-regulator
>             - items:
>                 - enum:



