Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24FBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWEV+VEuzq1AAVTVz+CiIxYbNnYNS1gCDHmHpkGBJ/U=; b=KKydPXpLNRlXxcYZ4VBPKB+rqF
	ymLOAYw95DIlhzpJ/MzEi2SUxdKVHvOc/sNL8QyJ2edB2uSPNNJTaV6fYmp3pj05mZaeUlcyIvYOA
	oc+8/uDGCOfeHh21yD8jgZokwqcn3B636ndFFzCjWBoCDL0pYtMxGTrQ7JacSKua1cxXbFThH6fAc
	MxdpvdIL110+KiRJ2DHV615l/jKi6/l/EDEVS7Uc8YDW49/kMVieTDyZDGzPOIW1ULFoFtxhQgA2n
	RtnQnDqEOXOCa92zrJeM4C/R+D50pkOPHW0szVuJaN3ltF/8CGAPDWahH506TRwZIYs+4kC4/kIV9
	AHGpuijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNnW-0000000347K-2kZl;
	Thu, 31 Jul 2025 07:33:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNkl-000000033nN-19qd;
	Thu, 31 Jul 2025 07:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753947061;
	bh=ErjQ47ZFmrUB+6AgCPEt2uAQFQd2rCBgVrhD5uTl65w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fmba4iSmh0us7h4tkqeW8Kz2Xhjy7f0Inj2joxQrEOopNR4/ibo5OuM+Xz3wIeG3W
	 audj9JZc3IYMm7j/RTw2r8VWxj/lQjemHmdrfFgacHRswJQ/GCPVHKVDkqIkBj+xeD
	 QJEVqwS5jHg8k0HHx8iDDFs5hk4QTJvrTXyJ/gO5JkiN0ner/muifOGVqb9YQky6FO
	 e6+qqHRkgj4tzjW9OjHJNrIGiRVbezsX6vaM17aXIExumIcSwkryXL28i9+B6sItzX
	 s+GuQBQXf/sOJeKNdd61nq4qhbsJtyRsKwzxNA8C20dusdMMVDU+b3jg3sd8ojbvrK
	 4QwlrBStxLqEg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C3D917E088C;
	Thu, 31 Jul 2025 09:31:00 +0200 (CEST)
Message-ID: <9a369599-d0cf-4a17-8667-fa2d7adf63d9@collabora.com>
Date: Thu, 31 Jul 2025 09:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller support for MT8196
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: wenst@chromium.org, nfraprado@collabora.com, arnd@arndb.de,
 colin.i.king@gmail.com, u.kleine-koenig@baylibre.com,
 andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, bchihi@baylibre.com,
 frank-w@public-files.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-2-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-2-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_003103_464723_6047E81B 
X-CRM114-Status: GOOD (  10.78  )
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

Il 30/07/25 17:21, Laura Nao ha scritto:
> Add LVTS thermal controller binding for MediaTek MT8196.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../thermal/mediatek,lvts-thermal.yaml        |  2 ++
>   .../thermal/mediatek,lvts-thermal.h           | 26 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> index 0259cd3ce9c5..beccdabe110b 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -26,6 +26,8 @@ properties:
>         - mediatek,mt8192-lvts-mcu
>         - mediatek,mt8195-lvts-ap
>         - mediatek,mt8195-lvts-mcu
> +      - mediatek,mt8196-lvts-ap
> +      - mediatek,mt8196-lvts-mcu
>   
>     reg:
>       maxItems: 1
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> index ddc7302a510a..0ec8ad184d47 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -80,4 +80,30 @@
>   #define MT8192_AP_MD1   15
>   #define MT8192_AP_MD2   16
>   
> +#define MT8196_MCU_MEDIUM_CPU6_0        0
> +#define MT8196_MCU_MEDIUM_CPU6_1        1
> +#define MT8196_MCU_DSU2                 2
> +#define MT8196_MCU_DSU3                 3
> +#define MT8196_MCU_LITTLE_CPU3          4
> +#define MT8196_MCU_LITTLE_CPU0          5
> +#define MT8196_MCU_LITTLE_CPU1          6
> +#define MT8196_MCU_LITTLE_CPU2          7
> +#define MT8196_MCU_MEDIUM_CPU4_0        8
> +#define MT8196_MCU_MEDIUM_CPU4_1        9
> +#define MT8196_MCU_MEDIUM_CPU5_0        10
> +#define MT8196_MCU_MEDIUM_CPU5_1        11
> +#define MT8196_MCU_DSU0                 12
> +#define MT8196_MCU_DSU1                 13
> +#define MT8196_MCU_BIG_CPU7_0           14
> +#define MT8196_MCU_BIG_CPU7_1           15
> +
> +#define MT8196_AP_TOP0                  0
> +#define MT8196_AP_TOP1                  1
> +#define MT8196_AP_TOP2                  2
> +#define MT8196_AP_TOP3                  3
> +#define MT8196_AP_BOT0                  4
> +#define MT8196_AP_BOT1                  5
> +#define MT8196_AP_BOT2                  6
> +#define MT8196_AP_BOT3                  7
> +
>   #endif /* __MEDIATEK_LVTS_DT_H */


