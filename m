Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BFFCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkC9wJNbN8DWnV+rIxALikJhH7vxyoleW0S5SIbWfqo=; b=zdojF1up7EXa6NXZ4BqDp+0BHz
	lXi0fk0JIJAXBVzzNxa9Ul4azZrZLdEcbCdLalT0HNl2GETqfIpbgDqRUlIkB2vvK2mrkzK1U70+p
	m75KHOmZHRtFmFWBYgdkasQP30bxoJbvfQ6YGfR1lWlBg2AbP+qO4S/6VepVCyQDO4J8qUIqpXBNO
	Eamm4Dj2nYHXqmu8nsm9/0FKg15JJZXwCZLeNAxXyQPgPY38XqJ3ePAuuoDDxyAKe0zgqoUItffDO
	rDSD88989jWf5upeBMliI4/MR75A+/YnvH3Itfsax3Ud30kg9JqzsrsLqGhPPhTRus5Prb8MP3dh9
	/eF6ma7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Zu-0000000B8nl-35Gg;
	Fri, 12 Jun 2026 15:13:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Zt-0000000B8na-2xh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21D2144181;
	Fri, 12 Jun 2026 15:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A7E1F00A3A;
	Fri, 12 Jun 2026 15:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781277229;
	bh=UkC9wJNbN8DWnV+rIxALikJhH7vxyoleW0S5SIbWfqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N74h59wLwlqfrzAJekopnPa+gmpQzuGPAV/NjVuNYkkUpHMFbJjYTblZt3QKz8Frn
	 dPHFgYQbb0/q92ELOMM1uDBeMmxiuJfQi6YphMyeBkebR1GGugtVUq6E7gk1JyoQxM
	 RYJo8tAV2TjZIxyDqrP1OilD6wdrYgUaubSNulPQOX3gDLIokw2/bMRpmxLjSYOtl7
	 RyeYmrMcs7ayFhj0qh/cDuU7jGo4apK2nIez1AXeWjpjnusSuNT0Sxsn9ndQBfByM7
	 fkoj1dVUUceJ9DWKu6AcI7c+HalCFRovDVLPPDJPraM10jfLB8TcKFhO7bj2wYN2iz
	 duYpTWextcEqQ==
Date: Fri, 12 Jun 2026 10:13:48 -0500
From: Rob Herring <robh@kernel.org>
To: hongxing.zhu@oss.nxp.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: imx6q-pcie: Add optional
 intr/aer/pme interrupts for i.MX95
Message-ID: <20260612151348.GA1040341-robh@kernel.org>
References: <20260603062510.3767610-1-hongxing.zhu@oss.nxp.com>
 <20260603062510.3767610-2-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603062510.3767610-2-hongxing.zhu@oss.nxp.com>
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

On Wed, Jun 03, 2026 at 02:25:08PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> The i.MX95 PCIe controller introduces three additional dedicated hardware
> interrupt lines for specific events:
> - intr: general controller events
> - aer: Advanced Error Reporting events
> - pme: Power Management Events
> 
> These interrupts are optional on i.MX95. PCIe basic functionality
> (enumeration, configuration, and data transfer) works correctly without
> them, as the controller can operate using only the existing msi interrupt.
> 
> Earlier i.MX PCIe variants (imx6q, imx6sx, imx6qp, imx7d, imx8mm, imx8mp,
> imx8mq, imx8q) do not have these three dedicated interrupt lines.
> 
> Update the binding to allow up to 5 interrupts for i.MX95, while
> restricting earlier variants to a maximum of 2 interrupts using
> conditional constraints (if/then schema). This ensures the schema
> accurately reflects the hardware capabilities of each SoC variant.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index e8b8131f5f23..9b5d4e59dfff 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -58,12 +58,18 @@ properties:
>      items:
>        - description: builtin MSI controller.
>        - description: builtin DMA controller.
> +      - description: PCIe event interrupt.
> +      - description: builtin AER SPI standalone interrupt line.
> +      - description: builtin PME SPI standalone interrupt line.
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
>      deprecated: true
> @@ -248,6 +254,29 @@ allOf:
>              - const: pcie_aux
>              - const: ref
>              - const: extref  # Optional
> +        interrupts:
> +          maxItems: 5
> +        interrupt-names:
> +          maxItems: 5

5 is already the max.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx6q-pcie
> +            - fsl,imx6sx-pcie
> +            - fsl,imx6qp-pcie
> +            - fsl,imx7d-pcie
> +            - fsl,imx8mm-pcie
> +            - fsl,imx8mp-pcie
> +            - fsl,imx8mq-pcie
> +            - fsl,imx8q-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +        interrupt-names:
> +          maxItems: 2
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.34.1
> 

