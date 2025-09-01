Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D9CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H97itMBqSXjujycajJtF1vCFsPB/L5wJreSCa+Iubpw=; b=5ChQVAhwdJLr/HznHby+louj+M
	k2YfRa3mksm+TPGk90YIKiLQz+Fr5X5ZliGSG4DKhNmKh5aOU7moj99ZRhsGxGGC0+XL1L4BGFDBj
	xhi8daJPur+c2U45X18Cr3KeqK1MDl5O9A89AcuLcL0/gC0HCtl3SUXCBNOjGjPPiUAvHaHEAyOe1
	lA0Im0RkU8zG8ajqbqFsMfObxxsKq3RQt/0xLH5POGgnixaQ5/dwnQUJfKl8Wpnpr78qvIz95UPk4
	8NsWUFm6M1oU81RftMUsYZpaMprAp9kqZb1dyv14WAr64NOVaGdIR9njEN/ynfSsJJGFanf3YzMCO
	PoS2wYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDh2-0000000EDyu-3tIo;
	Mon, 01 Sep 2025 23:12:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6js-0000000DATZ-2XjA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 15:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H97itMBqSXjujycajJtF1vCFsPB/L5wJreSCa+Iubpw=; b=WbYiEYMBPBC5yjNP3T2BLHg2PK
	Zgfd3Fv7NjoldxMhh3drk4bNCH/0C5EFVpuHK9pOmv1zIdZHi0Q9VthLDSK+G0JZEp18QjNUfw0hd
	dme/RJ03exQxafKZuKBX9JfMd/ZucjxTEUDcUTnmvZFiWfowxTgpDCJDJ6APV2lrVTGovO5CC0+X9
	9IiYppO9klt18Ywb9oDiVZQdu4L60EyN2HL0OsMyucNTV5aflVZi1rfYZfm1fxi8Mkjx0INkP/wcs
	mwVz0WZAGvy4o9dbNLm0NAAwzUf9oLnc/1cYaZq697qVdU/gnRLCLKYTE6PbeR4JcNoYmZDI/5d3C
	2PflzvxA==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6jp-00000003nWo-2u3m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:46:35 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA526E8A;
	Mon,  1 Sep 2025 17:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756741523;
	bh=Rtorms0Y8xcxRezMkXYYQWv9ZH000JtLph0sJAKDMHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZD5WCl6gznFYbvwUnNzz6vwIBq/2t0l0g6ae24Zq9w7aovOcQIf7uMu1roOSB85Ro
	 fTUq+4fYoQJxfzny+jG68ZsmAx1HW42143vtbIYZaqbItIZ3Ri5O2RHSXrGq6xy77p
	 kygdRmzqc9FYVNA0XjwoOPHqTJNG6bhtSV6U9LLA=
Date: Mon, 1 Sep 2025 17:46:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250901154610.GB13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_164633_919409_FEE6A8E2 
X-CRM114-Status: GOOD (  19.67  )
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

Thank you for the patch.

On Mon, Sep 01, 2025 at 02:25:29PM +0800, Guoniu Zhou wrote:
> The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> clock as the input clock for its APB interface of Control and Status
> register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> same restriction for existed compatible.

s/existed/existing/

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -21,7 +21,9 @@ properties:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
>        - items:
> -          - const: fsl,imx8qm-mipi-csi2
> +          - enum:
> +              - fsl,imx8qm-mipi-csi2
> +              - fsl,imx8ulp-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2

According to this, the ULP version is compatible with the QXP version.

>  
>    reg:
> @@ -39,12 +41,16 @@ properties:
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
> @@ -130,19 +136,53 @@ allOf:
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

But according to this, the ULP version requires more clocks than the QXP
version.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-mipi-csi2

QM is compatible with the QXP, so you don't need to list it here.

          contains:
            const: fsl,imx8qxp-mipi-csi2

is enough to cover both.

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

-- 
Regards,

Laurent Pinchart

