Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX7bYN4rGbRvqQqBmIKzfA7x2bDh6jhYMiXVyVV5RO0=; b=RKPfBARmi3IJECnPjGXldfa08v
	pSJLSfpuEXVuBM3PfQIRJQiOBFnLMYPB9WWRAl3pBff3vl7KeTdfbb8CQYWNNRh7d5eYrTnNgv5Wa
	mYv+HABds+Rn7Keh/yJjS75wkS5cOKSyhpdnGLyTZxznRrpp0ZLKeIZj3THaKj74Ugo6gTbAsq4+A
	JvD66LCFb28CVQ36Nrg5owhPghCxCMjbT2F1nTCbnWtcnJ/uhWvaZVWHJrPciW52HzNmFA14trOwX
	0tyUxo5fzWiJjwWPJcO/UAVT7Mpj9y0HAu7B95cdW9imcIdI5PCVyPOM4M3zQaOjvcSlwJj0+DT8i
	j51Y4ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyt9-00000007pp2-41HL;
	Fri, 12 Sep 2025 08:12:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyt3-00000007pl5-3fd7;
	Fri, 12 Sep 2025 08:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664693;
	bh=9+xOYBeZ+X7h8ramrWmPqxnrf2SG/GtpBiyuxPc138g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mLO35G+GQT/ZTZbiy0w14kycNTjbWocE+Pwgyu6D/DIjg5+dYtr+0yWVgVJU6Yrd8
	 sPUpFUckgWGN2ycq6xvqHBMDt6Ji6MjwoSD0i4MiZhQovDzDXG1Ebk5ddrI0Jccpab
	 eiy5n1YYtpHqTxsOVeMJk1jcIbSV+M1izE0FveYR38Bhf4kep7QbigM03J3epraa4P
	 eF5A7q5gQpIEtJjcwC6qT1iia+eBsvYrbXO9dAt1FCl9YwOZySfUEMqy/IflNa1FF+
	 /rA7KpHJhdhbl53sKtIxmkTmHdZSAH1NWwtu4eqeTQ06EWIWThbxVugK25jfO9d6cD
	 ocmct+H5P/ezw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6EB017E04D6;
	Fri, 12 Sep 2025 10:11:31 +0200 (CEST)
Message-ID: <b4c0f677-a97a-4076-a1d6-238854236ec9@collabora.com>
Date: Fri, 12 Sep 2025 10:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-2-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_011206_054862_2117021A 
X-CRM114-Status: GOOD (  13.63  )
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

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>   .../bindings/media/mediatek-mdp.txt           |  95 ----------
>   2 files changed, 169 insertions(+), 95 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> new file mode 100644
> index 0000000000000..8ca33a733c478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 Media Data Path
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Media Data Path is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt8173-mdp-rdma
> +          - mediatek,mt8173-mdp-rsz
> +          - mediatek,mt8173-mdp-wdma
> +          - mediatek,mt8173-mdp-wrot
> +      - items:
> +          - const: mediatek,mt8173-mdp-rdma
> +          - const: mediatek,mt8173-mdp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  mediatek,vpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
> +      image processing.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp-rdma
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Mutex clock
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +    then:
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp
> +    then:
> +      required:
> +        - mediatek,vpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mdp_rdma0: rdma@14001000 {
> +            compatible = "mediatek,mt8173-mdp-rdma",
> +                         "mediatek,mt8173-mdp";
> +            reg = <0 0x14001000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
> +            mediatek,vpu = <&vpu>;
> +        };
> +
> +        mdp_rdma1: rdma@14002000 {
> +            compatible = "mediatek,mt8173-mdp-rdma";
> +            reg = <0 0x14002000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
> +                     <&mmsys CLK_MM_MUTEX_32K>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
> +        };
> +
> +        mdp_rsz0: rsz@14003000 {
> +            compatible = "mediatek,mt8173-mdp-rsz";
> +            reg = <0 0x14003000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +        };
> +
> +        mdp_rsz1: rsz@14004000 {
> +            compatible = "mediatek,mt8173-mdp-rsz";
> +            reg = <0 0x14004000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +        };
> +
> +        mdp_rsz2: rsz@14005000 {
> +            compatible = "mediatek,mt8173-mdp-rsz";
> +            reg = <0 0x14005000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_RSZ2>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +        };
> +
> +        mdp_wdma0: wdma@14006000 {
> +            compatible = "mediatek,mt8173-mdp-wdma";
> +            reg = <0 0x14006000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_WDMA>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_WDMA>;
> +        };
> +
> +        mdp_wrot0: wrot@14007000 {
> +            compatible = "mediatek,mt8173-mdp-wrot";
> +            reg = <0 0x14007000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_WROT0>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_WROT0>;
> +        };
> +
> +        mdp_wrot1: wrot@14008000 {
> +            compatible = "mediatek,mt8173-mdp-wrot";
> +            reg = <0 0x14008000 0 0x1000>;
> +            clocks = <&mmsys CLK_MM_MDP_WROT1>;
> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> +            iommus = <&iommu M4U_PORT_MDP_WROT1>;
> +        };
> +    };
> +
> +...

