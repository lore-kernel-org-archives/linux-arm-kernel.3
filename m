Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E63D6A25D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 00:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dm6LOeBxuLX1+/7szCa8lzNK4zL1Dhsu6C14NU6hW+c=; b=Yt6aJ29nbUxVdir9b/inUyQgP4
	bt0CQpi4ZWaGf3goE+rmLnaHZjV8g0NM0V4d4uV1iJSkUdhTfc+UWGR5SYF94WrqwRpaDzYrdfyRL
	YchPxxMb5peEfhPXRJqqLgQo8njORNB68No8hHkanhrDJyF+JZJdz5MvJp58gl1mnf51pGEBDJU/P
	FwtzdWEDbVTzwIuPrqpGtFEPKSprMsH0ALzWMxlAYwxfNhHkEh925IHqI3sWJUf9NmK5iaRbQU+8d
	aAIHlBdGJf1xTvk16PcYKfMD610/yCKWgdI0Is5G3jRVJa1+FJSZza8hmZPyl8wzJ2h5sCr77DSpO
	bG/v0okw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBjne-00000001B7d-3Xvn;
	Fri, 15 Nov 2024 00:02:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBjmi-00000001Ay1-01bT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 00:02:01 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73633E0D;
	Fri, 15 Nov 2024 01:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731628904;
	bh=11Ae3SXZglfSECrgCD2E8kqCCDnvJWkPilN10xsoG4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrqH0dPnAHN3Sks9Lxwx+SyUY1PZgRCBHE1hKEVSGPkbc2TOJLoE67x8XlPTl19bz
	 2IZ1FjseqZH6R3hwh0Rg+Od1X89aiXiL08VvTAHLuUkHkCpAqQuJcxH6FqWQz7QrMv
	 vd2+6dxqBHLzD2R8qYrHwWHXhFh/w2uTfC7ricy8=
Date: Fri, 15 Nov 2024 02:01:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
Message-ID: <20241115000150.GJ26171@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_160200_189506_A05D6C50 
X-CRM114-Status: GOOD (  15.35  )
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

Hi Dave,

Thank you for the patch.

On Thu, Nov 14, 2024 at 04:01:14PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, which is supportable by
> the existing IMX290 driver via a new compatible string.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

With one of the "media:" dropped from the subject line,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index bf05ca48601a..fa69bd21c8da 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -33,6 +33,8 @@ properties:
>            - sony,imx290lqr # Colour
>            - sony,imx290llr # Monochrome
>            - sony,imx327lqr # Colour
> +          - sony,imx462lqr # Colour
> +          - sony,imx462llr # Monochrome
>        - const: sony,imx290
>          deprecated: true
>  

-- 
Regards,

Laurent Pinchart

