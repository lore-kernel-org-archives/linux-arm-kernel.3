Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB20CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU4F1r9F7jXURWtan/m4z+ut5FUI3K+h9OfKiGcAyxc=; b=LV/pPjnvNDsS/R4k6uP1nPyVkD
	9AbIx/dNLseBkCf0F7yn2tjP2eo0YNdkutBLBeTRuxbkOaLXHumtZlENgysvCpAo5DOYD29S0sAXZ
	jKyjLHvnVZvu9VG+rmr1NfLuzDu3wDZGC3G1Gs7M71qoFQY10yhnzhUmtrklcmzJFixsavIR7G1fH
	vCbJzVv6MK0qQnB9zC7/EAq95AzVtQPBe122YAyLaBZ+m+BR23NuTJ2MU0I/grkU7Bv+/r4vMeoaq
	xfSvNX4lR2WLP+xGBgjnGp3y1c/beOLxp0RwDuVSizcVEGfepxCAqSd6sWiBnqn8iwLY++Q2vQipB
	aq9TGw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhHs-0000000EAF2-2kjk;
	Wed, 05 Nov 2025 17:27:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhHp-0000000EADw-2bSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:27:10 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F214B5;
	Wed,  5 Nov 2025 18:25:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762363513;
	bh=0zh7mU6+Q2DgrXPwAM6Mbt58/5XP2Rm18IkdrvGTcKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9Q2i3qmyZ20IOL7SdDM+WwB9D19VYgM5hqbItih+ttfImYlnN/blGMLwogAQtYPB
	 bsrjefm/q4T1d3In/NUbRQrX4xYlYUtZu3BoGa5DzLIpv61oBNlzJkkAah0NPR1Mvr
	 4geXc6/x8mJ2K/8w8L8Bl8RkgGyZi8B5hpa7hh4k=
Date: Wed, 5 Nov 2025 19:27:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <20251105172703.GC6046@pendragon.ideasonboard.com>
References: <20251105-isi_imx95-v3-0-3987533cca1c@nxp.com>
 <20251105-isi_imx95-v3-1-3987533cca1c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105-isi_imx95-v3-1-3987533cca1c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092709_796111_9133944C 
X-CRM114-Status: GOOD (  18.33  )
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

On Wed, Nov 05, 2025 at 01:55:10PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI module on i.MX95 supports up to eight channels and four link
> sources to obtain the image data for processing in its pipelines. It
> can process up to eight image sources at the same time.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 27 +++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..c5cf4a9787ee7f31273bd097d2200402fb346773 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -23,6 +23,7 @@ properties:
>        - fsl,imx8mp-isi
>        - fsl,imx8ulp-isi
>        - fsl,imx93-isi
> +      - fsl,imx95-isi
>  
>    reg:
>      maxItems: 1
> @@ -49,7 +50,7 @@ properties:
>    interrupts:
>      description: Processing pipeline interrupts, one per pipeline
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 8
>  
>    power-domains:
>      maxItems: 1
> @@ -98,6 +99,7 @@ allOf:
>      then:
>        properties:
>          interrupts:
> +          minItems: 2
>            maxItems: 2
>          ports:
>            properties:
> @@ -109,6 +111,29 @@ allOf:
>              - port@0
>              - port@1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-isi
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 8
> +        ports:
> +          properties:
> +            port@0:
> +              description: Pixel Link Slave 0
> +            port@1:
> +              description: Pixel Link Slave 1
> +            port@2:
> +              description: MIPI CSI-2 RX 0
> +            port@3:
> +              description: MIPI CSI-2 RX 1
> +          required:
> +            - port@2
> +            - port@3
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart

