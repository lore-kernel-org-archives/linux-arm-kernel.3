Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5521CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cbIfAMUyOP2hfHN9Zut4FjkO30G+jSXVdDNewdHIxc=; b=r71OrnoRikTMaEAVhLDcJ5miTa
	PZ31BsF7K0vUZqLh38KwaRbdKmw7h0Kd9zNZsTv43VwWlWKmG9MJrWfiJIKH6kPEC04VcUYSmTJuk
	66lLSyb9g7+49c+WyvZNrOVs2y3zb29qP26cO8I48D6XqXha1l2cifWfYMMtP4duBCv1l2w25UGVc
	qwSakwELR0crs2zqml0SMbUzzIn9fxBDZd3MrxRNjvx6LvNoHDd7dVSkPe5bSWn89w34vPGlqw8em
	9hB1Id7xeAHyl5yvXe7ORDc02f3KEl0GeSwPuphKRPNk6DS4AL4KIzHn5v4s4pIo8MPBMbe9kPcVx
	iY5f+tlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaln-0000000GwlB-2GX6;
	Mon, 08 Sep 2025 12:14:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZeB-0000000GXAN-3EhT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:02:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF1491692;
	Mon,  8 Sep 2025 04:02:44 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E293F63F;
	Mon,  8 Sep 2025 04:02:48 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:02:41 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 0/5] initialize SCTRL2_ELx
Message-ID: <aL630WeBwWoUGTBp@e133380.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
 <aLW5OIgv8/bvvY9E@e133380.arm.com>
 <aLXjVNCbT6YeWlSS@e129823.arm.com>
 <aLgd0/7peYBA4z87@e133380.arm.com>
 <aLgvzKeEPn325aRO@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLgvzKeEPn325aRO@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_040255_902647_EC296336 
X-CRM114-Status: GOOD (  37.52  )
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

On Wed, Sep 03, 2025 at 01:08:44PM +0100, Yeoreum Yun wrote:

[...]

> > > > Have you tested all the code paths, or are there some things that have
> > > > not been tested?
> > >
> > > I've tested for pKVM, nested and nhve and crash path
> > > (I do my best what can I do for modified path).
> >
> > Was that just confirming that the kernel boots / does not crash?
> 
> Not only that, since the my last mistake, I've check it with debugger
> too -- set the SCTLR2_ELx as I expected.
> 
> >
> > What about CPU suspend/resume and hotplug?
> 
> Of course It's done both enter/exit idle and hotplug with related kselftest test.

Were you able to step through these paths, too?

> > My concern is that most of the defined SCTLR2_ELx bits won't affect
> > kernel execution unless the corresponding hardware features are
> > actively being used -- so while we know that the patches don't break
> > the kernel, this may not prove that SCTLR2_ELx is really being
> > initialised / saved / restored / reset correctly.
> 
> That's why I've confirmed with debugger whether the SCTLR2_ELx value
> sets as I expected... personally I've done as much as I can for
> test related for SCTLR2_ELx.

OK

> > > > Since this code is not useful by itself, it may make sense to delay
> > > > merging it until we have patches for a feature that depends on SCTLR2.
> > >
> > > Whatever I pass this detiermination for maintainer.
> >
> > Sure, that's just my opinion.
> >
> > Either way, this doesn't stop anyone from building support for specific
> > features on top of this series before it gets merged.


Looking again through this series, I realised that the requirements for
this feature are not documented in booting.rst.

Does the following patch look good to you?  If so, feel free to append
it to the series (with your Reviewed-by, if you're happy with the
changes).

It's probably worth double-checking the bit numbers etc.  I wrote this
some weeks ago and then forgot about it.

--8<--

From 0f0adc70ef6c00a3f198c1f0e105b6e47f8cab3b Mon Sep 17 00:00:00 2001
From: Dave Martin <Dave.Martin@arm.com>
Date: Mon, 8 Sep 2025 11:36:21 +0100
Subject: [PATCH] docs: arm64: Document booting requirements for FEAT_SCTLR2

Support for FEAT_SCTLR2 imposes some requirments on the configuration
of traps at exception levels above the level at which the kernel is
booted.

Document them.

For now, don't document requirements on the initial state of SCTLR2_ELx
at the kernel boot exception level.  The general wording under "System
registers" appiles.  (SCTLR_ELx is similarly undocumented.)

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---

Based on v6.17-rc1

 Documentation/arch/arm64/booting.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 2f666a7c303c..e8fe1b2023a9 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -545,6 +545,16 @@ Before jumping into the kernel, the following conditions must be met:
 
    - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
 
+  For CPUs with the SCTLR2_ELx registers (FEAT_SCTLR2):
+
+  - If EL3 is present:
+
+    - SCR_EL3.SCTLR2En (bit 44) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.SCTLR2En (bit 15) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented
-- 
2.34.1


