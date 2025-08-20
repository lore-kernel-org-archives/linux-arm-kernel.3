Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A2DCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrU8wrfD+gO5oCg+lt23ta4+0ZTErPtN2rRkkHgTRNg=; b=BxcgtxmGvGuyLJHS3Re1PFuu0V
	7glPAtzS7yjdiLOoGjCS83iDdEdq8NmPtfPUbivGDdvTFyMZacHRgfE1RK7M9YiLoQzyHGg29KyA5
	ZOZpviZAFN4q0hVGQyRyAX8OtXLKG60yeAAZFVU/fmuLtcVzu+osnSmuXvJUeD8fwTw84b+XruO8d
	1E/tx13HJ2y2z4ekEqjWKqD/kgpNpIgRoOPreOeUCqB678t5jNwRLBmy7V14pHeU6khJf87qAiM6c
	StUyy4o9onjaL0V4AQAO7MVJcfII3Awsuc9nDnUV+VKVRpbOdkkO+Wp7KFeaRpWWp/oPMyemPaUxe
	U9Eo6Qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogF0-0000000DCpT-2IUx;
	Wed, 20 Aug 2025 10:40:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof12-0000000CuBo-0ATp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 09:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FrU8wrfD+gO5oCg+lt23ta4+0ZTErPtN2rRkkHgTRNg=; b=MpUABLpCnRohib/emZv3vMwdos
	KJyZp/xQmExunsi0nQLIWdtEAgSUSASyul1htKvLN9hbRgnKd6c4b4twKKBf+bWaSZ3oAAFPozJvd
	bNVh+n+LHldscFkTK/WUd/bqUGScxYQG9UAo7/L1vwyelf36Qo8JILgy1BTR11iRBu1uWj5brrA7d
	j4YXL+gjr/3eMAjztuhL7kEe12Tt5mUAO9RtXEKvvK0/J9mCzfLBmPyIEPW8nuxbGvPqBQwLKQwlp
	KN9gE6p5D45UYGwq37Gf/kh7EHS91ZO7z4nU827EkAQV2nRBmfP/i2/M5BxMGz8uoegeyqiu/IZrh
	GVkL9UjA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof0y-00000000FnL-0MP6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 09:21:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9579F152B;
	Wed, 20 Aug 2025 02:21:41 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 185663F58B;
	Wed, 20 Aug 2025 02:21:43 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:21:23 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, yubowen8@huawei.com, zhangpengjie2@huawei.com,
	linhongye@h-partners.com
Subject: Re: [PATCH v5 3/3] arm64: topology: Setup AMU FIE for online CPUs
 only
Message-ID: <aKWTk5dfZysd_8ks@arm.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
 <20250819072931.1647431-4-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819072931.1647431-4-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_102152_502198_6E61960A 
X-CRM114-Status: GOOD (  44.72  )
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

The commit title does read a bit wrong I think.
It does not really reflect the change for supporting cpu hotplug.
Maybe smth along the lines of:
	arm64: topology: Handle AMU FIE setup on CPU hotplug
?

On Tue, Aug 19, 2025 at 03:29:31PM +0800, Lifeng Zheng wrote:
> When boot with maxcpu=1 restrict, and LPI(Low Power Idle States) is on,
So actually it is `maxcpus` to start with, Not sure what LPI has to do with any
of that ?
It might be better to slightly reword the whole commit message.
The problem is with CPUs being offline at the time the cpufreq policy is being
created so it might be with maxcpus != nr_cpus , or because cpu bring-up
failed, or due to RAS event that caused the cpu to go offline, etc.
How about:

"When a cpufreq policy is created, AMU FIE setup currently verifies all
CPUs in the policy, regardless of whether they are online. If any of
those CPUs are offline, their AMU capability flag is not yet verified, and
the check fails. As a result, AMU FIE is not enabled even if the CPUs
that are online do support it.

Later, when the offline CPUs eventually come online and advertise AMU
support, they have no opportunity to re-enable AMU FIE for the policy,
leaving the whole frequency domain without AMU FIE despite being
eligible.

Restrict the initial AMU FIE check to the CPUs that are online at the
time the policy is created, and allow CPUs brought online later to join
the policy with AMU FIE enabled."

> only CPU0 will go online. The support AMU flag of CPU0 will be set but the
> flags of other CPUs will not. This will cause AMU FIE set up fail for CPU0
> when it shares a cpufreq policy with other CPU(s). After that, when other
> CPUs are finally online and the support AMU flags of them are set, they'll
> never have a chance to set up AMU FIE, even though they're eligible.
> 
> To solve this problem, the process of setting up AMU FIE needs to be
> modified as follows:
> 
> 1. Set up AMU FIE only for the online CPUs.
> 
> 2. Try to set up AMU FIE each time a CPU goes online and do the
> freq_counters_valid() check. If this check fails, clear scale freq source
> of all the CPUs related to the same policy, in case they use different
> source of the freq scale.
> 
> At the same time, this change also be applied to cpufreq when calling
> arch_set_freq_scale.
Could we clarify that a bit ? Reads a bit ambiguous.

> 
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 54 ++++++++++++++++++++++++++++++++++--
>  drivers/cpufreq/cpufreq.c    |  4 +--
>  2 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 9317a618bb87..a9d9e9969cea 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -385,7 +385,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
>  	struct cpufreq_policy *policy = data;
>  
>  	if (val == CPUFREQ_CREATE_POLICY)
> -		amu_fie_setup(policy->related_cpus);
> +		amu_fie_setup(policy->cpus);
>  
>  	/*
>  	 * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> @@ -404,10 +404,60 @@ static struct notifier_block init_amu_fie_notifier = {
>  	.notifier_call = init_amu_fie_callback,
>  };
>  
> +static int cpuhp_topology_online(unsigned int cpu)
> +{
> +	struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> +
> +	/*
> +	 * If the online CPUs are not all AMU FIE CPUs or the new one is already
> +	 * an AMU FIE one, no need to set it.
> +	 */
> +	if (!policy || !cpumask_available(amu_fie_cpus) ||
> +	    !cpumask_subset(policy->cpus, amu_fie_cpus) ||
> +	    cpumask_test_cpu(cpu, amu_fie_cpus))
> +		return 0;
I believe this can be slightly optimised and made more ... readable, i.e:

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index a9d9e9969cea..2d6ce34af8e4 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -408,15 +408,25 @@ static int cpuhp_topology_online(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
 
+	/* Those are cheap checks */
+
 	/*
-	 * If the online CPUs are not all AMU FIE CPUs or the new one is already
-	 * an AMU FIE one, no need to set it.
+	 * Skip this CPU if:
+	 *  - it has no cpufreq policy assigned yet,
+	 *  - no policy exists that spans CPUs with AMU counters, or
+	 *  - it was already handled.
 	 */
-	if (!policy || !cpumask_available(amu_fie_cpus) ||
-	    !cpumask_subset(policy->cpus, amu_fie_cpus) ||
+	if (unlikely(!policy || !cpumask_available(amu_fie_cpus)) ||
 	    cpumask_test_cpu(cpu, amu_fie_cpus))
 		return 0;
 
+	/*
+	 * Only proceed if all already-online CPUs in this policy
+	 * support AMU counters.
+	 */
+	if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
+		return 0;
+
 	/*
 	 * If the new online CPU cannot pass this check, all the CPUs related to
 	 * the same policy should be clear from amu_fie_cpus mask, otherwise they


---
BR
Beata

> +
> +	/*
> +	 * If the new online CPU cannot pass this check, all the CPUs related to
> +	 * the same policy should be clear from amu_fie_cpus mask, otherwise they
> +	 * may use different source of the freq scale.
> +	 */
> +	if (WARN_ON(!freq_counters_valid(cpu))) {
> +		topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
> +						 policy->related_cpus);
> +		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
> +		return 0;
> +	}
> +
> +	cpumask_set_cpu(cpu, amu_fie_cpus);
> +
> +	topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> +
> +	pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
> +
> +	return 0;
> +}
> +
>  static int __init init_amu_fie(void)
>  {
> -	return cpufreq_register_notifier(&init_amu_fie_notifier,
> +	int ret;
> +
> +	ret = cpufreq_register_notifier(&init_amu_fie_notifier,
>  					CPUFREQ_POLICY_NOTIFIER);
> +	if (ret)
> +		return ret;
> +
> +	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> +					"arm64/topology:online",
> +					cpuhp_topology_online,
> +					NULL);
> +	if (ret < 0) {
> +		cpufreq_unregister_notifier(&init_amu_fie_notifier,
> +					    CPUFREQ_POLICY_NOTIFIER);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  core_initcall(init_amu_fie);
>  
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 78ca68ea754d..d1890a2af1af 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -417,7 +417,7 @@ void cpufreq_freq_transition_end(struct cpufreq_policy *policy,
>  
>  	cpufreq_notify_post_transition(policy, freqs, transition_failed);
>  
> -	arch_set_freq_scale(policy->related_cpus,
> +	arch_set_freq_scale(policy->cpus,
>  			    policy->cur,
>  			    arch_scale_freq_ref(policy->cpu));
>  
> @@ -2219,7 +2219,7 @@ unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
>  		return 0;
>  
>  	policy->cur = freq;
> -	arch_set_freq_scale(policy->related_cpus, freq,
> +	arch_set_freq_scale(policy->cpus, freq,
>  			    arch_scale_freq_ref(policy->cpu));
>  	cpufreq_stats_record_transition(policy, freq);
>  
> -- 
> 2.33.0
> 

