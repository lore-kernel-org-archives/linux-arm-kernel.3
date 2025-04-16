Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D549C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgM3WwWzThIQV3Fv3N07LVNHJbc+37PYi8/8xrP5FMI=; b=y2OiQHDyIHxhBhWpTorhXjVlSx
	VXyZf5sEHFH7hw3zVkRKMg+0lPsJ07bCi3eElcqA4bKNoiah9H20cELpAfvVmr6aKVEa4HgaSE/+t
	YKstuGYA4//OGWncEjhmYIOqUoeyMz/8iCpyS9ylsRVrcJBmCrtRysBhny2WeBDEmwUCc815mftPi
	5LDjO1auzXJ01PdTpsyrooWlAyAGiLk2movlPseK6wVqelaAxSFPSNBtoHSdDb8sUOgs5yT72Ed0H
	lj6AP29dGS3oC8CwcU0ktY85+B6827MgJTOuiIvrHgCYOr5yRknHbfHNx2BjTkSzlMdUxtak6oEE5
	WzkjLerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50nD-00000009K80-2Mzu;
	Wed, 16 Apr 2025 11:18:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50kI-00000009JnJ-2FxY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 11:16:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so45270785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744802157; x=1745406957; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgM3WwWzThIQV3Fv3N07LVNHJbc+37PYi8/8xrP5FMI=;
        b=Z8Nv/5AWxRy8NwHfbtx8PVC78tQfVMz7nI4xN9ppLhhXySayYF5tpgVFGYW6HZNEy/
         +Onrj+QoW2Hh1zQF3h2GngAZh6riuWP2GMtJvLijIkM4QBo8BKFVfJf+NPhG/omtXqFI
         E05zvXBCi+DCBBsdyxqERk4MYsd7C4L+DvqG+Sm3jVjqYC6m33Uri+bXzgLI3mo0WO8Y
         5FqGvZK6Ky+N+q9Vx2I5Nb54Al3yldcBBNxcHpveS0t9FwAX8D+vErV+Oc7gc9T5CKUy
         3rl1bS4t35NhTEhg1wB92Dw6qYCfBxR0iK8bfTZjwFD6ySXd29+SaCYGLSlYvJFPZ7tE
         Ll5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802157; x=1745406957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgM3WwWzThIQV3Fv3N07LVNHJbc+37PYi8/8xrP5FMI=;
        b=EPpCMrV7wIsZSeOKb9GCJc2cNgFIYvTnqDHbv3yHSM3ulj3v754bdfxlxe11Aq4l9/
         qX/2jHDO6k6tYaiUHmYdLherP5SAhopiCRdqiB00do+ZkpfDk2BYbHEPHL3IRi+ynUIU
         Zx0xGSo4cDJyz9tAX+LktposkBPsHBFwmdW/mxyikj9cJo6TJJuia0xTiz6mNVXEjaiu
         IJZHRzxt3/Qt/JHTUnuO2/VJFlC4/WLE3YomdHbnNgd9RI58J+Yg7ZvQ30jfJpB4yIPs
         bDNL2hGtjduu1CfYe696OJdZ/y+AUqn1673gWAqDQkDcVGK8AkZUkLPJGOX1kk/Dbl7m
         VWYA==
X-Forwarded-Encrypted: i=1; AJvYcCUCqltCjd00qg6JmBMheOx1Cs4DHEYodS9AyqyXzYSkOg9QC+IFrUotuJjVUtUm928kwf2Rc9X/tBTNALh9Cb9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwGatDkRlvDyHoTfJxCvtApaMkA5QAM+WvoCdW6UqOS09jxfinb
	FmjhyJto2uJ25Wq5vJFKRRw9P73VQuVpEbJRWMbXonLpshm2ulsV6SDb1PDThuI=
X-Gm-Gg: ASbGncuq6QWcIM7F1Yj0ASWKQdN3SUO+WdVup88SvfZfsPzWksChWT4WzGsLem6xW3T
	nLtZQiFudotaKzg2RyZCxPkzvq8n5fL52usNDExcPCo7+zEJ/lcD9aljvSF0Kpbu3J4BiNriHwX
	UJngahhruB2bbm9J2XYTYYlWN0JANE0doHwn6xfD+FQmB9s3CmeH2Cde2bKsGx0RYdTuZhgBT8J
	LDQJ+NfxUTPI5RR9+IJPcBByUgJ2pj5SlEqHn3wICJehBFyb6Z4k3sVzA+VxOLCJnnczCxR2BD9
	KPuWXGKmoZBRSd4M82PLJcRj8zXUOZD0OGlhEjk2PTtw6CN8Pq+LtXIclGGDGyfiJx+VpMM55ZA
	bPcg=
X-Google-Smtp-Source: AGHT+IEz+GCuPAXQGEykmoJh7ndtzRsRPw1jC68sVNImIJaJ+XeAMgd2XZHAT5eJI2F3fj9jTKhaKg==
X-Received: by 2002:a05:600c:698d:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-4405d5fcdbcmr13829375e9.5.1744802156679;
        Wed, 16 Apr 2025 04:15:56 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405f583bcesm5988575e9.3.2025.04.16.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:15:56 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:15:53 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: William McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z_-RaYcXHR9--zXA@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <Z_7O1xi2-ZGhJ1r_@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_7O1xi2-ZGhJ1r_@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_041558_589222_94289C4A 
X-CRM114-Status: GOOD (  54.98  )
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

On Tue, Apr 15, 2025 at 02:25:43PM -0700, William McVicker wrote:
> On 04/15/2025, Daniel Lezcano wrote:
> > Hi Will,
> 
> Hi Daniel,
> 
> > 
> > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > 
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> > 
> > From a previous thread where there is no answer:
> > 
> > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > 
> > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > a module for the reasons explained in the aforementionned thread.
> > 
> > Before this could be accepted, I really need a strong acked-by from Thomas
> 
> Thanks for the response! I'll copy-and-paste your replies from that previous
> thread and try to address your concerns.
> 
> >   * the GKI approach is to have an update for the 'mainline' kernel and
> > let the different SoC vendors deal with their drivers. I'm afraid this
> > will prevent driver fixes to be carry on upstream because they will stay
> > in the OoT kernels
> 
> I can't speak for that specific thread or their intent, but I can speak to this
> thread and our intent.
> 
> This whole patch series is about upstreaming the downstream changes. So saying
> this will prevent others from upstreaming changes is punishing the folks who
> are actually trying to upstream changes. I don't think that's a fair way to
> handle this.
> 
> Also, rejecting this series will not prevent people from upstreaming their
> changes, it'll just make it more unlikely because they now have to deal with
> upstreaming more changes that were rejected in the past. That's daunting for
> someone who doesn't do upstreaming often. I'm telling this from experience
> dealing with SoC vendors and asking them to upstream stuff.
> 
> With that said, let me try to address some of your technical concerns.

I won't reject the series based on my opinion. Answering the technical concerns
will prevail.

Why is it needed to convert the timer into a module ?
 
> > * the core code may not be prepared for that, so loading / unloading
> > the modules with active timers may result into some issues
> 
> We had the same concern for irqchip drivers. We can easily disable unloading
> for these clocksource modules just like we did for irqchip by making them
> permanent modules.

In the clockevent / clocksource initialization process, depending on the
platform, some are needed very early and other can be loaded later.

For example, the usual configuration is the architected timers are initialized
very early, then the external timer is loaded a bit later. And when this one is
loaded it does not take over the architected timers. It acts as a "broadcast"
timer to program the next timer event when the current CPU is going to an idle
state where the local timer is stopped.

Other cases are the architected timers are not desired and the 'external' timer
is used in place when it is loaded with a higher rating. Some configuration can
mimic local timers by settting a per CPU timer.

Some platforms could be without the architected timers, so the 'external' timer
is used.

Let's imagine the system started, the timers are running and then we load a
module with a timer replacing the current ones. Does it work well ?

Are we sure, the timer modularization is compatible with all the timer use cases ?
 
> > * it may end up with some interactions with cpuidle at boot time and
> > the broadcast timer
> 
> If I'm understanding this correctly, no driver is guaranteed to probe at
> initialization time regardless of whether it is built-in or a module. Taking
> a look at the other clocksource drivers, I found that the following drivers are
> all calling `clocksource_register_hz()` and `clockevents_config_and_register()`
> at probe time.
> 
>   timer-sun5i.c
>   sh_tmu.c
>   sh_cmt.c
>   timer-tegra186.c
>   timer-stm32-lp.c (only calls clockevents_config_and_register())
> 
> So this concern is unrelated to building these drivers are modules. Please let
> me know if I'm missing something here.

We would have to check each platform individually to answer this question.

The interaction between cpuidle and the timer module is about not having a
broadcast timer when cpuidle initializes and then having it later when the
module is loaded. Did you check the deep idle states are used after loading the
module ?

> >  * the timekeeping may do jump in the past [if and] when switching the
> > clocksource
> 
> Can you clarify how this relates to modules? IIUC, the clocksource can be
> changed anytime by writing to:
> 
>  /sys/devices/system/clocksource/clocksource0/current_clocksource

The clocksource counter is stopped when it is not the current one. So when you
switch it, the new clocksource counter could be different and can make you jump
back in time.
 
> If there's a bug related to timekeeping and changing the clocksource, then that
> should be handled separately from the modularization code.

I disagree :)

The whole point is the time framework may not be totally immune against the
timer modularization. It is about identifying the corner cases where the timer
driver modularization can have an impact and set the scene to support it.
 
> For ARM64 in general, the recommendation is to use the ARM architected timer
> which is not a module and is used for scheduling and timekeeping. While the
> Exynos MCT driver can functionally be used as the primary clocksource, it's not
> recommended due to performance issues. So building the MCT driver as a kernel
> module really shouldn't be an issue and has been thoroughly testing on several
> generations of Pixel devices which is why we are trying to upstream our
> downstream technical debt (so we can directly using the upstream version of the
> Exynos MCT driver).

The discussion is not about only the Exynos MCT but as you are not the first
one asking to convert the timer driver to a module, we should check what could
be the impact on the time framework and the system in general.

Others proposed to convert to module and I asked to investigate the impact.
Nobody came back with a clear answer and there is no feedback from Thomas.


> [...]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

