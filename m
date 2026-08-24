Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00CCC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iliDBqjEx4orC+pbVHq7+cD2NLWm0bEnhWlr15LeCas=; b=T0LxZs7KBT7cxzP+mx8h4CPPQP
	PL0NVnw4pOP8pbOhknwBWMXrDjL/BmzZrHQiosVg4U7/wAC+xrEDsHLlO3fjgKlDH1lc81TjdnF/4
	gcQAjKf6gdHANb4AVh/GX5ariE+kHqjLPSfLmwn1shYjy5WOCmOLcVe59iD3ZEqSd2DoRbY21cYqz
	aGjXVqzWTEX4rwCUe93s94zEmq/gv5dHuwvFZHvTL9tDDC5BTmOCO7MorVlchLaA2vWzTJUpJ/FvM
	m5No9CzxoIeJUkSIhBx/BqQpCsKVSAU9WZlw7FbB4xyc/mPITJXzITpPR9EMOzcWKTNP64pEnQiq7
	ONABijfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQh0-0000000GHRa-2sWJ;
	Mon, 24 Aug 2026 09:10:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQgx-0000000GHQk-3ci1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:10:09 +0000
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id 424BB20B7167; Mon, 24 Aug 2026 02:09:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 424BB20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787562574;
	bh=iliDBqjEx4orC+pbVHq7+cD2NLWm0bEnhWlr15LeCas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNJxgyEuuV+r+D6dEYGvhkwoRyH7nCEtAdiYs6pf+77V8nnT5vUZ/1KTdIIA49BsE
	 RM3HvSocIRSMdYdoEJEj+CEEvg9ACpDO+lu2AFNMgRSqlZQTjXZgcRM+LBZ5RvW/KV
	 J0w7SJbvybh0H3KwGLOYfWQLv7LiPfbsGRhYWWIs=
Date: Mon, 24 Aug 2026 02:09:34 -0700
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>,
	Shradha Gupta <shradhagupta@microsoft.com>
Subject: Re: [RFC PATCH 0/2] arm64/hyperv: Enable kexec reboot support
Message-ID: <aowKTktjAeA9H9/W@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
 <aoglGZD7ntLJkmcO@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoglGZD7ntLJkmcO@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_021007_932012_BB50E2BE 
X-CRM114-Status: GOOD (  18.12  )
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

On Fri, Aug 21, 2026 at 11:14:49AM +0100, Catalin Marinas wrote:
> On Fri, Aug 14, 2026 at 02:31:28AM -0700, Shradha Gupta wrote:
> > Kexec reboot consistently fails on ARM64 Hyper-V guests (Azure VMs).
> > During the kexec shutdown path, VMBus channels are never cleaned up,
> > so in the fresh kexec kernel startup hv_acpi_init() blocks because
> > the hypervisor still holds the old kernel's VMBus session open.
> > 
> > This is because ARM64 lacks the VMBus teardown that x86 performs during
> > kexec via hv_machine_shutdown(). On x86, machine_ops.shutdown is
> > overridden to send CHANNELMSG_UNLOAD and disable SynIC before CPUs
> > go offline. ARM64 has no equivalent mechanism.
> 
> I'm really not keen on such hook, a bare pointer you set elsewhere. Not
> sure it was discussed before but can you not use the syscore_shutdown()
> mechanism? This hook got added in 2023, so the 2022 discussion you
> referenced precedes it.
> 
> -- 
> Catalin

Thanks for the suggestion, Catalin.

I looked into syscore_shutdown() and it should work. The
syscore_shutdown() call in the kexec path runs after
device_shutdown() and before smp_shutdown_nonboot_cpus(),
which is exactly the window where VMBus teardown needs to happen.
It does run before cpu_hotplug_enable() (unlike the x86 path
where hv_kexec_handler runs inside machine_shutdown, after
cpu_hotplug_enable), but that should be safe because
cpuhp_remove_state() acquires cpus_read_lock, which should be
independent of the cpu_hotplug_disabled flag.

The implementation would override hv_setup_kexec_handler() in
arch/arm64/hyperv/mshyperv.c to register a syscore_ops.shutdown
callback, guarded by kexec_in_progress. No ARM64 arch changes needed,
and other shutdown paths (reboot, halt, poweroff, kdump) should also be
unaffected.

I am testing this now and will send a v2 with the updated approach.

Shradha


