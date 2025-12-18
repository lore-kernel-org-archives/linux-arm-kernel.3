Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C4DD6ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB87ggdElwk/7BG+P3OrNy4lVCw8a5cZotqqSrMd6YY=; b=P2oP/YCOmsaV79LMUX9JfE8Wct
	54R4NM0RFSb1bHJwicgmY4Jav3rvoAuPZaMEPgLZpOd3EClmWGQxnI3nRFQMvw/kBSSv1Fofd4Jy3
	fT6M01EF+09c6UQhTLa2HDisPXDjXQvV+RBgVuLZkpiqLej5WfqTilfMpRgzCrG10S3DWssGSW378
	4wKxpOvshse/a30HMa49EKY3GKPEj673ztizeRcxjjRkRvh3dzNgFl8aj3md0z7GQYoevW+PSm8Kj
	WOWUyVom6gkzHjuYQdtraZEL1oXEXqJUBr/QeJEvtXpG3IOR0Ky/c4ZxOlg/eBMLx9ZA11vos1NvJ
	MF88Ewhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBQy-00000008FKe-1m7J;
	Thu, 18 Dec 2025 10:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBQv-00000008FKD-2cRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:40:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BBCFEC;
	Thu, 18 Dec 2025 02:40:22 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99EC63F73F;
	Thu, 18 Dec 2025 02:40:29 -0800 (PST)
Date: Thu, 18 Dec 2025 10:40:27 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20251218104027.GA1790402@e132581.arm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024033_709579_DA4B9711 
X-CRM114-Status: GOOD (  13.93  )
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

On Thu, Dec 18, 2025 at 12:09:40AM -0800, Coresight ML wrote:

[...]

> - Utilizing `smp_call_function_single()` to ensure register accesses
>   (initialization, enablement, sysfs reads) are always executed on a
>   powered CPU within the target cluster.

This is concerned as Mike suggested earlier.

Let me convert to a common question: how does the Linux kernel manage
a power domain shared by multiple hardware modules?

A general solution is to bind a power domain (let's say PD1) to both
module A (MOD_A) and module B (MOD_B).  Each time before accessing MOD_A
or MOD_B, PD1 must be powered on first via the pm_runtime APIs, with
its refcount increased accordingly.

My understanding is the problem in your case is that the driver fails to
create a relationship between the funnel/replicator modules and the
cluster power domain.  Instead, you are trying to use the CPUs in the
same cluster as a delegate for power operations - when you want to
access MOD_B, your wake up MOD_A which sharing the same power domain,
only to turn on the PD_A in order to access MOD_B.

Have you discussed with the firmware and hardware engineers whether it
is feasible to provide explicit power and clock control interfaces for
the funnel and replicator modules?  I can imagine the cluster power
domain's design might differ from other device power domains, but
should not the hardware provide a sane design that allows software to
control power for the access logic within it?

General speaking, using smp_call_function_single() makes sense if only
when accessing logics within the CPU boundary.

P.s., currently you can use "taskset" as a temporary solution without
any code change, something like:

  taskset -c 0 echo 1 > /sys/bus/coresight/devices/etm0/enable_source

Thanks,
Leo

