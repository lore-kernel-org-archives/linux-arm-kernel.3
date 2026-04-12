Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C1E937EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3qvZGoeKroSKJZg8fjgOltCI+eEUJJkdIsN6rRfIw8=; b=lM7E0VX2nTD3C8x6S8jC+Fj06s
	pkmh8G0656XSiobxlT8JuphvrSsGdQBN5WpkCc7JTatWQ/UGUkMvXgZS2Pw3Mjd7P5xPRqD7iHtK7
	9PrMMvyraKMRV70gatqI9vyhudr1GmoIBnMVVSHl1CAW3+f1Ym0As8X4G3Gwf+PrRSlyPgj/yiJ1u
	1Sr7QnBb6nMdkcxkfPecIzLtjeDSeWroI9cf8BoO42VK96QcmtC8yaR/avVyPTtoafLkjp+UE5eFz
	eW9jKgsvtPTjP+g+YzAKCRewI+KdHOE7D+wq82hHZw/5sIrABCC6Yd7CDV9iQySQP6g3j1pYy4ZzK
	89eXzBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwy5-0000000ERnp-27AE;
	Sun, 12 Apr 2026 15:43:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBwy2-0000000ERnO-0PWH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 15:43:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E02A14CFD;
	Sun, 12 Apr 2026 08:43:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70DB23F7B4;
	Sun, 12 Apr 2026 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776008595; bh=EcMdls4weSBtngOueH6zD8jwOMCsdWcU5swg96W8Ud0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ao1bmBHgMfU5HQ7NeUHMETPo1Ub1g9JblwJIguUj6Mk6Mzm2Zw/sqWxJwKkMSOEQ8
	 f8gd9HiuAwfHILINnwo9G/kqXtO+PcX/EFlJQZG74rNIo1UC1hK40z1SrUm+bFEzyY
	 nVRKGuEsQtjJmIMyuAh/gdlycxHGKRpCREkGf0p8=
Date: Sun, 12 Apr 2026 16:43:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com
Subject: Re: [PATCH v2 4/5] coresight: etm3x: introduce struct etm_caps
Message-ID: <adu9kImh7OrIaz8p@e129823.arm.com>
References: <20260410074310.2693385-1-yeoreum.yun@arm.com>
 <20260410074310.2693385-5-yeoreum.yun@arm.com>
 <4feaf157-4015-471e-accf-d588e2345c13@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4feaf157-4015-471e-accf-d588e2345c13@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_084322_332472_E05CDD6A 
X-CRM114-Status: GOOD (  34.18  )
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

Hi Jie,

>
>
> On 4/10/2026 3:43 PM, Yeoreum Yun wrote:
> > Introduce struct etm_caps to describe ETMv3 capabilities
> > and move capabilities information into it.
> >
> > Since drvdata->etmccr and drvdata->etmccer are used to check
> > whether it supports fifofull logic and timestamping,
> > remove etmccr and etmccer field from drvdata and add relevant fields
> > in etm_caps structure.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm.h   | 40 +++++++++++--------
> >   .../coresight/coresight-etm3x-core.c          | 33 ++++++++-------
> >   .../coresight/coresight-etm3x-sysfs.c         | 14 ++++---
> >   3 files changed, 52 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
> > index 1d753cca2943..6fda26039db8 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm.h
> > @@ -140,6 +140,28 @@
> >   				 ETM_ADD_COMP_0		|	\
> >   				 ETM_EVENT_NOT_A)
> > +/**
> > + * struct etmv4_caps - specifics ETM capabilities
> > + * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
> > + * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
> > + * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
> > + * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
> > + * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
> > + * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
> > + * @fifofull: FIFOFULL logic is present.
> > + * @timestamp: Timestamping is implemented.
> > + */
> > +struct etm_caps {
> > +	int	port_size;
> > +	u8	nr_addr_cmp;
> > +	u8	nr_cntr;
> > +	u8	nr_ext_inp;
> > +	u8	nr_ext_out;
> > +	u8	nr_ctxid_cmp;
> > +	bool	fifofull : 1;
> > +	bool	timestamp : 1;
> > +};
> > +
> >   /**
> >    * struct etm_config - configuration information related to an ETM
> >    * @mode:	controls various modes supported by this ETM/PTM.
> > @@ -212,19 +234,12 @@ struct etm_config {
> >    * @csdev:	component vitals needed by the framework.
> >    * @spinlock:	only one at a time pls.
> >    * @cpu:	the cpu this component is affined to.
> > - * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
> >    * @arch:	ETM/PTM version number.
> > + * @caps:	ETM capabilities.
> >    * @use_cpu14:	true if management registers need to be accessed via CP14.
> >    * @sticky_enable: true if ETM base configuration has been done.
> >    * @boot_enable:true if we should start tracing at boot time.
> >    * @os_unlock:	true if access to management registers is allowed.
> > - * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
> > - * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
> > - * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
> > - * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
> > - * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
> > - * @etmccr:	value of register ETMCCR.
> > - * @etmccer:	value of register ETMCCER.
> >    * @traceid:	value of the current ID for this component.
> >    * @config:	structure holding configuration parameters.
> >    */
> > @@ -234,19 +249,12 @@ struct etm_drvdata {
> >   	struct coresight_device		*csdev;
> >   	spinlock_t			spinlock;
> >   	int				cpu;
> > -	int				port_size;
> >   	u8				arch;
> > +	struct etm_caps			caps;
> >   	bool				use_cp14;
> >   	bool				sticky_enable;
> >   	bool				boot_enable;
> >   	bool				os_unlock;
> > -	u8				nr_addr_cmp;
> > -	u8				nr_cntr;
> > -	u8				nr_ext_inp;
> > -	u8				nr_ext_out;
> > -	u8				nr_ctxid_cmp;
> > -	u32				etmccr;
> > -	u32				etmccer;
> >   	u32				traceid;
> >   	struct etm_config		config;
> >   };
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > index a547a6d2e0bd..b7e977defb1c 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> > @@ -367,6 +367,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
> >   {
> >   	int i, rc;
> >   	u32 etmcr;
> > +	const struct etm_caps *caps = &drvdata->caps;
> >   	struct etm_config *config = &drvdata->config;
> >   	struct coresight_device *csdev = drvdata->csdev;
> > @@ -388,7 +389,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
> >   	etmcr = etm_readl(drvdata, ETMCR);
> >   	/* Clear setting from a previous run if need be */
> >   	etmcr &= ~ETM3X_SUPPORTED_OPTIONS;
> > -	etmcr |= drvdata->port_size;
> > +	etmcr |= caps->port_size;
> >   	etmcr |= ETMCR_ETM_EN;
> >   	etm_writel(drvdata, config->ctrl | etmcr, ETMCR);
> >   	etm_writel(drvdata, config->trigger_event, ETMTRIGGER);
> > @@ -396,11 +397,11 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
> >   	etm_writel(drvdata, config->enable_event, ETMTEEVR);
> >   	etm_writel(drvdata, config->enable_ctrl1, ETMTECR1);
> >   	etm_writel(drvdata, config->fifofull_level, ETMFFLR);
> > -	for (i = 0; i < drvdata->nr_addr_cmp; i++) {
> > +	for (i = 0; i < caps->nr_addr_cmp; i++) {
> >   		etm_writel(drvdata, config->addr_val[i], ETMACVRn(i));
> >   		etm_writel(drvdata, config->addr_acctype[i], ETMACTRn(i));
> >   	}
> > -	for (i = 0; i < drvdata->nr_cntr; i++) {
> > +	for (i = 0; i < caps->nr_cntr; i++) {
> >   		etm_writel(drvdata, config->cntr_rld_val[i], ETMCNTRLDVRn(i));
> >   		etm_writel(drvdata, config->cntr_event[i], ETMCNTENRn(i));
> >   		etm_writel(drvdata, config->cntr_rld_event[i],
> > @@ -414,9 +415,9 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
> >   	etm_writel(drvdata, config->seq_32_event, ETMSQ32EVR);
> >   	etm_writel(drvdata, config->seq_13_event, ETMSQ13EVR);
> >   	etm_writel(drvdata, config->seq_curr_state, ETMSQR);
> > -	for (i = 0; i < drvdata->nr_ext_out; i++)
> > +	for (i = 0; i < caps->nr_ext_out; i++)
> >   		etm_writel(drvdata, ETM_DEFAULT_EVENT_VAL, ETMEXTOUTEVRn(i));
> > -	for (i = 0; i < drvdata->nr_ctxid_cmp; i++)
> > +	for (i = 0; i < caps->nr_ctxid_cmp; i++)
> >   		etm_writel(drvdata, config->ctxid_pid[i], ETMCIDCVRn(i));
> >   	etm_writel(drvdata, config->ctxid_mask, ETMCIDCMR);
> >   	etm_writel(drvdata, config->sync_freq, ETMSYNCFR);
> > @@ -572,7 +573,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
> >   	/* Read back sequencer and counters for post trace analysis */
> >   	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
> > -	for (i = 0; i < drvdata->nr_cntr; i++)
> > +	for (i = 0; i < caps->nr_cntr; i++)
>
> caps undeclared.
>
> Thanks,
> Jie

Sorry to mistake. I'll change.


>
> >   		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
> >   	etm_set_pwrdwn(drvdata);
> > @@ -754,7 +755,9 @@ static void etm_init_arch_data(void *info)
> >   {
> >   	u32 etmidr;
> >   	u32 etmccr;
> > +	u32 etmccer;
> >   	struct etm_drvdata *drvdata = info;
> > +	struct etm_caps *caps = &drvdata->caps;
> >   	/* Make sure all registers are accessible */
> >   	etm_os_unlock(drvdata);
> > @@ -779,16 +782,18 @@ static void etm_init_arch_data(void *info)
> >   	/* Find all capabilities */
> >   	etmidr = etm_readl(drvdata, ETMIDR);
> >   	drvdata->arch = BMVAL(etmidr, 4, 11);
> > -	drvdata->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
> > +	caps->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
> > +
> > +	etmccer = etm_readl(drvdata, ETMCCER);
> > +	caps->timestamp = !!(drvdata->etmccer & ETMCCER_TIMESTAMP);
>
> caps->timestamp = !!(etmccer & ETMCCER_TIMESTAMP);
>
> > -	drvdata->etmccer = etm_readl(drvdata, ETMCCER);
> >   	etmccr = etm_readl(drvdata, ETMCCR);
> > -	drvdata->etmccr = etmccr;
> > -	drvdata->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
> > -	drvdata->nr_cntr = BMVAL(etmccr, 13, 15);
> > -	drvdata->nr_ext_inp = BMVAL(etmccr, 17, 19);
> > -	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
> > -	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
> > +	caps->fifofull = !!(drvdata->etmccr & ETMCCR_FIFOFULL);
>
> caps->fifofull = !!(etmccr & ETMCCR_FIFOFULL);
>
> > +	caps->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
> > +	caps->nr_cntr = BMVAL(etmccr, 13, 15);
> > +	caps->nr_ext_inp = BMVAL(etmccr, 17, 19);
> > +	caps->nr_ext_out = BMVAL(etmccr, 20, 22);
> > +	caps->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
> >   	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
> >   	etm_set_pwrdwn(drvdata);
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > index 762109307b86..0d8dac29d055 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > @@ -111,6 +111,7 @@ static ssize_t mode_store(struct device *dev,
> >   	int ret;
> >   	unsigned long val;
> >   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +	const struct etm_caps *caps = &drvdata->caps;
> >   	struct etm_config *config = &drvdata->config;
> >   	ret = kstrtoul(buf, 16, &val);
> > @@ -131,7 +132,7 @@ static ssize_t mode_store(struct device *dev,
> >   		config->ctrl &= ~ETMCR_CYC_ACC;
> >   	if (config->mode & ETM_MODE_STALL) {
> > -		if (!(drvdata->etmccr & ETMCCR_FIFOFULL)) {
> > +		if (!caps->fifofull) {
> >   			dev_warn(dev, "stall mode not supported\n");
> >   			ret = -EINVAL;
> >   			goto err_unlock;
> > @@ -141,7 +142,7 @@ static ssize_t mode_store(struct device *dev,
> >   		config->ctrl &= ~ETMCR_STALL_MODE;
> >   	if (config->mode & ETM_MODE_TIMESTAMP) {
> > -		if (!(drvdata->etmccer & ETMCCER_TIMESTAMP)) {
> > +		if (!caps->timestamp) {
> >   			dev_warn(dev, "timestamp not supported\n");
> >   			ret = -EINVAL;
> >   			goto err_unlock;
> > @@ -286,13 +287,14 @@ static ssize_t addr_idx_store(struct device *dev,
> >   	int ret;
> >   	unsigned long val;
> >   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +	const struct etm_caps *caps = &drvdata->caps;
> >   	struct etm_config *config = &drvdata->config;
> >   	ret = kstrtoul(buf, 16, &val);
> >   	if (ret)
> >   		return ret;
> > -	if (val >= drvdata->nr_addr_cmp)
> > +	if (val >= caps->nr_addr_cmp)
> >   		return -EINVAL;
> >   	/*
> > @@ -589,13 +591,14 @@ static ssize_t cntr_idx_store(struct device *dev,
> >   	int ret;
> >   	unsigned long val;
> >   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +	const struct etm_caps *caps = &drvdata->caps;
> >   	struct etm_config *config = &drvdata->config;
> >   	ret = kstrtoul(buf, 16, &val);
> >   	if (ret)
> >   		return ret;
> > -	if (val >= drvdata->nr_cntr)
> > +	if (val >= caps->nr_cntr)
> >   		return -EINVAL;
> >   	/*
> >   	 * Use spinlock to ensure index doesn't change while it gets
> > @@ -999,13 +1002,14 @@ static ssize_t ctxid_idx_store(struct device *dev,
> >   	int ret;
> >   	unsigned long val;
> >   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +	const struct etm_caps *caps = &drvdata->caps;
> >   	struct etm_config *config = &drvdata->config;
> >   	ret = kstrtoul(buf, 16, &val);
> >   	if (ret)
> >   		return ret;
> > -	if (val >= drvdata->nr_ctxid_cmp)
> > +	if (val >= caps->nr_ctxid_cmp)
> >   		return -EINVAL;
> >   	/*
>

--
Sincerely,
Yeoreum Yun

