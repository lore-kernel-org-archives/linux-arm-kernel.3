Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B41AC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lY/D+laD89xjXaoXnSscTfXytNDP9HL5WnkKwaINUNg=; b=PqPis9U2/rp7vjJ0uA3uzZe/jE
	dEkBd783/nGxaxOYbVKHOOTnWXF7oCVMJQ735BI263CYbeuJr45sG9stp6n9rdoLxycA5iPTml35q
	VNxXLf8gAWbAS8Jwqe8kC1exL3p/BELhV41VdAhwPi9XsLjnBoBxPgzmiH0x6yMPvxSPgq/b3qoYQ
	0Q5CqpZN5B+xqXW/oZxofsbDCSvTIB415OLt0HacUzLsu7uHL6jTfguU/iObE60ISGzTPfgp5z9qK
	AqsjNTi5sdsgyiOMdgpeUSKEMEZU1bIQa+rgrOfOO+aguaKk2ZYQBqo18MIpLxR1onvmUn8g5OjCr
	EGkbWD7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghh-0000000FSjY-0ygn;
	Wed, 21 May 2025 10:29:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfsl-0000000FLIY-2NQs;
	Wed, 21 May 2025 09:37:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B77B4A3DD;
	Wed, 21 May 2025 09:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C83BC4CEEA;
	Wed, 21 May 2025 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820223;
	bh=R1smjQqKCqBD+gWdTB65+uxqJBq+XDVIA1HiFl2BUto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DiQX2a/yEYtLcOsrcqsA8mt3vW5BKfAft3rqhXBG1vP+4EHTTVxJy+pWhT00oXw1D
	 3gtkj/T+tQI/0ac2x+yHV7vIM/2L53bgqpUdDnh9tzN/i1RqrF2dwFx4UVlkcB9V5N
	 VGmzEFk2uV24NwbJ282OLOUMY8QYqfxZcaR2NliOFW1RvA1qszcVlMOTWLtIILI5mR
	 pMF86sqaKqqxGDzz9AiHawlngTscobwL0bMO4+C1Bv5SVwW9fz8/iGaes/R6filcuc
	 iTuLyTvv2ub99UqOZ++0ZVLi8rb8ec396YKF5A9tzQGNx+epBTBMBkOoLzqY1YcyQ8
	 vlvfdeQ5dgI2g==
Date: Wed, 21 May 2025 11:37:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com
Subject: Re: [PATCH 06/10] dt-bindings: PCI: Add bindings support for Tesla
 FSD SoC
Message-ID: <20250521-capable-affable-numbat-b0ce84@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193248epcas5p2543146c715eb249ea6c2ce3c78d03b34@epcas5p2.samsung.com>
 <20250518193152.63476-7-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-7-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_023703_648438_68852CDB 
X-CRM114-Status: GOOD (  19.73  )
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

On Mon, May 19, 2025 at 01:01:48AM GMT, Shradha Todi wrote:
> Document the PCIe controller device tree bindings for Tesla FSD
> SoC for both RC and EP.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  .../bindings/pci/samsung,exynos-pcie-ep.yaml  |  66 ++++++
>  .../bindings/pci/samsung,exynos-pcie.yaml     | 199 ++++++++++++------
>  2 files changed, 198 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/samsung,exynos-pcie-ep.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie-ep.yaml
> new file mode 100644
> index 000000000000..5d4a9067f727
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie-ep.yaml

Filename matching compatible.

> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/samsung,exynos-pcie-ep.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC series PCIe Endpoint Controller
> +
> +maintainers:
> +  - Shradha Todi <shradha.t@samsung.co>
> +
> +description: |+
> +  Samsung SoCs PCIe endpoint controller is based on the Synopsys DesignWare
> +  PCIe IP and thus inherits all the common properties defined in
> +  snps,dw-pcie-ep.yaml.
> +
> +properties:
> +  compatible:
> +    oneOf:

Drop

> +      - enum:
> +          - tesla,fsd-pcie-ep
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie-ep.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - tesla,fsd-pcie-ep

What is the point of this if:? There are no other variants.

Also, missing constraints for all the properties. This is really
incomplete.

> +    then:
> +      properties:
> +        samsung,syscon-pcie:
> +          description: phandle for system control registers, used to
> +                       control signals at system level

Where is the type defined? Look how such properties are described -
there are plenty of examples.

> +
> +      required:
> +        - samsung,syscon-pcie
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
> diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> index f20ed7e709f7..a3803bf0ef84 100644
> --- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> @@ -11,78 +11,113 @@ maintainers:
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
> -
> -  reg:
> -    items:
> -      - description: Data Bus Interface (DBI) registers.
> -      - description: External Local Bus interface (ELBI) registers.
> -      - description: PCIe configuration space region.
> -

No, I do not understand any of this change. Properties are defined in
top-level. Why all this is being removed?


Best regards,
Krzysztof


