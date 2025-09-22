Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5313DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SdojKNKwDfgKCl2U045dRf4D95aQNyA3CbcUeIq5ug=; b=c4TM6Rx2aFURgVgy4iW4AxQU//
	XMlb5P7BIiisd+z8IU5BDasKJ0wCLPwXBC1dfWu4DXT08tklf4ra2tv9K2pEkEZVsoUv2Rer23ku5
	NJy0ABmOJ+va/DJEY7yz8lCF3iZNhxdlVY6qeRULLsZTp8CRbQ8p9alir8dmS8KRwCWUyarniqPYM
	4qVEOtc696CiSWokK8jgA9mzcX7XLr2x/tNQCVFeyGNdQBKMzUwgAZOXJdxQdadzSucf+Be2l1lMY
	je878LQ6VfaqgztWbzpl8+j1J98BZBoUu+SacETbv12Ml1ACRC/uCfihfQy39MwHJ2yVZSFjjxRgN
	MPdwY2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mbn-0000000BOEz-393N;
	Mon, 22 Sep 2025 19:53:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mbk-0000000BODz-2zZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 19:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 125FC44F76;
	Mon, 22 Sep 2025 19:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C45C4CEF5;
	Mon, 22 Sep 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758570835;
	bh=JaOkQ3CL5j84b3sEHTMILLeyb7louIBqflmOtWnUrYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfSJnZgMo9fg9QT8eg+mKuHHHbEKj6Z8TLHSLxLGYzdupZyObeF4tQPB0Ec9cJzpE
	 sv6hAia69N2imXYz7yyk5QCiJ5T9zq6+3AqgvQIhw04YAlg6pj30r96ol3XjV/JLKT
	 83jEDrMDM/Kz6OOLmyzOjaL051Y8FjhydkjkKm/QuPfoOLpaLpH97su+CSyEV/8ONx
	 vfh+K15q7OM4Ksx7IGFrLaCQgmM3Vi6+OM7R47zAsug2v/5jY/plVCXmYkJEpwssY3
	 x1uTpESIY2K7QrgGRH8ZX/AASjScxuwcqSZFxt7fh8cPrLzv/iOXW1PyyfbDDVq0bi
	 XvaxzrvEF4zUQ==
Date: Mon, 22 Sep 2025 14:53:54 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Message-ID: <20250922195354.GA1065946-robh@kernel.org>
References: <20250919135950.10403-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919135950.10403-1-shgarg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_125356_790983_937B9EFC 
X-CRM114-Status: GOOD (  21.28  )
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

On Fri, Sep 19, 2025 at 01:59:50PM +0000, Shubhi Garg wrote:
> Add device tree bindings for NVIDIA VRS (Voltage Regulator Specification)
> RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
> power sequencing solution with I2C interface. The device includes RTC
> which provides functionality to get/set system time, retain system
> time across boot, wake system from suspend and shutdown state.

I only see this patch. The threading of this is broken.

> 
> Supported platforms:
> - NVIDIA Jetson AGX Orin Developer Kit
> - NVIDIA IGX Orin Development Kit
> - NVIDIA Jetson Orin NX Developer Kit
> - NVIDIA Jetson Orin Nano Developer Kit
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> v5:
> - moved device tree bindings from mfd to rtc
> - changed dtb node name to rtc@3c
> - changed compatible string to "nvidia,vrs10-rtc"
> 
> v4:
> - no changes
> 
> v3:
> - fixed device tree node name to generic "pmic@3c"
> - fixed indentation
> 
> v2:
> - fixed copyrights
> - updated description with RTC information
> - added status node in dtb node example
> 
>  .../bindings/rtc/nvidia,vrs10-rtc.yaml        | 59 +++++++++++++++++++

Filename should match compatible string.

>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
> new file mode 100644
> index 000000000000..e8f3c25607e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nvidia,vrs10-rtc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nvidia,vrs10-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Voltage Regulator Specification Real Time Clock
> +
> +maintainers:
> +  - Shubhi Garg <shgarg@nvidia.com>
> +
> +description:
> +  NVIDIA VRS-10 (Voltage Regulator Specification) is a Power Management IC
> +  (PMIC) that implements a power sequencing solution with I2C interface.
> +  The device includes a real-time clock (RTC) with 32kHz clock output and
> +  backup battery support, alarm functionality for system wake-up from
> +  suspend and shutdown states, OTP memory for power sequencing configuration,
> +  and an interrupt controller for managing VRS events.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs-10
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@3c {
> +            compatible = "nvidia,vrs-10";
> +            reg = <0x3c>;
> +            interrupt-parent = <&pmc>;
> +            interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
> +    };
> -- 
> 2.43.0
> 

