Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE6CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 00:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S35wgw8HvkDF+xoU+pjaLHjmgnp7iKwDrORhseo5nZM=; b=qAEqyrhXYM0vunt0vQC6fZMade
	YidcAx35NsuogTuq9qyY/S4FJQ7TeH11HX/DJN0OdO2FJdQET/FgBaB6pHwTKSyPjthO0e8COh+Cg
	B3NOYUu2xJN3zUanxN+aR524aI8ln+ghADnv0KH6ciDlw6LvmGsgMy7k9OCrmnV6VWq7q6L6KkMZZ
	LnjTM0NAshsOHt5NYUcM99g7eUQWvITPNNJXb6TDH8QCrNz10J1VQFToLd5cd0mpkvzJBHI7XyFqr
	9HKjBv3ZkcqgrPXwkUvgDQdGwg13Db/1WIsvwViDulJAj9ehc/pY2HvVWUCmMFWjkmWdCba+pTmdH
	p9YHIQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GhK-00000004tXs-0fFk;
	Tue, 15 Sep 2026 00:06:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6GhH-00000004tXP-0LH6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 00:06:52 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BEB2447;
	Tue, 15 Sep 2026 02:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789430709;
	bh=WOwRBLg+7b+gJWo+/8WY+8abFEJ6zaAncWZOIAQZjvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVYGPm5qwGxfBR6c4XwK2/TN0jkK9BYeOvjGfSHatHPPfOS98egoniH1pBDVlDlJg
	 w+yd+pfHgux9RYvKwij4RPS/LdgOboEUey4XcXgw6UfPEePC96NILXsNX5wROeu4YL
	 mTSLxYDQCb47H5BI5wyTeN6TIj/kYKD6kbDIR35o=
Date: Tue, 15 Sep 2026 03:06:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <20260915000648.GC2804748@killaraus.ideasonboard.com>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_170651_264022_FF7B515A 
X-CRM114-Status: GOOD (  13.96  )
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

On Mon, Aug 31, 2026 at 11:36:59AM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
> primarily addressing RAW data alignment. The core functionality
> remains identical, so the i.MX952 ISI uses a fallback compatible
> string to fsl,imx95-isi.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Use fallback compatible fsl,imx95-isi for imx952 (Frank, Conor Dooley)
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml        | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 279c9cd3034a..d0a99f00a45e 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -18,13 +18,17 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mn-isi
> -      - fsl,imx8mp-isi
> -      - fsl,imx8ulp-isi
> -      - fsl,imx91-isi
> -      - fsl,imx93-isi
> -      - fsl,imx95-isi
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mn-isi
> +          - fsl,imx8mp-isi
> +          - fsl,imx8ulp-isi
> +          - fsl,imx91-isi
> +          - fsl,imx93-isi
> +          - fsl,imx95-isi
> +      - items:
> +          - const: fsl,imx952-isi
> +          - const: fsl,imx95-isi
>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart

