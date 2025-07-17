Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D5BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2+K5kZAESVH5bjbMGycl+BENKKTT9M601876vlEf2I=; b=g8WetKUP/t/qEdLKDlcM32O2nX
	QvovwadyqkUdXZiCtz8g45MKci0Ovo5k2qd9lc8cRM6apIR2kzRkUVcvL2XS3izmmF71rmlGJTs/F
	czD7zXFiQe03UbLl+XGZVSGRMEwf9Ml5DDTBF2K8P20ufm2a8yLXW3kIhof4pdvjintD6qi/vme4B
	YDXvJhDH+GpvwTKuyagRezKVLHe3Vy+XjssB6cdCkQVWOmiR5/+lUPN/rjkkqZ5h81HM+dbhdMrFQ
	b4XErJo0/TlwjkrhjEXfwOytwJoRvOwUrA1kjFMXd8tMbUY2z3WBJgJt9rSyXw6sk9jFtIvBIK/qL
	ZlWG5FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucS4M-0000000AjeZ-1pOi;
	Thu, 17 Jul 2025 17:06:54 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRYh-0000000AfAR-2lYO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:34:12 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2eacb421554so498262fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752770051; x=1753374851; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X2+K5kZAESVH5bjbMGycl+BENKKTT9M601876vlEf2I=;
        b=NiGpZF6+AR/SSvawm+1Ou+5CMVDD940RbYYsRucMMFsrp73hmhHJC3idclo3HU4qc+
         YyrwE7it7aiP2KItYKygPSZiyh7Lnu2ydx2UbOuwnUIBqQkqkWWvYjS+ln8fPIbPiRcP
         GQcCvE9B+fUnf4IlZQkWIdnj21T+XdiK2Tqk1cY62brUh2LMxsd8q1fel6/tx3dE54Hh
         jJfJErA2YHlwAccIJP7/k7k3A7ODZ3hli4uP+13KZfjfjc9bfBaug3MUGwPxVZXfC8cY
         VJkF/KE4jv4bGA1oEtxpQyO7CcJAZ7/xPlVh0TEW5MnQ1nw2pd7CyDIdvP8YbpB/Dzvd
         /Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770051; x=1753374851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2+K5kZAESVH5bjbMGycl+BENKKTT9M601876vlEf2I=;
        b=NP1GiY+Ow+csODH9bzdf01c6s053Rnk1NMJ4UfNNQKiOU/w76AsVETgF+ltVPBBni8
         rd0LI22QijUL6bCaTgiGU1jiqy1XJWXk7QJJwvQ6sxmwzgC+s1pxB5bg2lRvt/tCejA7
         nT0Rz7apidOIXXZ4apZ29uKACMoBBHyoA+x6ikRwz8J1eIPdfZRi9bKQcDMCPu/W/eq3
         KiDdZOICH7DNu5UqumfM1Jzubv5uPsDxuRr+enRkmnanbli+uNeunayvW/x4+ucyUWX3
         ZOCkYMOQ3OCtPDzgq8gkrWaL+APsh21H1SZ814+yrZEChWpzkf+1BKwbb+nfzsg6ry9h
         VJXA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Cs3xbr/KxrUTLRZKFz02/3jBkXsvrDP1TyhzEPsZ0YH7BO4KpcgoC4s+3kYA8d5Qpi+FTuJNaP9vAGRbb3qB@lists.infradead.org
X-Gm-Message-State: AOJu0YxmDteYAMF+vip9cxqotIxbryWbOtnyuQNKYnmkoTjkoskpiCxP
	4JcIX8o/HlzJ0a+LKZa/rbQ4pSyqovbw1LuzdLEUJKr6Twa6tSjZPZ9Zy+Xtp/kK9gcoqLvaBF8
	GQOmgmqwf9+9ww/VqySLJCHSfnBwOrs6xNrh9C+F67g==
X-Gm-Gg: ASbGncsvYgC6komY/xmXyaz973GY9ZwXElzzOipTueJ0d5y52yu1KN+YmMZI+ZE68KE
	tmTjtBb42HYhC+BHhRY27khIK3567KWvOU4hPHZ89x42fNVeSE9u+btNpy3K6NG7C919xPEDtGS
	jcB/ykuX/RPovmlLF0GOaVdNEYts2jECbPsnZeZ60zQrNR5RUP8/pE4UpjpHSEFMqhLD56PVlxS
	2c2vt/9Vg==
X-Google-Smtp-Source: AGHT+IFwM46WAT88MwJQfwmy316aoGs2iMb5yuh3tLyPaOUzGsTIYwh4NOAiA1/hlEtURXz89n0/pWNod1NhIzdMukc=
X-Received: by 2002:a05:6870:2c9a:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-2ffb223d9damr5943160fac.7.1752770050610; Thu, 17 Jul 2025
 09:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org> <5597644b-267d-40d0-aa33-a8a665cebd70@kernel.org>
In-Reply-To: <5597644b-267d-40d0-aa33-a8a665cebd70@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 17 Jul 2025 17:33:54 +0100
X-Gm-Features: Ac12FXxDArSCCUN95XLlnHhF6jYPPCI7qSjY8zS1Dogc057C5wMeWh2BJ5AljmM
Message-ID: <CADrjBPq_ofiUirxUx+VyzTeGMgWKLmFRhPErVTSV3Qd3hKp-RA@mail.gmail.com>
Subject: Re: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, sudeep.holla@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_093411_710056_A5CCFDD8 
X-CRM114-Status: GOOD (  27.91  )
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

Hi Krzysztof,

Thanks, as always, for your review feedback.

On Sat, 12 Jul 2025 at 18:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/07/2025 15:50, Peter Griffin wrote:
> >
> >  #include <linux/soc/samsung/exynos-regs-pmu.h>
> > @@ -35,6 +37,14 @@ struct exynos_pmu_context {
> >       const struct exynos_pmu_data *pmu_data;
> >       struct regmap *pmureg;
> >       struct regmap *pmuintrgen;
> > +     /*
> > +      * Serialization lock for CPU hot plug and cpuidle ACPM hint
> > +      * programming. Also protects the in_hotplug flag.
> > +      */
> > +     raw_spinlock_t cpupm_lock;
> > +     bool *in_hotplug;
>
> This should be bitmap - more obvious code.

I've done this in v7 which I just sent.

>
> > +     atomic_t sys_suspended;
> > +     atomic_t sys_rebooting;
> >  };
> >
> >  void __iomem *pmu_base_addr;
> > @@ -221,6 +231,15 @@ static const struct regmap_config regmap_smccfg = {
> >       .reg_read = tensor_sec_reg_read,
> >       .reg_write = tensor_sec_reg_write,
> >       .reg_update_bits = tensor_sec_update_bits,
> > +     .use_raw_spinlock = true,
> > +};
> > +
> > +static const struct regmap_config regmap_pmu_intr = {
> > +     .name = "pmu_intr_gen",
> > +     .reg_bits = 32,
> > +     .reg_stride = 4,
> > +     .val_bits = 32,
> > +     .use_raw_spinlock = true,
> >  };
> >
> >  static const struct exynos_pmu_data gs101_pmu_data = {
> > @@ -330,13 +349,19 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
> >  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
> >
>
>
> ...
>
> > +/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
> > +static int gs101_cpu_pmu_offline(void)
> > +{
> > +     int cpu;
> > +
> > +     raw_spin_lock(&pmu_context->cpupm_lock);
> > +     cpu = smp_processor_id();
> > +
> > +     if (pmu_context->in_hotplug[cpu]) {
> > +             raw_spin_unlock(&pmu_context->cpupm_lock);
> > +             return NOTIFY_BAD;
> > +     }
> > +
> > +     __gs101_cpu_pmu_offline(cpu);
> > +     raw_spin_unlock(&pmu_context->cpupm_lock);
> > +
> > +     return NOTIFY_OK;
> > +}
> > +
> > +/* Called from CPU hot plug callback with IRQs enabled */
> > +static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> > +{
> > +     unsigned long flags;
> > +
> > +     raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
> > +     /*
> > +      * Mark this CPU as entering hotplug. So as not to confuse
> > +      * ACPM the CPU entering hotplug should not enter C2 idle state.
> > +      */
> > +     pmu_context->in_hotplug[cpu] = true;
> > +     __gs101_cpu_pmu_offline(cpu);
> > +
> > +     raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> > +                                     unsigned long action, void *v)
> > +{
> > +     switch (action) {
> > +     case CPU_PM_ENTER:
> > +             /*
> > +              * Ignore CPU_PM_ENTER event in reboot or
> > +              * suspend sequence.
> > +              */
> > +
> > +             if (atomic_read(&pmu_context->sys_suspended) ||
> > +                 atomic_read(&pmu_context->sys_rebooting))
>
> I don't get exactly why you need here atomics. You don't have here
> barriers, so ordering is not kept (non-RMW atomics are unordered), so
> maybe ordering was not the problem to be solved here. But then you don't
> use these at all as RMW and this is even explicitly described in atomic doc!
>
> "Therefore, if you find yourself only using the Non-RMW operations of
> atomic_t, you do not in fact need atomic_t at all and are doing it wrong."
>
> And it is right. READ/WRITE_ONCE gives you the same.
>
> The question is whether you need ordering or barriers in general
> (atomics don't give you these) - you have here control dependency
> if-else, however it is immediately followed with gs101_cpu_pmu_offline()
> which will use spin-lock (so memory barrier).
>
> Basically you should have here comment explaining why there is no
> barrier - you rely on barrier from spin lock in next calls.
>
> And if my reasoning is correct, then you should use just READ/WRITE_ONCE.

There was a bad assumption on my part that atomic_read etc would have
barriers. After looking at this some more in v7 I decided to protect
the reboot/suspend flags with the raw spinlock. I think that makes it
much easier to reason about the code.

Thanks,

Peter

