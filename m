Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DABBC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMY+4H/z2q19QD4opz1CCCp9/ZHn34YioBRdWGIzFGI=; b=TXbmvwE+TpiHcGchhJqoh+9niG
	ZPUJ0/RCikV/JBnRZ7J8CcCTcY4xqU5XLi73fxao0HlpSRYsQhzV4wC5HjxHqrgsSgS5VfNRjpgoW
	yu95QhLKKNVULzSspQ51h4qwxQJqtuaWiuuzaFtoJA7BlwAytkB8eRE7D/N5TpddDrY+6kTJkKR9M
	yIcnK/8vQ650fOIyfeoLsx5oVv3XsvDN2RxPq5dla4+0J3XDlvXqCZqOP7Hd2HhyVCRVLKPlEhqxC
	XNR7ZPZde4vUK282rh9oN8mRLi++Z3ewyy0AUOkCkop7MHaqdpGXeJEVXuMbg+UqITvWvcw5enxFn
	tA1FoczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5n-00000004YGJ-3zEJ;
	Tue, 04 Mar 2025 12:09:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQOf-00000004OQB-3RMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF6BC5C4A8D;
	Tue,  4 Mar 2025 11:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30551C4CEE5;
	Tue,  4 Mar 2025 11:25:08 +0000 (UTC)
Date: Tue, 4 Mar 2025 11:25:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v20 00/11] arm64/perf: Enable branch stack sampling
Message-ID: <Z8bjEm_neWdMBNYv@arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
 <174080569248.3208873.17639032755999041028.b4-ty@kernel.org>
 <CAL_JsqLijFG1PFkqKk7hXzC=aj70OLQsXwC280QsCO=PnCVZYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLijFG1PFkqKk7hXzC=aj70OLQsXwC280QsCO=PnCVZYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_032513_907404_816BFA28 
X-CRM114-Status: GOOD (  17.98  )
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

On Mon, Mar 03, 2025 at 10:44:21AM -0600, Rob Herring wrote:
> On Sat, Mar 1, 2025 at 1:05 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, 18 Feb 2025 14:39:55 -0600, Rob Herring (Arm) wrote:
> > > This series enables perf branch stack sampling support on arm64 via a
> > > v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> > > on BRBE can be found in the Arm ARM[1] chapter D18.
> > >
> > > I've picked up this series from Anshuman. v19 and v20 versions have been
> > > reworked quite a bit by Mark and myself. The bulk of those changes are
> > > in patch 11.
> > >
> > > [...]
> >
> > Applied cleanups to will (for-next/perf), thanks!
> >
> > [01/11] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
> >         https://git.kernel.org/will/c/04bd15c4cbc3
> > [02/11] perf: arm_pmu: Don't disable counter in armpmu_add()
> >         https://git.kernel.org/will/c/dcca27bc1ecc
> > [03/11] perf: arm_pmuv3: Don't disable counter in armv8pmu_enable_event()
> >         https://git.kernel.org/will/c/4b0567ad0be5
> > [04/11] perf: arm_v7_pmu: Drop obvious comments for enabling/disabling counters and interrupts
> >         https://git.kernel.org/will/c/7a5387748215
> > [05/11] perf: arm_v7_pmu: Don't disable counter in (armv7|krait_|scorpion_)pmu_enable_event()
> >         https://git.kernel.org/will/c/7bf1001e0d91
> > [06/11] perf: apple_m1: Don't disable counter in m1_pmu_enable_event()
> >         https://git.kernel.org/will/c/c2e793da59fc
> > [07/11] perf: arm_pmu: Move PMUv3-specific data
> >         https://git.kernel.org/will/c/dc4d58a752ea
> 
> I don't know if you looked at the thread on patch 11 and said "long
> discussion, I'll assume a new version is coming. Next!" because that's
> what I would do. In this case though, there's not any changes.

I do this as well ;). But I think Will is waiting for Mark R to look at
the rest of the series.

-- 
Catalin

