Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66FBD6E2BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HYx+XvNzAco4OW5M6513KsbE+VVG/Do1WnRA0qoZ7o=; b=nWx9Pi4+owfW7OWB5YeSQEhInv
	5vOGiMJH9FyhkIXsi2Vz+nwaZ/tGdPWBqaGD1saixF7Vfce7JEPcV+/SdV1hrfddrL99UtG6aPdHD
	gJ4MB7+E64ZN4jg7n26AfS7R1511yECdryyjYT7UNmsffOXfRqywMlvpsogNEfRZRzbCIYvoZh9CN
	ZRVf9249LSZCO1COxV9fvhMtM+3rQG8uob48yYAlYL/UyMX+dYVK9xxgr4Sb5iKvC3LWWHFd1Mw21
	zpcYogumJBCWLyAfz7mS6hNoudNNmHqOH3cBOTkP+o59HmwadiAHt531VcST7PS6we0neyltR9vIT
	WWeFpAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHQL-00000008s7G-0kbk;
	Thu, 18 Dec 2025 17:04:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHQH-00000008s6s-267Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 17:04:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A4AFEC;
	Thu, 18 Dec 2025 09:04:06 -0800 (PST)
Received: from [10.57.74.203] (unknown [10.57.74.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94D973F73F;
	Thu, 18 Dec 2025 09:04:09 -0800 (PST)
Message-ID: <3d4dd3d0-fca0-45ac-a833-e8f7f5d1aa95@arm.com>
Date: Thu, 18 Dec 2025 17:04:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
Content-Language: en-GB
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 maulik.shah@oss.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
 <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_090417_648928_9A8C4612 
X-CRM114-Status: GOOD (  19.69  )
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

On 18/12/2025 16:18, yuanfang zhang wrote:
> 
> 
> On 12/18/2025 5:32 PM, Suzuki K Poulose wrote:
>> Cc: Sudeep
>>
>> On 18/12/2025 08:09, Yuanfang Zhang wrote:
>>> This patch series adds support for CoreSight components local to CPU clusters,
>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>> domains. These components require special handling due to power domain
>>> constraints.
>>>
>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>> out of LPM, making standard register access unreliable.
>>
>> Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
>> and that can auto-magically keep the cluster power ON as long as you
>> want to use them.
>>
>> Suzuki
>>
> Hi Suzuki
> 
> Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
> CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
> cluster.
> It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
> implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
> the upstream Kernel.

Why does it need to wake up the CPU ? The firmware can power up the
cluster right? Anyways, to me this all looks like working around a
firmware issue. I will let you sort this out with Sudeep's response
, as I am not an expert on the cluster powermanagement and standards.

Suzuki



> 
> Yuanfang
> 
>>
>>>
>>> To address this, the series introduces:
>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>     device tree property.
>>> - Implementing deferred probing: if associated CPUs are offline during
>>>     probe, initialization is deferred until a CPU hotplug notifier detects
>>>     the CPU coming online.
>>> - Utilizing `smp_call_function_single()` to ensure register accesses
>>>     (initialization, enablement, sysfs reads) are always executed on a
>>>     powered CPU within the target cluster.
>>> - Extending the CoreSight link `enable` callback to pass the `cs_mode`.
>>>     This allows drivers to distinguish between SysFS and Perf modes and
>>>     apply mode-specific logic.
>>>
>>> Jie Gan (1):
>>>     arm64: dts: qcom: hamoa: add Coresight nodes for APSS debug block
>>>
>>> Yuanfang Zhang (11):
>>>     dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>>     coresight: Pass trace mode to link enable callback
>>>     coresight-funnel: Support CPU cluster funnel initialization
>>>     coresight-funnel: Defer probe when associated CPUs are offline
>>>     coresight-replicator: Support CPU cluster replicator initialization
>>>     coresight-replicator: Defer probe when associated CPUs are offline
>>>     coresight-replicator: Update management interface for CPU-bound devices
>>>     coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>>     coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>>     coresight-tmc: Update management interface for CPU-bound TMCs
>>>     coresight-tmc: Defer probe when associated CPUs are offline
>>>
>>> Verification:
>>>
>>> This series has been verified on sm8750.
>>>
>>> Test steps for delay probe:
>>>
>>> 1. limit the system to enable at most 6 CPU cores during boot.
>>> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
>>> 3. check whether ETM6 and ETM7 have been probed.
>>>
>>> Test steps for sysfs mode:
>>>
>>> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
>>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>>> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
>>> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>>
>>> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
>>> cat /dev/tmc_etf1 >/tmp/etf1.bin
>>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>>> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>>
>>> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>>> cat /dev/tmc_etf2 >/tmp/etf2.bin
>>> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
>>> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>>
>>> Test steps for sysfs node:
>>>
>>> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>>>
>>> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>>>
>>> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>>>
>>> Test steps for perf mode:
>>>
>>> perf record -a -e cs_etm//k -- sleep 5
>>>
>>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Use the qcom,cpu-bound-components device tree property to identify devices
>>>     bound to a cluster.
>>> - Refactor commit message.
>>> - Introduce a supported_cpus field in the drvdata structure to record the CPUs
>>>     that belong to the cluster where the local component resides.
>>> - Link to v1: https://lore.kernel.org/r/20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com
>>>
>>> ---
>>> Jie Gan (1):
>>>         arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS debug block
>>>
>>> Yuanfang Zhang (11):
>>>         dt-bindings: arm: coresight: Add 'qcom,cpu-bound-components' property
>>>         coresight-funnel: Support CPU cluster funnel initialization
>>>         coresight-funnel: Defer probe when associated CPUs are offline
>>>         coresight-replicator: Support CPU cluster replicator initialization
>>>         coresight-replicator: Defer probe when associated CPUs are offline
>>>         coresight-replicator: Update management interface for CPU-bound devices
>>>         coresight-tmc: Support probe and initialization for CPU cluster TMCs
>>>         coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>>         coresight-tmc: Update management interface for CPU-bound TMCs
>>>         coresight-tmc: Defer probe when associated CPUs are offline
>>>         coresight: Pass trace mode to link enable callback
>>>
>>>    .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   5 +
>>>    .../arm/arm,coresight-dynamic-replicator.yaml      |   5 +
>>>    .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   5 +
>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi                | 926 +++++++++++++++++++++
>>>    arch/arm64/boot/dts/qcom/purwa.dtsi                |  12 +
>>>    drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>>>    drivers/hwtracing/coresight/coresight-funnel.c     | 258 +++++-
>>>    drivers/hwtracing/coresight/coresight-replicator.c | 341 +++++++-
>>>    drivers/hwtracing/coresight/coresight-tmc-core.c   | 387 +++++++--
>>>    drivers/hwtracing/coresight/coresight-tmc-etf.c    | 106 ++-
>>>    drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>>>    drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>>>    drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>>>    include/linux/coresight.h                          |   3 +-
>>>    14 files changed, 1902 insertions(+), 169 deletions(-)
>>> ---
>>> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
>>> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>>>
>>> Best regards,
>>
> 


