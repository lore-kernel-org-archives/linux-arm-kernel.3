Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCA8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NeFS5AKsgsXMhm5joVjOKEoaGY6Xb0N1rMuZdFlMKw=; b=knQOwDoURhwuXy+dVgFY+NRpuw
	fBTR6Llj4P7XfUsnodAjVjGyOGJk11vYWkKAmy0Py7cLgMxyu3IzIJ702F2MaLx2/MCB6lto/OUUy
	OTGXaOjq0UwtLc3nL07KpGMwbQty4ijDQ3PMw/EgOD0da6SYBHeVXZHeJ8LVJCQA51uPi7WGTis9d
	+Zn32VAcXxR1dhodw4C8+Pjuj/Bug6WsnRvbQeH6vceiAdpf5A4xKrWKppM82tUZG5Xk0cv2gtAyc
	d+wE03XtRuq7ARiOUWzhGhrdBYyg3JvbCJ5zEtrHSRe77p6azolgFfSE1thpnFKpzhOwVwZzbJsIv
	o682q4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SHG-00000008JVM-3zIV;
	Sun, 21 Sep 2025 22:11:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SHD-00000008JUy-3CJl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:11:25 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3A82910C4;
	Mon, 22 Sep 2025 00:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758492599;
	bh=LAVT7fd94Dqyvggjb7HfswE4SogprjltEzomfWvmFqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il58BdovW9wqLdI9J5VQ3MUe7NyCvg6VqG6B1dgcjzlpcqMPLbk0USxPOKK2NGoaS
	 605omlvMMFhiZ3tKn1QVSCg0F8FC2O9QSC2BEoGt6+oJJMlf09652v9iEgKlcNzEgx
	 p3rXbh4WpjG9b5cIjcS6we/Md6PcdL9gxoFbHcIY=
Date: Mon, 22 Sep 2025 01:10:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI
 compatible string
Message-ID: <20250921221050.GA10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-1-37db5f768c57@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-1-37db5f768c57@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_151123_940525_97C2F12D 
X-CRM114-Status: GOOD (  14.23  )
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

On Fri, Sep 05, 2025 at 02:55:58PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> The ISI module on i.MX91 is reused from i.MX93 and implements one channel
> and one camera input which only can be connected to parallel camera input.
> So needn't to select camera source like i.MX93 in gasket ops.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..001a0d9b71e096db3f543adaad40b84af378d707 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -22,6 +22,7 @@ properties:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
>        - fsl,imx8ulp-isi
> +      - fsl,imx91-isi
>        - fsl,imx93-isi
>  
>    reg:
> @@ -66,7 +67,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - fsl,blk-ctrl
>    - ports
>  
>  allOf:
> @@ -77,6 +77,7 @@ allOf:
>              enum:
>                - fsl,imx8mn-isi
>                - fsl,imx8ulp-isi
> +              - fsl,imx91-isi
>                - fsl,imx93-isi
>      then:
>        properties:
> @@ -109,6 +110,16 @@ allOf:
>              - port@0
>              - port@1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx91-isi
> +    then:
> +      required:
> +        - fsl,blk-ctrl
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

