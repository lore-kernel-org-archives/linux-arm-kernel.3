Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A2FC44518
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 19:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NguD8WM1Um8VLPr5hiy0be8hoTzUMPdiSF6agQWqPvc=; b=j47tr1zyicD5tt+3X5gSJ5UjCJ
	nKOcvvFAJftS80ABAXZgQGETCcKuNfZLOLsgewLtVEuCIUXO/sCgk4IZA6651grKGeqWg2tMVvJwq
	b/A0QABko4MW06LOZkNCcNvN6Z5uXu2rsn47cC8KIzeT0c/f6C56YFNeO1YeWZKvaCmTDYo2T2S5H
	hgcohWKPCGt6KKHFP52ZfyMFor4l79ca8u5eqJamk0JAbYqbm4/YbKoH4/uTegzOn/k4OtkqrJyuX
	oSsXVQn6+pDDUg9iepgze0C/RwLbXhsh7KCxuu4GpDue5/aC0kWk0ibNWMe9hU+wVPNxje0vF9O90
	K47ZC7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRhJ-00000000Scr-29lc;
	Thu, 16 Jul 2026 19:24:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRhG-00000000ScS-3O96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 19:24:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81BB61476;
	Thu, 16 Jul 2026 12:24:32 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EDDA3F66F;
	Thu, 16 Jul 2026 12:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784229876; bh=tLfQE+sovK0Rmbekq3ZnIEFvDEsmscpFTa2E4Nbf7os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loOZX1A8xLHWRCLnA/im6N5qEKtTapWA61zE2fE7IATydD7VG8XSL8p72dpXwbJMN
	 prgKHdss8m33hnU8INM7lAzTJBbV5QCw53TvyJKjCjdGwIQgsGH2aKXr0DA+Y69i13
	 3/NRFOB61fufzftfVJodf05N70kpmV2j+cvjAiik=
Date: Thu, 16 Jul 2026 20:24:32 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 00/13] fix several inconsistencies with sysfs
 configuration in etmX
Message-ID: <alkv8JHDgylPBeSE@e129823.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <6ec5e456-fdf9-4953-9a0f-6231b48df07a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec5e456-fdf9-4953-9a0f-6231b48df07a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_122438_938174_72CDDFD0 
X-CRM114-Status: GOOD (  29.64  )
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

On Thu, Jul 16, 2026 at 01:48:15PM +0100, Suzuki K Poulose wrote:
> On 29/06/2026 09:59, Yeoreum Yun wrote:
> > The current ETMx configuration via sysfs can lead to the following
> > inconsistencies:
> > 
> >    - If a configuration is modified via sysfs while a perf session is
> >      active, the running configuration may differ between before
> >      a sched-out and after a subsequent sched-in.
> > 
> >    - If a perf session and sysfs session tries to enable concurrently,
> >      configuration from configfs could be corrupted (etm4).
> > 
> >    - There is chance to corrupt drvdata->config if perf session tries
> >      to enabled among handling cscfg_csdev_disable_active_config()
> >      in etm4_disable_sysfs() (etm4).
> > 
> > To resolve these inconsistencies, the configuration should be separated into:
> > 
> >    - active_config, which is applied configuration for the current session
> >    - config, which stores the settings configured via sysfs.
> > 
> > and apply configuration from configfs after taking a mode.
> > 
> > Also, This patch set includes some small fixes:
> >    - missing trace id release in etm4x.
> >    - underflow issue for nrseqstate.
> >    - wrong check in etm4x_sspcicrn_present().
> >    - missing call of cscfg_csdev_disable_active_config()
> > 
> > This patch based on coresight tree's next
> 
> 
> Please could you move all the "Fixes" to the top of the series, that way
> it is cleaner to backport for the stable kernels

Okay. but the fix which based on the cleanup wouldn't be top of it.
I'll deploy below patches first:

  coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
  coresight: etm4x: fix leaked trace id
  coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
  coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()

> 
> I have some minor comments, please could you address them. Otherwise,
> looks good to me. Thanks for the cleanup

Thanks for your review!

> 
> 
> > 
> > Patch History
> > =============
> > from v7 to v8:
> >    - accept @Leo Yan' suggestion to handle error.
> >    - small minor fixes following @Suzuki' suggestion.
> >    - https://lore.kernel.org/all/20260519154812.254884-1-yeoreum.yun@arm.com/
> > 
> > from v6 to v7:
> >    - rebase on coresight/next
> >    - add ETM_MAX_SEQ_TRANSITIONS define
> >    - remove redundant patch relavent cpu-hotplug as coresight-pm patch
> >      merged.
> >    - https://lore.kernel.org/all/20260422132203.977549-1-yeoreum.yun@arm.com/
> > 
> > from v5 to v6:
> >    - fix missing of calling cscfg_csdev_disable_active_config()
> >    - add rb & fixes tags.
> >    - add ss_status field in etm4x_drvdata to expose STATUS and PENDING bits.
> >    - https://lore.kernel.org/all/20260415165528.3369607-1-yeoreum.yun@arm.com/
> > 
> > from v4 to v5:
> >    - add rb-tag.
> >    - fix underflow issue for nrseqstate.
> >    - fix wrong check in etm4_sspcicrn_present().
> >    - remove redundant fields on etmv4_save_state.
> >    - rename caps->ss_status to ss_cmp.
> >    - fix wrong location of etm4_release_trace_id.
> >    - https://lore.kernel.org/all/20260413142003.3549310-1-yeoreum.yun@arm.com/
> > 
> > from v3 to v4:
> >    - change etm_drvdata->spinlock type to raw_spin_lock_t
> >    - remove redundant call etmX_enable_hw() with starting_cpu() callsback.
> >    - fix missing trace id release.
> >    - add missing docs.
> >    - https://lore.kernel.org/all/20260412175506.412301-1-yeoreum.yun@arm.com/
> > 
> > from v2 to v3:
> >    - fix build error for etm3x.
> >    - fix checkpatch warning.
> >    - https://lore.kernel.org/all/20260410074310.2693385-1-yeoreum.yun@arm.com/
> > 
> > from v1 to v2
> >    - rebased to v7.0-rc7.
> >    - introduce etmX_caps structure to save etmX's capabilities.
> >    - remove ss_status from etmv4_config.
> >    - modify active_config after taking a mode (perf/sysfs).
> >    - https://lore.kernel.org/all/20260317181705.2456271-1-yeoreum.yun@arm.com/
> > 
> > 
> > Yeoreum Yun (13):
> >    coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
> >    coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
> >    coresight: etm4x: introduce struct etm4_caps
> >    coresight: etm4x: exclude ss_status from drvdata->config
> >    coresight: etm4x: remove s_ex_level from config
> >    coresight: etm4x: remove redundant fields in etmv4_save_state
> >    coresight: etm4x: fix leaked trace id
> >    coresight: etm4x: fix inconsistencies with sysfs configuration
> >    coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf
> >      enable
> >    coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
> >    coresight: etm3x: introduce struct etm_caps
> >    coresight: etm3x: fix inconsistencies with sysfs configuration
> >    coresight: etm3x: remove redundant cpu online check on
> >      etm_enable_sysfs()
> > 
> >   drivers/hwtracing/coresight/coresight-etm.h   |  46 +-
> >   .../coresight/coresight-etm3x-core.c          |  96 ++--
> >   .../coresight/coresight-etm3x-sysfs.c         | 159 +++---
> >   .../hwtracing/coresight/coresight-etm4x-cfg.c |   5 +-
> >   .../coresight/coresight-etm4x-core.c          | 454 ++++++++++--------
> >   .../coresight/coresight-etm4x-sysfs.c         | 204 ++++----
> >   drivers/hwtracing/coresight/coresight-etm4x.h | 202 ++++----
> >   7 files changed, 639 insertions(+), 527 deletions(-)
> > 
> 

-- 
Sincerely,
Yeoreum Yun

