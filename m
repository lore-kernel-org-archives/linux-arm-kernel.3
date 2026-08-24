Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF879C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 22:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEmtRN47kwG05US/IbhgEzTorsVZSIZgz+RMBMlH7Yk=; b=g+o9QkXppBklkU7O1Gzz16U5Sb
	oyUp+T3S4oDW1lgWDAbJzfS1TaWw+pFky/tyGw0AAT36o/oamqwSUuY50CMUrBIpSxiC7Meb0wWKB
	CoVnRTmdUU7AUdirN6tcqWWXdl4J+hkWZLervr7BGuDv7rFL2DNsoyLW2r2LWJ47GGuiMrK2IFUGB
	YJ/OA3kKRaeaIuptCiEGEJyWdMibtNSW8P/PBGM3wh/kyXzyLmEUpmN4XoRdLhcp1kw3kWHHBCajx
	O/Vk+Tf28VAa7bWLsluyfteA0d2qEQoK3lcsbcVv4MXQCNkAFnTLtDOK6a4Jhw+M2Ao8aF/sTFq5J
	tvrztNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycon-0000000HQv3-1MP8;
	Mon, 24 Aug 2026 22:07:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycok-0000000HQuS-3XV2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 22:07:00 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a02:a03f:c393:cb01:be9:acf5:9729:4e55])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED8FE512;
	Tue, 25 Aug 2026 00:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787609130;
	bh=GoErHIMicp0nmvLS9m+qyBTsqbfwwSSRewhoOAHZe24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+HdUHPjMkS2V0DwWNdtjaZYiqEzZQQxwUZpjn17ZkAhfilW9z4VkQiS+9+ilEcdM
	 PrI+me66O9Xqk8Ldb32oSOf8bn6JzkJTzuycGGX5/M8zUugRdj3OGThOjIrSqhMNha
	 Ecxj9N7rVNRGZtHMTj/Ms59QL2glmRtPnFR114Wk=
Date: Tue, 25 Aug 2026 00:06:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mchehab@kernel.org, michal.simek@amd.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] [media] v4l: xilinx: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260824220653.GA727417@killaraus.ideasonboard.com>
References: <20260821071125.213335-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821071125.213335-1-triet.hoang.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_150659_028720_A5BE8238 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Triet,

Thank you for the patch.

I'm CC'ing Tomi Valkeinen who is currently working on the Xilinx V4L2
drivers. Tomi, could you handle this patch ?

On Fri, Aug 21, 2026 at 02:11:24PM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations
> from its suspend and resume callbacks,
> also reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
>  drivers/media/platform/xilinx/xilinx-tpg.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> index 7deec6e37edc..8bac01084605 100644
> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -686,7 +686,7 @@ static const struct media_entity_operations xtpg_media_ops = {
>   * Power Management
>   */
>  
> -static int __maybe_unused xtpg_pm_suspend(struct device *dev)
> +static int xtpg_pm_suspend(struct device *dev)
>  {
>  	struct xtpg_device *xtpg = dev_get_drvdata(dev);
>  
> @@ -695,7 +695,7 @@ static int __maybe_unused xtpg_pm_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused xtpg_pm_resume(struct device *dev)
> +static int xtpg_pm_resume(struct device *dev)
>  {
>  	struct xtpg_device *xtpg = dev_get_drvdata(dev);
>  
> @@ -895,7 +895,7 @@ static void xtpg_remove(struct platform_device *pdev)
>  	xvip_cleanup_resources(&xtpg->xvip);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
>  
>  static const struct of_device_id xtpg_of_id_table[] = {
>  	{ .compatible = "xlnx,v-tpg-5.0" },
> @@ -906,7 +906,7 @@ MODULE_DEVICE_TABLE(of, xtpg_of_id_table);
>  static struct platform_driver xtpg_driver = {
>  	.driver = {
>  		.name		= "xilinx-tpg",
> -		.pm		= &xtpg_pm_ops,
> +		.pm		= pm_sleep_ptr(&xtpg_pm_ops),
>  		.of_match_table	= xtpg_of_id_table,
>  	},
>  	.probe			= xtpg_probe,

-- 
Regards,

Laurent Pinchart

