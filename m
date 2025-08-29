Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B711DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fwpETSg9jVOFAoRPzNjzHDwqKnSiB7mVIJJLH1u1kk=; b=xYhpJcT18oZ/AKak8osOWnd4Sl
	y6rqh2I67Wwv3zqpBMY8rfrBKpeGFoTkW00tnvhE01AqK7LT0XWLASsoos94dMpQatgdyXzp+j6Vy
	yZcOmzxOC8CojG6tAsjrDqtcNs7c/eoU/CP0PIeMS3CE7do/yVnLB365l+K2pZtcYkedvCw/OWqnV
	1w4Lz825OVU0RQqC1nYCmaW8R+1eIrZu6f0Rsf4XMy4VwRRbyVG9tcmVg7SPavhgyZdkmWWUvZ2Vk
	7Bm2COED1VtpS5RYyhKCWi25HVRQmJ+vd7/xTB85R3L9Jk1Fth/mdipOry3DZXy0zYyxz4Ck7jjSU
	RKYc+cKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruZV-00000004zWI-1FXu;
	Fri, 29 Aug 2025 08:34:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru1q-00000004s6P-07SF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:00:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0213A1BCB;
	Fri, 29 Aug 2025 00:59:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E16DC3F694;
	Fri, 29 Aug 2025 01:00:06 -0700 (PDT)
Date: Fri, 29 Aug 2025 09:00:05 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 00/15] perf arm-spe: Support new events in FEAT_SPEv1p4
Message-ID: <20250829080005.GE745921@e132581.arm.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_010010_113377_E443797E 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Will,

On Thu, Jul 31, 2025 at 02:25:35PM +0100, Leo Yan wrote:
> This series adds support for new event types introduced in Arm SPE v1.4.
> 
> The first two patches modify the SPE driver to expose 'event_filter'
> entry in SysFS caps folder. These patches are part of James' series
> "[PATCH v5 00/12] perf: arm_spe: Armv8.8 SPE features" [1]. In case this
> series will be merged independently of James' series, these patches have
> have been included here.

Could you review the first two patches in this series for Arm SPE driver
change?

I verified this series can be applied cleanly on the Linux master
branch with the latest commit:

  07d9df80082b ("Merge tag 'perf-tools-fixes-for-v6.17-2025-08-27' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools")

Thanks,
Leo


> [1] https://lore.kernel.org/linux-arm-kernel/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org/

