Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA80D5E374
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfx3NHidGW5UuJWoYB1IprnwhJjORPuWqiTdZQff9WE=; b=UNsIurTPbVdpvjpa6DMRK41u+G
	GlL/q5QqV6O2wKWU++fKc5v+3rZsXTtQsm9N6OG+vZTG/796Eq4Nxmql/B4QJIybQ2nkEyOAuZHwo
	RDP/aCpMK7a6s6rrlQMsXOF4K0qaQSLcno/hao6Epu3FzI7n+Y9Hf9vco7DjWRPQMmaQnWCFy6fz0
	Zpit9KIfn/i8nd4C9NyuFrmO3t0TLKMqwAelSDkz7M0lHjZBGrZowDFSK+Eh3DeQ2ypUAIrW3VYUC
	TsgId2KQCTucm7JlBrmgSTYWgUL+JxiqwcHlO0myegx7Cp8PJK88lfMHs38ulw8oHNQe1gJzAeF+e
	IYRPXLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVyy-00000005KrC-0dUA;
	Tue, 16 Dec 2025 14:24:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVyv-00000005Kq3-2C1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:24:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15AAEFEC;
	Tue, 16 Dec 2025 06:24:44 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E48A13F694;
	Tue, 16 Dec 2025 06:24:47 -0800 (PST)
Message-ID: <16b5063a-1201-4453-8038-4ef937d20abd@arm.com>
Date: Tue, 16 Dec 2025 14:24:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/38] arm_mpam: resctrl: Add CDP emulation
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
 <20251205215901.17772-14-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-14-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_062453_683422_03B57907 
X-CRM114-Status: GOOD (  29.18  )
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
> Intel RDT's CDP feature allows the cache to use a different control value
> depending on whether the accesses was for instruction fetch or a data
> access. MPAM's equivalent feature is the other way up: the CPU assigns a
> different partid label to traffic depending on whether it was instruction
> fetch or a data access, which causes the cache to use a different control
> value based solely on the partid.
> 
> MPAM can emulate CDP, with the side effect that the alternative partid is
> seen by all MSC, it can't be enabled per-MSC.
> 
> Add the resctrl hooks to turn this on or off. Add the helpers that
> match a closid against a task, which need to be aware that the value
> written to hardware is not the same as the one resctrl is using.
> 
> Update the 'arm64_mpam_global_default' variable the arch code uses
> during context switch to know when the per-cpu value should be used
> instead.
> 
> Awkwardly, the MB controls don't implement CDP. To emulate this, the
> MPAM equivalent needs programming twice by the resctrl glue, as
> resctrl expects the bandwidth controls to be applied independently for
> both data and isntruction-fetch.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> CC: Ben Horgan <ben.horgan@arm.com>
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/include/asm/mpam.h  |   1 +
>  drivers/resctrl/mpam_resctrl.c | 115 ++++++++++++++++++++++++++++++++-
>  include/linux/arm_mpam.h       |   3 +
>  3 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index 2960ffaf6574..689285c4c61f 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -4,6 +4,7 @@
>  #ifndef __ASM__MPAM_H
>  #define __ASM__MPAM_H
>  
> +#include <linux/arm_mpam.h>
>  #include <linux/bitops.h>
>  #include <linux/bitfield.h>
>  #include <linux/init.h>
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index c2650abb99ec..d5f75ed67e46 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -33,6 +33,10 @@ static DEFINE_MUTEX(domain_list_lock);
>  static bool exposed_alloc_capable;
>  static bool exposed_mon_capable;
>  
> +/*
> + * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM0_EL1.
> + * This applies globally to all traffic the CPU generates.
> + */
>  static bool cdp_enabled;
>  
>  bool resctrl_arch_alloc_capable(void)
> @@ -45,6 +49,67 @@ bool resctrl_arch_mon_capable(void)
>  	return exposed_mon_capable;
>  }
>  
> +bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
> +{
> +	switch (rid) {
> +	case RDT_RESOURCE_L2:
> +	case RDT_RESOURCE_L3:
> +		return cdp_enabled;
> +	case RDT_RESOURCE_MBA:
> +	default:
> +		/*
> +		 * x86's MBA control doesn't support CDP, so user-space doesn't
> +		 * expect it.
> +		 */
> +		return false;
> +	}
> +}
> +
> +/**
> + * resctrl_reset_task_closids() - Reset the PARTID/PMG values for all tasks.
> + *
> + * At boot, all existing tasks use partid zero for D and I.
> + * To enable/disable CDP emulation, all these tasks need relabelling.
> + */
> +static void resctrl_reset_task_closids(void)
> +{
> +	struct task_struct *p, *t;
> +
> +	read_lock(&tasklist_lock);
> +	for_each_process_thread(p, t) {
> +		resctrl_arch_set_closid_rmid(t, RESCTRL_RESERVED_CLOSID,
> +					     RESCTRL_RESERVED_RMID);
> +	}
> +	read_unlock(&tasklist_lock);
> +}
> +
> +int resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool enable)
> +{
> +	u32 partid_i, partid_d;
> +
> +	cdp_enabled = enable;
> +	partid_i = partid_d = RESCTRL_RESERVED_CLOSID;
> +
> +	if (enable) {
> +		u32 partid = RESCTRL_RESERVED_CLOSID;
> +
> +		partid_d = resctrl_get_config_index(partid, CDP_CODE);
> +		partid_i = resctrl_get_config_index(partid, CDP_DATA);

These are back to front, partid_d is data and partid_i is code. Also, if
there is only one partid then we don't have 2 different partids and we
should fail to enable cdp.

> +	}
> +
> +	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
> +	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
> +
> +	resctrl_reset_task_closids();
> +
> +	return 0;
> +}

Thanks,

Ben


