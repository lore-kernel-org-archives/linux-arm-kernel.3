Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBA1C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fqNXp80X/VnPSC6Wlyy20+d/b6KLK1uC59GbYtvDRk=; b=1ZuCrw8jQGJ9KOAZbIyJ8L8yxH
	+i1/e6xfvey401BOCdywUB2CGetHR7Z1qwHtRZ8ukdsq3T5iiQ07gnUrozdcDeLS5JADBZrzppV4d
	5FBVhTVshpbnh0GAhyC4q12MfvZxABVfOV0ZnCqMOpY25IPd4tQY0WLTVV1V0XHBQMyabEULJu5Iu
	BD3+z/XMo6NIMQ6p/4vZzjH42iUrFGOeybCbCeGCbEnxIX4g/3D/T9ffoW2aWjgXww+hec0eiMDQc
	5fI9rHxyV4pyoeKb1Mzg458p0VTtY6LGp6B1XUOEltavqbXiTfF1mxSM4ZDBHQgfz7GKU81Kg5TrW
	Ghdh+NSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtfB-0000000Bwqy-3bpL;
	Thu, 27 Mar 2025 20:17:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt5L-0000000Bqgo-25md
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:40:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C0DA446;
	Thu, 27 Mar 2025 20:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743104305;
	bh=sExg9F8y8vGlQy/7nA7zkKPHGm1kx8ymbfVtL2PE38A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plHOSKhi6KcECMrx+0gSCODQ0vqJGdU7L/Uu+YerzWTQYTmEqNYh76XmD/FrNZVD0
	 e12hkjaI5AV2PvOMlsUxjYOY0O/wjAAlR4H2nkJvKXoVaipBKQA8HQcOlXStQ9WH0O
	 E4r3BiGX2gKE3S6ndMahDXFx6fluDFjVyjOU36Jk=
Date: Thu, 27 Mar 2025 21:39:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 06/12] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Message-ID: <20250327193951.GF4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_124015_675790_6F0E2CA7 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:25PM -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
> fsl,mipi-phy-gpr from required properties and add new reg space, since
> i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.
> 
> Keep the same restriction for other compatible strings.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - use dedicate csr register space
> change from v1 to v2
> - remove internal review tags
> - remove reg maxitems:1
> - remove 8ulp part
> - add 8qxp compatible string and make 8qm failback to 8qxp
> - limit reset and power domain number to 1 for 8qxp and 8qm
> - remove power-domains change because 8qm/8qxp only need 1 power domain
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 2a14e3b0e0040..522449e50079e 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -16,11 +16,19 @@ description: |-
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mq-mipi-csi2
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mq-mipi-csi2
> +          - fsl,imx8qxp-mipi-csi2
> +      - items:
> +          - const: fsl,imx8qm-mipi-csi2
> +          - const: fsl,imx8qxp-mipi-csi2
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: mipi csi2 rx host controller register.

s/mipi csi2 rx/MIPI CSI-2 RX/

> +      - description: mipi csi2 control and status register (csr).

Same here, and s/csr/CSR/

> +    minItems: 1
>  
>    clocks:
>      items:
> @@ -46,6 +54,7 @@ properties:
>        - description: CORE_RESET reset register bit definition
>        - description: PHY_REF_RESET reset register bit definition
>        - description: ESC_RESET reset register bit definition
> +    minItems: 1

Is this because on QM and QXP the three resets are handled by the SCU,
which exposes them as a single reset ? The reset description is then not
very accurate anymore, but I suppose we can live with that.

With the above small changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>    fsl,mipi-phy-gpr:
>      description: |
> @@ -113,9 +122,30 @@ required:
>    - clock-names
>    - power-domains
>    - resets
> -  - fsl,mipi-phy-gpr
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qxp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          maxItems: 1
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        resets:
> +          minItems: 3
> +      required:
> +        - fsl,mipi-phy-gpr
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

