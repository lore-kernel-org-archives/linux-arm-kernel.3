Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FCAC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1qlk8xMfjxcZpgCx30ayfptIduogwSr4czU5vrZVUA=; b=n6nwbSuEN+FXEvglxVycqF6fdM
	RSdAVYhW615SdM7ThsWp/IblkTuxXvRSTKPUg0wILzMbpa41/sT7Us/FqWC7LBTEJutAIBQaITUuZ
	Pb9l37jHDkVvEost2THaLcnWjAoeLTEsc1qcGAa4EI4hk8KHKrfQU6rComO8PiXE1kHk13cMkkrrX
	aRYBaSDKLKRaWe8e1tpsi0rrwUCteJpEjgH8SLugaWmSYi6dT9n1yPzJCIyClcpDI1yih6f0N/Jnc
	2gh/7wMRsLfERJLdr05BYjLBXRYZ9PHtSxnGziOmJvLViNtfrcH5lVzas8hUj1Bf1QzIJ/AiInhml
	IGGZngAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wHJ-00000004mV1-0SHE;
	Tue, 22 Sep 2026 08:55:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wHI-00000004mUa-0hSF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:55:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AAE142D85;
	Tue, 22 Sep 2026 08:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3161F000FF;
	Tue, 22 Sep 2026 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067303;
	bh=K1qlk8xMfjxcZpgCx30ayfptIduogwSr4czU5vrZVUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KOEYzUW5oJNFCDtWQykOhGn86Br0ampyjdGaizhhyVsQntXloTEwdWg0ZN6EXokMi
	 hQB5xHA0fLt4Lnj2qUIw5v85Bdt6I9ECKfOikMT5hWgbMT8Dj0dZybkBNZ4lqqkxvZ
	 1LnkbSIuLuFswA86DHzsEqI4iHUHQZ9uXOol5685vWoN9PUd3wz+2zpmRCn95YLkOX
	 jwLPAh5JQc5FD0rO0O3gYoXk84rAeTod1OYYE+wjvv7RfeVcAlyhmL0Q4fvKsIFTRp
	 yV/sFyIMNocNaFhvrfxKKERxjXnMyRGFsvW483nzuzplfb0umC3xcrpkLP+1HIttzb
	 PFYgMPcXtoGEg==
Message-ID: <c13dd4d8-0e35-4840-99d4-fb62bac661e9@kernel.org>
Date: Tue, 22 Sep 2026 10:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox
 schema
To: Tim Michals <tcmichals@gmail.com>, linux-sunxi@lists.linux.dev
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260922034711.190253-2-tcmichals@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260922034711.190253-2-tcmichals@gmail.com>
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

On 22/09/2026 05:47, Tim Michals wrote:
> Add Device Tree binding schema for the Allwinner 4-port hardware
> Message Box controller found on sun55i (A523, A527, T527) and
> sun60i (A733) SoCs.

Thank you for your patch. There is something to discuss/improve.


> 
> The message box connects the ARM Cortex-A55 host cluster to the
> HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
> co-processor across 12 logical channels with 8-entry hardware FIFOs.
> 
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
commit msg. There is no single need to store automated output of
get_maintainers.pl in the git log. It can be easily re-created at any
given time, thus its presence in the git history is redundant and
obfuscates the log.

If you need it for your own patch management purposes, keep it under the
--- separator.

> Signed-off-by: Tim Michals <tcmichals@gmail.com>
> ---
>  .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
> new file mode 100644
> index 000000000000..4b73543c7902
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner sun55i 4-Port Message Box
> +
> +maintainers:
> +  - Tim Michals <tcmichals@gmail.com>
> +  - Samuel Holland <samuel@sholland.org>
> +
> +description: |
> +  The hardware message box on sun55i (A523, A527, T527) and sun60i (A733)
> +  SoCs is a 4-port multi-processor mailbox controller connecting the ARM
> +  Cortex-A55 host cluster, HiFi4 Audio DSP, Power Management Unit (CPUS),
> +  and XuanTie RISC-V co-processor.
> +
> +  It features independent 256-byte register banks for each processor port,
> +  12 logical channels on the host (4 per remote processor), and 8-entry
> +  hardware FIFOs with level interrupts.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun55i-a523-msgbox
> +      - allwinner,sun55i-t527-msgbox
> +      - allwinner,sun60i-a733-msgbox
> +
> +  reg:
> +    minItems: 4

You can drop minItems

> +    maxItems: 4
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Register banks for each of the four processor ports. Each port has
> +      an independent 256-byte register bank.
> +
> +  reg-names:
> +    items:
> +      - const: arm
> +      - const: dsp
> +      - const: cpus
> +      - const: rv
> +
> +  clocks:
> +    maxItems: 1
> +    description: bus clock

Redundant description, drop.

> +
> +  resets:
> +    maxItems: 1
> +    description: bus reset

Also here

> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4

How interrupt could be optional? It either is or is not there.

> +    description: |
> +      One interrupt per processor port. The host port interrupt is required;
> +      remote port interrupts are optional.
> +
> +  '#mbox-cells':
> +    const: 1
> +    description: "channel number (0-11: 0-3 CPUS, 4-7 DSP, 8-11 RISC-V)"
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - resets
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false




Best regards,
Krzysztof

