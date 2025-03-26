Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B7BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqe2Yp7IFfFJ9StH3iQ08pr7JVoIfbbzAz+K9lagJLU=; b=3EHCw5Pj4BHykk6wZWGsvsroCC
	HSsD8/77BjYyW2U8iNvfr2ww8yq5+Xkof4KLONW06I03M5UeTLghlTcwURqVojLTqPigRug2hQU4J
	KJxzlUbEWA8GNDsTt+X8y1HsVKXYD3J9YTv86IObAiHiRjNHulvEbXp/qdy2F8TqT+sicM5BYB9VH
	4JgiwQpzCmzQ3IJ2sCsS6LmzzR6t/ZLSxsHD286txpAy8nq62D8lVp9XTsRDSioCbzqd8D2+Wpn+N
	t7q3nYTg6ZG5GmekWK1YCHzllpgRVkSry1PckxzvDEM6AhbnoFxotozAqIs2UT76A1yx6ntu7f2n/
	RBDYLy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNt2-00000008AJW-0KP0;
	Wed, 26 Mar 2025 10:21:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txNqU-000000089oh-2Xbw;
	Wed, 26 Mar 2025 10:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742984329;
	bh=q/nFNojlosborYJGt0qwUe6tullznsb4Pf2IVsxtddI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2w7KzYZhiCblvBuuvmzKgygHYi2uZCJ+vZIKkxh9za6J8dIz2FAZoiRvvM6OBmdI
	 38FwuPBbPOrgaeJnsVXy81JlZ2l+ypPoTzCouhW+gZ4Ffm+7w2uPubNLS3utlWhZnj
	 mIFuelbr0pR3PcR2LLEX7K+J0oNehKGrLvFaf+J0OeFWNp9zDy/aL6ObaWWZ1rovEK
	 CoToye6Vmdx2cy4GJ8Sn2v+imUq8oJkI4rtiNF7r3qa5L0V6sDns8Xb6VFfM6uQbKw
	 enm6x+qSmGOFhxNqz47IKsgb8Z6Di62ZiIfNKkPyV5gYE2Qrdp4ksrZFMuk18OagZh
	 4L7kHRlPWWP+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88E8017E0E8F;
	Wed, 26 Mar 2025 11:18:48 +0100 (CET)
Message-ID: <fb154077-e650-480e-a4d7-0a141b563dfc@collabora.com>
Date: Wed, 26 Mar 2025 11:18:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
 <20250326063041.7126-2-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250326063041.7126-2-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_031850_791969_98829A90 
X-CRM114-Status: GOOD (  13.72  )
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

Il 26/03/25 07:30, Crystal Guo ha scritto:
> A MediaTek DRAM controller interface to provide the current DDR
> data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   .../memory-controllers/mediatek,dramc.yaml    | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
> new file mode 100644
> index 000000000000..8bdacfc36cb5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml

The filename should be "mediatek,mt8196-dramc.yaml"


> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2025 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mediatek,dramc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek DRAM Controller (DRAMC)
> +
> +maintainers:
> +  - Crystal Guo <crystal.guo@mediatek.com>
> +
> +description:
> +  A MediaTek DRAM controller interface to provide the current data rate of DRAM.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8196-dramc

P.S.: bindings maintainers: this driver is expected to get more compatibles soon.

Cheers,
Angelo


> +
> +  reg:
> +    items:
> +      - description: anaphy registers
> +      - description: ddrphy registers
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        memory-controller@10236000 {
> +            compatible = "mediatek,mt8196-dramc";
> +            reg = <0 0x10236000 0 0x2000>,
> +                  <0 0x10238000 0 0x2000>;
> +        };
> +    };



