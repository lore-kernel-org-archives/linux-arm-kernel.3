Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231F7C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAz0hfP0ShOsn7zsGR4RyB9GfCZv5CzmWOx4m5Uw0J4=; b=r84q/HQdgCaASW9DsuzETeCCcC
	aqOSVgAUu3kcWqAWhza8TqjuOl6eHy7bG5FD9JZJ2d6eTdUeScdiTvUA4pFipEiJdzhWSd3joktIr
	V9NM7wqwkzLRwf/BM44bMXUeEVDmkFXoUruuHGegiMyOBg7CIVl+ejrwoBfx+ZvsxLWgPLkpQhBk8
	l8WS4oOTpelwS2rh9uVcgYHJENkoptfqhtOBwhgXmlPkspvgHkh2NCMFbUgKe465FWSth0v+3AsXB
	YeHRg1E25jWpeoqr4vmdQPAeWcH+cIE+qC0KhdczQMrU0/LF/OrV5kpUlCjca9oVQKrhyNOphCaLn
	8by5vGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNms-0000000AUNi-0TKa;
	Wed, 11 Jun 2025 15:54:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJDb-00000009hHF-23eX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jAz0hfP0ShOsn7zsGR4RyB9GfCZv5CzmWOx4m5Uw0J4=; b=XY7PGumpCB5m/XnGvJ63hUHcNa
	L2olPhoOw4JohHgtFKnlSdBpG8M+rTAhQrJpyEJdhlW6jzFoLl0Km7ZWp5n9Xm6ZFjdvoN58PvtF7
	XIu5wkkZyPAPJyEWF3OlPK1n6y19QRMgkW7g2yD71wm/DubgKd7mjPQ5gp+YY9LCLVgJsUWArAPuF
	io4hQFoWUleb0OPJgsm61RHsnc7itc4S4TJc9eC9tPFJQqDD1luq26X+WALGrR7rX42vHa/IWVf3O
	pNP8wBpuCqR2UWVOPpTmM0oc5F5jgRsKHb6VmhI7vAgoI49cKCZU2xmJ4mzKblytbnN0Fc4Ay1MbK
	tpIXVMGg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJDZ-00000002JAF-0klO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:02:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8F272A2A;
	Wed, 11 Jun 2025 04:01:43 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7CE83F59E;
	Wed, 11 Jun 2025 04:02:02 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:01:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] coresight: fix indentation error in
 cscfg_remove_owned_csdev_configs()
Message-ID: <20250611110157.GU8020@e132581.arm.com>
References: <20250611103025.939020-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611103025.939020-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_120205_460470_1E55EA53 
X-CRM114-Status: GOOD (  14.82  )
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

On Wed, Jun 11, 2025 at 11:30:25AM +0100, Yeoreum Yun wrote:
> Fix wrong indentation in cscfg_remove_owned_csdev_configs()
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506102238.XQfScl5x-lkp@intel.com/
> Fixes: 53b9e2659719 ("coresight: holding cscfg_csdev_lock while removing cscfg from csdev")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
> 
> Sorry for my bad forgetting to run checkpatch.pl...
> 
> ---
>  drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 83dad24e0116..6836b05986e8 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
>  	if (list_empty(&csdev->config_csdev_list))
>  		return;
> 
> -  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
> +	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
> 
>  	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
>  		if (config_csdev->config_desc->load_owner == load_owner)
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

