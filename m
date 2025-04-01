Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYCk+klL64EFjv81up9yZqqKCbdbZ2pRh5gnlDzkmv8=; b=PfCTuwoeQGXq82G9g4wEaV6L3I
	et2OcPklqsJtwQANg1dFINBLgVudzDGA9Hz5vV860FXAMZTh5X+mmB3mY8wM58Ldr+S7bU1WaCwkh
	ctPnVY1XVP9pYRQqYTb5c9UZx5PV26tD3R8pl4nyd52rU7siyXejRRung/0/84QV2wRBpyyjhM8nI
	GM3xt3tsneHaYSMlzAbFC5E03zlPUK41cbhQXeHcYQd1OsBt80vxhR0qstk8sgTXL1MxC/pzzDrI4
	tF8FaawNYS3FSQvM2WcI03Sb0gV4UdmB4tv3taGrzsLOd1TWggBpG2l6FCdaREAxhpQV+gsG9TVsU
	gB1pYraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzj1R-00000004RDh-2crr;
	Tue, 01 Apr 2025 21:19:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzitj-00000004Pz5-1arQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Apr 2025 21:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YYCk+klL64EFjv81up9yZqqKCbdbZ2pRh5gnlDzkmv8=; b=hZZocwWs+QoBp2LR3cT7lAYx8a
	7XD6ndC1j3bLrjWoVGAtkfRr8qpWPHp7ULw2XCwPXScrsiatRLKUoLN3nyYtVm+sIZSc1GNPQgEpL
	GP1SNWAE+bNJRf5NtyTI/CnFCxACMwgXbegEPecLGoPOa5IQxtLrYb+UDufbAuQRc4kO1EtmrE6Rb
	fXpXpC9LbQfsy6PExEWglFj6JkZeDuPbLTkbG4cm0/VzRJ0TEFK44YKLjQ8SBABsuGQsWmfZT1+5O
	FemecHTD/dMOVn9c8KXuBgQ2KvxDQGxeOWf9ym2XcfNO+Kt21/VGpnu2Miz0CwmNpq73Ltm/IjXn5
	hD/G05Eg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzitf-00000006sc7-1Ufw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 21:11:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79B4106F
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Apr 2025 14:11:46 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4151F3F694
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Apr 2025 14:11:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:11:23 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: shao.mingyin@zte.com.cn
Cc: j@jannau.net, chunkuang.hu@kernel.org, fnkl.kernel@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	tang.dongxing@zte.com.cn
Subject: Re: [PATCH 2/4] drm: arm: =?utf-8?Q?hdlcd?=
 =?utf-8?Q?=3A_Replace_custom_compare=5Fdev_with=C2=A0component=5Fcompare?=
 =?utf-8?B?X29m?=
Message-ID: <Z-xWe6nHEvKHdvsd@e110455-lin.cambridge.arm.com>
References: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
 <20250331173018043nQB6z_xgZxuYx0AkGeixh@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331173018043nQB6z_xgZxuYx0AkGeixh@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_221147_679618_4E8794D6 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Mar 31, 2025 at 05:30:18PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu Dudau

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index c3179d74f3f5..45b1dc5613bf 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -346,11 +346,6 @@ static const struct component_master_ops hdlcd_master_ops = {
>  	.unbind		= hdlcd_drm_unbind,
>  };
> 
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int hdlcd_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -361,7 +356,7 @@ static int hdlcd_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
> 
> -	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> +	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
>  	of_node_put(port);
> 
>  	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
> -- 
> 2.25.1

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

