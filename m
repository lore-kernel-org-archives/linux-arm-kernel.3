Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C875C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 03:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KIw1JGQpC7MaKU2LH1yR3Wzmy24qmeDvk0zXFo5SAw=; b=c5eoPoyV8eVknp1twhnDqDDc/0
	xiDm8Glr9s3QLNngByULCcql7aCgPCWRhgIYM/edGrjvAaQIaRo0r+Eveia8pg0Fa1LR3aTf42/an
	fpPDe+J8by6SXjfpShP6isomO+6kvzIuC9iRNUcITRc5WFZGO2FgyeYGXD4kPFfLHR+WfAjKtDOB3
	s6Ti9QwgoWCT7ZbM4jG4IfYpRHM/8RD23I3Oohk1oPpt38jkjBk82BKYVHqkDbZD2leazKCbQrrD0
	7W8G046sXekBq88kjxT1ouOlxC/QwzL1Qc2WMNW9zhdykvy+89dGirAW2IicA6ODrF41qrQxCUgFF
	G9pQXuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfUBT-00000005ut8-0yp3;
	Fri, 03 Jul 2026 03:03:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfUBR-00000005urx-05xZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 03:03:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E48C422D7;
	Thu,  2 Jul 2026 20:03:08 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8940F3F673;
	Thu,  2 Jul 2026 20:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783047793; bh=efnEm+W+VtLCuut/dmb71mCG6+tWP/oTrs9sNNtx4cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjTLuIAsvwzssMNef6cyBWug9GJal49GKFuVcxgfGednLxs1e+gG5uETzE3UevRJG
	 +DU0XyVSa1Y29wcDwIHFWKVxrh9p0lS7vbrWqvRJAhxj+yHlqn6/wCF3Yhl4+tD/hu
	 HRSfa/o/e0pTJRrtWJ6Pfl//U2V5lTpdxvcE809k=
Date: Fri, 3 Jul 2026 08:33:09 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: cpufeature: Extend bbml3 support list
Message-ID: <akcmbZHGMo_56Z2R@a079125.arm.com>
References: <20260701094131.677636-1-linu.cherian@arm.com>
 <20260701094131.677636-6-linu.cherian@arm.com>
 <akZBqNTTGXch6I9n@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZBqNTTGXch6I9n@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_200317_294629_5EAE0017 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Mark,

On Thu, Jul 02, 2026 at 11:47:04AM +0100, Mark Rutland wrote:
> On Wed, Jul 01, 2026 at 03:11:31PM +0530, Linu Cherian wrote:
> > Add below cpus to the midr list, which supports
> > BBML3 but don't advertise through MMFR2 ID.
> > 
> > Cortex A520(AE)
> > Cortex A715
> > Cortex A720(AE)
> > Cortex A725
> > Neoverse N3
> > C1-Nano
> > C1-Pro
> > C1-Ultra
> > C1-Premium
> > 
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> >  arch/arm64/kernel/cpufeature.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index d754b1b7da77..9b806c1c60aa 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2142,6 +2142,15 @@ bool cpu_supports_bbml3(void)
> >  		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> >  		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> >  		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> > +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> > +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> > +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> > +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> > +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
> 
> Why do these two have a range? The commit message didn't mention this.

C1 ultra and C1 Premium has BBM related errata until r1p0.
Will mention that in commit message.

Thanks,
Linu Cherian.


