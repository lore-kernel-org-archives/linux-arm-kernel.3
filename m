Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B0C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR1w2B2YW/IRMK7/rmkdjRnp6IaVcME7dFDC2bjLQYc=; b=Gp/ANZEDEAndM7VINe+6QvW0/U
	XfAvGvgw7LQfINagJwsOzsQRAvDDOv2WEJZVQjBqUT0SBw9qgOWUQ5ZrA12NWAtpfmlR7DLb8TPSc
	pAkGgAE26SdApAA+chY8hcZUzAl9tQN29MEk78ozlXMiOz1clPNVluhMCfYUSTvVItJhYV7K9TsOd
	aOyl1jKX7o7uRXfau7cv6BoLwWCtz1aKrc3gzjXlIv9sjlf0Sxu8ChfrVBEKV35l/T9v2syQN0kmb
	aE55FPaSlLuKTFP5prIkGTvCH40+1nLIIg9oTPdvaeX5j0r8cpiS4kl2MCjUmt1LnzxJ/Az7RVI5Y
	4hLsVF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5lU-00000005apt-2heZ;
	Mon, 17 Feb 2025 18:22:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5iy-00000005aJr-3fqN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 18:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CDDF9A40112;
	Mon, 17 Feb 2025 18:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C0DC4CED1;
	Mon, 17 Feb 2025 18:20:03 +0000 (UTC)
Date: Mon, 17 Feb 2025 18:20:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ionela Voinescu <ionela.voinescu@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, will@kernel.org, viresh.kumar@linaro.org,
	sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z7N90XZTICfLZCm_@arm.com>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-3-beata.michalska@arm.com>
 <CAJZ5v0g+yax=pT4m_2MTd9kUwbk5VBp2wkctTYJpFRU3myEjPQ@mail.gmail.com>
 <Z7NOcd3IamyMTjbH@arm.com>
 <Z7NQrBvnfYwXva1W@arm.com>
 <Z7NeTrorAqDxa8QM@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7NeTrorAqDxa8QM@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_102009_054784_969486CA 
X-CRM114-Status: GOOD (  33.04  )
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

On Mon, Feb 17, 2025 at 04:05:34PM +0000, Sudeep Holla wrote:
> On Mon, Feb 17, 2025 at 03:07:24PM +0000, Ionela Voinescu wrote:
> > On Monday 17 Feb 2025 at 14:57:53 (+0000), Catalin Marinas wrote:
> > > On Mon, Feb 17, 2025 at 12:52:44PM +0100, Rafael J. Wysocki wrote:
> > > > On Fri, Jan 31, 2025 at 5:25 PM Beata Michalska <beata.michalska@arm.com> wrote:
> > > > >
> > > > > Currently the CPUFreq core exposes two sysfs attributes that can be used
> > > > > to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> > > > > and scaling_cur_freq. Both provide slightly different view on the
> > > > > subject and they do come with their own drawbacks.
> > > > >
> > > > > cpuinfo_cur_freq provides higher precision though at a cost of being
> > > > > rather expensive. Moreover, the information retrieved via this attribute
> > > > > is somewhat short lived as frequency can change at any point of time
> > > > > making it difficult to reason from.
> > > > >
> > > > > scaling_cur_freq, on the other hand, tends to be less accurate but then
> > > > > the actual level of precision (and source of information) varies between
> > > > > architectures making it a bit ambiguous.
> > > > >
> > > > > The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> > > > > distinct interface, exposing an average frequency of a given CPU(s), as
> > > > > reported by the hardware, over a time frame spanning no more than a few
> > > > > milliseconds. As it requires appropriate hardware support, this
> > > > > interface is optional.
> > > > >
> > > > > Note that under the hood, the new attribute relies on the information
> > > > > provided by arch_freq_get_on_cpu, which, up to this point, has been
> > > > > feeding data for scaling_cur_freq attribute, being the source of
> > > > > ambiguity when it comes to interpretation. This has been amended by
> > > > > restoring the intended behavior for scaling_cur_freq, with a new
> > > > > dedicated config option to maintain status quo for those, who may need
> > > > > it.
> > > > 
> > > > In case anyone is waiting for my input here
> > > > 
> > > > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > > > 
> > > > for this and the previous patch and please feel free to route them
> > > > both through ARM64.
> > > 
> > > Thanks Rafael. I indeed plan to take them through the arm64 tree.
> > 
> > Just a mention that this set depends on the patch that Beata linked at
> > [6]. That patch applies cleanly on next-20250217 and it still
> > builds/boots/works as expected.
> 
> Ah I see it is indeed dependent. Just responded on the other thread before
> reading this. So it is better if Catalin picks up [6] as well. Sorry for
> the confusion.

I picked that one as well. I'll do some tests and push them out later
today or tomorrow morning.

Thanks.

-- 
Catalin

