Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4244CFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyYhAY5gn8iw9D+Uzk8YddWosOQm731RNsJ2l+W99dM=; b=lclGi2+AMYd0mqMvMxN8A/wuMa
	JW9rbq3AtcPd98NP3nmddLe1cODBOzfqrFTZRpCa2UCU9B7Vm7gCcNEHOtQ/cOY0ysh2/32TzWFAr
	cwcFqGdO6oFxtLK6KeSN6m0VN+S5p/xWHZ213OtguwWS5Ll3xRLTszcfAWq/JX8/uTNet07z48Sl1
	hrxAr4hewlnYwE9JdsRSlFqTPeG9vWBijXE6Ejt5Al+ErAdzDdQBsxt/ov/exlVnyOmTcGm/ArPKe
	awJBBPDnLmRRBnQ04ifxEGKz1E113hA/wLNMhvPF6qeksy8O1JSV3rEV8o7LPaPMSo7qvnFIEqkfF
	O70wkeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzMg-000000039j1-4Bgx;
	Wed, 29 Apr 2026 07:29:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzMe-000000039iV-2g9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E849344050;
	Wed, 29 Apr 2026 07:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF09C19425;
	Wed, 29 Apr 2026 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447783;
	bh=P35hfQSMr2+9auGQr2wxXAwA/zR1P0H1IWOnM0Oirxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaVXj7nO+UtL6HDIlPWdU61sZVvhPyBBiQAvW3cBwJFehEnrZjwhenHFB6n4ELEEJ
	 3vFCJaCM5jib2cTDIsQqDcsJnHZLmDWSs7WHXMD0tfk3i2kvZTLZBFsBYrvRpNGr9N
	 GjwdvSO+xlhzqz2aaU15CNgHFegA4xEdt+V2FprJKd5tABLAlsDY3ZKJqqT7ge3HVG
	 RAC2xV0kSjIscXevWZ3trSoovhx7UqNlXm1hbC/19NiRY7nF+/tPpleN4WiodCncdb
	 RceFEOPDnE1JarButwSsgUjrmfYKpzyO6kTb3TglgM14GM5dGmqnNHzm9k4T18fGQr
	 mGcjzpdhakP7A==
Date: Wed, 29 Apr 2026 09:29:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <20260429-curvy-amber-boobook-ac5693@quoll>
References: <20260428075030.1626440-1-hongxing.zhu@nxp.com>
 <20260428075030.1626440-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428075030.1626440-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_002944_720882_5ECFAC1D 
X-CRM114-Status: GOOD (  15.24  )
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

On Tue, Apr 28, 2026 at 03:50:28PM +0800, Richard Zhu wrote:
> Add 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q PCIe
> binding to support PCIe event-based interrupts for general controller
> events, Advanced Error Reporting, and Power Management Events
> respectively.
> 
> These interrupts are optional for most variants but required for
> fsl,imx95-pcie, which must specify all 5 interrupts (msi, dma, intr,
> aer, pme).
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 9d1349855b422..0913c3312ed26 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -58,12 +58,18 @@ properties:
>      items:
>        - description: builtin MSI controller.
>        - description: builtin DMA controller.
> +      - description: PCIe event interrupt.
> +      - description: builtin AER SPI standalone interrupter line.
> +      - description: builtin PME SPI standalone interrupter line.
>  
>    interrupt-names:
>      minItems: 1
>      items:
>        - const: msi
>        - const: dma
> +      - const: intr
> +      - const: aer
> +      - const: pme
>  
>    reset-gpio:
>      description: Should specify the GPIO for controlling the PCI bus device
> @@ -231,6 +237,21 @@ allOf:
>              - const: ref
>              - const: extref  # Optional
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-pcie

Why do you need another if: block? Why can't it be part of existing one?

> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 5
> +          maxItems: 5

Drop maxItems. You need also constraints for all other variants.

> +        interrupt-names:

Best regards,
Krzysztof


