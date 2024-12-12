Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D83E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnc+JWb80d/x2lRlX+hUido0JN4Dp3eaXJYJlRswdKc=; b=DheAIpA9KHHKU0x9/C+Bbz3iUU
	mJIO5PmZYsFD01ehrbnVq1nPvqibnFMozIchIuwMZ7V4Jugi9US6jBYCJ5X767Untpw0lWU3q+xHZ
	1uQu5Bd016oJxPgJHbWchZq5Fl6fx5Jb4aoOLcVWNBIPKG1leVdZELYoj8DU+bQNI6yE1uIXwVi+7
	FiJ6NV81Baw5XJGQHt4wf3k5/6KCd6WBnTyKJCrw1sDZZ188u4YK5hlTH+IbGhXSXmreT0W3G/u8J
	pC4XaflB71EsyTKdQWbM6kguWDbT1oAiDVk0L3Sk2lMBFFWImIZbZbSmkPA4uJoTSoUNvvkI0QkD2
	gzB40OLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgRf-000000003nG-3ap6;
	Thu, 12 Dec 2024 10:29:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgQG-000000003ZC-0roK;
	Thu, 12 Dec 2024 10:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733999274;
	bh=DLrR9DvNEGy896WEuOkI4qVaTUviwn0zBvUtMaDFUeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RmalG9PHOrb25SCruoUFZylPL/u2f5QgwpAZWBbSEhAXiJgtEiPj1MNi0dWlFKRye
	 tY2eo0osFH/1HmsClI1TF9ipGymNCLK7D8XXxmbO9ccQZOrgRLyYvwTYxdc9oa/8QQ
	 epz/pbrbOBhc7AqECMmAzqj4Jhiaf///6SLznrY7gQEEwBSDAWsoQ4fjnkx2WJZ7CR
	 cl+BPm+AAX5F9vENdXGE4ZuCRs9fOkOC2Iaqf0z8HcMp0GuFsH1Pm/e+0Zthqsb5f7
	 HVfkv9i7NwX9GPypAbtAsIudbZ8pdrFwGuYk9e3gA6B3drQnEORdjz33DGjSjkWPDE
	 tszN+/h87ARiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D62517E35D8;
	Thu, 12 Dec 2024 11:27:54 +0100 (CET)
Message-ID: <5d06211b-5ee2-48dd-9334-7c8bcffb894e@collabora.com>
Date: Thu, 12 Dec 2024 11:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
 <20241212090029.13692-3-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241212090029.13692-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_022757_228942_17E4AA09 
X-CRM114-Status: GOOD (  19.37  )
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

Il 12/12/24 09:59, Crystal Guo ha scritto:
> Add devicetree binding for mediatek common-dramc driver.
> 
> The DRAM controller of MediaTek SoC provides an interface to
> get the current data rate of DRAM.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   .../mediatek,common-dramc.yaml                | 129 ++++++++++++++++++
>   1 file changed, 129 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
> new file mode 100644
> index 000000000000..c9e608c7f183
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2024 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mediatek,common-dramc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Common DRAMC (DRAM Controller)

MediaTek DRAM Controller (DRAMC)

> +
> +maintainers:
> +  - Crystal Guo <crystal.guo@mediatek.com>
> +
> +description: |
> +  The DRAM controller of MediaTek SoC provides an interface to
> +  get the current data rate of DRAM.

No, the DRAM Controller does much more than just that.

> +
> +properties:
> +  compatible:
> +    const: mediatek,common-dramc

Absolutely no! Compatibles are per-soc.

mediatek,mt8186-dramc
mediatek,mt8188-dramc
mediatek,mt8195-dramc

etc

> +
> +  reg:
> +    minItems: 9
> +    items:
> +      - description: DRAMC_AO_CHA_BASE
> +      - description: DRAMC_AO_CHB_BASE
> +      - description: DRAMC_AO_CHC_BASE
> +      - description: DRAMC_AO_CHD_BASE

All those channels are sequential in AO->NAO, in the sense that
every channel is:

CH0     AO: 0x10230000   len: 0x4000
CH0    NAO: 0x10234000   len: 0x2000
CH0 PHY_AO: 0x10236000   len: 0x2000
CH0 PHY_AO: 0x10238000   len: 0x2000

So the reg can be simplified as

minItems: 4
items:
   - description: DRAM Controller Channel 0
   - description: DRAM Controller Channel 1
   - description: DRAM Controller Channel 2
   - description: DRAM Controller Channel 3


> +      - description: DRAMC_NAO_CHA_BASE
> +      - description: DRAMC_NAO_CHB_BASE
> +      - description: DRAMC_NAO_CHC_BASE
> +      - description: DRAMC_NAO_CHD_BASE
> +      - description: DDRPHY_AO_CHA_BASE
> +      - description: DDRPHY_AO_CHB_BASE
> +      - description: DDRPHY_AO_CHC_BASE
> +      - description: DDRPHY_AO_CHD_BASE
> +      - description: DDRPHY_NAO_CHA_BASE
> +      - description: DDRPHY_NAO_CHB_BASE
> +      - description: DDRPHY_NAO_CHC_BASE
> +      - description: DDRPHY_NAO_CHD_BASE
> +      - description: SLEEP_BASE

You're not using the SLEEP_BASE iospace, and that's not even really specific
to the DRAM Controller. Drop it.

> +
> +  support-ch-cnt:
> +    maxItems: 1

Don't tell me that the DRAM Controller in MediaTek SoCs cannot see how many
channels are actually occupied by a DRAM bank, because I will be really skeptical.

You can autodetect that in the driver, you don't need a DT property for that.

> +
> +  fmeter-version:
> +    maxItems: 1
> +    description:
> +      Fmeter version for calculating dram data rate

The Fmeter version is SoC-specific, you need platform data, not DT property.

> +
> +  crystal-freq:
> +    maxItems: 1
> +    description:
> +      Reference clock rate in MHz

Is this crystal an external component, or is it integrated into the SoC?

> +
> +  shu-of:
> +    maxItems: 1

There's no description, what is shu-of?

> +
> +  pll-id: true
> +  shu-lv: true
> +  sdmpcw: true
> +  posdiv: true
> +  fbksel: true
> +  dqsopen: true
> +  async-ca: true
> +  dq-ser-mode: true

Same for these ones, please describe them - but then remember: if those parameters
are board-specific, they can stay here, otherwise those go in platform data.

Besides, I doubt that those are board specific.

Regards,
Angelo


