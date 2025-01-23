Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C900C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5Ajll9tj8V8FZUXTPv+bK6fykPIs2haPLgwF5KaizM=; b=HCSed0DWiWSbReLTwM7cY39uIW
	EO5SVniOtEuDbxsqUhd8d3S6EnlhEQoJI/BiiMaO6ZSCx6dMO27Af69qrdEhhTF/aHUgCUxhnVna2
	N5QXphnTfQCcziJ3P5RWuFXBdTCzXBt43wHvXQ5KOWgNMy4OW+jHXiFUNLAzJH0VCuXa1i+igGYGy
	2DP4iYg65/I9fSXF5XgTZOn7fSZT6T4sgzD4iwMFF4qNU1XHNoO9xqIqSL4jRdTwR4bg2nqm7bp7H
	fgglUBn2NItJEmL9gM57LWvsG2yAK315h4VwAPXXR5ht9siJ/uo44CrmyYi55HXSVkssYXYLDWz/u
	Xr1pcyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb54b-0000000DLI1-08c3;
	Thu, 23 Jan 2025 21:49:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb53I-0000000DLC1-3eVO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:47:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 849D51063;
	Thu, 23 Jan 2025 13:48:20 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 489A93F66E;
	Thu, 23 Jan 2025 13:47:47 -0800 (PST)
Date: Thu, 23 Jan 2025 22:47:07 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z5K42yXtcDSZGuUF@arm.com>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-3-beata.michalska@arm.com>
 <20250121105355.sdrgmjv2w2256qfn@vireshk-i7>
 <Z4-6bsDzfe9CLcVf@arm.com>
 <20250122060902.5pgfr5g24jpjrxw3@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122060902.5pgfr5g24jpjrxw3@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_134752_956958_B68051AD 
X-CRM114-Status: GOOD (  25.25  )
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

On Wed, Jan 22, 2025 at 11:39:02AM +0530, Viresh Kumar wrote:
> On 21-01-25, 16:17, Beata Michalska wrote:
> > On Tue, Jan 21, 2025 at 04:23:55PM +0530, Viresh Kumar wrote:
> > > On 21-01-25, 08:44, Beata Michalska wrote:
> > > > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > > > index 6f45684483c4..b2a8efa83c98 100644
> > > > --- a/drivers/cpufreq/cpufreq.c
> > > > +++ b/drivers/cpufreq/cpufreq.c
> > > > @@ -733,12 +733,20 @@ __weak int arch_freq_get_on_cpu(int cpu)
> > > >  	return -EOPNOTSUPP;
> > > >  }
> > > >  
> > > >  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
> > > >  {
> > > >  	ssize_t ret;
> > > >  	int freq;
> > > >  
> > > > -	freq = arch_freq_get_on_cpu(policy->cpu);
> > > > +	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
> > > > +		? arch_freq_get_on_cpu(policy->cpu)
> > > > +		: 0;
> > > > +
> > > >  	if (freq > 0)
> > > >  		ret = sysfs_emit(buf, "%u\n", freq);
> > > >  	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
> > > 
> > > Maybe this should be a separate commit ? And also I am not very happy
> > Initially it was supposed to be one, but then the rest of the series justifies
> > the changes so it made sense to send those in one go.
> > > with the new kconfig option. I don't want others to use it as we want
> > > to get rid of this for X86 too eventually. Making it a kconfig option
> > > allows anyone to enable it and then depend on it without us knowing..
> > > 
> > > Rather just write it as "if (x86)", with a comment on what we plan to
> > > do with it in few release cycles.
> > Right, those changes are based on discussion in [1].
> 
> Ahh I see.. What about making it depend on X86 for now, as we really
> don't want new users to use it ?
Do you mean the new config option? If so, it is in Kconfig.x86 already.
Unless you have smth else in mind ?

---
BR
Beata
> 
> -- 
> viresh

