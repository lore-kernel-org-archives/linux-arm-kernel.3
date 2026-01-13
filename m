Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25380D0C84D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzWAvWlKk1ivM3WNqFslwu42j6W682o4xLEKdFkEC58=; b=AXM4kBjPTflWxUU6yCbawDVTqQ
	6usp4YTZqdlpazjCo/f99V3GYWrhNpqWt0M5iQQHT65nW8qk+ScMcMg3GPEeVCB4DOfXF2wspixhr
	A+Imsw7RKEcfNZPa/aRBbwHQwO67dNdaLflwrOxOzK2+jtty2enfdaiQeG3ITJqmnOfiVB3cW1eNS
	HLy+DvCBT/XbYJ+HVIUU+YvGU3FF/U9mpyHIM3dKy82uEbdjlt5E0sCORwLnKG8GT2HKgrU2IFETy
	dEjaMzZnHYbp4iaXpM0+GQWhq7DiN31DdbWXLjNKmaPGNdGkQF5ShqHnVER1mG3R8ysLj34NWVCBy
	+Yry1k/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc5d-00000006wJX-2C8l;
	Tue, 13 Jan 2026 10:57:33 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc5Z-00000006wIY-3Xlc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:57:32 +0000
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2d32b9777so1121285285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301848; x=1768906648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzWAvWlKk1ivM3WNqFslwu42j6W682o4xLEKdFkEC58=;
        b=Qb1j7IpuB0UwbJUyUpiUi3eJCculF75U0W56tXDjT9FOoP0ixqC1jQugLGgDJfe68y
         uX6rGdAPHgBOhfsYPQonSTXoHiNbelk046jVyN3LPnbbLWOjNG/ZkemFFfpXdviGzqYA
         8VRGpqYczgLOqrZbt0BUPhSQd/tLy1gEnDXfVp3+GfN0NFlUZkC/IVwdzM/nCqvOcutB
         edxiCapt/oPhBhrVOEbHX3qCypEz96Z+ucKFh/X9mGJarrRfDBCfwmslNApwAmzmirA0
         HvB0ynJfY9YKu2UkG+r09O8qkLXkU8ehcY0m6CRcX5Hmkr44y0fhd0YYmbWc3XqapUPo
         1dXA==
X-Forwarded-Encrypted: i=1; AJvYcCVTLuQFCPTc4apBEMKh27vl6RObcjspvFmo4wbca3EfLTxngELBfsr0PIYW2ENQGOGAJAdTe4610h3ab/0RpeO6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMsgrfUbohnPDsE2A8nPPzty2s7amc9OGL4YJKudU8QC+M+KFa
	d97LUk+y/ZEI1XHGKrKasIl5dCFESoM+JGbo6NG0M+0xPTMLjamww0qXLruSGm3T
X-Gm-Gg: AY/fxX6+4OC2GosysGp4JgN3IW53Li55/qWuCPIe3F7sU0goGVeCcG23MM8o6+5ggEu
	zrQI/XkkNcDC6G/JTad8HlvJiEBJZlMbjXRHgs5LYCYSgoUamQa1RIyhCvuIIEZTPymAcbLQIGI
	00TGOODeWBvmuaDYupod1ozyNaSgFOg4f0+6yWGsxigR0uaO3qNUWVkyvhArLVQ6AnYhyYQc4/R
	5RBqKrIOJb7dLKjDixqJLCIZ3M2JrMs/YN3xfG/Mn5tVlfTgn4YEMI7ZF+uwVeCICcdyM82Yc50
	DwYOADNpydLoPCK7rxE+C2LZ8X1rMECjLa9KdUoyt/oIWAWaxa/OvuMhM6hWqLMERO+c69/m+oP
	7LUG9OInWVLwknYRDTnF8JUxVfIUYCv8YWJZaOGNuKWnyzq0WHGDatoQNN5isptuTRwXd4qnY1/
	R0faU94q/nf1NiSOM+FjudO8Zkf4xTrFe3otPUQByIIOiOrY5YSo6BWlwDG/AIbTs=
X-Google-Smtp-Source: AGHT+IHVkHLlFn4vIZFiJLiX4H14vaV9D/R7BVIOfbGbB4BBhf46NH8nyDiCIbUDwUIrGfItjpedCg==
X-Received: by 2002:a05:620a:4442:b0:8c3:1719:9b84 with SMTP id af79cd13be357-8c38942be70mr2724391285a.82.1768301848393;
        Tue, 13 Jan 2026 02:57:28 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51ceb5sm1798342385a.35.2026.01.13.02.57.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:57:28 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee1879e6d9so87476511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:57:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCNN08ynBtQ1Fu0Jhb7JvXgKTkkT2Z+tIdyXqv8bvhyTpaTKK2Qffobkm24R9HGK9kKZCBuyYSJV3jgvTFbOri@lists.infradead.org
X-Received: by 2002:a05:6102:4412:b0:4e6:a338:a421 with SMTP id
 ada2fe7eead31-5ecb5cbb070mr8601476137.6.1768301516773; Tue, 13 Jan 2026
 02:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com> <20251230080115.2120612-4-zhenglifeng1@huawei.com>
In-Reply-To: <20251230080115.2120612-4-zhenglifeng1@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 11:51:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
X-Gm-Features: AZwV_QisLfN-JbYTCLd4Pwog5D8ewcnp0Gg5r8ROYeUNPNSxroJTI4oVjqJhvbQ
Message-ID: <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, sudeep.holla@arm.com, gregkh@linuxfoundation.org, 
	dakr@kernel.org, beata.michalska@arm.com, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025731_512291_B31713CE 
X-CRM114-Status: GOOD (  39.82  )
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

Hi Lifeng,

On Tue, 30 Dec 2025 at 09:02, Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
> Currently, when a cpufreq policy is created, the AMU FIE setup process
> checks all CPUs in the policy -- including those that are offline. If any
> of these CPUs are offline at that time, their AMU capability flag hasn't
> been verified yet, leading the check fail. As a result, AMU FIE is not
> enabled, even if the CPUs that are online do support it.
>
> Later, when the previously offline CPUs come online and report AMU support,
> there's no mechanism in place to re-enable AMU FIE for the policy. This
> leaves the entire frequency domain without AMU FIE, despite being eligible.
>
> Restrict the initial AMU FIE check to only those CPUs that are online at
> the time the policy is created, and allow CPUs that come online later to
> join the policy with AMU FIE enabled.
>
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Acked-by: Beata Michalska <beata.michalska@arm.com>

Thanks for your patch, which is now commit 6fd9be0b7b2e957d
("arm64: topology: Handle AMU FIE setup on CPU hotplug") in
arm64/for-next/core (next-20260107 and later).

> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
>         struct cpufreq_policy *policy = data;
>
>         if (val == CPUFREQ_CREATE_POLICY)
> -               amu_fie_setup(policy->related_cpus);
> +               amu_fie_setup(policy->cpus);
>
>         /*
>          * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> @@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
>         .notifier_call = init_amu_fie_callback,
>  };
>
> +static int cpuhp_topology_online(unsigned int cpu)
> +{
> +       struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> +
> +       /* Those are cheap checks */
> +
> +       /*
> +        * Skip this CPU if:
> +        *  - it has no cpufreq policy assigned yet,
> +        *  - no policy exists that spans CPUs with AMU counters, or
> +        *  - it was already handled.
> +        */
> +       if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
> +           cpumask_test_cpu(cpu, amu_fie_cpus))
> +               return 0;
> +
> +       /*
> +        * Only proceed if all already-online CPUs in this policy
> +        * support AMU counters.
> +        */
> +       if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
> +               return 0;
> +
> +       /*
> +        * If the new online CPU cannot pass this check, all the CPUs related to
> +        * the same policy should be clear from amu_fie_cpus mask, otherwise they
> +        * may use different source of the freq scale.
> +        */
> +       if (!freq_counters_valid(cpu)) {
> +               pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);

This is triggered during resume from s2ram on Renesas R-Car H3
(big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), when enabling the first
little core:

    AMU: CPU[4] doesn't support AMU counters

Adding debug code:

    pr_info("Calling
topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, %*pbl)\n",
cpumask_pr_args(policy->related_cpus));
    pr_info("Calling cpumask_andnot(..., %*pbl, %*pbl)\n",
cpumask_pr_args(amu_fie_cpus), cpumask_pr_args(policy->related_cpus));

gives:

    AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
    AMU: Calling cpumask_andnot(..., , 4-7)

so AMU is disabled for all little cores.

Since this only happens during s2ram, and not during initial CPU
bring-up on boot, this looks wrong to me?

> +               topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
> +                                                policy->related_cpus);
> +               cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
> +               return 0;
> +       }
> +
> +       cpumask_set_cpu(cpu, amu_fie_cpus);
> +
> +       topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> +
> +       pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
> +
> +       return 0;
> +}
> +
>  static int __init init_amu_fie(void)
>  {
> -       return cpufreq_register_notifier(&init_amu_fie_notifier,
> +       int ret;
> +
> +       ret = cpufreq_register_notifier(&init_amu_fie_notifier,
>                                         CPUFREQ_POLICY_NOTIFIER);
> +       if (ret)
> +               return ret;
> +
> +       ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> +                                       "arm64/topology:online",
> +                                       cpuhp_topology_online,
> +                                       NULL);
> +       if (ret < 0) {
> +               cpufreq_unregister_notifier(&init_amu_fie_notifier,
> +                                           CPUFREQ_POLICY_NOTIFIER);
> +               return ret;
> +       }
> +
> +       return 0;
>  }
>  core_initcall(init_amu_fie);
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 84ec92bff642..c0ef6ea9c111 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -34,7 +34,14 @@ EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
>
>  static bool supports_scale_freq_counters(const struct cpumask *cpus)
>  {
> -       return cpumask_subset(cpus, &scale_freq_counters_mask);
> +       int i;
> +
> +       for_each_cpu(i, cpus) {
> +               if (cpumask_test_cpu(i, &scale_freq_counters_mask))
> +                       return true;
> +       }
> +
> +       return false;
>  }
>
>  bool topology_scale_freq_invariant(void)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

