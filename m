Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A13C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 08:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+2jeM3+0HjZvMLs25kCVMMMaMZx/315gtOHsBXq8V4=; b=y57Ig2ue440KIWaKcL/l6RDBEu
	mRhydbbjPTy4FVnAZ7WSQYGnBn2RR/V8ihmAVv1bLMnvIIo3wHTc4u3rx43YS5o8zz7ow8qXP2ex3
	d/JlYCFySKLMENjgjj0TJsJiIz0jM3uooLhjvvuvyFpPHb0JIqB/JOZG8h2aGqNGFXiL/yPX8JiG5
	oEodGU1wwnCiDvOrI2KkPzAT/axHYZVT8XUgoqyabrflM/EmR5o7EmvXpnSXlFxZU/3N88QIvJ6o3
	3wUsIf7b7Tl8hoyOZAGJAQnKk8tFKXYd/LVUO9zJZ4umtwJxgWwTXPCR7f6u94lfVkYdGz4m3D0pa
	jBSlZWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdRA-00000002d9S-0sip;
	Mon, 24 Mar 2025 08:45:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdPQ-00000002cza-3Y0X
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Mar 2025 08:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t+2jeM3+0HjZvMLs25kCVMMMaMZx/315gtOHsBXq8V4=; b=AVV1tcXZNigIrFtO10KkOlFkZ9
	F4MFAwdRpmDxfilImziljcWT+E7qfv9xUQtwg/j0uG7fWPKLzSDvM2Nn46dOXqG1xkhmKB3vnkB9Y
	nrsVgW9IKtRl01K8liX8tZkPvHkEMF0bJSGmDTWNoSCmlgycpIEPHZI/+XHa1IVXTl/R2xuK2K1UC
	0aY5cYWMZ63z51BwF6PDqPXgbqTghRVg8NbX2NJJM5kHhf1HDT+IO/QcKdJ2+TP3fmuXa3E2YSoy8
	Y0KezgXiIU+fZ8LihUBv7XzADHPCtyerwZ9gR6maIzbkaMNGxvibGfH+YezgBKqfOnvDWRmDTwMDD
	5eCausQQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdPN-00000005CEb-3Qud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 08:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742805818;
	bh=GHS3IpXQhdYO4TFfzI7IaDKnCl40cRYwui87XEEhlGg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LUfPERqY2YeNmCMthC0TWEUy+C9p14zzstnLfbgvjTbPch2DOxOaKqVujvW2HNvYB
	 +y39XCzpLEB/mQgovQmJQBZaVRbKBU7h3hZhawqAq9iFSMC97KCFaV2ac363LVS7We
	 4i90Dk1PBGO8pG/Qd0S3C+2SYGfUDIR46u/gu0qjxaZ1Zcn+qhOVMPLTf4c+QYWIZg
	 ZEv0Me5JE0QWWJ04ySu49wsr9DI4q62r+covXy7rnNWQSiCqfFFPLRvzHgBque2leE
	 b7bk+wBjFCTZ+YE/zpkamGNVMpTr1ZMPbvHcnBjGb7oRl9arCUz7yN86YXHBo9fewF
	 +ufZ6ufEzz8cw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F25417E0B12;
	Mon, 24 Mar 2025 09:43:38 +0100 (CET)
Date: Mon, 24 Mar 2025 09:43:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250324094333.7afb17a1@collabora.com>
In-Reply-To: <20250321200625.132494-5-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_084346_062502_254F75A6 
X-CRM114-Status: GOOD (  25.81  )
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

On Fri, 21 Mar 2025 21:05:54 +0100
Marek Vasut <marex@denx.de> wrote:

> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Implement support for one optional reset.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Drop the select RESET_SIMPLE from Kconfig
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index a9da1d1eeb707..51ee9cae94504 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> +static int panthor_reset_init(struct panthor_device *ptdev)
> +{
> +	ptdev->resets = devm_reset_control_get_optional_exclusive_deasserted(ptdev->base.dev, NULL);
> +	if (IS_ERR(ptdev->resets))
> +		return dev_err_probe(ptdev->base.dev,
> +				     PTR_ERR(ptdev->resets),
> +				     "get reset failed");
> +
> +	return 0;
> +}
> +
>  void panthor_device_unplug(struct panthor_device *ptdev)
>  {
>  	/* This function can be called from two different path: the reset work
> @@ -217,6 +228,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = panthor_reset_init(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> @@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
>  
> +	ret = reset_control_deassert(ptdev->resets);
> +	if (ret)
> +		goto err_disable_coregroup_clk;
> +
>  	panthor_devfreq_resume(ptdev);
>  
>  	if (panthor_device_is_initialized(ptdev) &&
> @@ -512,6 +531,9 @@ int panthor_device_resume(struct device *dev)
>  
>  err_suspend_devfreq:
>  	panthor_devfreq_suspend(ptdev);
> +	reset_control_assert(ptdev->resets);
> +
> +err_disable_coregroup_clk:
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  
>  err_disable_stacks_clk:
> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>  
>  	panthor_devfreq_suspend(ptdev);
>  
> +	reset_control_assert(ptdev->resets);

Hm, that might be the cause of the fast reset issue (which is a fast
resume more than a fast reset BTW): if you re-assert the reset line on
runtime suspend, I guess this causes a full GPU reset, and the MCU ends
up in a state where it needs a slow reset (all data sections reset to
their initial state). Can you try to move the reset_control_[de]assert
to the unplug/init functions?

>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  	clk_disable_unprepare(ptdev->clks.stacks);
>  	clk_disable_unprepare(ptdev->clks.core);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index da6574021664b..fea3a05778e2e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -111,6 +111,9 @@ struct panthor_device {
>  		struct clk *coregroup;
>  	} clks;
>  
> +	/** @resets: GPU reset. */
> +	struct reset_control *resets;
> +
>  	/** @coherent: True if the CPU/GPU are memory coherent. */
>  	bool coherent;
>  


