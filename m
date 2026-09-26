Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17DC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeMWNbVHdretNzKm7IuwM80kkZYHD6VP3xhelYzW3vc=; b=OIbrfSFmqBZf8KE+TeP1RQMjfw
	qXL7rG0/J8msUfIQW6SnDk3gosdm8/1QLuqRUPfCIP3U7U8rKsi9DY4SoIQdexKOTJK50aHDE8aKX
	N07MbpaA+2Y4qswtC/0s9AHfvQGek34p/Wf7202kK6Vqpg0hyFAF4FPsbNzPoclwowWx6uG+305Rq
	0VO1E3uqcB1A/G8JGuojluHrm4hAOMJW4Y0sh8+NBfK2g2u1pbSpgLVtngpXXacPl2XfXZLsjVgyD
	szSSrWCjLxhOuopcvqNGyGC0YIFL1WArNlPzgvWoQGC+Zg+w/a/i7R51LzgHv51uj+kp/XiL2EG2C
	RbuA/9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATo6-0000000FYbv-1TFw;
	Sat, 26 Sep 2026 14:55:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATo2-0000000FYbD-3Jp7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:55:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37E65B5;
	Sat, 26 Sep 2026 16:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434404;
	bh=1xewGzcPzu1zkc5GgR1aR/d+w28PQT84GqRxGO77PuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puYh4aYf+/598T9+F5R5xyDS0Z95c94B/xaOwVM8aXuWSrB1Pq8JnKqKJY7SSPEEP
	 ax8X7ztdelje6/0VUY1g5EksIuWiZ7+jGW+8kFwqgouLPZFHPFftXudkcJdyZBpI5G
	 1dn6BWqCidXPqADsSUhAlXHfG7DkMIt8KblaCYOI=
Date: Sat, 26 Sep 2026 17:55:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 8/8] arm64: defconfig: Enable OV2312
Message-ID: <20260926145511.GE764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-9-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-9-r-donadkar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075516_246801_D9528CBF 
X-CRM114-Status: GOOD (  10.79  )
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

On Fri, Sep 25, 2026 at 07:00:01PM +0530, Rishikesh Donadkar wrote:
> Enable Omnivison OV2312 RGB+Ir based sensor

Why is this needed in the defconfig ?

> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98..f00b8eee15f3 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -954,6 +954,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
>  CONFIG_VIDEO_HANTRO=m
>  CONFIG_VIDEO_IMX219=m
>  CONFIG_VIDEO_IMX412=m
> +CONFIG_VIDEO_OV2312=m
>  CONFIG_VIDEO_OV5640=m
>  CONFIG_VIDEO_OV5645=m
>  CONFIG_VIDEO_S5KJN1=m

-- 
Regards,

Laurent Pinchart

