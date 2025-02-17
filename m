Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10364C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmvi/zB0/Yp84GtDtdmHnqglCCA/iWdE6IpQ4rdpvW4=; b=ICAEH0B07O0hJoPiyeNFesoOKZ
	YvB+yagwH2NHum0deC38yWgHRMsyBAB8tGxta9X1GHYE2GS8AUaj2GhM3Y7h0h6xrhH7gVnKH8/LW
	lAjJzRl9ecnZbOWqxxmeX02v1IZEMA6V4jO+m64LIzV1E9ntEi1KNew1w95EZMCbm53mryV5QYKWz
	qwkv1njHQB9HkLCPh9KuKX9m2FblrBWOx050DaZKc5Zb3PGKY6xXQkNyYepqXxaaAsIoO1eqQqb1S
	QMqk1mJ3Gd0HgtRC/2gOOrhX84f5c+5gMPU52KVob12QnEVNdKJ/kSlKGL04BfvPDa6CLSDls/Jtf
	bSwKoi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2na-00000004zzY-29JQ;
	Mon, 17 Feb 2025 15:12:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ci-00000004yQF-0lb5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCFB5152B;
	Mon, 17 Feb 2025 07:01:44 -0800 (PST)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.80.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D9CD3F6A8;
	Mon, 17 Feb 2025 07:01:25 -0800 (PST)
Date: Mon, 17 Feb 2025 15:01:23 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, catalin.marinas@arm.com,
	vincent.guittot@linaro.org, beata.michalska@arm.com
Cc: rafael@kernel.org, viresh.kumar@linaro.org, dietmar.eggemann@arm.com,
	pierre.gondois@arm.com
Subject: Re: [PATCH] arch_topology: init capacity_freq_ref to 0
Message-ID: <Z7NPEic3jxLAQBTd@arm.com>
References: <20240827154818.1195849-1-ionela.voinescu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827154818.1195849-1-ionela.voinescu@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_070128_304813_2C800B5E 
X-CRM114-Status: GOOD (  25.39  )
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

Hi folks,

I just wanted to mention that this patch still applies cleanly on
next-20250217 as well, and it still builds/boots/works as expected.

I've rechecked it given that the patches at [1] seem ready to be picked
up, and those patches depend on this one.

Thanks,
Ionela.

[1] https://lore.kernel.org/lkml/20250131162439.3843071-1-beata.michalska@arm.com/

On Tuesday 27 Aug 2024 at 16:48:18 (+0100), Ionela Voinescu wrote:
> It's useful to have capacity_freq_ref initialized to 0 for users of
> arch_scale_freq_ref() to detect when capacity_freq_ref was not
> yet set.
> 
> The only scenario affected by this change in the init value is when a
> cpufreq driver is never loaded. As a result, the only setter of a
> cpu scale factor remains the call of topology_normalize_cpu_scale()
> from parse_dt_topology(). There we cannot use the value 0 of
> capacity_freq_ref so we have to compensate for its uninitialized state.
> 
> Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
> 
> Hi,
> 
> This patch was previously part of the patch-set at [1], but we thought
> it's best to separate the standalone patches in that set to make
> further review easier on the remaining topics.
> 
> Based on v6.11-rc5 and tested on Juno with and without a cpufreq driver.
> 
> [1] https://lore.kernel.org/lkml/20240603082154.3830591-2-beata.michalska@arm.com/
> 
> Thanks,
> Ionela.
> 
>  drivers/base/arch_topology.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 75fcb75d5515..c49ef1a712f4 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -28,7 +28,7 @@
>  static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
>  static struct cpumask scale_freq_counters_mask;
>  static bool scale_freq_invariant;
> -DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
> +DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 0;
>  EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
>  
>  static bool supports_scale_freq_counters(const struct cpumask *cpus)
> @@ -293,13 +293,15 @@ void topology_normalize_cpu_scale(void)
>  
>  	capacity_scale = 1;
>  	for_each_possible_cpu(cpu) {
> -		capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu);
> +		capacity = raw_capacity[cpu] *
> +			   (per_cpu(capacity_freq_ref, cpu) ?: 1);
>  		capacity_scale = max(capacity, capacity_scale);
>  	}
>  
>  	pr_debug("cpu_capacity: capacity_scale=%llu\n", capacity_scale);
>  	for_each_possible_cpu(cpu) {
> -		capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu);
> +		capacity = raw_capacity[cpu] *
> +			   (per_cpu(capacity_freq_ref, cpu) ?: 1);
>  		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
>  			capacity_scale);
>  		topology_set_cpu_scale(cpu, capacity);
> -- 
> 2.25.1
> 
> 

