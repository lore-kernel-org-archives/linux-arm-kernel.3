Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79075CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqEmRj//FT7GlpzPh3z5e+KqZRb5Ig8Av9dWGoCy/MU=; b=xPsctSOFYTWEC5b9RcOTobodwz
	+HGBOP5x75/pz1WBEac4mfds7tdSiGL00bJ6mouf4qT3fRfgl0TG0p0fK6AEpFceXcp1h/jBC5Z0Y
	ymWB2LwKs3MGccIEY+J98WxS+oGnwJLr3nT0Ts9GGiycyLXx1n36AkgWAbsxw8vR0C8QTVv0xae71
	z8HIP+z/FcTtyRdG4oXL3Le1WlA8/FnE0GNK6hhBoJUF4PyvciirGS3PIuQMkXDSPy5O3EC2Bn3jY
	6bpC6H3ILZudGlTG0hq5AaAGESekKK4JEaXkK59SJichzv29kvBOojEIjwMsPnBSfR9dWxpLtC/Zn
	CadnoX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1CG-0000000Am2F-45T1;
	Mon, 01 Jun 2026 11:52:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1CE-0000000Am1n-1DAi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:52:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25B15176C;
	Mon,  1 Jun 2026 04:52:36 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0E643F632;
	Mon,  1 Jun 2026 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780314761; bh=VuGKz419dGEK1hMd/gw21IOIjBsYgnj6iKHmM0ZlWb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avulxCYdZe1mmF8e34Yp9UfY7IbnXgIvyANzLy24F2HSCNJfMPxGxUYdv8KMgPwse
	 T847OVzkXCflrILpTe0GCro5fey1o1UKQUjUOitYcVO5Ks/hmsx5eHbATeCUaPAy5C
	 OkCUmEreqORHGlMSs8DCVeDxRxB4SZfHP7K7ZKlk=
Date: Mon, 1 Jun 2026 12:52:37 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 05/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <ah1yhaZgddq+8fCW@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-6-yeoreum.yun@arm.com>
 <55b306e3-1e33-4a5b-a2ce-043132db7154@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55b306e3-1e33-4a5b-a2ce-043132db7154@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_045242_485942_AA958749 
X-CRM114-Status: GOOD (  41.98  )
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

Hi Suzuki,

> On 19/05/2026 16:48, Yeoreum Yun wrote:
> > The purpose of TRCSSCSRn register is to show status of
> > the corresponding Single-shot Comparator Control and input supports.
> > That means writable field's purpose for reset or restore from idle status
> > not for configuration.
> > 
> > Therefore, exclude ss_status from drvdata->config and move it to drvdata.
> 
> TRCSSCSRn has two different types of fields.
> 
> 1. Capability
> 2. Status
> 
> Moving the entire register from "config" to a common dangling place looks
> like shifting the problem to me.
> 
> Could we do something like :
> 
> 1. Split the fields to two.
>   a. Store only the capability information in etmv4_caps. Bits[4:0]
>   b. Store the Status bit in drvdata->config , as it is really matters
>      to the session ? Bits[31:30]
> 
> Add a helper to write/read the TRCSSSRn which would apply/mask the bits from
> drvdata->etmv4_caps->fields to the Status/Pending

Well. I'm not sure about whether we need to this.
When I remind of discussion with Leo, The Status and Pending bits should
be preserved in the *same* session theoretically However, Unitil today
In case of *perf* it doesn't keep but always cleared at the time of
resuming session and this behavior haven't reported any issue yet.

TBH, I don't have any idea how perf could utilise those bits except
the current use case for  the sysfs to show the bit via *status* file.

Futhermore, IMHO, config isn't good place for the Status/Pending bits
since those fields are not *configrable* fields so I think it would be
better to locate saving information for the status and pending bits on
drvdata or by defining other fields.

But, until we find some usage of those bits in perf, I think we can
delay this separation you suggest and it might be better to keep as-is
for the purpose of showing the status/pending bits when sysfs session is
finished.

Am I missing something?

> 
> Suzuki
> 
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm4x-cfg.c    |  1 -
> >   .../hwtracing/coresight/coresight-etm4x-core.c   | 16 +++++++++-------
> >   .../hwtracing/coresight/coresight-etm4x-sysfs.c  | 10 +++++-----
> >   drivers/hwtracing/coresight/coresight-etm4x.h    |  7 ++++++-
> >   4 files changed, 20 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> > index e1a59b434505..9b4947d75fde 100644
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
> > index 53fbc4826628..7783c97b53e8 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -95,7 +95,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
> >   	const struct etmv4_caps *caps = &drvdata->caps;
> >   	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
> > -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
> > +	       (drvdata->ss_status[n] & TRCSSCSRn_PC);
> >   }
> >   u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
> > @@ -571,11 +571,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
> > @@ -772,6 +772,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >   	/* Clear configuration from previous run */
> >   	memset(config, 0, sizeof(struct etmv4_config));
> > +
> >   	if (attr->exclude_kernel)
> >   		config->mode = ETM_MODE_EXCL_KERN;
> > @@ -1064,7 +1065,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
> >   	/* read the status of the single shot comparators */
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		config->ss_status[i] =
> > +		drvdata->ss_status[i] =
> >   			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> >   	}
> > @@ -1497,8 +1498,9 @@ static void etm4_init_arch_data(void *info)
> >   	 */
> >   	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> >   	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		drvdata->config.ss_status[i] =
> > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> > +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
> >   	}
> >   	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
> >   	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > index 7de3c58a47b4..71e95d152ee6 100644
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
> > index 6d4fbae78448..43db1eb6f8cd 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> > @@ -213,6 +213,7 @@
> >   #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
> >   #define TRCSSCSRn_STATUS			BIT(31)
> > +#define TRCSSCSRn_PENDING			BIT(30)
> >   #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
> >   #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
> > @@ -730,6 +731,9 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
> >   #define ETM_DEFAULT_ADDR_COMP		0
> >   #define TRCSSCSRn_PC			BIT(3)
> > +#define TRCSSCSRn_DV			BIT(2)
> > +#define TRCSSCSRn_DA			BIT(1)
> > +#define TRCSSCSRn_INST			BIT(0)
> >   /* PowerDown Control Register bits */
> >   #define TRCPDCR_PU			BIT(3)
> > @@ -978,7 +982,6 @@ struct etmv4_config {
> >   	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
> >   	u8				ss_idx;
> >   	u32				ss_ctrl[ETM_MAX_SS_CMP];
> > -	u32				ss_status[ETM_MAX_SS_CMP];
> >   	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
> >   	u8				addr_idx;
> >   	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
> > @@ -1073,6 +1076,7 @@ struct etmv4_save_state {
> >    * @config:	structure holding configuration parameters.
> >    * @save_state:	State to be preserved across power loss
> >    * @paused:	Indicates if the trace unit is paused.
> > + * @ss_status:	The status of the corresponding single-shot comparator.
> >    * @arch_features: Bitmap of arch features of etmv4 devices.
> >    */
> >   struct etmv4_drvdata {
> > @@ -1092,6 +1096,7 @@ struct etmv4_drvdata {
> >   	u64				trfcr;
> >   	struct etmv4_config		config;
> >   	struct etmv4_save_state		*save_state;
> > +	u32				ss_status[ETM_MAX_SS_CMP];
> >   	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
> >   };
> 

-- 
Sincerely,
Yeoreum Yun

