Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BDED111BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeZtCRsJiGg3sIw0SoJtWiCQvYy7NOZbjLLFDcQsrN4=; b=SPsSWc7OnhpqpYZEou6GbPeJVk
	nWmQ+UdPpvvr4QLz1w0dPI1Bk5ijGZDndLS3u2HkY03/FnevKROpcJbYo73I3DN/GfEbZIJCxcEkx
	WaE4zW7YTNR7Y6El0HYdcQNjFv8detBk3vP0TEvDe0k0tRl48cplyZdYrlai4OAAouBiMM6KFOEys
	eVNwI8cCzv6hCtU3PSD4UuPBTxQTE+Yb9xwHUIfaOXLnAQM6YpnQidno9KbAB8PvVbvqeUJmq+LK3
	01ivfRua5XR6Czw7kNZjBknOgDZaVMKPWGJrhIN3poSMiYTq/eZqXQeAkcIoxX/EugYJsvGdPuXoL
	fGeWysbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s37-0000000CusI-0Ykv;
	Mon, 04 Nov 2024 08:02:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s0l-0000000CubW-3du8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:00:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF54DFEC;
	Mon,  4 Nov 2024 00:01:00 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B2A3F6A8;
	Mon,  4 Nov 2024 00:00:27 -0800 (PST)
Date: Mon, 4 Nov 2024 09:00:00 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v7 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Zyh_ACbOkSsjcPX3@arm.com>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-2-beata.michalska@arm.com>
 <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_000032_012539_5E361B6B 
X-CRM114-Status: GOOD (  29.75  )
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

On Tue, Oct 29, 2024 at 12:34:29PM +0530, Viresh Kumar wrote:
> Apologies for the delay from my side. September was mostly holidays
> for me and then I was stuck with other stuff plus email backlog and
> this series was always a painful point to return to :(
Thanks for getting back to me on this one!
> 
> On 13-09-24, 14:29, Beata Michalska wrote:
> > Currently the CPUFreq core exposes two sysfs attributes that can be used
> > to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> > and scaling_cur_freq. Both provide slightly different view on the
> > subject and they do come with their own drawbacks.
> > 
> > cpuinfo_cur_freq provides higher precision though at a cost of being
> > rather expensive. Moreover, the information retrieved via this attribute
> > is somewhat short lived as frequency can change at any point of time
> > making it difficult to reason from.
> > 
> > scaling_cur_freq, on the other hand, tends to be less accurate but then
> > the actual level of precision (and source of information) varies between
> > architectures making it a bit ambiguous.
> > 
> > The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> > distinct interface, exposing an average frequency of a given CPU(s), as
> > reported by the hardware, over a time frame spanning no more than a few
> > milliseconds. As it requires appropriate hardware support, this
> > interface is optional.
> 
> From what I recall, the plan is to:
> - keep cpuinfo_cur_freq as it is, not expose for x86 and call ->get()
>   for ARM.
> 
> - introduce cpuinfo_avg_freq() and make it return frequency from hw
>   counters for both ARM and Intel and others who provide the API.
> 
> - update scaling_cur_freq() to only return the requested frequency or
>   error in case of X86 and update documentation to reflect the same.
>   Right now or after some time ? How much time ?
> 
>   Rafael ?
>
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 04fc786dd2c0..3493e5a9500d 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -752,6 +752,16 @@ __weak unsigned int arch_freq_get_on_cpu(int cpu)
> >  	return 0;
> >  }
> >  
> > +__weak int arch_freq_avg_get_on_cpu(int cpu)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
> > +{
> > +	return arch_freq_avg_get_on_cpu(policy->cpu) >= 0;
> > +}
> 
> And why aren't we simply reusing arch_freq_get_on_cpu() here ?
We need a way to discover whether the new sysfs attrib is to be enabled or not.
I guess I could change the signature for arch_freq_get_on_cpu to return an error
if that functionality is not supported for given policy ?

---
Best Regards
Beata
> 
> -- 
> viresh

