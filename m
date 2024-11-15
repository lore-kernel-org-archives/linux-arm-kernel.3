Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E779D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0LjiaqMThscAIs7bg4QizE4MBHTTfzv3pHzToNXt/M=; b=mpVxWjnyJ7pSsNt0sDiVKRsLaa
	rYCIWB2fT5CbCGzqgg8k1iDx/D+u+RboYY3upz04lw0rpgjqlStqfiyGxMMRD1xViwi6g7Z08+Xkh
	0pkp8sJ14IPyGO13Jd7K7ddymj74kDTyCqKhrR5jwegI3cmMe69rhq9qEP92FLhrU10VfWVZJ3pPv
	GIXX7WY/1RgVf/qcx8Vto0zwO0KTssUZjvYoF4fw2P1r/18p8N9B+lWmWlyvJhsb94j3iSkkb3U2Q
	MyTFvKD6kanCyCdPP2FNcPege9Cwg3tI8G8MMUfQ82EKcZpS/J/JBbP7V6rir9WBBhzp0n3aodCR/
	6BAwk7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzKW-00000003MrE-49wm;
	Fri, 15 Nov 2024 16:37:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzIk-00000003MVj-31KC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 16:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14E1BA429E4;
	Fri, 15 Nov 2024 16:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E232C4CED5;
	Fri, 15 Nov 2024 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731688565;
	bh=6yQrzL+pY0s5bWYhKAenvAd4K3vkSdTM9mFizd+1r8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H99tUUBjROYIibs7vXroxAi3KXnmtRNRe1yk//et3sKkQZfVPW2DCaDJlHgMsrnAK
	 Y6iuBeAZFRfUzJZcbT2178fMPypgrYxiE/oWrhYWdNN0qbdZA+UsYJjonG5XV9hTnU
	 ELMQnXVNxjU30qSBtvn1KcZyVyrzBjvk0LH6C2LXAMDqTMcdUj5/183weCY3T7jw8L
	 RFds4A3qvgQD2FmsqcARtCjpAig8ANEpgfBcn7kfTUVGl7nS7Id4DXdqaAa7R84K+H
	 yKEcNGIULnpqYwTkfwqboyI1zpC1GvA7Q5bkfAEy+QsJ/aToJ/Zuc4jZxaRvsIdG7E
	 pNnt/nYpycq0Q==
Date: Fri, 15 Nov 2024 10:36:03 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241115163603.GA3188739-robh@kernel.org>
References: <20241112161925.999196-1-christian.bruel@foss.st.com>
 <20241112161925.999196-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_083606_905424_CEABA4FC 
X-CRM114-Status: GOOD (  23.57  )
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

On Tue, Nov 12, 2024 at 05:19:21PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.
> 
> Allow tuning to change payload (default 128B) thanks to the
> st,max-payload-size entry.
> Can also limit the Maximum Read Request Size on downstream devices to the
> minimum possible value between 128B and 256B.
> 
> STM32 PCIE may be in a power domain which is the case for the STM32MP25
> based boards.
> Supports wake# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> new file mode 100644
> index 000000000000..d7d360b63a08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/st,stm32-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 PCIe root complex driver
> +
> +maintainers:
> +  - Christian Bruel <christian.bruel@foss.st.com>
> +
> +description:
> +  PCIe root complex controller based on the Synopsys DesignWare PCIe core.
> +
> +select:
> +  properties:
> +    compatible:
> +      const: st,stm32mp25-pcie-rc
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#

snps,dw-pcie.yaml instead of these 2.

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
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: core

-names with a single entry is kind of pointless.

> +
> +  clocks:
> +    maxItems: 1
> +    description: PCIe system clock
> +
> +  clock-names:
> +    const: core
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: pcie-phy
> +
> +  num-lanes:
> +    const: 1
> +
> +  msi-parent:
> +    maxItems: 1

Just 'msi-parent: true'. It's already only ever 1 entry.

> +
> +  reset-gpios:
> +    description: GPIO controlled connection to PERST# signal
> +    maxItems: 1
> +
> +  wake-gpios:
> +    description: GPIO controlled connection to WAKE# input signal
> +    maxItems: 1
> +

> +  st,limit-mrrs:
> +    description: If present limit downstream MRRS to 256B
> +    type: boolean
> +
> +  st,max-payload-size:
> +    description: Maximum Payload size to use
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [128, 256]
> +    default: 128

IIRC, other hosts have similar restrictions, so you should be able to do 
the same and imply it from the compatible. Though I'm open to a common 
property as Bjorn suggested.

> +
> +  wakeup-source: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  access-controllers:
> +    maxItems: 1
> +
> +if:
> +  required:
> +    - wakeup-source
> +then:
> +  required:
> +    - wake-gpios

This can be just:

dependentRequired:
  wakeup-source: [ wake-gpios ]

(dependentRequired supercedes dependencies)

> +
> +required:
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - ranges
> +  - resets
> +  - reset-names
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
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
> +        num-lanes = <1>;
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
> +        ranges = <0x01000000 0 0x10010000 0x10010000 0 0x10000>,
> +                 <0x02000000 0 0x10020000 0x10020000 0 0x7fe0000>,
> +                 <0x42000000 0 0x18000000 0x18000000 0 0x8000000>;
> +        bus-range = <0x00 0xff>;

Don't need this unless it's restricted to less than bus 0-255.

> +        clocks = <&rcc CK_BUS_PCIE>;
> +        clock-names = "core";
> +        phys = <&combophy PHY_TYPE_PCIE>;
> +        phy-names = "pcie-phy";
> +        resets = <&rcc PCIE_R>;
> +        reset-names = "core";
> +        msi-parent = <&v2m0>;
> +        wakeup-source;
> +        wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +        access-controllers = <&rifsc 76>;
> +        power-domains = <&CLUSTER_PD>;
> +    };
> -- 
> 2.34.1
> 

