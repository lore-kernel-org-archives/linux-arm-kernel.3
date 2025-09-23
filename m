Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62yh3o99XcU9rhTa5BDldF7Wvq8f5oMEOjZQazW483k=; b=CvHRRU0F2r/1ey2TbP1r0Y7n8c
	FBXQEcBxnW9fOthovjPN7v68AZA9CHMemVP88NWnr8IbE2dt4Z+SHP4ByGUYjNnRhogXTMRO2URf5
	G3LhLwGkSw3D/9yV8MCsSfnAkiURw5UCj5V2j6StIpI0m07gl5ECXVRergBnP7aJ43OfCwvkA0NTw
	a0P4qSc6rU1eCmzxpbx4AUo5rfQWiSAfADTSOkohNQqBsZElEzGjzZn+Ko8hZvpNO/pPxxaYSaJqK
	J1lLsB+CQUrx+ex972k7JXAymTgRo3D2asu38vg4BVW8n6PDm/PAUUIv037Bb3wjYifAOFCvBJ9Mg
	YNB5AJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13VI-0000000DcGv-2fol;
	Tue, 23 Sep 2025 13:56:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13VF-0000000DcFn-3Xkc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 13:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ACD044411;
	Tue, 23 Sep 2025 13:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A2CC4CEF5;
	Tue, 23 Sep 2025 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758635781;
	bh=kOlptTAMuRl5NWkzp4fnFsjCn40/aOU6F6uREez5ENk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMp2ue66YefrR3Co7QU397bbhtXrB6SVemYwwBHQgH4mBwYaUL7FS2M8sSNaDaGVe
	 oh0fOrvLQ8Qq2sHRMUUl3QTyBWZwmhvKWmvmI+t4OBYyJaeTafxT1HnSujYrMdQhxy
	 QAENl5pu7LE+mYbG2nKFJnlH+l5khBSQFDKz2x7uqBYosSRaFzQzaKjQV7XupQl+i1
	 X3y/YK2blE2R7zcbtS9uQ3pcMOEdhQOOUm3WziewPLND6qmPRgvx4UOUYh7fwng4v7
	 emMTSKwoA+jwn/sSgjNOI1jzX7PJRrzVbnnE/l5MDngd1jBQ+c+zGfH21d/2HwgGyk
	 JzQW4e+x5k3pw==
Date: Tue, 23 Sep 2025 08:56:20 -0500
From: Rob Herring <robh@kernel.org>
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 4/9] dt-bindings: mmc: add binding for BST DWCMSHC SDHCI
 controller
Message-ID: <20250923135620.GA3119392-robh@kernel.org>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
 <20250923-v4-patch-final-v1-4-2283ad7cbf88@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-v4-patch-final-v1-4-2283ad7cbf88@thundersoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_065621_931202_84C3FA51 
X-CRM114-Status: GOOD (  24.18  )
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

On Tue, Sep 23, 2025 at 02:10:10PM +0800, Albert Yang wrote:
> Add device tree binding documentation for the Black Sesame Technologies
> (BST) DWCMSHC SDHCI controller.
> 
> This binding describes the required and optional properties for the
> bst,c1200-dwcmshc-sdhci compatible controller, including register layout,
> interrupts, bus width, clock configuration, and other controller-specific
> features.
> 
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> 
> ---
> Changes for v4:

Thanks for the changelog here, but the subject should have 'PATCH v4' so 
various tools work.

> - Remove Signed-off-by line for Ge Gordon
> - Change `$ref: mmc-controller.yaml#` to `$ref: sdhci-common.yaml#`
> - Change compatible string from `bst,c1200-dwcmshc-sdhci` to `bst,c1200-sdhci`
> 
> Changes for v3:
> - Switch reg schema from maxItems to explicit items with per-entry descriptions
> - Improve example: add irq.h include and wrap under a bus node with address/size cells
> - Drop status = "disabled" from example; keep example concise
> - Add Signed-off-by: Ge Gordon
> 
> Changes for v2:
> - Simplify description, remove redundant paragraphs
> - Update $schema to reference mmc-specific scheme
> - Correct compatible to add soc name (bst,c1200-dwcmshc-sdhci)
> - Remove all redundant property descriptions
> - Drop invalid mmc_crm_base/size properties, use reg for all address ranges
> - Clean up required properties to only essential entries
> - Standardize example DTS format, fix reg syntax and property ordering
> - Remove additionalProperties: true
> ---
>  .../devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml | 70 ++++++++++++++++++++++

Filename should match compatible.

>  1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7f16e6db39690cb7621d167bf7bc492f814ea693
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/bst,dwcmshc-sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Black Sesame Technologies DWCMSHC SDHCI Controller
> +
> +maintainers:
> +  - Ge Gordon <gordon.ge@bst.ai>
> +
> +allOf:
> +  - $ref: sdhci-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: bst,c1200-sdhci
> +
> +  reg:
> +    items:
> +      - description: Core SDHCI registers
> +      - description: CRM registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: core

Not really any point in having -names when there is only 1 entry.

> +
> +  memory-region:
> +    maxItems: 1

Having this is odd. Please add a description saying what it is for.

> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mmc@22200000 {
> +            compatible = "bst,c1200-dwcmshc-sdhci";
> +            reg = <0x0 0x22200000 0x0 0x1000>,
> +                  <0x0 0x23006000 0x0 0x1000>;
> +            interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clk_mmc>;
> +            clock-names = "core";
> +            memory-region = <&mmc0_reserved>;
> +            max-frequency = <200000000>;
> +            bus-width = <8>;
> +            non-removable;
> +            dma-coherent;
> +        };
> +    };
> 
> -- 
> 2.43.0
> 

