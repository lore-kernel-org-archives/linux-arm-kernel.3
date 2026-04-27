Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032E3FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A8c5EaUo5IoDVaBozvn/C7Rmnc8Mb33RmetMp8FsMQ=; b=NKfBOhKk/fUItLERhyi5+TAjLP
	8aW6IW8ji6HtNRnkCSdsz98Fpc7xWN7DByB99xsnviOaHXvpJ2XKjzlsVkGmnQRBW/bIAuqIgWdFT
	NS+sWTjwzy7ETl1Ea8Ss9pnH6jHEuaRYRnBmIwliFTwPmD6HDY6dHpEidpgVGggnyI3la/5a0uyhm
	LCeYxAh9JIjk0NKN/30tcNY6Q1WvG0G9lLMHI6AwbDUEAavHnSl4FsvdqFAX6AJxjwBO/OO4xrWqV
	njRmVhHvXlaLf+iBOmzzYc+TTB4mNH08aW0BfFl+1zNgRwcVqqQjNVbPREG7czKDu9OXUvSLf7unA
	0/FAudQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMMw-0000000H1yd-3t4n;
	Mon, 27 Apr 2026 13:51:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMMv-0000000H1yS-2qUm;
	Mon, 27 Apr 2026 13:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A44D061141;
	Mon, 27 Apr 2026 13:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E43BC2BCB4;
	Mon, 27 Apr 2026 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297884;
	bh=lc2dFE2do90KeKyX8qyoFkG1PvpHS4hbDdHzs4tyRag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krNIz+YgbUJQ+HQIxonDgleTHi9ZbHyd4RJdhrla2R1K+mTPLOUiL6TuW+1bSuOHq
	 fFIyFshK6yLb+B6V554dRg03U3t6i3aJIv0Zt5V06WyZ6KG42pj+imi0uk5iCIrZjl
	 VMcImRdayHHcz2kFcn7gE4/fgz9QHiCi7MyTfF2ByAfHLv4xRSd93jFycAPaaF0b3B
	 T6bkzxX/2/0EjAiIPQeusMRROsOI8R6wZbFqRZIZD1RZnd8ntWtHq06Mfe5GygdbT1
	 1Nmlt2LZOaIE/Tccw0RKpgK4hEdMuMykamFbTGXOm7RIRpztVzk1UprHAsMcMJ5dzg
	 zuFA4LiWuP8Ww==
Date: Mon, 27 Apr 2026 08:51:22 -0500
From: Rob Herring <robh@kernel.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Hailong Fan <Hailong.Fan@mediatek.com>,
	Huayu Zong <Huayu.Zong@mediatek.com>,
	Jarried Lin <Jarried.Lin@mediatek.com>,
	Justin Yeh <Justin.Yeh@mediatek.com>,
	Vince-WL Liu <Vince-WL.Liu@mediatek.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: remoteproc: Add MediaTek mt8196 VCP
 binding
Message-ID: <20260427135122.GA2322791-robh@kernel.org>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
 <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
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

On Mon, Apr 27, 2026 at 07:04:40PM +0800, Xiangzhi Tang wrote:
> Add device tree binding for the MediaTek Video Companion Processor
> (VCP), a RISC-V based coprocessor used for video processing and
> multimedia tasks on mt8196 and future MediaTek SoCs.
> 
> The VCP is a heterogeneous multi-core processor that can contain
> multiple RISC-V cores with different hart (hardware thread)
> configurations. Key features:
> 
> - Supports both single-core and multi-core VCP configurations
> - Each core can have 1 or 2 harts (hardware threads)
> - Shared SRAM memory space partitioned among cores
> - Communication via 5 dedicated mailbox channels for IPI messaging
> - Integrated with SoC IOMMU for multimedia memory management
> - Boot and power management coordinated with ARM Trusted Firmware
> 
> The binding defines both the top-level VCP device (with mailboxes,
> interrupts, and power domains) and child nodes for individual VCP
> cores (with SRAM allocation and hart configuration).
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> new file mode 100644
> index 000000000000..8ecb643cbdc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/mediatek,mt8196-vcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Video Companion Processor (VCP)
> +
> +maintainers:
> +  - Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> +
> +description:
> +  This binding provides support for the MediaTek Video Companion Processor
> +  (VCP), a Risc-V coprocessor found on some MediaTek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp
> +
> +  reg:
> +    items:
> +      - description: sram base
> +      - description: cfg group IO
> +      - description: cfg core group IO
> +      - description: cfg sec group IO
> +
> +  reg-names:
> +    items:
> +      - const: sram
> +      - const: cfg
> +      - const: cfg-core
> +      - const: cfg-sec
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 5

You have to define what each one is.

> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1
> +      - const: mbox2
> +      - const: mbox3
> +      - const: mbox4

name plus an index is not useful.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Using MediaTek IOMMU to apply larb ports for Multimedia Memory
> +      Management Unit and address translation.
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^vcp@[a-f0-9]+$":
> +    type: object
> +    description:

You need '>' for paragraphs.

> +      The MediaTek VCP integrated to SoC might be a multi-core version.
> +      The other cores are represented as child nodes of the boot core.
> +      There are some integration differences for the IP like the usage of
> +      address translator for translating SoC bus addresses into address
> +      space for the processor.
> +
> +      The SRAM is shared by all cores, each VCP core only using a piece of
> +      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
> +      The size of SRAM varies on different SoCs.
> +
> +      The VCP cores have differences on different SoCs for Hart support.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mediatek,vcp-core
> +
> +      reg:
> +        description: The base address and size of SRAM.
> +        maxItems: 1

This is memory mapped, right? If so you need 'ranges' in the parent 
node.

> +
> +      reg-names:
> +        const: sram
> +
> +      mediatek,vcp-core-harts:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Number of harts in this VCP core.
> +        enum: [1, 2]
> +
> +      mediatek,vcp-core-sram-offset:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Offset of the allocated SRAM memory for this VCP core.

Why do you have this and SRAM for the core defined in reg? It should 
only be in reg.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - mediatek,vcp-core-harts
> +      - mediatek,vcp-core-sram-offset
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - mboxes
> +  - mbox-names
> +  - power-domains
> +  - iommus
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8196-power.h>
> +
> +    vcp: vcp@31800000 {

Drop unused labels.

> +        compatible = "mediatek,mt8196-vcp";
> +        reg = <0x31800000 0x60000>,
> +              <0x31a04000 0xa000>,
> +              <0x31bd0000 0x1000>,
> +              <0x31a70020 0x100>;
> +        reg-names = "sram",
> +                    "cfg",
> +                    "cfg-core",
> +                    "cfg-sec";
> +
> +        interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +        mboxes = <&vcp_mailbox0>,
> +                 <&vcp_mailbox1>,
> +                 <&vcp_mailbox2>,
> +                 <&vcp_mailbox3>,
> +                 <&vcp_mailbox4>;
> +        mbox-names = "mbox0", "mbox1", "mbox2", "mbox3", "mbox4";
> +
> +        power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
> +        iommus = <&mm_smmu 160>;
> +        memory-region = <&vcp_resv_mem>;
> +
> +        vcp@0 {
> +            compatible = "mediatek,vcp-core";
> +            reg = <0x0 0x31000>;
> +            reg-names = "sram";
> +            mediatek,vcp-core-harts = <2>;
> +            mediatek,vcp-core-sram-offset = <0x0>;
> +        };
> +
> +        vcp@31000 {
> +            compatible = "mediatek,vcp-core";
> +            reg = <0x31000 0x60000>;
> +            reg-names = "sram";
> +            mediatek,vcp-core-harts = <1>;
> +            mediatek,vcp-core-sram-offset = <0x31000>;
> +        };
> +    };
> -- 
> 2.46.0
> 

