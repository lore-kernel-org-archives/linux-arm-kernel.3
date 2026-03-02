Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD88E9B37E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czXpryiOuNx4RyFMVD0F0mKTE/Ow16r1oulxR6Eo8UY=; b=QTsB435H21WHE5niD3IySdi5fo
	hB5O821nE+VeEQTwSHdfeO+OvXfm7Y3Yqg6yNx7RjFQ+V7tn6CpED8QJ5AHXDqG91hzaqIOligXYX
	jXSyVJ5Wbe1uuBGzghPliN/M3dmdEKLakad6f53SPd2cxBsq/SATsh/4wMAZ7MmtXwkG9oS035+gK
	1YmCUjTDc0rreiASbf1aNVr4VniaU/e6o3b1rthzgbkR3tC7xWPkBPGcxfnqBHb29iimXy/9r8C/I
	ZhfG81JK4JBydvcfk13SeFwEmJWKFjUGXNw8CU6A8leEimMWRKZ9NKI0Ey3QKY0m7+LLB51UAMa/C
	OW5XZw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6ZV-0000000DXNU-1sCY;
	Mon, 02 Mar 2026 16:56:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6ZS-0000000DXN3-3mjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0446A14BF;
	Mon,  2 Mar 2026 08:56:30 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5661B3F694;
	Mon,  2 Mar 2026 08:56:34 -0800 (PST)
Message-ID: <31d68fe1-3b6b-4d1f-b998-f6b8875f435e@arm.com>
Date: Mon, 2 Mar 2026 16:56:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Set feature bits on default partition config
To: Fenghua Yu <fenghuay@nvidia.com>, James Morse <james.morse@arm.com>,
 Dave Martin <Dave.Martin@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>,
 Peter Newman <peternewman@google.com>, Gavin Shan <gshan@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Carl Worth <carl@os.amperecomputing.com>, Zeng Heng <zengheng4@huawei.com>,
 Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260301171829.1357886-1-fenghuay@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260301171829.1357886-1-fenghuay@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_085639_083990_6355EE17 
X-CRM114-Status: GOOD (  29.39  )
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

Hi Fenghua,

On 3/1/26 17:18, Fenghua Yu wrote:
> Currently we only set the default values (cpbm, mbw_pbm, mbw_max)
> and do not set the corresponding feature bits. As a result,
> the MBW_MIN/MBW_MAX and CPBM/MBW_PBM blocks in
> mpam_reprogram_ris_partid() does not apply the default config

The current behaviour is the intended behaviour. The values here
are there so that the expected values appear in the resctrl interface.
When an actual reset is done we want to use the hardware default
values and not limit ourselves to what is currently supported by
resctrl. On well-behaved hardware for controls supporting resctrl
these will be equivalent. cpor isn't supported if there are more than 32
bits.


> because they require both rprops and cfg to have the feature.
> The missing feature bits may cause other issues in the future.
> 
> When initializing default per-partition config in
> mpam_reset_component_cfg(), set the feature bits on cfg for
> each resource we program (cpor_part, mbw_part, mbw_max)
> so that "configured" matches the default values.
> 
> Set mpam_feat_cpor_part on cfg whenever we set default cpbm
> (cpbm_wd implies cpor_part).
> 
> Set mpam_feat_mbw_part and mpam_feat_mbw_max on cfg only when the
> class has the feature (mbw_pbm_bits/bwa_wd can be set without
> HAS_PBM/HAS_MAX).
> 
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Without the fix, mpam_wa_t241_calc_min_from_max() in the patch:
> https://lore.kernel.org/lkml/20260224175720.2663924-39-ben.horgan@arm.com/
> sees mpam_has_feature(mpam_feat_mbw_max, cfg) as false and always returned 0
> on hardware that supports mbw_max. This causes performance degration
> because of too small mbw_min on T241 platform.

Isn't it only because of the erratum that this makes a difference. When
mbw_max is at it's maximum then when mbw_min=0 or mbw_max at a maximum.
Either the current bandwidth is always higher than mbw_min or it's
always lower than mbw_min. In both cases everything is classified with
the same priority.

This has caused me to look again into the reset code and I've noticed a
different issue. It's not recorded in the component configuration that
it needs to reset. Hence, on unmount if not all cpus are online
mpam_reset_component_locked() might not reset all msc and rely on cpuhp
to finish the reset but it doesn't have the information to do that. For
this reason, I think we should go back to James' original model of
resetting any feature that isn't set in the feature bitmap. (I shouldn't
have suggested we change that!)

> 
>  drivers/resctrl/mpam_devices.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 9182c8fcf003..be4b554104e3 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2618,12 +2618,20 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
>  
>  	for (i = 0; i <= mpam_partid_max; i++) {
>  		comp->cfg[i] = (struct mpam_config) {};
> -		if (cprops->cpbm_wd)
> +		if (cprops->cpbm_wd) {
>  			comp->cfg[i].cpbm = GENMASK(cprops->cpbm_wd - 1, 0);
> -		if (cprops->mbw_pbm_bits)
> +			mpam_set_feature(mpam_feat_cpor_part, &comp->cfg[i]);
> +		}
> +		if (cprops->mbw_pbm_bits) {
>  			comp->cfg[i].mbw_pbm = GENMASK(cprops->mbw_pbm_bits - 1, 0);
> -		if (cprops->bwa_wd)
> +			if (mpam_has_feature(mpam_feat_mbw_part, cprops))
> +				mpam_set_feature(mpam_feat_mbw_part, &comp->cfg[i]);
> +		}
> +		if (cprops->bwa_wd) {
>  			comp->cfg[i].mbw_max = GENMASK(15, 16 - cprops->bwa_wd);
> +			if (mpam_has_feature(mpam_feat_mbw_max, cprops))
> +				mpam_set_feature(mpam_feat_mbw_max, &comp->cfg[i]);
> +		}
>  	}
>  }
>  

Thanks,

Ben


