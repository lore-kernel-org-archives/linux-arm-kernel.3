Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABCBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjWKFG+NdZEbXmAWjFBXYPvaEAdaIog/7zRlvscxd8A=; b=UCpnthOLQsVMKua9Jb5a1w/vuM
	g8DpoOqnnzX82LM+UoQr/D5dLq48AyHLcYvRLlnPRVZkjblTbk6kxI4F+tLpi7yatfXm9fDgAgpAU
	htrBFUefW94Ao7Gi1qcCrJUF5bIh1fvdHjGXLoDbJtK8/tAk7zHdKH6Fyh/ggcFxlhF0tee2G7n21
	C4lY8m+OT6Qt1Fc0kAcAcPZCKO/2kQ7OANDNL2KrxmXzG3Yty+0EmM5XAA+/DSEWJ3/yN3pLSxAwT
	42mm1b/BVHqrExz8DraZPfgRD9AjiYmjPiOC07HQ2JNgylHv+jlwVJ4DS53TNXuVnnrOBDOgPMyXq
	OsW+elkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9o2-0000000Gg04-0DZP;
	Thu, 18 Sep 2025 08:15:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9nz-0000000GfzR-0eq8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:15:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ABA11A32;
	Thu, 18 Sep 2025 01:15:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 161433F673;
	Thu, 18 Sep 2025 01:15:50 -0700 (PDT)
Date: Thu, 18 Sep 2025 09:15:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v6 00/12] perf: arm_spe: Armv8.8 SPE features
Message-ID: <20250918081548.GQ12516@e132581.arm.com>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
 <20250808123913.GD3420125@e132581.arm.com>
 <aMruzdTu74rZ0RZ9@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMruzdTu74rZ0RZ9@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_011551_239515_4BBC97BE 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, Sep 17, 2025 at 02:24:29PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Aug 08, 2025 at 01:39:13PM +0100, Leo Yan wrote:
> > On Fri, Aug 08, 2025 at 12:22:57PM +0100, James Clark wrote:
> > > Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
> > > filtering, and SPE_FEAT_FDS data source filtering. The features are
> > > independent can be applied separately:
> > > 
> > >   * Prerequisite sysreg changes - patch 1
> > >   * FEAT_SPEv1p4 - patches 2 - 3
> > >   * FEAT_SPE_EFT - patch 4
> > >   * FEAT_SPE_FDS - patches 5 - 9
> > >   * FEAT_SPE_FDS Perf tool changes - patches 10 - 12
> > > 
> > > The first two features will work with old Perfs but a Perf change to
> > > parse the new config4 is required for the last feature.
> > 
> > I tested FEAT_SPE_EFT (xxx_filter_mask), inv_data_src_filter
> > and inv_event_filter, all of them work as expected.
> > 
> > Tested-by: Leo Yan <leo.yan@arm.com>
> 
> Please let me know when I can merge the tools/perf bits.

Thanks for bringing up this, Arnaldo!

Just remind, James sent the latest series is v8 [1] couple weeks ago,
and I confirmed v8 can apply clearly on the latest mainline kernel.
We need kernel maintainers' review so can move forward.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org/

