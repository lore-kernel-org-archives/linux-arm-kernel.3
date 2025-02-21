Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3EDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASKiSGHCwnfgvZonDMXusXDNZTZQ7nGDAOgNT1rllKs=; b=2+v04BivHm9+X4XpYFuaawKPtE
	bCUkHiBRFJCmhf3cpR+BrxWsAI2s2NM0M5pEyHRhlZ01Q0ki1Y+LnW6woMWtVxB5TJumMiyiDUQis
	6xpxTGkj4Xrqyr5MXu/cN4JeHWnPcdomE8C/77tLh6z44992RvHmmsc6loe/cLLPvlFtOS/x0m5fV
	ADtABzlY2bY+aXgBmUHAuAEnK+5qyaw4PP3Ut/miq1THql3+1967x45Dyogg6tTBU4VkVuFfy7DsA
	oW64Tc+kLwAFUU0LM8/NC4AAuEkfdBeG0iHnqRlnEsHqfhZVyIUyjdQrSwZxO7Q3BXwGW0e+v49xo
	5cxxPWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXfA-00000006Vf7-3UXo;
	Fri, 21 Feb 2025 18:22:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXSw-00000006TRa-285w;
	Fri, 21 Feb 2025 18:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C50B85C6C96;
	Fri, 21 Feb 2025 18:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53646C4CED6;
	Fri, 21 Feb 2025 18:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740161373;
	bh=aVbsiWoZIxApCz2+QDbMVPPTpsz8VI9s1WvBplvWgnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3iEDAtAb3sWgbFkRzw96L67Iy7ScCx9rrNiXjqM+kl7dui2AxBQK1D8jJbcqp2BJ
	 Msy21ZxDF47a7kXRcIMrl5FLUx8l+0iJ6zkZ5zIvjHQ7bC//lzYKvl8dwrFsYgqS6a
	 gG1lsP0GqJwR4WCnDDg1zHtz0sfAJbO9K3NW6aLjJrE4u4l2CgjMbrc77LCgw+4wcq
	 CC5wtXQG0JaUjjcZr0SVfK27iWMVpFesAUAD1Vun2i2pXphUs/shbORkFMaYyrVYBF
	 j+FbQY6EmwJxTTLCTzrqffQMngRENy64bvxpA4JT+De3KmmibK+HEQoH+1weKxb7g5
	 VXa9EpXJI+vjA==
Date: Fri, 21 Feb 2025 12:09:30 -0600
From: Rob Herring <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Simon Xue <xxm@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v6 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576
 support
Message-ID: <20250221180930.GA3486559-robh@kernel.org>
References: <20250221104357.1514128-1-kever.yang@rock-chips.com>
 <20250221104357.1514128-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221104357.1514128-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_100934_657717_AB7428FB 
X-CRM114-Status: GOOD (  23.46  )
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

On Fri, Feb 21, 2025 at 06:43:56PM +0800, Kever Yang wrote:
> rk3576 is using dwc controller, with msi interrupt directly to gic instead
> of to gic its, so
> - no its support is required and the 'msi-map' is not need anymore,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
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
>  .../bindings/pci/rockchip-dw-pcie-common.yaml | 59 +++++++++++++++----
>  .../bindings/pci/rockchip-dw-pcie.yaml        |  4 +-
>  2 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> index cc9adfc7611c..069eb267c0bb 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml
> @@ -64,6 +64,10 @@ properties:
>            interrupts - aer_rc_err, aer_rc_err_msi, rx_cpl_timeout,
>            tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx,
>            nf_err_rx, f_err_rx, radm_qoverflow
> +      - description:
> +          Combinded MSI line interrupt, which is to support MSI interrupts
> +          output to GIC controller via GIC SPI interrupt instead of GIC its
> +          interrupt.
>        - description:
>            eDMA write channel 0 interrupt
>        - description:
> @@ -75,16 +79,6 @@ properties:
>  
>    interrupt-names:
>      minItems: 5
> -    items:

You just made the max 5 by dropping this.

> -      - const: sys
> -      - const: pmc
> -      - const: msg
> -      - const: legacy
> -      - const: err
> -      - const: dma0

Make this 'enum: [ dma0, msi ]'

Yeah, that would allow the wrong one to be used, but I prefer that over 
duplicating the names.

> -      - const: dma1
> -      - const: dma2
> -      - const: dma3
>  
>    num-lanes: true
>  
> @@ -123,4 +117,49 @@ required:
>  
>  additionalProperties: true
>  
> +anyOf:

allOf

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3568-pcie
> +              - rockchip,rk3588-pcie
> +              - rockchip,rk3588-pcie-ep
> +    then:
> +      properties:
> +        interrupt-names:
> +          minItems: 5

That's already the min.

> +          type: array

Don't need type. Do you see any schema use 'type: array' outside of the 
core? 

> +          items:
> +            - const: sys
> +            - const: pmc
> +            - const: msg
> +            - const: legacy
> +            - const: err
> +            - const: dma0
> +            - const: dma1
> +            - const: dma2
> +            - const: dma3

The whole if/then can be dropped.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-pcie
> +    then:
> +      properties:
> +        interrupt-names:
> +          type: array
> +          items:
> +            - const: sys
> +            - const: pmc
> +            - const: msg
> +            - const: legacy
> +            - const: err
> +            - const: msi

Don't need type or items. Just this is enough to ensure 'msi' is used:

contains:
  const: msi

> +          minItems: 6
> +          maxItems: 6

This part is correct.

> +
>  ...
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> index 550d8a684af3..9a464731fa4a 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
> @@ -26,6 +26,7 @@ properties:
>        - const: rockchip,rk3568-pcie
>        - items:
>            - enum:
> +              - rockchip,rk3576-pcie
>                - rockchip,rk3588-pcie
>            - const: rockchip,rk3568-pcie
>  
> @@ -71,9 +72,6 @@ properties:
>  
>    vpcie3v3-supply: true
>  
> -required:
> -  - msi-map

This should be moved to an if/then schema, not just dropped. Unless it 
was wrong for the existing users. If so, then that's a separate patch.

> -
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.25.1
> 

