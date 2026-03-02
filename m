Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D07D58E7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0j+aRVIB6j112TIAd5MW3X8pL5CN0UWu31BcHdnhd2s=; b=ke+3G0fS4a18R1dkoe90xF5jjX
	g9r7khzRZ9isPaUrxhQCqaJFa0LgtzP18aSNf/RO3z9rEzr2/nbOZEqaAc5uHS1SRYhJuWvY9nvj9
	6zWkTCK/oltSnlf9b6a7PgqkkpCCQ54n6AcqinG0XF0728tIeOiaedbTpH1pANd1js/vj0CdDtfZ0
	n5g93lIfOjDV3XRYn2gvKwMjhjY5n+rL852H11Ng4vRYiMl63dN0zVZ083lOnXa6oh0YNxs239koh
	0WvcgI1lcu6hrWU+k5diwnDuOhaR2r0/fLdJcjzTxsLL0nGiFk/WB0hZiT+p9i0fp+GMzV/TSVgDk
	d0l/NdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzGd-0000000CZYl-1NSH;
	Mon, 02 Mar 2026 09:08:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzGa-0000000CZXT-3L0Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5720C14BF;
	Mon,  2 Mar 2026 01:08:31 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F08E3F73B;
	Mon,  2 Mar 2026 01:08:37 -0800 (PST)
Date: Mon, 2 Mar 2026 09:08:35 +0000
From: Leo Yan <leo.yan@arm.com>
To: Elsanti <santiagojoseleal27@gmail.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/hwtracing/coresight: remove unneeded variable in
 tmc_crashdata_release()
Message-ID: <20260302090835.GD1098637@e132581.arm.com>
References: <20260228222344.288639-1-santiagojoseleal27@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228222344.288639-1-santiagojoseleal27@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_010840_892368_3EF3D65D 
X-CRM114-Status: GOOD (  16.36  )
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

On Sat, Feb 28, 2026 at 06:23:44PM -0400, Elsanti wrote:
> The variable 'ret' is initialized to 0, never modified, and returned
> directly. Remove it and return 0 explicitly.
> 
> Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-tmc-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 36599c431be6..e29012c451c5 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -401,7 +401,6 @@ static ssize_t tmc_crashdata_read(struct file *file, char __user *data,
>  
>  static int tmc_crashdata_release(struct inode *inode, struct file *file)
>  {
> -	int ret = 0;
>  	unsigned long flags;
>  	struct tmc_resrv_buf *rbuf;
>  	struct tmc_drvdata *drvdata = container_of(file->private_data,
> @@ -414,7 +413,7 @@ static int tmc_crashdata_release(struct inode *inode, struct file *file)
>  	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>  
>  	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct file_operations tmc_crashdata_fops = {
> -- 
> 2.53.0
> 
> 

