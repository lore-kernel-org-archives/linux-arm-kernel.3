Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3779D37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZLqC1bLBjSQm/oEEjmqpl5nTEIq7+AXCXiTqeXbF7A=; b=IvOlPFi2dQIp/0neQrMa5djSws
	O6+UyCZfNCe+ZRMZn5Q2kPXBaLcswkCUSp0ampTeJSJ3IDPZ40qzvH4RvVLpTNupMvNYC/s5hRDzn
	wc/OCW6qE/Q1bbwnw1H2kcYQWzwAGcEIaexSH+2Fjh95dTkuaJayq0LaXVFX194fPclcDJXXcaA+a
	vtJOH6HWVCrNTSu77shahdfPgwmLq+rUQAnTXciErOQiIw08zpuWdGF27aFcjEVq2DaX6aWWmyPJb
	yUbNU3neXaTShXS2Uqdgd2Oy8ccFOI2A8gCwVmcyDGQamA8zPKxBjRr33lMZzfhvDiWVtYKPEBQja
	dNiJgJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Km-00000009Pqj-3lxK;
	Wed, 14 Jan 2026 13:54:52 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Kj-00000009Pq0-3cmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 13:54:51 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636784884eso1582272e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 05:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398888; x=1769003688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZLqC1bLBjSQm/oEEjmqpl5nTEIq7+AXCXiTqeXbF7A=;
        b=oWDcxp/KlmmF4Rq2RtsXTcVNxPaw/RvROyACqHzk6dB0RaRtvLwMy1+AjypRE5eJp/
         1blzMcJusB/EacE7mypJuO8kGKpdKs3oALR3O6Wo+QvEmDEAZH7yOw0hSlL5tFHdH8aL
         09+//aiW7vZsEzs+6hQbbfRQoMODfhUD8J3iHTkwplVBZ0qAGrC0WpZnFtWaKIhoh1a+
         euPYyTuCjQwqU6YOePtisQRlQDzhDtY3uU8bAveXqXW4oMYAI+pQLAOMfeEQT4wnmtzf
         4P8QCl8mp4pxp6LtJNE81/QzX1pXwSIh7EK3TFJ+I3XrN/eePxUCyhavJAiOTVRqwC6V
         kepw==
X-Forwarded-Encrypted: i=1; AJvYcCVpJBEmL7nJ44v+Z3s4BcpzT8Y30RA2BuRmtzpgrHXBg9LEGG7BKaLu69GYWm36DZD6+yEaeRZEamvLVACVknak@lists.infradead.org
X-Gm-Message-State: AOJu0YxZGPVZnEH+GZG9coos0NdM8gfaRwuAIZpi/hMRCD42d3marn4y
	Mg/ZTdE/vrmk4rZmZykTX3Z3s5U4TSQz3M6EcysGx0/Ai+Kc8FvdaAt0yGH4nhF5
X-Gm-Gg: AY/fxX4esjhd3Osnkz/cZ49ByLnKxq8suLubmf1wwkUEYvM3E/Qjs2ZuhucYYRD6bxU
	vTyqP5gSz9N4JZZ/UolMqrZ07/tGVulhVr1tk5W9ZAF7s5oPKrfymUcC+iWVHynRj2ooNidCqns
	8RBEMDPKq6zUCfJUre2BQvI0GSiGaUnqVLRlVRYQ5xiyrzosp1uxL/lh5OpJsfU+DlPbG52Sh9j
	JB6QK2RJ27DXxPquBlhNZe3t11wih0pMP23Q3eDjHuUQKPvWpi06mQzPNxS3TG8Ha+uksOUhtK7
	Sb6wPwZ12h7aWSU1ul6gERXCyePtwuwN+IlSVnBu8pIsI5TU8Qw4rdZVkDHfO7CZgOkIsjd9ULI
	HpXdmLH24Gng5wADxOUJCXQqfV4R+9IUG55s80c9qrwBj9d7duNBIfgFKwk+nyx9estVky4MjAA
	7YEqhSNJWdRnkm6Fz2ctYpoyBUNhEfrkepWrVto3lqX84TUOJR
X-Received: by 2002:a05:6122:3bc6:b0:563:8339:6201 with SMTP id 71dfb90a1353d-563a0a5c743mr869161e0c.17.1768398888199;
        Wed, 14 Jan 2026 05:54:48 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563995311fbsm4656988e0c.11.2026.01.14.05.54.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:54:47 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ed0b816d76so2528499137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 05:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUo+7FZWxMK3JzYcaMKt0n11SOBjvPoz08H/x8smCRX1ISXUzMQvgfrhIafTmupeaGoOZSpY1Wv1KuunDpUDBU8@lists.infradead.org
X-Received: by 2002:a05:6102:4a96:b0:5ed:77d:fd6c with SMTP id
 ada2fe7eead31-5f17f5d8436mr999268137.21.1768398886733; Wed, 14 Jan 2026
 05:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20251230080115.2120612-1-zhenglifeng1@huawei.com>
 <20251230080115.2120612-4-zhenglifeng1@huawei.com> <CAMuHMdVeHk-Enc-M9ztwSdeAtE8YPKtJwq+273bGPEFOEsu=Rw@mail.gmail.com>
 <aWZriVlQZ5jRx2o4@arm.com>
In-Reply-To: <aWZriVlQZ5jRx2o4@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 14:54:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
X-Gm-Features: AZwV_Qjx2dELiMfsKzad8VnoGFI8Ocod5E-6j0toQajY1saFLqz5CsCrIlg1Tmo
Message-ID: <CAMuHMdVgbQnaCQ8U8FK6J1vJLsqc0_MC7zSTX2B=rsuF2kpEKg@mail.gmail.com>
Subject: Re: [REPOST PATCH v6 3/3] arm64: topology: Handle AMU FIE setup on
 CPU hotplug
To: Beata Michalska <beata.michalska@arm.com>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, catalin.marinas@arm.com, will@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, sudeep.holla@arm.com, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linuxarm@huawei.com, jonathan.cameron@huawei.com, vincent.guittot@linaro.org, 
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com, 
	zhangpengjie2@huawei.com, wangzhi12@huawei.com, linhongye@h-partners.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_055449_935266_C14D67E0 
X-CRM114-Status: GOOD (  49.30  )
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

Hi Beata,

On Tue, 13 Jan 2026 at 16:58, Beata Michalska <beata.michalska@arm.com> wrote:
> On Tue, Jan 13, 2026 at 11:51:45AM +0100, Geert Uytterhoeven wrote:
> > On Tue, 30 Dec 2025 at 09:02, Lifeng Zheng <zhenglifeng1@huawei.com> wrote:
> > > Currently, when a cpufreq policy is created, the AMU FIE setup process
> > > checks all CPUs in the policy -- including those that are offline. If any
> > > of these CPUs are offline at that time, their AMU capability flag hasn't
> > > been verified yet, leading the check fail. As a result, AMU FIE is not
> > > enabled, even if the CPUs that are online do support it.
> > >
> > > Later, when the previously offline CPUs come online and report AMU support,
> > > there's no mechanism in place to re-enable AMU FIE for the policy. This
> > > leaves the entire frequency domain without AMU FIE, despite being eligible.
> > >
> > > Restrict the initial AMU FIE check to only those CPUs that are online at
> > > the time the policy is created, and allow CPUs that come online later to
> > > join the policy with AMU FIE enabled.
> > >
> > > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> > > Acked-by: Beata Michalska <beata.michalska@arm.com>
> >
> > Thanks for your patch, which is now commit 6fd9be0b7b2e957d
> > ("arm64: topology: Handle AMU FIE setup on CPU hotplug") in
> > arm64/for-next/core (next-20260107 and later).
> >
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -284,7 +284,7 @@ static int init_amu_fie_callback(struct notifier_block *nb, unsigned long val,
> > >         struct cpufreq_policy *policy = data;
> > >
> > >         if (val == CPUFREQ_CREATE_POLICY)
> > > -               amu_fie_setup(policy->related_cpus);
> > > +               amu_fie_setup(policy->cpus);
> > >
> > >         /*
> > >          * We don't need to handle CPUFREQ_REMOVE_POLICY event as the AMU
> > > @@ -303,10 +303,71 @@ static struct notifier_block init_amu_fie_notifier = {
> > >         .notifier_call = init_amu_fie_callback,
> > >  };
> > >
> > > +static int cpuhp_topology_online(unsigned int cpu)
> > > +{
> > > +       struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
> > > +
> > > +       /* Those are cheap checks */
> > > +
> > > +       /*
> > > +        * Skip this CPU if:
> > > +        *  - it has no cpufreq policy assigned yet,
> > > +        *  - no policy exists that spans CPUs with AMU counters, or
> > > +        *  - it was already handled.
> > > +        */
> > > +       if (unlikely(!policy) || !cpumask_available(amu_fie_cpus) ||
> > > +           cpumask_test_cpu(cpu, amu_fie_cpus))
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * Only proceed if all already-online CPUs in this policy
> > > +        * support AMU counters.
> > > +        */
> > > +       if (unlikely(!cpumask_subset(policy->cpus, amu_fie_cpus)))
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * If the new online CPU cannot pass this check, all the CPUs related to
> > > +        * the same policy should be clear from amu_fie_cpus mask, otherwise they
> > > +        * may use different source of the freq scale.
> > > +        */
> > > +       if (!freq_counters_valid(cpu)) {
> > > +               pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);
> >
> > This is triggered during resume from s2ram on Renesas R-Car H3
> > (big.LITTLE 4x Cortex-A57 + 4x Cortex-A53), when enabling the first
> > little core:
> >
> >     AMU: CPU[4] doesn't support AMU counters
> >
> > Adding debug code:
> >
> >     pr_info("Calling
> > topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, %*pbl)\n",
> > cpumask_pr_args(policy->related_cpus));
> >     pr_info("Calling cpumask_andnot(..., %*pbl, %*pbl)\n",
> > cpumask_pr_args(amu_fie_cpus), cpumask_pr_args(policy->related_cpus));
> >
> > gives:
> >
> >     AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
> >     AMU: Calling cpumask_andnot(..., , 4-7)
> >
> > so AMU is disabled for all little cores.
> >
> > Since this only happens during s2ram, and not during initial CPU
> > bring-up on boot, this looks wrong to me?
> This does look rather surprising. If that CPU was marked as supporting AMUs at
> the initial bring-up it should be part of amu_fie_cpus mask, so the hp callback
> should bail out straight away. Would you be able to add some logs to see what
> that mask actually contains ?
> Furthermore, freq_counters_valid is logging issues when validating the counters.
> Would you be able to re-run it with the debug level to see what might be
> happening under the hood, although I am still unsure why it is even reaching
> that point ...

Adding extra debugging info, and "#define DEBUG" at the top.

During boot:

    AMU: amu_fie_setup:260: cpus 0-3 amu_fie_cpus
    ^^^ empty amu_fie_cpus
    AMU: CPU0: counters are not supported.
    ^^^ pr_debug
    AMU: amu_fie_setup:260: cpus 4-7 amu_fie_cpus
    ^^^ empty amu_fie_cpus
    AMU: CPU4: counters are not supported.
    ^^^ pr_debug

During resume from s2ram:

    AMU: cpuhp_topology_online:314: cpu 1 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 2 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 3 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 4 amu_fie_cpus
    AMU: CPU4: counters are not supported.
    ^^^ pr_debug
    AMU: CPU[4] doesn't support AMU counters
    ^^^ pr_warn
    AMU: Calling topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, 4-7)
    AMU: Calling cpumask_andnot(..., , 4-7)
    AMU: cpuhp_topology_online:314: cpu 5 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 6 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))
    AMU: cpuhp_topology_online:314: cpu 7 amu_fie_cpus
    AMU: cpuhp_topology_online:343: skipped
(!cpumask_subset(policy->cpus, amu_fie_cpus))

Hence there is no issue, as AMU is not supported at all!

The confusing part is in the (absence of) logging.
If AMU is not supported, freq_counters_valid() uses:

     pr_debug("CPU%d: counters are not supported.\n", cpu);

which is typically not printed, unless DEBUG is enabled.

If freq_counters_valid() failed, the new cpuhp_topology_online() uses:

    pr_warn("CPU[%u] doesn't support AMU counters\n", cpu);

which is always printed.

Given freq_counters_valid() already prints a (debug) message, I think
the pr_warn() should just be removed.  Do you agree, or is there still
another incorrect check that should prevent getting this far?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

