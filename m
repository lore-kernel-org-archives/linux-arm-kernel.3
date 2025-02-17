Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11331C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrtkyRmrhRGlL8wdnAEtLnAgVfwK5XB6OxNOY4o46+E=; b=3GY5j6sOr8szTgD/EB5W1d28C9
	ojBZI0pZ6+oSfGXBNxCuaQQl//Y6iJVQqEV1gtJ2UKNOsPDcQhAvOKEWqEtJoPmkIWL+SmOTt8S77
	v0I40KLOs1p+t5o7QTNgNt1OK3rqbT9hy9gSAxCfdaXvKSINvaArQwBgkLQbwdeQhjrsdl6Aj8w8j
	KYfBdJYlP6mdUqxThaBxaNBrsy5E7xOpsR/Kqg+TQpBg9FC+Z/x2EK0/0BWvjHF8al2DpBprveDru
	SK/wnQXjo7FvXZkoqhPaej7kzpQXcU5fxLQL9JMCcqnOH/cPJgHd1c39p/pxCuDo1ujxpIjaGB26p
	hKp/xPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4oe-00000005Qx2-3vFq;
	Mon, 17 Feb 2025 17:21:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3cr-00000005CPQ-2Pfa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:05:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE99152B;
	Mon, 17 Feb 2025 08:06:00 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 561253F5A1;
	Mon, 17 Feb 2025 08:05:37 -0800 (PST)
Date: Mon, 17 Feb 2025 16:05:34 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<will@kernel.org>, <viresh.kumar@linaro.org>, <sumitg@nvidia.com>,
	<yang@os.amperecomputing.com>, <vanshikonda@os.amperecomputing.com>,
	<lihuisong@huawei.com>, <zhanjie9@hisilicon.com>,
	<ptsm@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z7NeTrorAqDxa8QM@bogus>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-3-beata.michalska@arm.com>
 <CAJZ5v0g+yax=pT4m_2MTd9kUwbk5VBp2wkctTYJpFRU3myEjPQ@mail.gmail.com>
 <Z7NOcd3IamyMTjbH@arm.com>
 <Z7NQrBvnfYwXva1W@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7NQrBvnfYwXva1W@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_080541_705126_FAC14DCD 
X-CRM114-Status: GOOD (  31.81  )
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

On Mon, Feb 17, 2025 at 03:07:24PM +0000, Ionela Voinescu wrote:
> Hi Catalin,
> 
> On Monday 17 Feb 2025 at 14:57:53 (+0000), Catalin Marinas wrote:
> > On Mon, Feb 17, 2025 at 12:52:44PM +0100, Rafael J. Wysocki wrote:
> > > On Fri, Jan 31, 2025 at 5:25 PM Beata Michalska <beata.michalska@arm.com> wrote:
> > > >
> > > > Currently the CPUFreq core exposes two sysfs attributes that can be used
> > > > to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> > > > and scaling_cur_freq. Both provide slightly different view on the
> > > > subject and they do come with their own drawbacks.
> > > >
> > > > cpuinfo_cur_freq provides higher precision though at a cost of being
> > > > rather expensive. Moreover, the information retrieved via this attribute
> > > > is somewhat short lived as frequency can change at any point of time
> > > > making it difficult to reason from.
> > > >
> > > > scaling_cur_freq, on the other hand, tends to be less accurate but then
> > > > the actual level of precision (and source of information) varies between
> > > > architectures making it a bit ambiguous.
> > > >
> > > > The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> > > > distinct interface, exposing an average frequency of a given CPU(s), as
> > > > reported by the hardware, over a time frame spanning no more than a few
> > > > milliseconds. As it requires appropriate hardware support, this
> > > > interface is optional.
> > > >
> > > > Note that under the hood, the new attribute relies on the information
> > > > provided by arch_freq_get_on_cpu, which, up to this point, has been
> > > > feeding data for scaling_cur_freq attribute, being the source of
> > > > ambiguity when it comes to interpretation. This has been amended by
> > > > restoring the intended behavior for scaling_cur_freq, with a new
> > > > dedicated config option to maintain status quo for those, who may need
> > > > it.
> > > 
> > > In case anyone is waiting for my input here
> > > 
> > > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > > 
> > > for this and the previous patch and please feel free to route them
> > > both through ARM64.
> > 
> > Thanks Rafael. I indeed plan to take them through the arm64 tree.
> 
> Just a mention that this set depends on the patch that Beata linked at
> [6]. That patch applies cleanly on next-20250217 and it still
> builds/boots/works as expected.
> 

Ah I see it is indeed dependent. Just responded on the other thread before
reading this. So it is better if Catalin picks up [6] as well. Sorry for
the confusion.

-- 
Regards,
Sudeep

[6] https://lore.kernel.org/all/20240827154818.1195849-1-ionela.voinescu@arm.com/

