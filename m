Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10698C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBtmCipIZJ72gYb70P6hLcPGIVyWxoMAEiePXE20wWI=; b=Wqj5sCu8NozeH14d48yxQC1tzK
	r1kwVk2ja7B1un3YhjhIqXkqyhxIUnpQ6JaA7bWPJ20w+T89PvyU8x4pCX25bxgmam1fHb+erpNAO
	Yf+J/3dXXBIeDOmn/xlavXAwyPuaxNUUDHlgBPd9dmjyXIDdZraz019ySvXwdvF178vkua3favxCm
	7i81Dnwlft40WYf4xkDhcVCWxJet7j32ReHrtuJo7Xh4p4tSG8a9vvDTzI3ZE1uOdjJCBNcGwMJKX
	1d3vmoGTHIYDv5zAJXV1wpwS6ziY8oxfnamx9baRRaIjjDx9yRHgD24oIZDrNdzM0YRHsp/SBtxnf
	62+3i+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgT1-0000000GE8j-2V90;
	Thu, 29 May 2025 16:50:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgQs-0000000GDyd-0zyQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 16:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE3211764;
	Thu, 29 May 2025 09:48:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3FA03F673;
	Thu, 29 May 2025 09:48:40 -0700 (PDT)
Date: Thu, 29 May 2025 17:48:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 00/11] perf: arm_spe: Armv8.8 SPE features
Message-ID: <20250529164839.GN2566836@e132581.arm.com>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_094842_322976_557BC1A9 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, May 29, 2025 at 12:30:21PM +0100, James Clark wrote:
> Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
> filtering, and SPE_FEAT_FDS data source filtering. The features are
> independent can be applied separately:
> 
>   * Prerequisite sysreg changes - patches 1 - 2
>   * FEAT_SPEv1p4 - patch 3
>   * FEAT_SPE_EFT - patch 4
>   * FEAT_SPE_FDS - patches 5 - 8
>   * FEAT_SPE_FDS Perf tool changes - patches 9 - 11
> 
> The first two features will work with old Perfs but a Perf change to
> parse the new config4 is required for the last feature.

I tested the load_filter_mask / store_filter_mask (FEAT_SPE_EFT) and
data_src_filter (SPE_FEAT_FDS), all of them work as expected.

Tested-by: Leo Yan <leo.yan@arm.com>

