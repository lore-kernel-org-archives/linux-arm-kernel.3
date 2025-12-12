Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA830D59D77
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnfb2OY91yan/V6dPjm/vzPs3tmNecd045SL8SSrkKE=; b=qOhwAailZGTy344Djaf83rwVTl
	iV5WmNvDzRB0CbdxyOVBuLp/Loihd9cKnKSdfJZhM4IK5aO66zBJ/fsqynb6YKRmFQQOeodJQe8w+
	30PRakpoFLHoIRK+P38sW1e+HOMXFZ1n0RK0t6sQ8/zZil1BZ/P9LK0jbTJe2FIDeR//c2F0kOJiZ
	LPzCQZJYIN1KbCvIhaO6pDy8TjyLIldJYdAB1PJi7Q9iULtGZcIqjJrXyMCZR6B5JlYLfIFamCqxu
	VIIqyZ0ne25NnYS2GI4711RSUv2XG6XZAeEKw3YQw4629qiPnqQ3L+c/PEF/3samId0+YTA2zWFkK
	4dLq/JCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU65D-00000000qKs-3ZTE;
	Fri, 12 Dec 2025 16:33:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU656-00000000qKE-0Ies
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 16:33:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 625C41063;
	Fri, 12 Dec 2025 08:33:12 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A298D3F762;
	Fri, 12 Dec 2025 08:33:15 -0800 (PST)
Date: Sat, 13 Dec 2025 01:33:06 +0900
From: Mark Rutland <mark.rutland@arm.com>
To: Ben Niu <BenNiu@meta.com>
Cc: catalin.marinas@arm.com, will@kernel.org, tytso@mit.edu,
	Jason@zx2c4.com, linux-arm-kernel@lists.infradead.org,
	niuben003@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: Withdraw [PATCH] tracing: Enable kprobe tracing for Arm64 asm
 functions
Message-ID: <aTxDwiqIhGG1NkUl@J2N7QTR9R3>
References: <20251027181749.240466-1-benniu@meta.com>
 <aQIltqoIVDwh4A6p@J2N7QTR9R3>
 <aQKpDIYwO9VTP7qM@meta.com>
 <aQNbjap69C6inZwb@J2N7QTR9R3>
 <aQOpd14RXnyQLOWR@meta.com>
 <aRr6Ll7h29dpt7zz@J2N7QTR9R3>
 <aTnVEdv2j5ur48aF@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTnVEdv2j5ur48aF@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_083324_178262_135809E2 
X-CRM114-Status: GOOD (  25.56  )
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

On Wed, Dec 10, 2025 at 12:16:17PM -0800, Ben Niu wrote:
> On Mon, Nov 17, 2025 at 10:34:22AM +0000, Mark Rutland wrote:
> > On Thu, Oct 30, 2025 at 11:07:51AM -0700, Ben Niu wrote:
> > > On Thu, Oct 30, 2025 at 12:35:25PM +0000, Mark Rutland wrote:
> > > > Is there something specific you want to trace, but cannot currently
> > > > trace (on arm64)?
> > > 
> > > For some reason, we only saw Arm64 Linux asm functions __arch_copy_to_user and
> > > __arch_copy_from_user being hot in our workloads, not those counterpart asm
> > > functions on x86, so we are trying to understand and improve performance of
> > > those Arm64 asm functions.
> > 
> > Are you sure that's not an artifact of those being out-of-line on arm64,
> > but inline on x86? On x86, the out-of-line forms are only used when the
> > CPU doesn't have FSRM, and when the CPU *does* have FSRM, the logic gets
> > inlined. See raw_copy_from_user(), raw_copy_to_user(), and
> > copy_user_generic() in arch/x86/include/asm/uaccess_64.h.
> 
> On x86, INLINE_COPY_TO_USER is not defined in the latest linux kernel and our
> internal branch, so _copy_to_user is always defined as an extern function
> (no-inline), which ends up inlining copy_user_generic. copy_user_generic
> executes FSRM rep movs if CPU supports it (our case), otherwise, it calls
> rep_movs_alternative, which issues plain movs to copy memory.

> > Have you checked that inlining is not skewing your results, and
> > artificially making those look hotter on am64 by virtue of centralizing
> > samples to the same IP/PC range?
> 
> As mentioned above, _copy_to_user is not inlined on x86.

Thanks for confirming!

> > Can you share any information on those workloads? e.g. which callchains
> > were hot?
> 
> Please reach out to James Greenhalgh and Chris Goodyer at Arm for more details
> about those workloads, which I can't share in a public channel.

If you can't share this info publicly, that's fair enough.

Please note that upstream it's hard to justify changing things based on
confidential information. Sharing information with me in private isn't
all that helpful as it would not be clear what I could subsequently
share in public.

The reason that I've asked is that it would be very interesting to know
whether there's a specific subsystem, driver, or code path that's
hitting this hard, because a better option might be "don't do that", and
attempt to avoid the uaccesses entirely (e.g. accessing a kernel alias
with get_user_pages()).

If there's anything that you can share about that, it'd be very helpful.

Mark.

