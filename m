Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59EEC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKsJBpnLk/08e874ONiX4VGfefkwWilar7u3v3aQIIc=; b=FkoBZ1a3JQUwPSSE5/MND9L1oL
	Gzt8WdA7o4WXHRCBm2grv6OwqbNiWfLdPNLWfbYfBRuA/4a/N6f0RiLTuqHyabMr81tQP2Iq+dykd
	IogGPlFrWQZKZgAfVotMkmD1LwP3V+uLpv8ybaIcAEIcJIGLlUAUKgHu29z9skd1BmTMpl4ftyqh7
	++UfWlYUHYFi6iHYcpUQ6D+fXvy9OCFFNB0G5GfLvc/A6rICVOHLngiIi/Gm3cV9rmNVQhXGKjDf1
	uZZtj0jX6WnEjuoFdNtPKMmQFOSCUdB06k0F8mm8mJuEq6DtAOiLnd8nB/zwV18yfDeyQRT5iYcOD
	1n/b2Tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKg6S-0000000GBJf-2BNK;
	Thu, 29 May 2025 16:27:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKg4K-0000000GB7z-2duG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 16:25:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED9E2176A;
	Thu, 29 May 2025 09:25:04 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85B843F673;
	Thu, 29 May 2025 09:25:18 -0700 (PDT)
Date: Thu, 29 May 2025 17:25:13 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v22 2/5] arm64: el2_setup.h: Make __init_el2_fgt labels
 consistent, again
Message-ID: <aDiBuC2JjAUNDq29@e133380.arm.com>
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
 <20250520-arm-brbe-v19-v22-2-c1ddde38e7f8@kernel.org>
 <aC9NhvYzajduVm7y@e133380.arm.com>
 <CAL_JsqKWY7rRGTbHXTmm4RC9F8fqrs133=75XFkVdm91bLHfaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKWY7rRGTbHXTmm4RC9F8fqrs133=75XFkVdm91bLHfaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_092524_761355_DF05CE28 
X-CRM114-Status: GOOD (  29.15  )
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

Hi,

On Thu, May 22, 2025 at 12:20:35PM -0500, Rob Herring wrote:
> On Thu, May 22, 2025 at 11:15 AM Dave Martin <Dave.Martin@arm.com> wrote:
> >
> > On Tue, May 20, 2025 at 05:27:37PM -0500, Rob Herring (Arm) wrote:
> > > From: Anshuman Khandual <anshuman.khandual@arm.com>
> > >
> > > Commit 5b39db6037e7 ("arm64: el2_setup.h: Rename some labels to be more
> > > diff-friendly") reworked the labels in __init_el2_fgt to say what's
> > > skipped rather than what the target location is. The exception was
> > > "set_fgt_" which is where registers are written. In reviewing the BRBE
> > > additions, Will suggested "set_debug_fgt_" where HDFGxTR_EL2 are
> > > written. Doing that would partially revert commit 5b39db6037e7 undoing
> > > the goal of minimizing additions here, but it would follow the
> > > convention for labels where registers are written.
> > >
> > > So let's do both. Branches that skip something go to a "skip" label and
> > > places that set registers have a "set" label. This results in some
> > > double labels, but it makes things entirely consistent.
> > >
> > > While we're here, the SME skip label was incorrectly named, so fix it.
> > >
> > > Reported-by: Will Deacon <will@kernel.org>
> > > Cc: Dave Martin <Dave.Martin@arm.com>
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > This one can be applied even if the rest of the series is not.
> > >
> > > v22:
> > >  - New patch
> > > ---
> > >  arch/arm64/include/asm/el2_setup.h | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> > > index ebceaae3c749..30f57b0334a3 100644
> > > --- a/arch/arm64/include/asm/el2_setup.h
> > > +++ b/arch/arm64/include/asm/el2_setup.h
> > > @@ -204,19 +204,21 @@
> > >       orr     x0, x0, #(1 << 62)
> > >
> > >  .Lskip_spe_fgt_\@:
> > > +
> > > +.Lset_debug_fgt_\@:
> >
> > Dangling label?  There doesn't seem to be any branch to it in this
> > series, unless I've missed something.
> 
> I tried to explain that in the commit message. To have both what you
> wanted and what Will suggested, you end up with 2 labels in between
> the last skip and setting registers.

Hmm, I wasn't trying to advocate for adding dead labels in anticipation
of their use, just to avoid labels whose names conflict with an
anticipated future use.

I guess this is harmless, but I may look at this again as and when...

Cheers
---Dave

