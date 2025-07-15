Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E51C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mknczMVn4WXftHGSUEmj3LcVZpLgNwJJ6ecQLoslB7o=; b=3PqINIJNPQi8C9tVgIEpe39zry
	ytazt+YNg+piwb6XFdI7qLz2qtSj6iSBVPBmLcCK2r9pYy1ztbo5+560+0c9dn3GgOiq3Vt/4LfOm
	AQQBKZSp9H0e8brTFMCcxPaXC7cthZPKBC8vSHw7y4wkVOPTjQdmp+u6cAwvh/DnBUsra5CQ8UURB
	mYV0x9TRmIvpxPmaEUcxgbR2eu6DenlMfFdqQdusE23XaDXtmdrZeIsCpiN6PlhROzgvfA8VfuCDn
	BdzPc3w/FydP0QCZOwNuu/ONaSwNN+kFENlYAv6+UUNROvjdvGnLWPxqsc0hpuf9KgHfwBBAfnf47
	cNSYr36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhAK-00000005VNd-43Mr;
	Tue, 15 Jul 2025 15:01:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfiK-00000005D8r-2k7a;
	Tue, 15 Jul 2025 13:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752586134;
	bh=NZtHYSOuQbNspfyKqTqQMOVejME6k8PRvnKr3a2/2D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kRcBlPPvRe+bzW3i/349S6j/Q0Rd1pBOiZHegxlcV54u6jnCdI+WmwWxjRsBnqbKK
	 Au2xhiZsjApGtuJuHrWtOYpaqh21zUnqY8YdL8P4zsa+8PXLxYA6j9HwHHJB/inQfL
	 43PVMiO+tuTGwHkJD61oUmSWKNQUtjJEx3YjViwqRGQCLZCfN1hazHIy7IHjdNVqYn
	 SORvTVefSQNSiWbYSmLfFOVhyiSbdoCDMlFMPG0t9GsYZYJVLiROZQsyKwrpNHUMxS
	 dR3BGWoXJlJJqf3CS0cM7yfcAx/6LndJV1j9GbRe6RCRyKQavMar0okFkpeAv4kiLM
	 cViUNU5zai9SA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F30D517E05F0;
	Tue, 15 Jul 2025 15:28:53 +0200 (CEST)
Message-ID: <bf5638c9-e49a-4482-9796-ddd3a010d162@collabora.com>
Date: Tue, 15 Jul 2025 15:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org
References: <20250715115718.176495-1-angelogioacchino.delregno@collabora.com>
 <20250715115718.176495-2-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250715115718.176495-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062856_882015_C93E510E 
X-CRM114-Status: GOOD (  16.42  )
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

Il 15/07/25 13:57, AngeloGioacchino Del Regno ha scritto:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Link: https://lore.kernel.org/r/20250624073548.29732-2-angelogioacchino.delregno@collabora.com
> Link: https://lore.kernel.org/r/20250707134451.154346-2-angelogioacchino.delregno@collabora.com

Btw, sorry about those Link: tags, those were completely unwanted... they
slipped through while using b4 and I forgot to remove them.

I'll wait for any feedback or tags and will resend the series with those
tags removed.

Thanks,
Angelo

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../regulator/mediatek,mt6316b-regulator.yaml | 46 +++++++++++++++++++
>   .../regulator/mediatek,mt6316c-regulator.yaml | 46 +++++++++++++++++++
>   .../regulator/mediatek,mt6316d-regulator.yaml | 41 +++++++++++++++++
>   3 files changed, 133 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> new file mode 100644
> index 000000000000..e7a6b70cdab2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
> +  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
> +  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6316b-regulator
> +
> +  vbuck12:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  vbuck34:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      regulators {
> +        compatible = "mediatek,mt6316b-regulator";
> +
> +        vbuck12 {
> +          regulator-min-microvolt = <450000>;
> +          regulator-max-microvolt = <965000>;
> +          regulator-always-on;
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
> new file mode 100644
> index 000000000000..0b9239a595ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 CP/HP/KP SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT6316CP/HP/KP PMICs are fully controlled by SPMI interface,
> +  features four step-down DC/DC (buck) converters, and provides 3+1 Phases,
> +  joining Buck 1+2+4 for the first phase, and uses Buck 3 for the second.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6316c-regulator
> +
> +  vbuck124:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  vbuck3:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      regulators {
> +        compatible = "mediatek,mt6316c-regulator";
> +
> +        vbuck124 {
> +          regulator-min-microvolt = <450000>;
> +          regulator-max-microvolt = <1277500>;
> +          regulator-always-on;
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> new file mode 100644
> index 000000000000..460c02bf69de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 DP/TP SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT6316DP/TP PMICs are fully controlled by SPMI interface, both
> +  feature four step-down DC/DC (buck) converters, and provides a single Phase,
> +  joining Buck 1+2+3+4.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6316d-regulator
> +
> +  vbuck1234:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {
> +      regulators {
> +        compatible = "mediatek,mt6316d-regulator";
> +
> +        vbuck1234 {
> +          regulator-min-microvolt = <400000>;
> +          regulator-max-microvolt = <1277500>;
> +          regulator-always-on;
> +        };
> +      };
> +    };
> +...


