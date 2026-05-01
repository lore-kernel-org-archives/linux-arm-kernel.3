Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjyaCIfZZTe40eXw+j++rnoh0O8gAhuVK4VnYovqeUc=; b=bX4B3DLB0xyZN35O1/nzxIRKZ9
	jIP/CyLYLbY38WK7a4WVaGV5EJshusYgFb3Ack0qpYcFKM2LXt7tmZs8ikezjk3p2ryz8H5uNGjOp
	mD9a9juVQfHik/B50ILSpcvoEInHmdTDTHtN/iWLPljEKP7ozmLt07QYgTilVo7uF0abQoIMf5ul0
	YZhKpg9UZ9bNrMmEh5nLA2g5DXSdZq9mpPncVvQ/cihuIDuHCi7euiczz6TdhDKntZkX0sEr8U3wY
	UqXFD/5RqjiPJjsJS+mtA0OiVq5jqt2OTfHdjXBj5IsuBEvffv0dcvvphfd3wov9jJz73+qjq7s+T
	45QVB4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInPP-000000078vm-2ZGT;
	Fri, 01 May 2026 12:55:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInPN-000000078vJ-0ncy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:55:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07737176B;
	Fri,  1 May 2026 05:55:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E1C43F7B4;
	Fri,  1 May 2026 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777640149; bh=XhFDyZV6Ay3pnkqMe6UT+REa3lOAJYvzygmpMynHdAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSPugyvFhnUwigXLMRpnu1hFkGs0AhJsRMHOO8/QcIAjPyUIAnjilQ7X1B+RCsnX3
	 TENFXCgNp1zGtKA1SrI7sbWqLsfRzDh5fpEINVAyUCWahlpYT0uCjWGBdAtJa0y4Ru
	 W7wHy/ZqV0R8zW5lUdsZh69M4bI+YnXkVlYFGlJY=
Date: Fri, 1 May 2026 13:55:46 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, leo.yan@arm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 00/13] fix several inconsistencies with sysfs
 configuration in etmX
Message-ID: <afSi0pJgGKAhBnYC@e129823.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_055553_393667_1006DEDB 
X-CRM114-Status: GOOD (  21.04  )
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

Gentle ping in case of forgotten.

> The current ETMx configuration via sysfs can lead to the following
> inconsistencies:
> 
>   - If a configuration is modified via sysfs while a perf session is
>     active, the running configuration may differ between before
>     a sched-out and after a subsequent sched-in.
> 
>   - If a perf session and sysfs session tries to enable concurrently,
>     configuration from configfs could be corrupted (etm4).
> 
>   - There is chance to corrupt drvdata->config if perf session tries
>     to enabled among handling cscfg_csdev_disable_active_config()
>     in etm4_disable_sysfs() (etm4).
> 
> To resolve these inconsistencies, the configuration should be separated into:
> 
>   - active_config, which is applied configuration for the current session
>   - config, which stores the settings configured via sysfs.
> 
> and apply configuration from configfs after taking a mode.
> 
> Also, This patch set includes some small fixes:
>   - missing trace id release in etm4x.
>   - underflow issue for nrseqstate.
>   - wrong check in etm4x_sspcicrn_present().
>   - missing call of cscfg_csdev_disable_active_config()
> 
> This patch based on v7.0
> 
> Patch History
> =============
> from v5 to v6:
>   - fix missing of calling cscfg_csdev_disable_active_config()
>   - add rb & fixes tags.
>   - add ss_status field in etm4x_drvdata to expose STATUS and PENDING bits.
>   - https://lore.kernel.org/all/20260415165528.3369607-1-yeoreum.yun@arm.com/
> 
> from v4 to v5:
>   - add rb-tag.
>   - fix underflow issue for nrseqstate.
>   - fix wrong check in etm4_sspcicrn_present().
>   - remove redundant fields on etmv4_save_state.
>   - rename caps->ss_status to ss_cmp.
>   - fix wrong location of etm4_release_trace_id.
>   - https://lore.kernel.org/all/20260413142003.3549310-1-yeoreum.yun@arm.com/
> 
> from v3 to v4:
>   - change etm_drvdata->spinlock type to raw_spin_lock_t
>   - remove redundant call etmX_enable_hw() with starting_cpu() callsback.
>   - fix missing trace id release.
>   - add missing docs.
>   - https://lore.kernel.org/all/20260412175506.412301-1-yeoreum.yun@arm.com/
> 
> from v2 to v3:
>   - fix build error for etm3x.
>   - fix checkpatch warning.
>   - https://lore.kernel.org/all/20260410074310.2693385-1-yeoreum.yun@arm.com/
> 
> from v1 to v2
>   - rebased to v7.0-rc7.
>   - introduce etmX_caps structure to save etmX's capabilities.
>   - remove ss_status from etmv4_config.
>   - modify active_config after taking a mode (perf/sysfs).
>   - https://lore.kernel.org/all/20260317181705.2456271-1-yeoreum.yun@arm.com/
> 
> Yeoreum Yun (13):
>   coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
>   coresight: etm4x: fix underflow for nrseqstate
>   coresight: etm4x: introduce struct etm4_caps
>   coresight: etm4x: exclude ss_status from drvdata->config
>   coresight: etm4x: remove redundant fields in etmv4_save_state
>   coresight: etm4x: fix leaked trace id
>   coresight: etm4x: fix inconsistencies with sysfs configuration
>   coresight: etm4x: remove redundant call etm4_enable_hw() with hotplug
>   coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf
>     enable
>   coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
>   coresight: etm3x: introduce struct etm_caps
>   coresight: etm3x: fix inconsistencies with sysfs configuration
>   coresight: etm3x: remove redundant call etm_enable_hw() with hotplug
> 
>  drivers/hwtracing/coresight/coresight-etm.h   |  46 ++-
>  .../coresight/coresight-etm3x-core.c          | 101 ++---
>  .../coresight/coresight-etm3x-sysfs.c         | 159 +++----
>  .../hwtracing/coresight/coresight-etm4x-cfg.c |   3 +-
>  .../coresight/coresight-etm4x-core.c          | 388 ++++++++++--------
>  .../coresight/coresight-etm4x-sysfs.c         | 202 +++++----
>  drivers/hwtracing/coresight/coresight-etm4x.h | 190 +++++----
>  7 files changed, 606 insertions(+), 483 deletions(-)
> 
> 
> base-commit: 028ef9c96e96197026887c0f092424679298aae8
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

-- 
Sincerely,
Yeoreum Yun

