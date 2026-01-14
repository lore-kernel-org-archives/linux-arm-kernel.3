Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D98D30CF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 00:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwfqOrkVrMyNbucOnEdg1ziIn7jUKKQJwrC1YoJcjmo=; b=jztGFYHbK9uQ3f1sGZk3J40nRV
	Ck7qgSwC4iR2aRvp73XSzfTa+EPGZPYN1Tpa8HlGOT6OBOSzxNJF7bcRuJJmXa4xaqrnUVbCeoToC
	yga752UqPf1bkLkVXzRCRPBx1ItDD3riq+jJx9KJAt7p3ivgRkEYPjvScNJKFyRTlnSs5w8Mp4GEF
	TzJVy/WgqKPjYueFSAgakWO2zX88i9zSZl2PErVdkWytGw6CpSaxldg7IacBTm4xXYdHxohLbU9WY
	RxRzSWXTPlC74hlYVDf8cQatH7rdwlV3zEfSfVSwyvG+0jqRWm5z0QV6W/RVDRd9XNAjHwiEpt+Uf
	JqnDWNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfp6H-00000007vN0-2JOO;
	Wed, 14 Jan 2026 00:51:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfp6A-00000007vMA-2wRI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 00:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB1996001A;
	Wed, 14 Jan 2026 00:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67236C116C6;
	Wed, 14 Jan 2026 00:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768351857;
	bh=+4hoae6wCkSkzxItSPvkfqfjm0ujTzA0v4ghsxEfF+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aqqr0e1xICwOF3fuLxxhjPVYLGsxyHEM/JW9DbLtIZwh3nm3diO4PBgjuH01Ze7/h
	 ptMOH0YCux8hh2JJWA23nH+WrwK+qe2Bqr/INhbUXFsGzk1tyjb1195MsZS7xlhF+N
	 MG4tcJrU7q6dcNnSBH1xu56kmqEqJjReYygDFph/BNOQnXMT9DMyz5Urfk4/t0HNid
	 Iw/BnftztMBeCt3Qa1BFsSao91JaeD42u9spmujPfOVitG/PdrCbYQmOdNeCdgIic4
	 JJfjZ6ZUqQdhhulnaSOftNuuRmOUOWB70AG0UV7TZrsuV49Ms5SJNDf+q32pekT+wH
	 a6jBTZK5uWPtA==
Date: Wed, 14 Jan 2026 08:50:52 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for
 wakeup interrupt name
Message-ID: <20260114005052.GA2295746@nchen-desktop>
References: <20260112110408.3263954-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112110408.3263954-1-xu.yang_2@nxp.com>
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

On 26-01-12 19:04:08, Xu Yang wrote:
> Currently the wakeup and controller interrupt name are same. It's not
> easy to find the correct one in /proc/interrupt at the first glance.
> Rename the wakeup interrupt name for better distinction.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changs in v2:
>  - check return value
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index d4ee9e16332f..56d2ba824a0b 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
> +	const char *irq_name;
>  
>  	imx_platform_flag = of_device_get_match_data(&pdev->dev);
>  
> @@ -525,10 +526,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  
>  	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
>  	if (data->wakeup_irq > 0) {
> +		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> +		if (!irq_name) {
> +			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			goto err_clk;
> +		}
> +
>  		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
>  						NULL, ci_wakeup_irq_handler,
>  						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> -						pdata.name, data);
> +						irq_name, data);
>  		if (ret)
>  			goto err_clk;
>  	}
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

