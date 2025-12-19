Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95D7D767CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rr6AOIc4U8eWnOIbWXPg2cTyBi21t7kJJ99fYA2XhQ=; b=SMN2sfkN4humN06wVqlg8znIxv
	+3ntGoHieTcL4aLc0LC16+lRkdnbkxgSZFqKNpoavobXhkarCw6kMuW7mAeOI+0A/RCC7UJTAPQlh
	a8OLRHHth21c1zRLn8RKJoXqg1FOmFNBbCnYDRHOiMyWjcXnuxc/Mvq+cekpSSHbkdhrYYN99JHb+
	cSgs5GrjI3RPIlMYpUrs4yaRk3Ug5Be1S+0l7FwZlEJymf/kHzyWGlc7r9s3fSnxl/raeVgk23y+r
	VsDpZ1c4YESg5eT1WDC11thS+XFHRDCJ3CifSvj4lbdgotv1dfj6fg7vXfK4v410uWgniRW5QWDcd
	KLp1eGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXwe-0000000A8tu-1qWo;
	Fri, 19 Dec 2025 10:42:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXwc-0000000A8tW-3DNJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:42:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF2C106F;
	Fri, 19 Dec 2025 02:42:37 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE2FB3F5CA;
	Fri, 19 Dec 2025 02:42:43 -0800 (PST)
Date: Fri, 19 Dec 2025 10:42:41 +0000
From: Leo Yan <leo.yan@arm.com>
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
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
Message-ID: <20251219104241.GB9788@e132581.arm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218104027.GA1790402@e132581.arm.com>
 <927f15d5-da2a-4282-b80f-c1c7563a4367@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <927f15d5-da2a-4282-b80f-c1c7563a4367@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_024246_847425_D866614C 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Dec 19, 2025 at 09:50:18AM +0800, yuanfang zhang wrote:

[...]

> It is due to the particular characteristics of the CPU cluster power domain.
> Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
> CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
> cluster.
> It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
> implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
> the upstream Kernel.

Just for easier understanding, let me give an example:

    funnel0: funnel@10000000 {
        compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
        reg = <0x10000000 0x1000>;

        clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
        clock-names = "apb_pclk", "atclk";
        power-domains = <&cluster0_pd>;
    }

If funnel0 is bound to cluster's power domain, kernel's genPD will
automatically enable cluster power domain before access registers.

My understanding is your driver or firmware fails to turn on a cluster
power domain without waking up a CPU (and without sending IPI).  It is
not a kernel issue or limitation, and no any incorrect in PSCI OSI.

As Suzuki said, you might directly reply Sudeep's questions.  We would
confirm if any flaw in common code.

> > P.s., currently you can use "taskset" as a temporary solution without
> > any code change, something like:
> > 
> >   taskset -c 0 echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> 
> This can address the runtime issue, but it does not resolve the problem during the probe phase.

Indeed.  If you insmod mode, you might can temporarily disable idle
states?

    exec 3<> /dev/cpu_dma_latency; echo 0 >&3
    insmod
    exec 3<>-

Thanks,
Leo

