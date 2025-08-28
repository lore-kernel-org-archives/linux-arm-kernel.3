Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E259CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgE8sfPYNlXWm4d1AHIySSqUwUTXXGN1Nn+rMMR0uHY=; b=Nt6RAKVluRY4wXwqi/pDXPtyVs
	1/ymnFH86HGH0eJ0UDRuXWOFimDnrpFEJLE2lN8xk7oxU852pjbAuI2rfp8r9FzSiJpwDeVamEkRx
	N6SeGpe7HrmVgl4lPkxQ5sbRitv5k9TYRooxel3B2rKLKxOcasY+jDzsd6nTV5DzlVH5wt1KzUfyT
	1tj6jj4DRgBBvYCgOQCRU4wujgJQf071UiXUu8dRUx6cUVfWVElJfVdXzAZ9ThyUUuc0kPmzjJ/eg
	aQPvpuaM9aBTH/gqYcTaWlrmUATnRW8P9KKAHBBjjCtkBAjapoeerS613VlipAwVjnUOztBcOYBwR
	Pfrh9RdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urab5-00000001Jkh-1anJ;
	Thu, 28 Aug 2025 11:15:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZbR-000000016D5-0aT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:11:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43EA1688;
	Thu, 28 Aug 2025 03:11:23 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11AD93F738;
	Thu, 28 Aug 2025 03:11:25 -0700 (PDT)
Message-ID: <13767875-3744-47f3-98ec-a808c0c22f21@arm.com>
Date: Thu, 28 Aug 2025 11:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/33] arm_mpam: Probe and reset the rest of the features
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Zeng Heng <zengheng4@huawei.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-26-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-26-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_031133_359704_467004E8 
X-CRM114-Status: GOOD (  34.50  )
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

Hi James,

On 8/22/25 16:30, James Morse wrote:
> MPAM supports more features than are going to be exposed to resctrl.
> For partid other than 0, the reset values of these controls isn't
> known.
> 
> Discover the rest of the features so they can be reset to avoid any
> side effects when resctrl is in use.
> 
> PARTID narrowing allows MSC/RIS to support less configuration space than
> is usable. If this feature is found on a class of device we are likely
> to use, then reduce the partid_max to make it usable. This allows us
> to map a PARTID to itself.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> CC: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 175 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h |  16 ++-
>  2 files changed, 189 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 8f6df2406c22..aedd743d6827 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -213,6 +213,15 @@ static void __mpam_part_sel(u8 ris_idx, u16 partid, struct mpam_msc *msc)
>  	__mpam_part_sel_raw(partsel, msc);
>  }
>  
> +static void __mpam_intpart_sel(u8 ris_idx, u16 intpartid, struct mpam_msc *msc)
> +{
> +	u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
> +		      FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, intpartid) |
> +		      MPAMCFG_PART_SEL_INTERNAL;
> +
> +	__mpam_part_sel_raw(partsel, msc);
> +}
> +
>  int mpam_register_requestor(u16 partid_max, u8 pmg_max)
>  {
>  	int err = 0;
> @@ -743,10 +752,35 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  	int err;
>  	struct mpam_msc *msc = ris->vmsc->msc;
>  	struct mpam_props *props = &ris->props;
> +	struct mpam_class *class = ris->vmsc->comp->class;
>  
>  	lockdep_assert_held(&msc->probe_lock);
>  	lockdep_assert_held(&msc->part_sel_lock);
>  
> +	/* Cache Capacity Partitioning */
> +	if (FIELD_GET(MPAMF_IDR_HAS_CCAP_PART, ris->idr)) {
> +		u32 ccap_features = mpam_read_partsel_reg(msc, CCAP_IDR);
> +
> +		props->cmax_wd = FIELD_GET(MPAMF_CCAP_IDR_CMAX_WD, ccap_features);
> +		if (props->cmax_wd &&
> +		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CMAX_SOFTLIM, ccap_features))
> +			mpam_set_feature(mpam_feat_cmax_softlim, props);
> +
> +		if (props->cmax_wd &&
> +		    !FIELD_GET(MPAMF_CCAP_IDR_NO_CMAX, ccap_features))
> +			mpam_set_feature(mpam_feat_cmax_cmax, props);
> +
> +		if (props->cmax_wd &&
> +		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CMIN, ccap_features))
> +			mpam_set_feature(mpam_feat_cmax_cmin, props);
> +
> +		props->cassoc_wd = FIELD_GET(MPAMF_CCAP_IDR_CASSOC_WD, ccap_features);
> +
> +		if (props->cassoc_wd &&
> +		    FIELD_GET(MPAMF_CCAP_IDR_HAS_CASSOC, ccap_features))
> +			mpam_set_feature(mpam_feat_cmax_cassoc, props);
> +	}
> +
>  	/* Cache Portion partitioning */
>  	if (FIELD_GET(MPAMF_IDR_HAS_CPOR_PART, ris->idr)) {
>  		u32 cpor_features = mpam_read_partsel_reg(msc, CPOR_IDR);
> @@ -769,6 +803,31 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  		props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
>  		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
>  			mpam_set_feature(mpam_feat_mbw_max, props);
> +
> +		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
> +			mpam_set_feature(mpam_feat_mbw_min, props);
> +
> +		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_PROP, mbw_features))
> +			mpam_set_feature(mpam_feat_mbw_prop, props);
> +	}
> +
> +	/* Priority partitioning */
> +	if (FIELD_GET(MPAMF_IDR_HAS_PRI_PART, ris->idr)) {
> +		u32 pri_features = mpam_read_partsel_reg(msc, PRI_IDR);
> +
> +		props->intpri_wd = FIELD_GET(MPAMF_PRI_IDR_INTPRI_WD, pri_features);
> +		if (props->intpri_wd && FIELD_GET(MPAMF_PRI_IDR_HAS_INTPRI, pri_features)) {
> +			mpam_set_feature(mpam_feat_intpri_part, props);
> +			if (FIELD_GET(MPAMF_PRI_IDR_INTPRI_0_IS_LOW, pri_features))
> +				mpam_set_feature(mpam_feat_intpri_part_0_low, props);
> +		}
> +
> +		props->dspri_wd = FIELD_GET(MPAMF_PRI_IDR_DSPRI_WD, pri_features);
> +		if (props->dspri_wd && FIELD_GET(MPAMF_PRI_IDR_HAS_DSPRI, pri_features)) {
> +			mpam_set_feature(mpam_feat_dspri_part, props);
> +			if (FIELD_GET(MPAMF_PRI_IDR_DSPRI_0_IS_LOW, pri_features))
> +				mpam_set_feature(mpam_feat_dspri_part_0_low, props);
> +		}
>  	}
>  
>  	/* Performance Monitoring */
> @@ -832,6 +891,21 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  			 */
>  		}
>  	}
> +
> +	/*
> +	 * RIS with PARTID narrowing don't have enough storage for one
> +	 * configuration per PARTID. If these are in a class we could use,
> +	 * reduce the supported partid_max to match the number of intpartid.
> +	 * If the class is unknown, just ignore it.
> +	 */
> +	if (FIELD_GET(MPAMF_IDR_HAS_PARTID_NRW, ris->idr) &&
> +	    class->type != MPAM_CLASS_UNKNOWN) {
> +		u32 nrwidr = mpam_read_partsel_reg(msc, PARTID_NRW_IDR);
> +		u16 partid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
> +
> +		mpam_set_feature(mpam_feat_partid_nrw, props);
> +		msc->partid_max = min(msc->partid_max, partid_max);
> +	}
>  }
>  
>  static int mpam_msc_hw_probe(struct mpam_msc *msc)
> @@ -929,13 +1003,29 @@ static void mpam_reset_msc_bitmap(struct mpam_msc *msc, u16 reg, u16 wd)
>  static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  				      struct mpam_config *cfg)
>  {
> +	u32 pri_val = 0;
> +	u16 cmax = MPAMCFG_CMAX_CMAX;
>  	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
>  	struct mpam_msc *msc = ris->vmsc->msc;
>  	struct mpam_props *rprops = &ris->props;
> +	u16 dspri = GENMASK(rprops->dspri_wd, 0);
> +	u16 intpri = GENMASK(rprops->intpri_wd, 0);
>  
>  	mutex_lock(&msc->part_sel_lock);
>  	__mpam_part_sel(ris->ris_idx, partid, msc);
>  
> +	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
> +		/* Update the intpartid mapping */
> +		mpam_write_partsel_reg(msc, INTPARTID,
> +				       MPAMCFG_INTPARTID_INTERNAL | partid);
> +
> +		/*
> +		 * Then switch to the 'internal' partid to update the
> +		 * configuration.
> +		 */
> +		__mpam_intpart_sel(ris->ris_idx, partid, msc);
> +	}
> +
>  	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
>  		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
>  			mpam_write_partsel_reg(msc, CPBM, cfg->cpbm);
> @@ -964,6 +1054,29 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>  
>  	if (mpam_has_feature(mpam_feat_mbw_prop, rprops))
>  		mpam_write_partsel_reg(msc, MBW_PROP, bwa_fract);
> +
> +	if (mpam_has_feature(mpam_feat_cmax_cmax, rprops))
> +		mpam_write_partsel_reg(msc, CMAX, cmax);
> +
> +	if (mpam_has_feature(mpam_feat_cmax_cmin, rprops))
> +		mpam_write_partsel_reg(msc, CMIN, 0);

Missing reset for cmax_cassoc. I wonder if it makes sense to have
separate enums for partitioning features, which require reset, and the rest.
> +
> +	if (mpam_has_feature(mpam_feat_intpri_part, rprops) ||
> +	    mpam_has_feature(mpam_feat_dspri_part, rprops)) {
> +		/* aces high? */
> +		if (!mpam_has_feature(mpam_feat_intpri_part_0_low, rprops))
> +			intpri = 0;
> +		if (!mpam_has_feature(mpam_feat_dspri_part_0_low, rprops))
> +			dspri = 0;
> +
> +		if (mpam_has_feature(mpam_feat_intpri_part, rprops))
> +			pri_val |= FIELD_PREP(MPAMCFG_PRI_INTPRI, intpri);
> +		if (mpam_has_feature(mpam_feat_dspri_part, rprops))
> +			pri_val |= FIELD_PREP(MPAMCFG_PRI_DSPRI, dspri);
> +
> +		mpam_write_partsel_reg(msc, PRI, pri_val);
> +	}
> +
>  	mutex_unlock(&msc->part_sel_lock);
>  }
>  
> @@ -1529,6 +1642,16 @@ static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
>  	return false;
>  }
>  
> +/* Any of these features mean the CMAX_WD field is valid. */
> +static bool mpam_has_cmax_wd_feature(struct mpam_props *props)
> +{
> +	if (mpam_has_feature(mpam_feat_cmax_cmax, props))
> +		return true;
> +	if (mpam_has_feature(mpam_feat_cmax_cmin, props))
> +		return true;
> +	return false;
> +}
> +
>  #define MISMATCHED_HELPER(parent, child, helper, field, alias)		\
>  	helper(parent) &&						\
>  	((helper(child) && (parent)->field != (child)->field) ||	\
> @@ -1583,6 +1706,23 @@ static void __props_mismatch(struct mpam_props *parent,
>  		parent->bwa_wd = min(parent->bwa_wd, child->bwa_wd);
>  	}
>  
> +	if (alias && !mpam_has_cmax_wd_feature(parent) && mpam_has_cmax_wd_feature(child)) {
> +		parent->cmax_wd = child->cmax_wd;
> +	} else if (MISMATCHED_HELPER(parent, child, mpam_has_cmax_wd_feature,
> +				     cmax_wd, alias)) {
> +		pr_debug("%s took the min cmax_wd\n", __func__);
> +		parent->cmax_wd = min(parent->cmax_wd, child->cmax_wd);
> +	}
> +
> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_cmax_cassoc, alias)) {
> +		parent->cassoc_wd = child->cassoc_wd;
> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_cmax_cassoc,
> +				   cassoc_wd, alias)) {
> +		pr_debug("%s cleared cassoc_wd\n", __func__);
> +		mpam_clear_feature(mpam_feat_cmax_cassoc, &parent->features);
> +		parent->cassoc_wd = 0;
> +	}
> +
>  	/* For num properties, take the minimum */
>  	if (CAN_MERGE_FEAT(parent, child, mpam_feat_msmon_csu, alias)) {
>  		parent->num_csu_mon = child->num_csu_mon;
> @@ -1600,6 +1740,41 @@ static void __props_mismatch(struct mpam_props *parent,
>  		parent->num_mbwu_mon = min(parent->num_mbwu_mon, child->num_mbwu_mon);
>  	}
>  
> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_intpri_part, alias)) {
> +		parent->intpri_wd = child->intpri_wd;
> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_intpri_part,
> +				   intpri_wd, alias)) {
> +		pr_debug("%s took the min intpri_wd\n", __func__);
> +		parent->intpri_wd = min(parent->intpri_wd, child->intpri_wd);
> +	}
> +
> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_dspri_part, alias)) {
> +		parent->dspri_wd = child->dspri_wd;
> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_dspri_part,
> +				   dspri_wd, alias)) {
> +		pr_debug("%s took the min dspri_wd\n", __func__);
> +		parent->dspri_wd = min(parent->dspri_wd, child->dspri_wd);
> +	}
> +
> +	/* TODO: alias support for these two */
> +	/* {int,ds}pri may not have differing 0-low behaviour */
> +	if (mpam_has_feature(mpam_feat_intpri_part, parent) &&
> +	    (!mpam_has_feature(mpam_feat_intpri_part, child) ||
> +	     mpam_has_feature(mpam_feat_intpri_part_0_low, parent) !=
> +	     mpam_has_feature(mpam_feat_intpri_part_0_low, child))) {
> +		pr_debug("%s cleared intpri_part\n", __func__);
> +		mpam_clear_feature(mpam_feat_intpri_part, &parent->features);
> +		mpam_clear_feature(mpam_feat_intpri_part_0_low, &parent->features);
> +	}
> +	if (mpam_has_feature(mpam_feat_dspri_part, parent) &&
> +	    (!mpam_has_feature(mpam_feat_dspri_part, child) ||
> +	     mpam_has_feature(mpam_feat_dspri_part_0_low, parent) !=
> +	     mpam_has_feature(mpam_feat_dspri_part_0_low, child))) {
> +		pr_debug("%s cleared dspri_part\n", __func__);
> +		mpam_clear_feature(mpam_feat_dspri_part, &parent->features);
> +		mpam_clear_feature(mpam_feat_dspri_part_0_low, &parent->features);
> +	}
> +
>  	if (alias) {
>  		/* Merge features for aliased resources */
>  		parent->features |= child->features;
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 70cba9f22746..23445aedbabd 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -157,16 +157,23 @@ static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
>   * When we compact the supported features, we don't care what they are.
>   * Storing them as a bitmap makes life easy.
>   */
> -typedef u16 mpam_features_t;
> +typedef u32 mpam_features_t;
>  
>  /* Bits for mpam_features_t */
>  enum mpam_device_features {
> -	mpam_feat_ccap_part = 0,
> +	mpam_feat_cmax_softlim,
> +	mpam_feat_cmax_cmax,
> +	mpam_feat_cmax_cmin,
> +	mpam_feat_cmax_cassoc,
>  	mpam_feat_cpor_part,
>  	mpam_feat_mbw_part,
>  	mpam_feat_mbw_min,
>  	mpam_feat_mbw_max,
>  	mpam_feat_mbw_prop,
> +	mpam_feat_intpri_part,
> +	mpam_feat_intpri_part_0_low,
> +	mpam_feat_dspri_part,
> +	mpam_feat_dspri_part_0_low,
>  	mpam_feat_msmon,
>  	mpam_feat_msmon_csu,
>  	mpam_feat_msmon_csu_capture,
> @@ -176,6 +183,7 @@ enum mpam_device_features {
>  	mpam_feat_msmon_mbwu_rwbw,
>  	mpam_feat_msmon_mbwu_hw_nrdy,
>  	mpam_feat_msmon_capt,
> +	mpam_feat_partid_nrw,
>  	MPAM_FEATURE_LAST,
>  };
>  static_assert(BITS_PER_TYPE(mpam_features_t) >= MPAM_FEATURE_LAST);
> @@ -187,6 +195,10 @@ struct mpam_props {
>  	u16			cpbm_wd;
>  	u16			mbw_pbm_bits;
>  	u16			bwa_wd;
> +	u16			cmax_wd;
> +	u16			cassoc_wd;
> +	u16			intpri_wd;
> +	u16			dspri_wd;
>  	u16			num_csu_mon;
>  	u16			num_mbwu_mon;
>  };

Thanks,

Ben


