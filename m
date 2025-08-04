Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D965BC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBD+cYmOjsyWYdPcoci/WYj0RWnPR1YI5IhWOQffgRM=; b=vss2FKbg3mIv8HUh9H8rtl7/r6
	Hn9vKfbiuPLJMMYEu2gSkp5e9wcNHnL8Y6TIWHEorSIaUAtqeoCyWKc+S2BhFlAQgIy/PxdjFVg5u
	Mw4bQBlRL0vQ4wWD/5QENKr4z2WPQd1R8Op9IbKZec9+DsncJQBRle3VOQb32A8/d3H8HqvVMKW+i
	45f5UHjvMTQyW6SyEKB03mAK4fl3CUM6R1vMtLCEGj964Ny6+iONtrQxPe73Z1X3JH/BSAOboAtj1
	fXcSn6tfOKQJOlWwrUPpj7oN+Ojep0zSf9ycoiBipKXMWRH8XUhRjOPUhYK+w7Guvlz9CWJIx6VXK
	PH0pc/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqQs-00000009vdZ-0pX3;
	Mon, 04 Aug 2025 08:20:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq6e-00000009sTc-1RWl;
	Mon, 04 Aug 2025 07:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294378;
	bh=qKi0eXDo0OTD7u8dxVvtJEkp/wS/GQKLGnSmOfqNspM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFrS3RMc58FRonFJy7TsjmETlRNBbZEBME9CIkLnprbTk12RIUIyCwDGo/ncIyos/
	 swC6vWL868wuIAX6eFUzsQTvqDoam8Pvg6sapx+Rv5DM5eGKlYaM7B9pBny+29j1Ku
	 DSr8nOco/T+L9lUa3OG0TlYUMbNWB8Qd7htQ6Ds/HYkHQTtHUVJI3G6JQsRDSPILfX
	 UTHfROGPVTS3Ys2EuTDd6zLseSM0vGWsWFOfiaVDOCLCVM0NqOnsfLHRjnTXcEfUKF
	 GuzbBHnW0nCdiLa6BtiqoiBJzZyxO+LecxryY46q4fBLcf5k3q8yx8BP2WD7QKaLlM
	 9J+jFZtgPc7PA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A86B317E046C;
	Mon,  4 Aug 2025 09:59:37 +0200 (CEST)
Message-ID: <7c0433be-1008-4d6e-9672-b1908383e162@collabora.com>
Date: Mon, 4 Aug 2025 09:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005940_565114_FBEBD125 
X-CRM114-Status: GOOD (  14.81  )
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

Il 01/08/25 13:18, Julien Massot ha scritto:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller binding
> (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../bindings/arm/mediatek/mediatek,audsys.yaml          | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411c5632ae6663d15f29 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> @@ -23,6 +23,7 @@ properties:
>                 - mediatek,mt7622-audsys
>                 - mediatek,mt8167-audsys
>                 - mediatek,mt8173-audsys
> +              - mediatek,mt8183-audiosys
>                 - mediatek,mt8183-audsys
>                 - mediatek,mt8186-audsys
>                 - mediatek,mt8192-audsys
> @@ -41,7 +42,6 @@ properties:
>       const: 1
>   
>     audio-controller:
> -    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
>       type: object
>   
>   required:
> @@ -50,6 +50,21 @@ required:
>   
>   additionalProperties: false
>   
> +allOf:

I think you can do it without the allOf here as well.

if:
   properties:
     compatible:
       contains...
then:
   properties
     ...
else:
  ... etc

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-audiosys
> +    then:
> +      properties:
> +        audio-controller:
> +          $ref: /schemas/sound/mt8183-afe-pcm.yaml#
> +    else:
> +      properties:
> +        audio-controller:
> +          $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +
>   examples:
>     - |
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
> 



