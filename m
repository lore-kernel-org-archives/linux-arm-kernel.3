Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E5ACCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW9MHgW2LIR+7IpkY15cJpI4fuX3rW3GEgTJWwqjPWY=; b=SJwwGtGRDPOOIqsut50YmQPe8g
	6r4n7xOSvyugVG5DLmfrbldIYV7qSLmhqWwQPpJJMfXtZ25kDGe8HUhdWeS2F9o8hW4ajYp0Bj0bw
	sOYQy9iFeUUcAHlbgUceLvtLFLGlhuKw9m5JDx3YqBOc2MLj/7h9HOaWBYA2iUGD22pSDrOyrOVMl
	mpmBucBv9MlzQ0c5aFhZHychQ3s7v4N/vGSe5jOtHtHrcqk6lYDe8yeMT+5Us2XVGSMJ96M/odVRT
	FzfH3YJH7p4g50Gq83orQQesMryJrOMSzvO0oMyzX5bKLNaLA8KvigdVgB/SbpGB7J+hTbmJ3k5n8
	EssnuWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaZL-00000008dZ6-3p1P;
	Sun, 02 Nov 2025 16:04:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaZI-00000008dYf-266H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 16:04:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBE8F43BE9;
	Sun,  2 Nov 2025 16:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FABEC4CEF7;
	Sun,  2 Nov 2025 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762099475;
	bh=LDVvvx4d31uLUm6uFJRNmDhHPt6c/ETBVWcMM1W43j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXhs0E7QOaDTPLyzD8sh/jKT2Lz+iJJI6iYwTOW9F8nF60mefcKIvxTvQ63fAj9lV
	 yC/ha9bLOKwUfgg4yyx8MbxaPZTQNCsPyrEnf9qZbFHkSpJuQL+nVECb+iEDNk3un5
	 3ZQ1hqAVbhb8YasBBjC8vp88snPxhgN9yV06v8vIGm8pbvggNmh9qIzIhQKZMl8tvE
	 GlAYumEoNncebVpQCc+LrXzrQpraQmPERM9dgM6bZGaPV0CTvaE328gAQoFiWrOkqX
	 nMSxdODCL8ahHVpU6MGMrUBaYU20ezVq2hMZfRvnAb97pskQHt6UoGb6x71fV7qlJt
	 P4wLy5vt+5kDQ==
Date: Sun, 2 Nov 2025 17:04:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/3] dt-bindings: PCI: pci-imx6: Add external
 reference clock input
Message-ID: <20251102-complex-placid-frog-09cbed@kuoka>
References: <20251031031907.1390870-1-hongxing.zhu@nxp.com>
 <20251031031907.1390870-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031031907.1390870-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_080438_400762_368A21C1 
X-CRM114-Status: GOOD (  15.15  )
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

On Fri, Oct 31, 2025 at 11:19:06AM +0800, Richard Zhu wrote:
> i.MX95 PCIes have two reference clock inputs: one from internal PLL, the
> other from off chip crystal oscillator. The "extref" clock refers to a
> reference clock from an external crystal oscillator.
> 
> Add external reference clock input for i.MX95 PCIes.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index ca5f2970f217c..703c776d28e6f 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -44,7 +44,7 @@ properties:
>  
>    clock-names:
>      minItems: 3
> -    maxItems: 5
> +    maxItems: 6
>  
>    interrupts:
>      minItems: 1
> @@ -212,14 +212,17 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          maxItems: 5
> +          minItems: 4
> +          maxItems: 6
>          clock-names:
> +          minItems: 4
>            items:
>              - const: pcie
>              - const: pcie_bus
>              - const: pcie_phy
>              - const: pcie_aux
>              - const: ref

This was required last time. Nothing in commit msg explained changing
that.

> +            - const: extref  # Optional

Drop the comment, do not repeat the schema. And why only this is marked
as optional if 'ref' is optional as well now.

It is v9, can you please really think thoroughly what you are sending,
so obvious issues won't be there?

Best regards,
Krzysztof


