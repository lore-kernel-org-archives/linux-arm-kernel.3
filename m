Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF90C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyUSuNL69M6kmh09zKLoG/A/RhPHSQoEpCqx+VUsHvs=; b=E3TPTiNEFGBKKqd8It7I/nz9yO
	+eGFu+E9SS8kvpUs7X18uT9k3P6t4mdVZOBkE5tY4R0B52GWUmdM2omnA2dyiE+nXrLLWS9o1XOo/
	i3/ADFOcoqGKK8mt+JX1ZWSj4BwwpbSY3DdcCVyyd9I03vMWcC+Jwb/Wgvl+DsqV8YGS2rDKlc0Z5
	HYDTUFXZM9PhZVHM/+wWnoZZa+dsWlFWNkzQJhScjYRoTuIYWQXR85fmBK6rDP71GcS7P0tae1FvE
	hp+SCs94wgE2CkDsTK3YB8on9P7qPX2xJw3lYkEyBn0Dlk2Y4gFyfCiolLPgQ24yuaTo38LwNgYOX
	4NlPe1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzw2O-00000005sm9-2IyK;
	Wed, 02 Apr 2025 11:13:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzw0e-00000005sgP-2sqE;
	Wed, 02 Apr 2025 11:11:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E44261145;
	Wed,  2 Apr 2025 11:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00991C4CEDD;
	Wed,  2 Apr 2025 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743592311;
	bh=UqhKSL65Dxgk2dVyb4tCArOqKN+10TQqPqttHJ0QJO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Js1F89MZ7mNqy+1Rx8WRbvLFGAnn2kyc2xk0D+jRJgnpYglHNNXsre5BwSajoXQfx
	 z/7Xu4ofH+VNbrxEI5IbjrJOkoE0xTlmrWLfz4E9roXufyg/9MaSMoMpV4JdsYxzw6
	 dLR1Li/2S8SAU5llwUTxs7P38xefN0Rr1OGrSAblHNcJzpFfeb3J3QV/TCKO7LEqs0
	 X9wkOlEipCmvqyd+482RTngII0StYMWDcxMWTO5EYbqYXMCSPFjbu6UKAhc0RTmnee
	 k2nqn36OmTL57W9u9X8XDLieQAs/ax7pDXmDmjp1pa6gW9jG9JlXDd4Erraijhkr28
	 dC985VtQWHccA==
Message-ID: <860ae623-f33f-4cfe-be08-6bb6524ecf94@kernel.org>
Date: Wed, 2 Apr 2025 13:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jjian.zhou@mediatek.com,
 hailong.fan@mediatek.com
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
 <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 02/04/2025 11:19, Xiangzhi Tang wrote:
> +
> +description:
> +  The MediaTek VCP enables the SoC control the MediaTek Video Companion Risc-V coprocessor.

Wrap at coding style.

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
> +      - description: vcp rdy group IO
> +
> +  reg-names:
> +    items:
> +      - const: sram
> +      - const: cfg
> +      - const: cfg_core
> +      - const: cfg_sec
> +      - const: vcp_vlp_ao_rsvd7
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    description:
> +      Using mailbox to communicate with VCP, it should have this
> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
> +      for details.

Drop entire description, redundant.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +

No, you do not get your own type. Instead list items or just maxItems.


> +  mbox-names:
> +    maxItems: 5

No, you must list the items.

> +
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.

Look how other bindings do it. Do not repeat obvious stuff, do not
develop bindings entirely different than all others.

> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Using MediaTek iommu to apply larb ports for Multimedia Memory
> +      Management Unit and address translation
> +      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Really, look at other code first.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  vcp-mem-tbl:
> +    description:
> +      Manage reserved memory for VCP RTOS FW and various features.

No, reserved memory is in memory-region. Drop property.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 12
> +
> +patternProperties:
> +  "^vcp_[a-f0-9]+$":

Follow DTS coding style.

Heh, nothing here was really tested and you have obvious bugs pointed
out by simple testing of DTS.

Why these children are needed in the first place? Offsets are implied by
parent compatible.

> +    type: object
> +    description:
> +      The MediaTek VCP integrated to SoC might be a multi-core version.
> +      The other cores are represented as child nodes of the boot core.
> +      There are some integration differences for the IP like the usage of
> +      address translator for translating SoC bus addresses into address
> +      space for the processor.
> +
> +      The SRAM are shared by all cores, each VCP core only using a piece
> +      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
> +      The size of SRAM are varied on differnt SoCs.
> +
> +      The VCP cores has differences on different SoCs to support for
> +      Hart.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mediatek,vcp-core
> +          - mediatek,mmup-core
> +
> +      twohart:

Missing vendor prefix, look at writing bindings and other examples.

> +        enum: [0, 1]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      sram-offset:
> +        description:
> +          Allocated SRAM memory for each VCP core used.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - compatible
> +      - twohart
> +      - sram-offset
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
> +  - vcp-mem-tbl
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
> +        compatible = "mediatek,mt8196-vcp";
> +        reg = <0x31800000 0x60000>,
> +              <0x31a04000 0xa000>,
> +              <0x31bd0000 0x1000>,
> +              <0x31a70020 0x100>,
> +              <0x1c00091c 0x4>;

Quite different address,  are you sure this is still part of this
device? Looks like on register.


Best regards,
Krzysztof

