Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 22:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWZN46Zt1B+MuJCu8Yfkn3a8yWwd2Kx33caNQipC72Q=; b=FihkQqpX3Jz3dUGOpCr1TtZJhI
	wZYh/r8c0p/Y4OfrNUO7XnaClEgl3sqK5hK2AX89hOyANhX9hDSlayZirwIgQQF7O4XUjebsAR9OY
	ppMwrK15MBYjjBfi5A675iK9Ap/xXSoBC0IPU+b1RjNnb2vinGIHHF8zOVTJE0voJ2f3vKRvNzzxT
	m+02v8SJ8/3TECd2ZyCl4rTH5QJD1osl8zkxA49pqMunyPdRwnh/hVShEmgK4BiCb5PckTQMHu0sY
	QQFaoDbhYXAqZu6LTg6vSppbiipD2IVn5amOm1LNCvgj1LY0qvY3LDpvAWdlNT/5tKVVQCDX4sm2z
	Bs0Mq+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJP2-0000000BXS8-0Sz1;
	Mon, 16 Dec 2024 22:17:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJNv-0000000BXLL-3NmJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 22:16:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26A81113E;
	Mon, 16 Dec 2024 14:16:40 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED6B13F58B;
	Mon, 16 Dec 2024 14:16:06 -0800 (PST)
Date: Mon, 16 Dec 2024 23:15:13 +0100
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
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z2CmcelSy89NULtz@arm.com>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_141615_901413_10232D59 
X-CRM114-Status: GOOD (  14.48  )
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

On Thu, Dec 12, 2024 at 12:21:00PM +0530, Viresh Kumar wrote:
> On 06-12-24, 13:55, Beata Michalska wrote:
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 04fc786dd2c0..70df2a24437b 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -747,9 +747,14 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
> >  show_one(scaling_min_freq, min);
> >  show_one(scaling_max_freq, max);
> >  
> > -__weak unsigned int arch_freq_get_on_cpu(int cpu)
> > +__weak int arch_freq_get_on_cpu(int cpu)
> >  {
> > -	return 0;
> > +	return -EOPNOTSUPP;
> 
> I did suggest not doing this as it may not be acceptable.
> 
> https://lore.kernel.org/all/CAKohpokFUpQyHYO017kOn-Jbt0CFZ1GuxoG3N-fenWJ_poW=4Q@mail.gmail.com/
>
My bad as I must have misinterpreted that message. Although I am not entirely
sure why this might be unacceptable as it is not such uncommon approach to use
signed int space to cover both: expected positive value as well as potential
error code case failure.
Enabling the new attribute for all is an option, tough not entirely compelling
one as exposing a feature that is known not to be supported seems bit
counterintuitive. On the other hand using cpufreq driver flags won't help much
as the support for the new attrib is platform-specific, not driver-specific.

---
BR
Beata
> -- 
> viresh

