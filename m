Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC452EDF027
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14RhMx/QamCD23AhW2V+0IziadVCc/Y22NYexDthow0=; b=Gb8CLk06Gsy2RPNI1OgZeH0LDX
	vchcfWfhnvNZ+3aqhCAh2el+dBC7x8G+LJgxV4RorITegtZeMdDHxi1+kNUbFNcbE9Rs1vPey6wpq
	+5RQ5AXtpjfBX2NzhYJCqRSi+9HH4lJqL95rsK4MjOB+5hyf1qpPXIYaCOL5oz0mr22MOeg4/y0af
	HtBny2gynl1uWf119ZYqakLhSTZI97AIqGMkHtTdQpzY0YwdUPaWwZ76H1pFVySYPQXMo5M7VdmVX
	q4DnfMYFxa7O4J3bAWS0cc1CYsVHZl2kOJJfAIa+ZZzX1mT4OfVbjnV1pd0d++0BVoXotKW6M+TRl
	wLaQ+qDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpQg-00000003E6N-05qr;
	Fri, 13 Feb 2026 09:25:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpQd-00000003E5Y-1vmH;
	Fri, 13 Feb 2026 09:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770974731;
	bh=G5uVfiHvpJL7gGWEE69leLa5qM6BlavB/hM9VB1DZnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VTOkrQjJfHt53FBmeh4TZceysttLfR6T/agUdUWq8bavGxs1gHSKaS5OamqBMHmAy
	 UQ+JnnfJVwJDdLYdmdfKn4loOzu8y1oNVDqrjZimuck2GrCFSLYnhW1Ig6lR2gxM58
	 c387nPyYx+gFMcBvfRh3AuXJwFTQQb3NZjcl5Y1+2onXga3PBQcdew4wVb9gttu5vg
	 bOws3sNAXwv138v3CGWVu7J+vip9ZOQbBP8o0MBH3Sj+Dqb588T3FADYS8YXg2zCdo
	 xxRet0yJJ1yEGYBdxDc4bMJN6k8VS43OO/KINDkchQw9P8E6mBeo62UC/1lSMhc+co
	 0Yfyc3kobPuzw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D2DA17E12C6;
	Fri, 13 Feb 2026 10:25:31 +0100 (CET)
Message-ID: <1de39897-7e7b-4c49-963b-9fed48dacc81@collabora.com>
Date: Fri, 13 Feb 2026 10:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: synopsys: use
 devm_reset_control_get_optional_exclusive()
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-1-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-1-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_012535_686025_B06C3801 
X-CRM114-Status: GOOD (  16.98  )
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

Thanks for the patch series.

Could you use "media: synopsys: csi2rx: " as prefix for your commit
messages?

On 2/10/26 18:11, Frank Li wrote:
> The DW MIPI CSI-2 RX is used on different SoCs, not all of which provide a
> reset controller. Switch to devm_reset_control_get_optional_exclusive()
> to support such platforms.
> 
> Reset presence and numbering are validated by the DT binding.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With that change,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 170346ae1a599e43bba9d19476ee4d65124303bd..0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -639,7 +639,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(csi2->phy),
>  				     "failed to get MIPI CSI-2 PHY\n");
>  
> -	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	csi2->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
>  	if (IS_ERR(csi2->reset))
>  		return dev_err_probe(dev, PTR_ERR(csi2->reset),
>  				     "failed to get reset\n");
> 


