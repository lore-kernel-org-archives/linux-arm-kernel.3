Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CDDC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=990z843Hw4WjF5gh5lltOoHhp+5PR65tJYgJWtuj0pc=; b=F1oIYH/rs8jHXnJeoqqyXe37uz
	3G1ztAsIYByDdqdkzTMJvfjxCDOKNKEQadIauNKOYOX1qPWUmcA/WQK3+QzxjyuqruewfpLPXNxax
	gjZSgbdFz20mbLFA0e/MFI2VU6iDSDxe3JDgBdwGdITanhLfR3LxVYLR3zy3F188yUYD9NCqatNcv
	Hk4lc1NgIaMRmVazmiWIFhyxNhcLHG+t9tb+7YQPMZvwM5zoVBN0ZZ1WMKsM668W39b1wWrvHBDuX
	VRd6/P8VCaIv3Ms3zkcbEQ9lHzQu8wbzvG9ZO5B2MegabpHk4AYV0ONraXi8uuzCMTjtv4bIfSY11
	D8RqQKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGPW-0000000FpPq-2GWM;
	Fri, 27 Jun 2025 21:15:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGNC-0000000FpGt-1NaD;
	Fri, 27 Jun 2025 21:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8073AA53012;
	Fri, 27 Jun 2025 21:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DF5C4CEE3;
	Fri, 27 Jun 2025 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751058757;
	bh=svUYSDXjgjPfLQhcEOdWRWksVsA976jCuE+IoA6ycNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOzgmbW7vV/mYGQxckuhC5FYN5ylxShyS60Bg9yF2/rUsPwm+C32dI2YRV2yx8iUa
	 vkMjYzP1M97vAqvEp9sowPKHIVtJ4dP4lATxYEOCoPMeTVtYQNkUY3lZd1hGVMCf55
	 DCJuoc9Xi+M7qjb6cwAmX3Cc55B7C7x4o2MiOfS4DLQtxZX4ltgpN9G7463N7qEeZe
	 WB0zgYPeufqjRug06JFuTzb5gYsV0vsIfEfY13rkfR8qBaDFXkwSAYYrZa9gH39j+A
	 Y6wQxXKjlTF39swyPQaXI6+K2Ww/ilV71loV3IO+LkO6pqDmles7cPD7w/X8+IZ1qt
	 hg9/i8WIfJoJA==
Date: Fri, 27 Jun 2025 16:12:36 -0500
From: Rob Herring <robh@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v2 06/10] dt-bindings: PCI: Add bindings support for
 Tesla FSD SoC
Message-ID: <20250627211236.GA147018-robh@kernel.org>
References: <20250625165229.3458-1-shradha.t@samsung.com>
 <CGME20250625165315epcas5p19f081c8a0e2e7dc87698577cc2d460ca@epcas5p1.samsung.com>
 <20250625165229.3458-7-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-7-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_141238_499135_0ADD57B2 
X-CRM114-Status: GOOD (  19.46  )
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

On Wed, Jun 25, 2025 at 10:22:25PM +0530, Shradha Todi wrote:
> Document the PCIe controller device tree bindings for Tesla FSD
> SoC for both RC and EP.

Drop 'bindings support for ' in the subject.

> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  .../bindings/pci/samsung,exynos-pcie.yaml     | 121 ++++++++++++------

I think this should be its own schema file. There's not much shared.

>  .../bindings/pci/tesla,fsd-pcie-ep.yaml       |  91 +++++++++++++
>  2 files changed, 176 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> index f20ed7e709f7..595156759b06 100644
> --- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> @@ -11,16 +11,15 @@ maintainers:
>    - Jaehoon Chung <jh80.chung@samsung.com>
>  
>  description: |+
> -  Exynos5433 SoC PCIe host controller is based on the Synopsys DesignWare
> +  Samsung SoCs PCIe host controller is based on the Synopsys DesignWare
>    PCIe IP and thus inherits all the common properties defined in
>    snps,dw-pcie.yaml.
>  
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -
>  properties:
>    compatible:
> -    const: samsung,exynos5433-pcie
> +    enum:
> +      - samsung,exynos5433-pcie
> +      - tesla,fsd-pcie
>  
>    reg:
>      items:
> @@ -37,52 +36,102 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    items:
> -      - description: PCIe bridge clock
> -      - description: PCIe bus clock
> -
> -  clock-names:
> -    items:
> -      - const: pcie
> -      - const: pcie_bus
> -
>    phys:
>      maxItems: 1
>  
> -  vdd10-supply:
> -    description:
> -      Phandle to a regulator that provides 1.0V power to the PCIe block.
> -
> -  vdd18-supply:
> -    description:
> -      Phandle to a regulator that provides 1.8V power to the PCIe block.
> -
> -  num-lanes:
> -    const: 1
> -
> -  num-viewport:
> -    const: 3
> -
>  required:
>    - reg
>    - reg-names
>    - interrupts
>    - "#address-cells"
>    - "#size-cells"
> -  - "#interrupt-cells"
> -  - interrupt-map
> -  - interrupt-map-mask
>    - ranges
> -  - bus-range
>    - device_type
>    - num-lanes
> -  - num-viewport
>    - clocks
>    - clock-names
>    - phys
> -  - vdd10-supply
> -  - vdd18-supply
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - tesla,fsd-pcie
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +
> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: dbi
> +            - const: mstr
> +            - const: slv
> +
> +        samsung,syscon-pcie:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          description: phandle for system control registers, used to
> +                       control signals at system level
> +
> +        num-lanes:
> +          maximum: 4
> +
> +      required:
> +        - samsung,syscon-pcie
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos5433-pcie
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: pcie bridge clock
> +            - description: pcie bus clock
> +
> +        clock-names:
> +          items:
> +            - const: pcie
> +            - const: pcie_bus
> +
> +        vdd10-supply:
> +          description:
> +            phandle to a regulator that provides 1.0v power to the pcie block.
> +
> +        vdd18-supply:
> +          description:
> +            phandle to a regulator that provides 1.8v power to the pcie block.
> +
> +        num-lanes:
> +          const: 1
> +
> +        num-viewport:
> +          const: 3
> +
> +        assigned-clocks:
> +          maxItems: 2
> +
> +        assigned-clock-parents:
> +          maxItems: 2
> +
> +        assigned-clock-rates:
> +          maxItems: 2
> +
> +      required:
> +        - "#interrupt-cells"
> +        - interrupt-map
> +        - interrupt-map-mask
> +        - bus-range
> +        - num-viewport
> +        - vdd10-supply
> +        - vdd18-supply
>  
>  unevaluatedProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
> new file mode 100644
> index 000000000000..f85615a0225d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/tesla,fsd-pcie-ep.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC series PCIe Endpoint Controller
> +
> +maintainers:
> +  - Shradha Todi <shradha.t@samsung.com>
> +
> +description: |+

Don't need '|+'

> +  Samsung SoCs PCIe endpoint controller is based on the Synopsys DesignWare
> +  PCIe IP and thus inherits all the common properties defined in
> +  snps,dw-pcie-ep.yaml.
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
> +
> +properties:
> +  compatible:
> +    const: tesla,fsd-pcie-ep
> +
> +  reg:
> +    maxItems: 4
> +
> +  reg-names:
> +    items:
> +      - const: elbi
> +      - const: dbi
> +      - const: dbi2
> +      - const: addr_space
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: dbi
> +      - const: mstr
> +      - const: slv
> +
> +  num-lanes:
> +    maximum: 4
> +
> +  samsung,syscon-pcie:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: phandle for system control registers, used to
> +                 control signals at system level
> +
> +  phys:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - num-lanes
> +  - samsung,syscon-pcie
> +  - phys
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        pcieep0: pcie-ep@16a00000 {
> +            compatible = "tesla,fsd-pcie-ep";
> +            reg = <0x0 0x168b0000 0x0 0x1000>,
> +                  <0x0 0x16a00000 0x0 0x2000>,
> +                  <0x0 0x16a01000 0x0 0x80>,
> +                  <0x0 0x17000000 0x0 0xff0000>;
> +            reg-names = "elbi", "dbi", "dbi2", "addr_space";
> +            clocks = <&clock_fsys1 PCIE_LINK0_IPCLKPORT_AUX_ACLK>,
> +                     <&clock_fsys1 PCIE_LINK0_IPCLKPORT_DBI_ACLK>,
> +                     <&clock_fsys1 PCIE_LINK0_IPCLKPORT_MSTR_ACLK>,
> +                     <&clock_fsys1 PCIE_LINK0_IPCLKPORT_SLV_ACLK>;
> +            clock-names = "aux", "dbi", "mstr", "slv";
> +            num-lanes = <4>;
> +            samsung,syscon-pcie = <&sysreg_fsys1 0x50c>;
> +            phys = <&pciephy1>;
> +        };
> +    };
> +...
> -- 
> 2.49.0
> 

