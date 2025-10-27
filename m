Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE8ACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 00:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDl+J2NSPrHB8OD0HoYd1EC6pCinvP7Q63HbNnrnhVw=; b=OtEaOb2ti1nDZ8A2iEJb9nISyY
	kNYMjo8N0LKZVRujEh1e8F586U+IfaevZgbMXwHy6pgQ1iHpPZPXU7CzpPVMmIUcugfwKD9A4DKSE
	z5PUhvCox7EBziCGCQalG70na/C+aunwNHTfF6I/V51iaXiIME45AbNMUUy0nOmLoJlYVy1MDNMsh
	8ZYpofEerepbXROny5CQg8lN+/DFYEj6st/jBrHPcKKx5CEfrQyHlCZ1aB+TRrQr862zAmN+vsT3U
	08ipAgYeSLxkzf1GrOLwECdCtI7swhqJT725S9SgeN8Z/ubNIr54TgyB4Rz+A0QqRjHUw59cAbOEs
	6mmGleAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDAkF-0000000Csey-38bp;
	Mon, 27 Oct 2025 00:05:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDAkD-0000000CseZ-1QFQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 00:05:54 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 22ABD1440;
	Mon, 27 Oct 2025 01:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761523444;
	bh=auHda76l+GnxC4l4AX5IUbUQ0/OD6TFUuSzzllIMoqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLLij5vdwxx78VYqIbIQ13SNB7tBegPvOc5vBzcKSKHeZNO8Ess/4v88akdINieS5
	 c6XpNEGOBGxaCcazwaQQYVzLt1wT8w99Vs7rtI3rLMk6ImLsXMS9eje7T18tXylEZz
	 y5o0p/EeKkKbR9JVwvbDY4dSkQMcjFzCYIJvc8+o=
Date: Mon, 27 Oct 2025 02:05:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20251027000537.GM13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-1-5ecb081ce79b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-1-5ecb081ce79b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_170553_522367_B220D367 
X-CRM114-Status: GOOD (  19.43  )
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

Hi Guoniu,

On Thu, Oct 23, 2025 at 05:19:42PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> clock as the input clock for its APB interface of Control and Status
> register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> same restriction for existing compatible.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..da3978da1cab75292ada3f24837443f7f4ab6418 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
> +          - fsl,imx8ulp-mipi-csi2
>        - items:
>            - const: fsl,imx8qm-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2
> @@ -39,12 +40,16 @@ properties:
>                       clock that the RX DPHY receives.
>        - description: ui is the pixel clock (phy_ref up to 333Mhz).
>                       See the reference manual for details.
> +      - description: pclk is clock for csr APB interface.
> +    minItems: 3
>  
>    clock-names:
>      items:
>        - const: core
>        - const: esc
>        - const: ui
> +      - const: pclk
> +    minItems: 3
>  
>    power-domains:
>      maxItems: 1
> @@ -130,19 +135,51 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - fsl,imx8qxp-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4

Do we need the clock-names constraint ? The DT schemas will enforce that
clocks and clock-names always have the same number of elements.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-mipi-csi2
>      then:
>        properties:
>          reg:
>            minItems: 2
>          resets:
>            maxItems: 1
> -    else:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-mipi-csi2
> +    then:
>        properties:
>          reg:
>            maxItems: 1
>          resets:
>            minItems: 3
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
>        required:
>          - fsl,mipi-phy-gpr
>  

Could you please sort those conditional blocks by alphabetical order of
the compatible strings ?

-- 
Regards,

Laurent Pinchart

