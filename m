Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F99C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bmh4CYTvClTqEnnoR+LMXehgw+R4HPYGsu74Uz3UHnw=; b=zuIcfiY4I8GfUm9vlR78MZSrHL
	/OUCTXVw1vke47DgtSPatt/f/newUKHzahoQugQePmW3brVrSvPmaUIsE5KgOtNvGJTdpgEKFqFnL
	CfcFSl1e0vMslJ2LS//ikxZfhsVaftqnGDP0/t9zu9Ai7Sj3TjQdo5uZSQPdS5w0+e0LgjGTOCquY
	hIwDtLkxsxNy8MFuAUEOLugfRfHSxmTLEpptzcrARIjEF7DlePW+WZ5JiG3vcIwgQ9I0NkWtMgi/g
	1ABNkrWGKK9ZiT2IIdZ0SMN4Ma9rGyEuVYqhBIU1VHQW+zifaigC+h75yqW/wH82YhrkkY5aC8yZs
	rkv2nLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxlh-00000007Cgn-45u7;
	Wed, 16 Jul 2025 08:45:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxTz-00000007ARI-3Qes
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11DEE5C67DE;
	Wed, 16 Jul 2025 08:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F140C4CEF0;
	Wed, 16 Jul 2025 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654438;
	bh=jA5FOSjFCNJGkBGVQ3T0NygKzKDwksb4u4k+DuY6Ba4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=be89xxRrv9xuxcIrfDxAYLIU64qDm+AhV8+M6ZIRIHCV6NppRf5AJ8o0NCluJ2xnX
	 hSiKyhZD+ICPEpqMknx+RBzxKFD5dm6ESQ2smgvsBvzpQDiBzd+uOsuEKINp2NBc+4
	 Ow9bH4ecBU8nxkuGEmi5Vm76U/1jskLNLgCK+j8iE9IcqlssP94zZCzNxubpn1bglP
	 8QBH0Vaaf13M+t1q580dgn/uJViuDVecG6wZ2QfQpJP4eRa95IUBj1iMy0rXCPp1+u
	 x/q8hOrqYIxVowZRisT94c+q6Wr+Jlzz9bc39vjnwJ2fUOJL4NLrvO8Vty7rZ0Kjdd
	 gEwd8c0O2CWpw==
Date: Wed, 16 Jul 2025 10:27:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 03/10] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <20250716-watchful-enigmatic-condor-0fc6b3@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-4-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-4-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_012719_934969_D6B9FC6F 
X-CRM114-Status: GOOD (  16.03  )
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

On Tue, Jul 15, 2025 at 11:43:13AM +0800, Jacky Chou wrote:
> This binding describes the required and optional properties for

No, describe the hardware, not "this binding".

> configuring the PCIe RC node, including support for syscon phandles,
> MSI, clocks, resets, and interrupt mapping. The schema enforces strict
> property validation and provides a comprehensive example for reference.

Don't say what schema does or does not. It's completely redundant.
Describe the hardware.

Your entire commit is redundantn and not helpful at all.

> 

...

> +
> +  aspeed,ahbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the ASPEED AHB Controller (AHBC) syscon node.
> +      This reference is used by the PCIe controller to access
> +      system-level configuration registers related to the AHB bus.
> +      To enable AHB access for the PCIe controller.
> +
> +  aspeed,pciecfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the ASPEED PCIe configuration syscon node.
> +      This reference allows the PCIe controller to access
> +      SoC-specific PCIe configuration registers. There are the others
> +      functions such PCIe RC and PCIe EP will use this common register
> +      to configure the SoC interfaces.
> +
> +  aspeed,pciephy:

No, phys are not syscons. I already told you that in v1.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the ASPEED PCIe PHY syscon node.
> +      This property provides access to the PCIe PHY control
> +      registers required for link initialization and management.
> +      The other functions such PCIe RC and PCIe EP will use this
> +      common register to configure the PHY interfaces and get some
> +      information from the PHY.
> +
> +  interrupt-controller:
> +    description: Interrupt controller node for handling legacy PCI interrupts.
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 0
> +      '#interrupt-cells':
> +        const: 1
> +      interrupt-controller: true
> +
> +    required:
> +      - '#address-cells'
> +      - '#interrupt-cells'
> +      - interrupt-controller
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus-common.yaml#

No other binding references this. Don't write completely different code
than all other SoCs. This entire binding is written such way.

> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-pcie
> +    then:
> +      required:
> +        - aspeed,ahbc
> +    else:
> +      properties:
> +        aspeed,ahbc: false
> +
> +required:
> +  - reg
> +  - interrupts
> +  - bus-range
> +  - ranges
> +  - resets
> +  - reset-names
> +  - msi-parent
> +  - msi-controller
> +  - aspeed,pciecfg
> +  - interrupt-map-mask
> +  - interrupt-map
> +  - interrupt-controller
> +
> +unevaluatedProperties: false
> +
> +patternProperties:
> +  "^pcie@[0-9a-f,]+$":

Why do you need it? Also, order things according to example schema.

Best regards,
Krzysztof


