Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E254CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5lN2FVRUwyWUziPhLvGH3HntzNUb1a1JZVF0oGrBo8=; b=B2xN+EslM4Fxx/YrlPYaHNHN0a
	5LJ8dDLB75HJ638XAX6utkmSKK+JQuf6GFLnOxmc9OT3LtCZhxKQcnVcWsLS+/HeZTfg34v08Emvt
	OQSf2u/QQRsZ0f3P8HfTIgYBETU3j3TUjgwo4cPO/YtRzjxBA3DkFbHTEvlQh5ujyWJeg6RmAPpzO
	VqNDJdamiHFGxOJF5+IsCieqBniSb9kPwQNqpY9/N7IY3lp0b6eLTghWQbULLhZCVY9wDLb/tMI93
	Qv6e//dbpHD3SMeG4N9kBhZaPvBkHBVbKGHpDDWk2fHLBUjHs/Ef3PHQ0SQV/wAZhj26v1GxTGAnF
	sccXv3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdks-00000002AMM-1b3h;
	Thu, 11 Sep 2025 09:38:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdkp-00000002AJU-2wjf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:38:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F77F153B;
	Thu, 11 Sep 2025 02:38:02 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704E73F694;
	Thu, 11 Sep 2025 02:38:10 -0700 (PDT)
Date: Thu, 11 Sep 2025 10:38:07 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v3 1/3] coresight: tmc: Add missing doc including reading
 and etr_mode of struct tmc_drvdata
Message-ID: <20250911093807.GE12516@e132581.arm.com>
References: <20250818080600.418425-1-hejunhao3@huawei.com>
 <20250818080600.418425-2-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818080600.418425-2-hejunhao3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_023811_787331_1118C599 
X-CRM114-Status: GOOD (  18.04  )
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

On Mon, Aug 18, 2025 at 04:05:58PM +0800, Junhao He wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> tmc_drvdata::reading is used to indicate whether a reading process
> is performed through /dev/xyz.tmc.
> tmc_drvdata::etr_mode is used to store the Coresight TMC-ETR buffer
> mode selected by the user.
> Document them.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Junhao He <hejunhao3@huawei.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-tmc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..9daa2680cfb6 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -220,6 +220,7 @@ struct tmc_resrv_buf {
>   * @pid:	Process ID of the process that owns the session that is using
>   *		this component. For example this would be the pid of the Perf
>   *		process.
> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
>   * @stop_on_flush: Stop on flush trigger user configuration.
>   * @buf:	Snapshot of the trace data for ETF/ETB.
>   * @etr_buf:	details of buffer used in TMC-ETR
> @@ -232,6 +233,7 @@ struct tmc_resrv_buf {
>   * @trigger_cntr: amount of words to store after a trigger.
>   * @etr_caps:	Bitmask of capabilities of the TMC ETR, inferred from the
>   *		device configuration register (DEVID)
> + * @etr_mode:	User preferred mode of the ETR device, default auto mode.
>   * @idr:	Holds etr_bufs allocated for this ETR.
>   * @idr_mutex:	Access serialisation for idr.
>   * @sysfs_buf:	SYSFS buffer for ETR.
> -- 
> 2.33.0
> 

