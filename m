Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0873C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poXHcJh20MmrQsEqGwSp8j1qUwEtxEzQIdNeV+45pAY=; b=XVA1Ke1zLJah6+y2EfJ0xug0ho
	mrm4OozGw2ZFBQIsb8ix+KnKm/DNZCxR2kPWNxU4zYGaPKmWLc89Le67BKDJhQozLK0RrnNzLZE85
	G3ecXUDAXtHoC0UZ37i37/31G3JKUFC48oXnU2R8HYQxrXExW6IsV+CorWximo0xL3ckpltD/UWEH
	cJj6w8QsHZa4whOUFuA5bIaDY32S6FhzAcMcAcLuwZI0hR02QzMxHLT3Zf1q9WJRrjzNpwB3lbybT
	Mr8TSOeBtBWWSzpuLvRHnhfiuQHfhGA18mbpkDZT1RT3vwLUWHjxBqLMI9PNhFrJHgWlUTitjzHZS
	WOFre7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUzu-0000000Cy1x-35rW;
	Mon, 24 Feb 2025 09:43:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUlO-0000000Cuww-0VP4;
	Mon, 24 Feb 2025 09:28:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D03C5C5679;
	Mon, 24 Feb 2025 09:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86498C4CEE8;
	Mon, 24 Feb 2025 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740389313;
	bh=aMQo00Bw8GVTaJOzwAkgnTY3DGHFCoHqKBTGnM3Nqnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNHwsTSPhRtUDIeanKBFmigKrR5ixtkJusf+tCsGrZTe19jvOEoe84JN8S1/8fv3C
	 iJKe7W9jzNmFkxPTNsI1jVfDf3VbJdq2jBwv3pxAnceNsfAyKd4/V59kj8ZiCYGGWK
	 D9Mgiyul9Zh4ziIlA9fPHwiRWIUb4omZZZgNqOEoVFkir2hUY67DuQCIjlCdTtHuBZ
	 vu8ZkTW49WbzoL37HIJUcvwwcFa2W3biZPhK4vJK3f8+xdfd3AXOC5bEF1Yb7F64Gr
	 9ij553I2lVVnIPczGWTx60+lWuTiJLDWxach7DVHbU81ZMcxB7FRZo9xUdu124A9G1
	 dbxh8GMGFuKIQ==
Date: Mon, 24 Feb 2025 10:28:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Simon Xue <xxm@rock-chips.com>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Message-ID: <20250224-gifted-piculet-of-amplitude-a91ecd@krzk-bin>
References: <20250224074928.2005744-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224074928.2005744-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_012834_298098_1683024A 
X-CRM114-Status: GOOD (  20.17  )
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

On Mon, Feb 24, 2025 at 03:49:27PM +0800, Kever Yang wrote:
> rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
> instead of using GIC ITS, so
> - no ITS support is required and the 'msi-map' is not required,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> 
> Changes in v6:
> - Fix make dt_binding_check and make CHECK_DTBS=y
> 
> Changes in v5:
> - Add constraints per device for interrupt-names due to the interrupt is
> different from rk3588.
> 
> Changes in v4:
> - Fix wrong indentation in dt_binding_check report by Rob
> 
> Changes in v3:
> - Fix dtb check broken on rk3588
> - Update commit message
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../bindings/pci/rockchip-dw-pcie-common.yaml | 41 ++++++++++++++++++-
>  .../bindings/pci/rockchip-dw-pcie.yaml        | 19 ++++++---
>  2 files changed, 52 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> index cc9adfc7611c..e1ca8e2f35fe 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> @@ -65,7 +65,11 @@ properties:
>            tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx,
>            nf_err_rx, f_err_rx, radm_qoverflow
>        - description:
> -          eDMA write channel 0 interrupt
> +          If the matching interrupt name is "msi", then this is the combinded
> +          MSI line interrupt, which is to support MSI interrupts output to GIC
> +          controller via GIC SPI interrupt instead of GIC its interrupt.
> +          If the matching interrupt name is "dma0", then this is the eDMA write
> +          channel 0 interrupt.
>        - description:
>            eDMA write channel 1 interrupt
>        - description:
> @@ -81,7 +85,9 @@ properties:
>        - const: msg
>        - const: legacy
>        - const: err
> -      - const: dma0
> +      - enum:
> +          - msi
> +          - dma0
>        - const: dma1
>        - const: dma2
>        - const: dma3
> @@ -123,4 +129,35 @@ required:
>  
>  additionalProperties: true
>  
> +anyOf:

There is never syntax like that. Where did you find it (so we can fix
it)?

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-pcie

This does not belong to common schema, but to device specific. I don't
see this compatible in this common schema at all.


> +    then:
> +      properties:

interrupts:
  minItems: 6
  maxItems: 6

> +        interrupt-names:
> +          items:
> +            - const: sys
> +            - const: pmc
> +            - const: msg
> +            - const: legacy
> +            - const: err

Best regards,
Krzysztof


