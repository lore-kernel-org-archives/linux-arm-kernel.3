Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72397CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 12:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rv1f4iBAcrSWktOTrbikkBrg5gUMQn5EE/ivYPY4cN4=; b=COOEpns2Ahbaq6OU5QPXuoOVnj
	2s3XLpsC2Yz6f4n4rbMD7ZNExYDS5jiHzxdLhEQzH1VxrucY4+DOS0ocDgxq6/+qMmLgsxmLiiH1x
	HqmIXrxIyQM2lzPrdvSxoG5Uj1ubuW6AuAz0Q6PjeTWnZZNMlGXbQyfBLofJGQl+PhJ+LuVBuCrHA
	PebzeuyWnBVmjs8CWuuGzsnHH7xbPmqnwk2D6hL3tBZHo6Q0raZw7ut623h51v/Nlx2W+uilRYET5
	2y0A+vXCeRpE2dsWtDuGysgA2Khj89aqZ0KcCq5YlKWLnQ2MYj0otcUe2F3luwDHMr6OeKM4wv5Tz
	7ZotjHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g79-0000000AOP3-3zAt;
	Mon, 22 Sep 2025 12:57:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g77-0000000AOOd-0TmC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 12:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94132FEC;
	Mon, 22 Sep 2025 05:57:42 -0700 (PDT)
Received: from [10.57.6.128] (unknown [10.57.6.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 907183F694;
	Mon, 22 Sep 2025 05:57:49 -0700 (PDT)
Message-ID: <4650c1ce-2249-4896-b71a-08db71c5ff7f@arm.com>
Date: Mon, 22 Sep 2025 13:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] coresight: Updates for Linux v6.18
Content-Language: en-GB
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 james.clark@linaro.org, leo.yan@linux.dev, mike.leach@linaro.org
References: <20250922125354.2267995-1-suzuki.poulose@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250922125354.2267995-1-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_055753_240345_A6239E1B 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Greg

On 22/09/2025 13:53, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the CoreSight tree updates for v6.18.
> 

Kindly ignore this one due to the non-standard PULL URL.
I will resend it with the fixed one. Apologies.

Suzuki

> Kindly pull,
> 
> Suzuki
> 
> 
> 
> The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:
> 
>    Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)
> 
> are available in the Git repository at:
> 
>    ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.18
> 
> for you to fetch changes up to 559d6c380ea0a27e71d0269410301303515e4179:
> 
>    coresight: Add label sysfs node support (2025-09-10 17:53:01 +0100)
> 
> ----------------------------------------------------------------
> coresight: Updates for Linux v6.18
> 
> CoreSight selfhosted tracing subsystem updates targeting Linux v6.18, includes:
> 
>   - Clean up and consolidate clocks handling
>   - Support for exposing labels via sysfs for better device identification
>   - Add Qualcomm Trace Network On Chip driver support
>   - Miscellaneous fixes
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>        coresight: Fix a NULL vs IS_ERR() bug in probe
> 
> James Clark (2):
>        coresight: trbe: Add ISB after TRBLIMITR write
>        coresight: Fix missing include for FIELD_GET
> 
> Jie Gan (1):
>        coresight: tpda: fix the logic to setup the element size
> 
> Leo Yan (13):
>        coresight: stm: Remove redundant NULL checks
>        coresight: perf: Use %px for printing pointers
>        coresight: tmc: Support atclk
>        coresight: catu: Support atclk
>        coresight: etm4x: Support atclk
>        coresight: Appropriately disable programming clocks
>        coresight: Appropriately disable trace bus clocks
>        coresight: Avoid enable programming clock duplicately
>        coresight: Consolidate clock enabling
>        coresight: Refactor driver data allocation
>        coresight: Make clock sequence consistent
>        coresight: Refactor runtime PM
>        coresight: trbe: Return NULL pointer for allocation failures
> 
> Lin Yujun (1):
>        coresight: Fix incorrect handling for return value of devm_kzalloc
> 
> Mao Jinlong (2):
>        dt-bindings: arm: Add label in the coresight components
>        coresight: Add label sysfs node support
> 
> Rob Herring (Arm) (1):
>        hwtracing: coresight: Use of_reserved_mem_region_to_resource() for "memory-region"
> 
> Yeoreum Yun (1):
>        coresight: fix indentation error in cscfg_remove_owned_csdev_configs()
> 
> Yuanfang Zhang (5):
>        coresight: Only register perf symlink for sinks with alloc_buffer
>        dt-bindings: arm: Add device Trace Network On Chip definition
>        coresight: add coresight Trace Network On Chip driver
>        coresight-etm4x: Conditionally access register TRCEXTINSELR
>        coresight: tnoc: add new AMBA ID to support Trace Noc V2
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-cti    |   6 +
>   .../sysfs-bus-coresight-devices-dummy-source       |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-etb10  |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-etm3x  |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-etm4x  |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-funnel |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-stm    |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-tmc    |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |   6 +
>   .../ABI/testing/sysfs-bus-coresight-devices-trbe   |   6 +
>   .../devicetree/bindings/arm/arm,coresight-cti.yaml |   4 +
>   .../bindings/arm/arm,coresight-dummy-sink.yaml     |   4 +
>   .../bindings/arm/arm,coresight-dummy-source.yaml   |   4 +
>   .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   4 +
>   .../arm/arm,coresight-dynamic-replicator.yaml      |   4 +
>   .../bindings/arm/arm,coresight-etb10.yaml          |   4 +
>   .../devicetree/bindings/arm/arm,coresight-etm.yaml |   4 +
>   .../bindings/arm/arm,coresight-static-funnel.yaml  |   4 +
>   .../arm/arm,coresight-static-replicator.yaml       |   4 +
>   .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   4 +
>   .../bindings/arm/arm,coresight-tpiu.yaml           |   4 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>   .../bindings/arm/qcom,coresight-remote-etm.yaml    |   4 +
>   .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 ++++++++++
>   .../bindings/arm/qcom,coresight-tpda.yaml          |   4 +
>   .../bindings/arm/qcom,coresight-tpdm.yaml          |   4 +
>   drivers/hwtracing/coresight/Kconfig                |  12 +
>   drivers/hwtracing/coresight/Makefile               |   1 +
>   drivers/hwtracing/coresight/coresight-catu.c       |  53 +++--
>   drivers/hwtracing/coresight/coresight-catu.h       |   1 +
>   drivers/hwtracing/coresight/coresight-core.c       |  54 ++++-
>   drivers/hwtracing/coresight/coresight-cpu-debug.c  |  41 ++--
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |  24 +-
>   drivers/hwtracing/coresight/coresight-etb10.c      |  18 +-
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |   4 +-
>   drivers/hwtracing/coresight/coresight-etm3x-core.c |  17 +-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c |  44 ++--
>   .../hwtracing/coresight/coresight-etm4x-sysfs.c    |   1 +
>   drivers/hwtracing/coresight/coresight-etm4x.h      |   6 +-
>   drivers/hwtracing/coresight/coresight-funnel.c     |  66 ++----
>   drivers/hwtracing/coresight/coresight-replicator.c |  63 ++----
>   drivers/hwtracing/coresight/coresight-stm.c        |  42 ++--
>   drivers/hwtracing/coresight/coresight-syscfg.c     |   2 +-
>   drivers/hwtracing/coresight/coresight-sysfs.c      |  71 +++++-
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  70 +++---
>   drivers/hwtracing/coresight/coresight-tmc.h        |   2 +
>   drivers/hwtracing/coresight/coresight-tnoc.c       | 246 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c       |   3 +
>   drivers/hwtracing/coresight/coresight-tpiu.c       |  36 ++-
>   drivers/hwtracing/coresight/coresight-trbe.c       |   9 +-
>   drivers/hwtracing/coresight/ultrasoc-smb.h         |   1 +
>   include/linux/coresight.h                          |  31 +--
>   52 files changed, 827 insertions(+), 324 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>   create mode 100644 drivers/hwtracing/coresight/coresight-tnoc.c


