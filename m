Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E524CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtP+t7ayk8SByG4XwypIs2NNY/g/Y1Vld0h/xpyMDKI=; b=S3EadA44MdUAz++IUlNpSn6PuR
	AyvFvrTt7TLEci9vR4eLaJFeKMrSxVCb7Cpa+fz92vP2ndnesSht89cgbDAUvwQCtfa7QX7v82/1u
	/RIQlzXg7So1OXrLhhDoVCW2w+DxLMHFLWoimEINRfGsNXXTxfWVdKDALAPCg/j+jNBMNmUAat2ze
	2TEsGhPTbUtwNRxKU7d9eXehvRQHVyjD6WnmZZbMjhDTqJlRmqmUwpcXaAr0slra1pgCR73kBP5YU
	70WmA9OCJFkTXB/Wm9QLfaWa1q5LU5i9QswjLiarc2WXKSINdIu3EiGTz1nCytUi7CxsndyuNmgWr
	xUr0GTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lv-00000007Arn-0VZ1;
	Sat, 30 Aug 2025 00:48:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3BQ-00000006ZOn-2I3t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 17:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00276601B7;
	Fri, 29 Aug 2025 17:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1EEC4CEF0;
	Fri, 29 Aug 2025 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756489599;
	bh=ni/lQ5yzIye/3iBX3VMg4p5EesBhwErRoN8M///2GNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fhs3NxM+vQiz2pFhk/hwwJPHnY/ziGeFEK6zrOQeE8/KVlLdkmrY4vRwVdD2oXeJO
	 Pl2vU/rMM2fUKtHsiqPelilXXkufypzi0ghXGiaPsw7iEBIblRpwx4gLbwaRmzHTHl
	 9v7h4FzueqvZRni1uGfOD60lEPNzLuxGsoPSFgV4sEEWZYuIJNMmdJegIq/HXE/3h/
	 g8B3pET1KW5ndBD0EviQlQniCmutNefiQO4zq94AlQK1/aj6KCecQffcbIIFDcJBxc
	 JiPuEe3OXb8K747sv6k5RpS3Db23wWPcwoDBmytgzhZtTZkcAnvaIzcv3Fqgiv+uCs
	 pkmS2DV080Glg==
Date: Fri, 29 Aug 2025 12:46:38 -0500
From: Rob Herring <robh@kernel.org>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	shradha.t@samsung.com
Subject: Re: [PATCH v3 1/7] dt-bindings: media: nxp: Add support for FSD SoC
Message-ID: <20250829174638.GA1054721-robh@kernel.org>
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
 <CGME20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6@epcas5p1.samsung.com>
 <20250828085911.81266-2-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828085911.81266-2-inbaraj.e@samsung.com>
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

On Thu, Aug 28, 2025 at 02:29:05PM +0530, Inbaraj E wrote:
> The Tesla FSD CSIS link controller is used to configure MIPI CSI-2
> Rx link operations.
> 
> The Tesla FSD SoC include a MIPI CSI-2 Rx IP core named CSIS, which is
> compatible with the CSIS IP found in NXP i.MX7 and i.MX8 SoCs. Add the
> compatible string "tesla,fsd-mipi-csi2" to support the MIPI CSI-2 Rx
> link operation on the Tesla FSD SoC.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  .../bindings/media/nxp,imx-mipi-csi2.yaml     | 91 +++++++++++++++----
>  1 file changed, 71 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> index 41ad5b84eaeb..39b9447fd40c 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> @@ -14,7 +14,7 @@ description: |-
>    The NXP i.MX7 and i.MX8 families contain SoCs that include a MIPI CSI-2
>    receiver IP core named CSIS. The IP core originates from Samsung, and may be
>    compatible with some of the Exynos4 and S5P SoCs. i.MX7 SoCs use CSIS version
> -  3.3, and i.MX8 SoCs use CSIS version 3.6.3.
> +  3.3, i.MX8 SoCs use CSIS version 3.6.3 and FSD SoC uses CSIS version 4.3.
>  
>    While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
>    completely wrapped by the CSIS and doesn't expose a control interface of its
> @@ -26,6 +26,7 @@ properties:
>        - enum:
>            - fsl,imx7-mipi-csi2
>            - fsl,imx8mm-mipi-csi2
> +          - tesla,fsd-mipi-csi2
>        - items:
>            - enum:
>                - fsl,imx8mp-mipi-csi2
> @@ -38,24 +39,21 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    minItems: 3
> -    items:
> -      - description: The peripheral clock (a.k.a. APB clock)
> -      - description: The external clock (optionally used as the pixel clock)
> -      - description: The MIPI D-PHY clock
> -      - description: The AXI clock
> +    minItems: 2
> +    maxItems: 4
>  
>    clock-names:
> -    minItems: 3
> -    items:
> -      - const: pclk
> -      - const: wrap
> -      - const: phy
> -      - const: axi
> +    minItems: 2
> +    maxItems: 4
>  
>    power-domains:
>      maxItems: 1
>  
> +  tesla,syscon-csis:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Syscon used to hold and release the reset of MIPI D-PHY

Reset? Sounds like you should be using the reset binding.

> +
>    phy-supply:
>      description: The MIPI D-PHY digital power supply
>  
> @@ -93,7 +91,8 @@ properties:
>              properties:
>                data-lanes:
>                  description:
> -                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
> +                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data
> +                  lines.

Reformatting should be a separate patch.

>                  minItems: 1
>                  items:
>                    - const: 1
> @@ -115,7 +114,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - power-domains
>    - ports
>  
>  additionalProperties: false
> @@ -124,20 +122,73 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          contains:
> -            const: fsl,imx7-mipi-csi2
> +          const: fsl,imx7-mipi-csi2

'contains' was correct. It is more future proof when there is another 
SoC that is backwards compatible with imx7.

>      then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: The peripheral clock (a.k.a. APB clock)
> +            - description: The external clock (optionally used as the pixel
> +                clock)
> +            - description: The MIPI D-PHY clock
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: wrap
> +            - const: phy
> +        tesla,syscon-csis: false
> +        fsl,num-channels: false

blank line

>        required:
> +        - power-domains
>          - phy-supply
>          - resets
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,imx8mm-mipi-csi2
> +    then:
>        properties:
>          clocks:
> -          minItems: 4
> +          items:
> +            - description: The peripheral clock (a.k.a. APB clock)
> +            - description: The external clock (optionally used as the pixel
> +                clock)
> +            - description: The MIPI D-PHY clock
> +            - description: The AXI clock
>          clock-names:
> -          minItems: 4
> +          items:
> +            - const: pclk
> +            - const: wrap
> +            - const: phy
> +            - const: axi
> +        tesla,syscon-csis: false
> +        fsl,num-channels: false
>          phy-supply: false
>          resets: false

blank line

> +      required:
> +        - power-domains
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: tesla,fsd-mipi-csi2
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: The peripheral clock (a.k.a. APB clock)
> +            - description: The DMA clock

Wouldn't this be the same as the "AXI clock"?

> +        clocks-names:
> +          items:
> +            - const: pclk
> +            - const: aclk
> +        phy-supply: false
> +        resets: false
> +        power-domains: false

blank line

> +      required:
> +        - tesla,syscon-csis
> +        - fsl,num-channels
>  
>  examples:
>    - |
> -- 
> 2.49.0
> 

