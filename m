Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D8F34C74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Unssg2ZUqVZM3gnX+ox2XFdkNWoFAhOTcXwJkG9T2yM=; b=goIb3Aezho0pvcsfXeJTvQWTBQ
	dk5L5KXoy4sUsYWZKLN5MfSZJq8wnYDAtVGVd42B3v1TES8U5Ly00SuOzQ8NY9Err5e/SQLj0UPNv
	cREjKZtaJhj7/3JwHawAzZeP8itJhFB280VQ1gWWv6RnAwmTaRoM8W994xG/qE7846e8FWVLwiI4o
	mhV9UrBIzBFEG7KM55dOuCU/G0Am8mlB2+LTlqPnHPM4s5WZS5jjzcxcJkAvBDyMd25OdsraCy4r0
	2oCJEYL7qaU3LpsINrM5MRbRFFvDxV97fbKus8ql+xKa+MlnamJ8x01yuZkTDlVmdllxaeTSegmd+
	5oXuQLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKyF-0000000G7yN-1AnX;
	Mon, 13 Apr 2026 17:21:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKyC-0000000G7wr-0yiT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:21:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 145E4357A;
	Mon, 13 Apr 2026 10:21:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63C993F86F;
	Mon, 13 Apr 2026 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776100866; bh=HKlmNvL3lsaWXRhMoep2GQ31CkZ+NBkaZrWabpLkiGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqYrMuqO58GTp8l0L5xBn8paZZHj0xMNeoG6TzcwQFYJj/pu6QNp2XHvMgKepO9yT
	 G5O7IQNZQKGs0WzWVroF+cdB5qhEX1hOAyBqXAbSi/V0W4w3eUBzYQtauX0XLcyhnF
	 gURerw3HsEA2Io75DnW+0VMaCM/6/pKLlM4+PDKU=
Date: Mon, 13 Apr 2026 18:21:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v4 1/9] coresight: etm4x: introduce struct etm4_caps
Message-ID: <20260413172104.GD356832@e132581.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413142003.3549310-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_102108_387451_3E63A4DA 
X-CRM114-Status: GOOD (  22.82  )
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

On Mon, Apr 13, 2026 at 03:19:54PM +0100, Yeoreum Yun wrote:
> Introduce struct etm4_caps to describe ETMv4 capabilities
> and move capabilities information into it.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

FWIW, two comments from Sashiko are valuable for me, please see below.

> ---
>  .../coresight/coresight-etm4x-core.c          | 234 +++++++++---------
>  .../coresight/coresight-etm4x-sysfs.c         | 190 ++++++++------
>  drivers/hwtracing/coresight/coresight-etm4x.h | 176 ++++++-------
>  3 files changed, 328 insertions(+), 272 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042..6443f3717b37 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -88,8 +88,9 @@ static int etm4_probe_cpu(unsigned int cpu);
>   */
>  static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>  {
> -	return (n < drvdata->nr_ss_cmp) &&
> -	       drvdata->nr_pe &&
> +	const struct etmv4_caps *caps = &drvdata->caps;
> +
> +	return (n < caps->nr_ss_cmp) && caps->nr_pe &&
>  	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);

As Sashiko suggests:

  "This isn't a regression introduced by this patch, but should this be
   checking caps->nr_pe_cmp instead of caps->nr_pe?"

I confirmed the ETMv4 specification (ARM IHI0064H.b), the comment
above is valid as the we should check caps->nr_pe_cmp instead.

Could you first use a patch to fix the typo and then apply
capabilities afterwards?  This is helpful for porting to stable
kernels.

[...]

> @@ -525,14 +530,14 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1))
>  		dev_err(etm_dev,
>  			"timeout while waiting for Idle Trace Status\n");
> -	if (drvdata->nr_pe)
> +	if (caps->nr_pe)
>  		etm4x_relaxed_write32(csa, config->pe_sel, TRCPROCSELR);
>  	etm4x_relaxed_write32(csa, config->cfg, TRCCONFIGR);
>  	/* nothing specific implemented */
>  	etm4x_relaxed_write32(csa, 0x0, TRCAUXCTLR);
>  	etm4x_relaxed_write32(csa, config->eventctrl0, TRCEVENTCTL0R);
>  	etm4x_relaxed_write32(csa, config->eventctrl1, TRCEVENTCTL1R);
> -	if (drvdata->stallctl)
> +	if (caps->stallctl)
>  		etm4x_relaxed_write32(csa, config->stall_ctrl, TRCSTALLCTLR);
>  	etm4x_relaxed_write32(csa, config->ts_ctrl, TRCTSCTLR);
>  	etm4x_relaxed_write32(csa, config->syncfreq, TRCSYNCPR);
> @@ -542,17 +547,17 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  	etm4x_relaxed_write32(csa, config->vinst_ctrl, TRCVICTLR);
>  	etm4x_relaxed_write32(csa, config->viiectlr, TRCVIIECTLR);
>  	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
> -	if (drvdata->nr_pe_cmp)
> +	if (caps->nr_pe_cmp)
>  		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +	for (i = 0; i < caps->nrseqstate - 1; i++)
>  		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));

Sashiko's comment:

  "If the hardware does not implement a sequencer, caps->nrseqstate (a u8)
   will be 0. Does 0 - 1 evaluate to -1 as an int, which then gets promoted
   to ULONG_MAX against val (an unsigned long)?"

This is a good catch.  The condition check should be:

  for (i = 0; i < caps->nrseqstate; i++)
       ...;

The issue is irrelevant to your patch, but could you use a patch to fix
"nrseqstate - 1" first and then apply the cap refactoring on it?  This
would be friendly for porting to stable kernel.

Thanks,
Leo

