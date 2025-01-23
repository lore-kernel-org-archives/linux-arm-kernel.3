Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18122C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISiaXzwM8SDAMNs3ASxK9KpfZqPXdPHVEQ5zkEDOHJQ=; b=b3k7KOYFttZckUGd6KzGhdRh9S
	PaOcBBJc49+U2i8TpjTr8F1RhQc07NAutmV2/B+DFg2NqJedsKjzr4imu0bUbTIIYj43CSwPFFGZA
	xdsr4PVtKe01TV4OG4lDfHl4Zf/a/Jpdz+TM5JqIdKS3bAmq3N/sKY4GWj2FA+7HxGSeyAUbe9vCy
	9r0jPlXn56RSeSh56AAwDIgeAJL656fRI3JULbxTF1RxrpYN7QP+AKIt8YOLcYXQ4yvCyB1zf2Jub
	jqt+Xcw3u/bFr355KlY2fDT39zGJBNlGAAQeFcDu+eQYZ8V9U4/82Xf9P2Zyd/QhabYVGK0XYhCx8
	XnJhPoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4wZ-0000000DKe2-1Ths;
	Thu, 23 Jan 2025 21:40:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4u4-0000000DKSL-1thb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8104F5C5B53;
	Thu, 23 Jan 2025 21:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AEAC4CED3;
	Thu, 23 Jan 2025 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737668299;
	bh=kIg09Min6QwFaovmaca18U9kozBuMZ1yuBDBVGZHNLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0Gl7ZvIuWU4RspKumbfgiP3PSD4xH0Ac1OIpaIVQ7wbHfcXEC3xzHjRNNUWHhdT7
	 EyaW8WmYu/8mNAO0/UoTeo6doKEkdNDD9Rwhr+0mXjYlAFMtI+gGkREM23XdLPIMjU
	 nEJwGXzJPx7O+coBGU9aYtBGVTHO5ooI48pAiSQNTNuursXmYsfpOWgotEDgdA9Zf0
	 CRwFe4bPhNhsE7BYcKc40iZpgKIgU6+jhC4JASdjys8GdiIjCvve0I63E564CgLPeE
	 f9zGCoQGzFUV/QcOaJh87AfD2PYRljR8v2eQlYCVTW3G6PngfnG4Bv8L5ad7rCBpI6
	 57cW6lsfZqCnw==
Date: Thu, 23 Jan 2025 15:38:18 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jingoohan1@gmail.com,
	p.zabel@pengutronix.de, johan+linaro@kernel.org,
	quic_schintav@quicinc.com, cassel@kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v3 01/10] dt-bindings: PCI: Add STM32MP25 PCIe Root
 Complex bindings
Message-ID: <20250123213818.GA401153-robh@kernel.org>
References: <20250115092134.2904773-1-christian.bruel@foss.st.com>
 <20250115092134.2904773-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115092134.2904773-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_133820_580490_AFD5FE79 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Jan 15, 2025 at 10:21:25AM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> 
> Supports 4 INTx and MSI interrupts from the ARM GICv2m controller.
> 
> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports WAKE# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-common.yaml    |  43 +++++++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 120 ++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
> new file mode 100644
> index 000000000000..9ee25bb25aac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe RC/EP controller
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  STM32MP25 PCIe RC/EP common properties
> +
> +properties:
> +  clocks:
> +    maxItems: 1
> +    description: PCIe system clock
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1

You have phys in host bridge and the root ports?

> +
> +  phy-names:
> +    const: pcie-phy

-names is unless when there is only 1 entry. We already know it's a 
'phy' for 'pcie', so the whole string adds nothing.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO controlled connection to PERST# signal
> +    maxItems: 1

You have multiple root ports, but only one PERST# signal?

> +
> +required:
> +  - clocks
> +  - resets
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> new file mode 100644
> index 000000000000..b5b8c92522e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP25 PCIe Root Complex
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - $ref: /schemas/pci/st,stm32-pcie-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-pcie-rc
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers.
> +      - description: PCIe configuration registers.
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: config
> +
> +  msi-parent:
> +    maxItems: 1
> +
> +  wake-gpios:
> +    description: GPIO used as WAKE# input signal
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +dependentRequired:
> +  wakeup-source: [ wake-gpios ]
> +
> +patternProperties:
> +  '^pcie@[0-2],0$':
> +    type: object
> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      phys:
> +        maxItems: 1
> +
> +      phy-names:
> +        const: pcie-phy
> +
> +    required:
> +      - phys
> +      - phy-names
> +      - ranges
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - ranges
> +  - dma-ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +    pcie@48400000 {
> +        compatible = "st,stm32mp25-pcie-rc";
> +        device_type = "pci";
> +        reg = <0x48400000 0x400000>,
> +              <0x10000000 0x10000>;
> +        reg-names = "dbi", "config";
> +        #interrupt-cells = <1>;
> +        interrupt-map-mask = <0 0 0 7>;
> +        interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
> +                 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
> +                 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
> +        dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
> +        clocks = <&rcc CK_BUS_PCIE>;
> +        resets = <&rcc PCIE_R>;
> +        msi-parent = <&v2m0>;
> +        wakeup-source;
> +        wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +        reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
> +        access-controllers = <&rifsc 68>;
> +        power-domains = <&CLUSTER_PD>;
> +
> +        pcie@0,0 {
> +          device_type = "pci";
> +          reg = <0x0 0x0 0x0 0x0 0x0>;
> +          phys = <&combophy PHY_TYPE_PCIE>;
> +          phy-names = "pcie-phy";
> +          #address-cells = <3>;
> +          #size-cells = <2>;
> +          ranges;
> +        };
> +
> +    };
> -- 
> 2.34.1
> 

