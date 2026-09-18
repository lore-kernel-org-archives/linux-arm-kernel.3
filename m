Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B4C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPAUgj61skePTRwkTuWzD4/Gpc8BPMepdf+as3uycd8=; b=cF95svD5VG/OZgfazl2C7J3bRn
	3xg1XKbkXYjHKS8LI2+66HhxvT/2oJK9ykGQZDo2oTjm0trlJsJidVewMrARKWWiUtgL7n+n3Ftc+
	3lg6AHO0lgNEVoovR1y9DoGkD6LjMxnyL4M3AY0+dxtSg2tck3x1gUWAsoyhG4BAgCpsq/2nRMvN8
	9VqC1HdOhPMcFnlCuzHd0d/ecBAjJ3GoQTLYHmsPZ5LHCh9Pp5t0CLKHlUuZdyQvXNesN0kJgVFnn
	CsHYVSl5zrkUKCoeOqGJZfRDDiUr4iVjZOG07qYiRRYwjS3VA9VFH8E+sVHmR6Zgw8TEFEfkggj36
	Xu+Wtv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VdF-0000000E4kf-1d3d;
	Fri, 18 Sep 2026 10:15:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VdC-0000000E4k4-1r59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:15:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 142742F;
	Fri, 18 Sep 2026 03:15:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4588E3F86F;
	Fri, 18 Sep 2026 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789726542; bh=KtHkCCp2ZJR4LBAx51tVzEC/Q5vrKoLnFu0a9w80TAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYNKN1y8FvUqtRoTmCJN84zHFuSHI66hCK7SmrRDccWSAA6kPUPRyCM86KWZopKwm
	 1MY7mRlqvOkyOEuMfABKU63QmNm6Jy9o3ocITyRl0IAoMNuKM0upzyIY4pK+X8ty4i
	 RzZgJ4HTwQtLV7OQSMxxgK2vrK6ps7sMbyFb/yd4=
Date: Fri, 18 Sep 2026 11:15:37 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, nd@arm.com
Subject: Re: [PATCH v10 6/8] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <aq0PSbrA5n0mb8WG@e129823.arm.com>
References: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
 <20260911-separate_etm_cfg_v2-v10-6-1b715d95927a@arm.com>
 <784ab977-0247-410e-a2f0-b24962b2579b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <784ab977-0247-410e-a2f0-b24962b2579b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_031546_574299_3E5D3E00 
X-CRM114-Status: GOOD (  33.69  )
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

Hi Mike,

> Hi,
> 
> On 9/11/26 11:56, Yeoreum Yun wrote:
> > The purpose of TRCSSCSRn register is to show status of
> > the corresponding Single-shot Comparator Control and input supports.
> > That means writable field's purpose for reset or restore from idle status
> > not for configuration.
> > 
> > Therefore, exclude ss_status from drvdata->config and move it to drvdata.
> > 
> > Before this patch, clearing the PENDING and STATUS bits when enabling
> > a perf session could trigger multiple single-shot events within
> > the same session.
> 
> The hardware is designed to have multiple single shot events - the reset bit
> in TRCSSCCRn specifically programs this behaviour.
> 
> But the basic point is correct there is no need to have the status register
> as part of the configurable set of registers.
> 
> This issue will be addressed in a future patch;

Acked. Thanks for your review ;)

> > this patch intentionally preserves the existing behavior.
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-cfg.c   |  1 -
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c  | 15 ++++++++-------
> >   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 10 +++++-----
> >   drivers/hwtracing/coresight/coresight-etm4x.h       |  7 ++++++-
> >   4 files changed, 19 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index d24f533c623d..098aabd2b922 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > @@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
> >   		off_mask =  (offset & GENMASK(11, 5));
> >   		do {
> >   			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
> > -			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
> >   			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
> >   		} while (0);
> >   	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 6d64a3fbdea4..68aa99e8135d 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -95,7 +95,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> >   	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
> > -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> > +	       (drvdata->ss_status[n] & TRCSSCSRn_PC);
> >   }
> >   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> > @@ -573,11 +573,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		/* always clear status bit on restart if using single-shot */
> > +		/* always clear status and pending bits on restart if using single-shot */
> >   		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> > -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> > +			drvdata->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
> >   		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> > -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> > +		etm4x_relaxed_write32(csa, drvdata->ss_status[i], TRCSSCSRn(i));
> >   		if (etm4x_sspcicrn_present(drvdata, i))
> >   			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
> >   	}
> > @@ -1081,7 +1081,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> >   	/* read the status of the single shot comparators */
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		config->ss_status[i] =
> > +		drvdata->ss_status[i] =
> >   			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> >   	}
> > @@ -1511,8 +1511,9 @@ static void etm4_init_arch_data(void *info)
> >   	 */
> >   	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		drvdata->config.ss_status[i] =
> > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> > +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
> 
> The unused bits in this register are RES0 - rendering this masking
> redundant.

Agree. I'll restore it.

> 
> >   	}
> >   	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
> >   	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > index 2d8a8f64a038..ac290f446c51 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > @@ -1829,8 +1829,8 @@ static ssize_t sshot_ctrl_store(struct device *dev,
> >   	raw_spin_lock(&drvdata->spinlock);
> >   	idx = config->ss_idx;
> >   	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
> > -	/* must clear bit 31 in related status register on programming */
> > -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
> > +	/* must clear bit 31 and 30 in related status register on programming */
> > +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
> >   	raw_spin_unlock(&drvdata->spinlock);
> >   	return size;
> >   }
> > @@ -1844,7 +1844,7 @@ static ssize_t sshot_status_show(struct device *dev,
> >   	struct etmv4_config *config = &drvdata->config;
> >   	raw_spin_lock(&drvdata->spinlock);
> > -	val = config->ss_status[config->ss_idx];
> > +	val = drvdata->ss_status[config->ss_idx];
> >   	raw_spin_unlock(&drvdata->spinlock);
> >   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> >   }
> > @@ -1879,8 +1879,8 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
> >   	raw_spin_lock(&drvdata->spinlock);
> >   	idx = config->ss_idx;
> >   	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
> > -	/* must clear bit 31 in related status register on programming */
> > -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
> > +	/* must clear bit 31 and 30 in related status register on programming */
> > +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
> >   	raw_spin_unlock(&drvdata->spinlock);
> >   	return size;
> >   }
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> > index ffde48b6b41b..8c1c1364b1c4 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -213,6 +213,7 @@
> >   #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
> >   #define TRCSSCSRn_STATUS			BIT(31)
> > +#define TRCSSCSRn_PENDING			BIT(30)
> 
> Minor nit - PENDING is ETE only - worth commenting in case a reader is
> looking at the ETMv4 spec.

Okay. I'll spell out.

> 
> 
> >   #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
> >   #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
> > @@ -730,6 +731,9 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
> >   #define ETM_DEFAULT_ADDR_COMP		0
> >   #define TRCSSCSRn_PC			BIT(3)
> > +#define TRCSSCSRn_DV			BIT(2)
> > +#define TRCSSCSRn_DA			BIT(1)
> > +#define TRCSSCSRn_INST			BIT(0)
> 
> These new defs are redundant if the masking above is redundant

Acked. will remove this defines. 

Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun

