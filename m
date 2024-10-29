Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32977D3A67F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7mBby3UjMYegWNb8L+VEboqcA8KSaUyZJq/i3wPHB8=; b=jdmE3HLde6PRQULvM5CU+FHNnC
	da8DwX/L0Avh6iFW6+TZjM1ym/HHitYvROARg1LNtiNjmQcg4G2k3nW4+HzPuxHVyMd04alIr0jWQ
	tMb3UGPkGG8yfvaD7ZAXhdFtmWAYsqJptnz9X/iUQgEtEZ4qh5MIUz8SRY7xQuODFVfeg872j6uFQ
	4DWxfBCm02c6yC/Orm6j5t+mjobnq265oBiKAOfkr+qIw6/kT/JkLrWc9FZXCBdCgwYmLbebP9P0K
	lZCH6AReyWv8hYlpTPzhMdK/gZkyGAcMHBIrZVsSi5Kiyf0s5F5EbKwbqtvyl+Lv7/ujFnBZCrs1g
	hRCPr5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDq-0000000FWlY-1TOx;
	Tue, 29 Oct 2024 18:45:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oxp-0000000F6AH-0H3y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:21:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515E0497;
	Tue, 29 Oct 2024 09:21:30 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94C793F73B;
	Tue, 29 Oct 2024 09:20:58 -0700 (PDT)
Date: Tue, 29 Oct 2024 16:20:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
Message-ID: <ZyELaIMQVRTULKXi@J2N7QTR9R3.cambridge.arm.com>
References: <20241001043602.1116991-1-anshuman.khandual@arm.com>
 <20241001043602.1116991-4-anshuman.khandual@arm.com>
 <ZxfGAHAn6I41ZLZV@J2N7QTR9R3>
 <2310454a-99c6-4ff9-80f7-8707fbfaf5a6@arm.com>
 <Zx-H8IU2wZmyowGe@J2N7QTR9R3>
 <f65af1fe-b500-499e-84dd-954700583475@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f65af1fe-b500-499e-84dd-954700583475@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_092101_212137_98BF7BB9 
X-CRM114-Status: GOOD (  30.98  )
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

On Tue, Oct 29, 2024 at 01:06:38PM +0530, Anshuman Khandual wrote:
> On 10/28/24 18:17, Mark Rutland wrote:
> > On Wed, Oct 23, 2024 at 01:01:52PM +0530, Anshuman Khandual wrote:
> >> On 10/22/24 21:04, Mark Rutland wrote:

> >>> I assume this is intended to protect the bank in sequences like:
> >>>
> >>> 	MSR	MDSELR, <...>
> >>> 	ISB
> >>> 	MRS	<..._, BANKED_REGISTER
> >>
> >> Correct, it is protecting the above sequence.
> >>
> >>> ... but is theat suffucient for mutual exclusion against
> >>> exception handlers, or does that come from somewhere else?
> >>
> >> Looking at all existing use cases for breakpoint/watchpoints, it should
> >> be sufficient to protect against mutual exclusion. But thinking, do you
> >> have a particular exception handler scenario in mind where this might
> >> still be problematic ? Will keep looking into it.
> > 
> > Where does the mutual exclusion come from for the existing sequences?
> 
> Bank selection followed by indexed read/write, inherently requires mutual
> exclusion (ensuring that both these steps executed together) in order to
> prevent read/write into wrong registers. That being said, HW breakpoints
> get used in multiple different places such as perf, ptrace, debug monitor
> based single stepping etc calling platform functions which operate on the
> HW breakpoint registers here.

Yes; that's *why* I'm asking. 

> preempt_disable()/enable() sequence in the very last leaf level helpers
> such as [read|write]_wb_reg(), will ensure required mutual exclusion.

I do not believe that this assertion is correct.

I specifically gave the example of mutual exclusion against exception
handlers, and preempt_disable() ... preempt_disable() does not prevent
exceptions being taken, so disabling preemption *cannot* be sufficient
to provide mutual exclusion against exception handlers.

What prevents a race with an exception handler? e.g. 

* Does the structure of the code prevent that somehow?

* What context(s) does this code execute in?
  - Are debug exceptions always masked?
  - Do we disable breakpoints/watchpoints around (some) manipulation of
    the relevant registers?

> > We should be able to descrive should be able to describe that in the
> > commit message or in a comment somewhere (or better, with some
> > assertions that get tested).
> 
> Planning to add a comment - something like this both for read and write
> helpers.
>        /*
>         * Bank selection in MDSELR_EL1, followed by indexed read from
>         * [break|watch]point registers cannot be interrupted, as that
>         * might cause misread from wrong targets. Hence this requires
>         * mutual exclusion via preventing any preemption.
>         */

As above, I do not believe this is correct. At minimum, disabling
preemption is not the full story here.

> But regarding adding assertions, could you give some more details and
> it will be great to have some relevant examples as well.

I've given some suggestions above. Please go and read the code and
figure this out.

> > For example, what prevents watchpoint_handler() from firing in the
> > middle of arch_install_hw_breakpoint() or
> > arch_uninstall_hw_breakpoint()?
> 
> If perf is the only user, watchpoint_handler() will not get triggered
> without watchpoints being installed via arch_install_hw_breakpoint().
> Similarly once they get uninstalled via arch_uninstall_hw_breakpoint()
> there will not be active watchpoints to trigger the handler. Although
> there are other users (ptrace, debug monitor etc) besides perf which
> could also be active simultaneously and race with each other ? TBH, I
> am not sure.

Please go and read the code and figure this out.

> > Is the existing code correct?
> 
> I have not tested the concurrency aspects of the HW breakpoints enough
> to be able to answer that question. But if there is a particular concern
> here, happy to look into that.
> 
> But wondering how does this new bank indexed read/write mechanism (after
> taking care of the mutual exclusion in the leaf level helpers such as
> [read| write]_wb_reg()) still makes the existing concurrency situation
> worse off than earlier ?

Please go and read the code and figure this out.

Mark.

