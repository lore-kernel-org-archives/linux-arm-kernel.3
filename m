Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF23D609D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSLRSdVry/4i7Is83McdOYMK2RSM2NsBlIXZ+qo6OuI=; b=JTvTo60fYHd7R6bnJ04DvreJiO
	zT1sXe+ZJTddGzhP2inzIpzybG8w5vqqkJ1d9YF6LjmFwFekG/8JvCBs2oBst/z6AFhmsVABIH4Gm
	u2LTyPavLBpbDy1MYUsA3CA4F2HOEs4De7Z07nauorCppEZZlZHIetQg22HCKMHYDP0VG/Zgp+tqP
	GPpHNn9COpqQf7UgMmLAI9bD6ga1jVDLR+1MV8dBLRr314b4wgcuMth0p4GIJs/5g/LSZ7iiZ+Lg0
	NUP8Zi/bX67N01FscK/fM8yKjonv+Jc88W9hy4cqUF5GcJ0FUjuDg/onIZlZ4BtE2mmve2Li/UepF
	OgB9ORnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYNo-00000005Zih-1pPn;
	Tue, 16 Dec 2025 16:58:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYNj-00000005Zi4-23Mp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:58:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57C6BFEC;
	Tue, 16 Dec 2025 08:58:30 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352A43F73B;
	Tue, 16 Dec 2025 08:58:34 -0800 (PST)
Message-ID: <ffc80ae1-cbed-438e-af19-25006fbf4545@arm.com>
Date: Tue, 16 Dec 2025 16:58:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/38] arm_mpam: resctrl: Allow resctrl to allocate
 monitors
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-25-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-25-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_085839_571216_34474799 
X-CRM114-Status: GOOD (  21.07  )
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

On 12/5/25 21:58, James Morse wrote:
> When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs
> to allocate a monitor on the corresponding resource. Monitors are
> allocated by class instead of component.
> 
> MBM monitors are much more complicated, if there are enough monitors,
> they will be pre-allocated and free-running. If ABMC is in use instead
> then 'some' are pre-allocated in a different way, and need assigning.
> 
> Add helpers to allocate a CSU monitor. These helper return an out
> of range value for MBM counters.
> 
> Allocating a montitor context is expected to block until hardware
> resources become available. This only makes sense for QOS_L3_OCCUP
> as unallocated MBM counters are losing data.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Since ABMC got merged it may be possible to remove the monitor alloc
> call for MBM counters from resctrl as this work is now done by ABMC's
> assign call.
> ---
>  drivers/resctrl/mpam_internal.h | 14 ++++++-
>  drivers/resctrl/mpam_resctrl.c  | 68 +++++++++++++++++++++++++++++++++
>  include/linux/arm_mpam.h        |  4 ++
>  3 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 05101186af17..3a68ebd498fa 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -32,6 +32,14 @@ DECLARE_STATIC_KEY_FALSE(mpam_enabled);
>  #define PACKED_FOR_KUNIT
>  #endif
>  
> +/*
> + * This 'mon' values must not alias an actual monitor, so must be larger than
> + * U16_MAX, but not be confused with an errno value, so smaller than
> + * (u32)-SZ_4K.
> + * USE_PRE_ALLOCATED is used to avoid confusion with an actual monitor.
> + */
> +#define USE_PRE_ALLOCATED      (U16_MAX + 1)
> +
>  static inline bool mpam_is_enabled(void)
>  {
>  	return static_branch_likely(&mpam_enabled);
> @@ -215,7 +223,11 @@ enum mon_filter_options {
>  };
>  
>  struct mon_cfg {
> -	u16			mon;
> +	/*
> +	 * mon must be large enough to hold out of range values like
> +	 * USE_RMID_IDX
> +	 */

USE_RMID_IDX -> USE_PRE_ALLOCATED

Thanks,

Ben


