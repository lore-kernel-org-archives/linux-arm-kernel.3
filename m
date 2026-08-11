Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A54C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5FIo9Rd1+Wjhk2xamsRSeBg7FU4l/iOilYWT35fpoU=; b=nE7d5sXsT3b0xKQNPujgeq1Ji8
	Ts9Zz5Flqp4jPo2KkvwCchkAhWEZyCZTJsqVFvwEzuHeYJJoKLwVB7/GDllJZllxm0FILMXPO4wdq
	wpNoDlXSJeor0gzb+bzZf3jIcd7hSNPLbFg9dyjccwf/ckh+H7urtwx2AKnN3RV5/veSu0YnvWz1g
	hzfJPQAlwMN/EgXDTQjh4cGOl2Sr2DPiU54/iXmkbTTa6hpnJi+uB/ia9YwfnB5I9fT4A6D6Phr+E
	uGNPAz3YDphohz+N+qpbB3gL0nnJpqtjrRZPqtBtACIT1MjJukPaRssdDI8J71Q9cyuu4OyFmWvxb
	CAQwmP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkWC-0000000Dv4F-29Vh;
	Tue, 11 Aug 2026 11:19:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkWB-0000000Dv44-4AWG;
	Tue, 11 Aug 2026 11:19:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED9764073F;
	Tue, 11 Aug 2026 11:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207A91F000E9;
	Tue, 11 Aug 2026 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786447177;
	bh=F5FIo9Rd1+Wjhk2xamsRSeBg7FU4l/iOilYWT35fpoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dWMyUO1+Opeuttfzz/V96XtKwONa0umSbET4XswtJ8+jVDNx2tm7eKGg4F9ITTpUd
	 XozesCCR1XSEif6ykvac/YiMiF5jNEs6hdkGR2KbXXKlJNcvwJr3kF6tWs1bKx9dss
	 qjzD7CLl7vw9PG5tGz41ZYYFU6iYYg1Ne0ACXVz9luKxNIOnudeutnSxL/xboGQljo
	 8caq3wpLwN9VEa6n5+Gsr9EjqwIYobbPSURvUKAH4e6sK0WxqCbuS41WHZu8nxdYI+
	 jt2RJpw1/vptTxKFdoqrr4WJ6TWMcakID3xGuFWsmBAcIO1bpkBuVoazedFhCMl0yF
	 ocBa3YrjkEV2A==
Date: Tue, 11 Aug 2026 16:49:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: tomi.valkeinen@ideasonboard.com, neil.armstrong@linaro.org,
	michal.simek@amd.com, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	git@amd.com, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] phy: zynqmp: register PHY provider after probe
 initialization
Message-ID: <ansFRgkKgEHVVFJL@vaman>
References: <20260807162510.3681572-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807162510.3681572-1-radhey.shyam.pandey@amd.com>
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

On 07-08-26, 21:55, Radhey Shyam Pandey wrote:
> Register the OF PHY provider only after saved_regs allocation and
> runtime PM setup complete successfully. Publishing the provider
> mid-probe allowed concurrent consumers to obtain a phy via xpsgtr_xlate()
> while probe could still fail, leaving them with references into driver
> state that devres would free on the error path.

That fails for me!

> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260720155732.9DA581F000E9@smtp.kernel.org
> Fixes: b3db66f62446 ("phy: xilinx: add runtime PM support")
> Fixes: 5af9b304bc60 ("phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume")
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  drivers/phy/xilinx/phy-zynqmp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
> index 240626b55475..8930cbe24b5a 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -1060,13 +1060,6 @@ static int xpsgtr_probe(struct platform_device *pdev)
>  					    xpsgtr_status_read);
>  	}
>  
> -	/* Register the PHY provider. */
> -	provider = devm_of_phy_provider_register(&pdev->dev, xpsgtr_xlate);
> -	if (IS_ERR(provider)) {
> -		dev_err(&pdev->dev, "registering provider failed\n");
> -		return PTR_ERR(provider);
> -	}
> -
>  	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
>  					   sizeof(save_reg_address),
>  					   GFP_KERNEL);
> @@ -1082,6 +1075,14 @@ static int xpsgtr_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	provider = devm_of_phy_provider_register(&pdev->dev, xpsgtr_xlate);
> +	if (IS_ERR(provider)) {
> +		dev_err(&pdev->dev, "registering provider failed\n");
> +		pm_runtime_put(gtr_dev->dev);
> +		pm_runtime_disable(gtr_dev->dev);
> +		return PTR_ERR(provider);
> +	}
> +
>  	return 0;
>  }
>  
> 
> base-commit: ea2bff00da89d7767d677bb68470130ba96f4928

and this does not exist for me!

-- 
~Vinod

