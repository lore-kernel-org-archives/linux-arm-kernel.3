Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6FFC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9qFhwXNt5nOCJzEqj8JB0MpQ/9Z77x05iZAh1+O/5I=; b=zmtGwDawwaIxN3ExuzuOHQctVy
	6k+NKiC91qoBWQOu+hmhKYku/9SGg1pB09DEr08f4Xbb7kZCG1iaZ/wM2WRtrFnk5Q03UcFERUZyK
	J0SSLXN45dmPq0emfyvJLyrGHzKPHU1ooZCW13oPbcvLMYV0U5CVXrKMblb2PpZTRz0tIrM1ijcJS
	G69b1PVP1+ORgebo/X5wQF4UqVTkOmebNEMDfzNMezUkt4dK4XoLCK1uRCPdOHgWYb2Ho0SLJUKHm
	unjMRIk6exF8nCvvIpf1ynbWUBIrTpU88YUzC21FwoTbTnYH+ZcECcBh4ZVJ/qw1ow+JDKyuyVpWs
	uqBlYFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqb1d-0000000Eyrm-2Xh5;
	Fri, 07 Mar 2025 16:58:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaxT-0000000EyLe-3KhI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:54:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5499659e669so514445e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741366436; x=1741971236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9qFhwXNt5nOCJzEqj8JB0MpQ/9Z77x05iZAh1+O/5I=;
        b=YGn4KSjKsmNKssExP98HAJFoFLylCE9JHHFn1Cv/iH7Wl7PS2IH7T4MKORXswTZkMM
         oj1100FVMxXW3ad6LhqfofPaoycVyuRJTt5wWMPiDAGwCaO47pLR1xYgfxDLUZDqnTwn
         umbRe7cMIPo2MjVT4YzfZckBBeX/fcIilSig8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366436; x=1741971236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9qFhwXNt5nOCJzEqj8JB0MpQ/9Z77x05iZAh1+O/5I=;
        b=WruYWNP7qOTfDr/iHVIEn8xh2ei1FworA6lLceOwiQPPaGITEDqCPBSvgoWQJMXBFA
         zxMpKkgW2pGBmmSVVKjp8DyfI+2z+euUTb6GygHlIcjJ1FUHJnUfuN87twvvutsS3ei1
         B5oXVbP0R+CC+u7AtnYm6nT1Du2mK49tqHPHYh0rg1UFrf3vkA9AX8UWhXqumPYxJ4XO
         VyEi8bDf7l6kBIes+7aFuxrSBVq7hkISfNif2gyunGU674rE9+Z+0cQp1CjY/hsOgXMU
         XE9tOCRVq7xfpZUYwvWRoR1O5QVemsWC0oK4y1zoyfcA2Rc+y3IHxr+lRukkSKW1/oZ+
         N5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5s1H5gUcf10WAdf1GRyAFAgz0P9xeviTWYgvi7FCsuc7eMb1qIwh4e2u+DpUYZkIvM/s7DM4r23YhCwF3C+Rw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3iaCwDdtY2A2is9Xyn/Hi3F4QC+q7bdqVOYR31QblL9Q8GBNO
	VVscLlnbuGMlJNK5U7xMRx/LaNjjaS72G+v56lIzKUdIaF1zb8Qeu8sHUZTVII54RyVsuYP8fuM
	nxA==
X-Gm-Gg: ASbGncvzzWnTBhO1gHJE4kYhbwb8FWH3T27Us86jAZEnbmpgsPf3gEHNo4m4xlTKrS7
	vjXPRvzsxKH/zDs09RbdL2Pbp+QX88nWyEgl9l3QcXKJH6vSwpWznLVPSStpSbPT4KzQs3+wRq4
	YioR1xreVO8YtQHBkncI18q6MLLxJr0J2w6UKBsTBS8dpZTKPnW+NR1p6PSyDkuZeeJhFP909od
	TGQyy6/4Uf2c62Fn9QUJImpM9r0PwyazUvAloWFYGoxzvodX45QpqiJyimLSyBt+aQOhuzzaW6H
	ACoWu4mKLE+JTVntwE+tG1TVreVfJH6TqpbQf8b86t/EIkVQ2HOLn4GHERSTcEWm4gVVJGevTB4
	H51Dc9EGkmoap
X-Google-Smtp-Source: AGHT+IGCnlplwMh+4riIwZj+YuJ9RZvqRfreYalWpn2AiDKISS67n8UeJY8SeMpnMV2QjvZ5fZv0rQ==
X-Received: by 2002:a05:6512:ea5:b0:549:7145:5d2f with SMTP id 2adb3069b0e04-54990eb8e3fmr1843250e87.33.1741366436101;
        Fri, 07 Mar 2025 08:53:56 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c3da9sm530605e87.252.2025.03.07.08.53.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:53:50 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf2513a2dso15333161fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:53:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWeeUp7MXOAyxGIqea/KgKpi/Q4MzpJZqFX4v8yTORMNeVNIn5g/FAY4/9hUCNZFybXEZUVF8EPJH2w5W/Ex0g@lists.infradead.org
X-Received: by 2002:a2e:be1e:0:b0:30b:ef38:22ce with SMTP id
 38308e7fff4ca-30bf4635c48mr16484231fa.31.1741366429347; Fri, 07 Mar 2025
 08:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20250307021811.46981-1-yangyicong@huawei.com> <20250307021811.46981-3-yangyicong@huawei.com>
In-Reply-To: <20250307021811.46981-3-yangyicong@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Mar 2025 08:53:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XLn9Dz8rhRnjTKdbbeS3YP+XZFzpSV0C6+DakWOUmMpA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp6kJhnI2pkqsYSqzqRYdTDnZIcksY6a7eiW1i7qvQnjUMx9E9FYEZtyO0
Message-ID: <CAD=FV=XLn9Dz8rhRnjTKdbbeS3YP+XZFzpSV0C6+DakWOUmMpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64/watchdog_hld: Add a cpufreq notifier for update
 watchdog thresh
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	sumit.garg@linaro.org, kernelfans@gmail.com, lecopzer.chen@mediatek.com, 
	tglx@linutronix.de, song@kernel.org, linux-arm-kernel@lists.infradead.org, 
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com, prime.zeng@hisilicon.com, 
	yangyicong@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085359_840862_E836A991 
X-CRM114-Status: GOOD (  24.87  )
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

Hi,

On Thu, Mar 6, 2025 at 6:18=E2=80=AFPM Yicong Yang <yangyicong@huawei.com> =
wrote:
>
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
> to convert the watchdog_thresh to perf event period. cpufreq drivers
> like cppc_cpufreq will be initialized lately after the initializing of
> the hard lockup detector so just use a safe cpufreq which will be
> inaccurency. Use a cpufreq notifier to adjust the event's period to
> a more accurate one.
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/kernel/watchdog_hld.c | 34 ++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdo=
g_hld.c
> index dcd25322127c..719ae39e8bc0 100644
> --- a/arch/arm64/kernel/watchdog_hld.c
> +++ b/arch/arm64/kernel/watchdog_hld.c
> @@ -34,3 +34,37 @@ bool __init arch_perf_nmi_is_available(void)
>          */
>         return arm_pmu_irq_is_nmi();
>  }
> +
> +static int watchdog_freq_notifier_callback(struct notifier_block *nb,
> +                                          unsigned long val, void *data)
> +{
> +       struct cpufreq_policy *policy =3D data;
> +       unsigned long max_cpu_freq;

Feels like max_cpu_freq should be a u64. It probably should have been
u64 in hw_nmi_get_sample_period() as well. Otherwise you could end up
with a problem if the max CPU frequency is above ~4.3GHz and "unsigned
long" is 32-bits (I think it technically could be?)


> +       u64 new_period;
> +       int cpu;
> +
> +       if (val !=3D CPUFREQ_CREATE_POLICY)
> +               return 0;

nit: maybe better documenting to return "NOTIFY_DONE" instead of 0?


> +       for_each_cpu(cpu, policy->cpus) {
> +               max_cpu_freq =3D cpufreq_get_hw_max_freq(cpu) * 1000UL;
> +               if (!max_cpu_freq)
> +                       continue;
> +
> +               new_period =3D watchdog_thresh * max_cpu_freq;
> +               hardlockup_detector_perf_adjust_period(cpu, new_period);
> +       }
> +
> +       return 0;
> +}
> +
> +static struct notifier_block watchdog_freq_notifier =3D {
> +       .notifier_call =3D watchdog_freq_notifier_callback,
> +};
> +
> +static int __init init_watchdog_freq_notifier(void)
> +{
> +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> +                                        CPUFREQ_POLICY_NOTIFIER);
> +}
> +core_initcall(init_watchdog_freq_notifier);

I haven't dug into everything, but don't you have a potential blind
spot, though? What if the order is this:

1. hw_nmi_get_sample_period() is called
2. cpufreq driver probes
3. init_watchdog_freq_notifier() initcall runs

Since the cpufreq driver proved before you registered for the
notifier, won't you miss the creation of the policy? Maybe instead of
registering for an initcall you should somehow trigger off the first
call to hw_nmi_get_sample_period() and register at that point in time?

-Doug

