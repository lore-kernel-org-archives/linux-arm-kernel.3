Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA988E77179
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nXUIDrvFYK1sMgLYIfbhMun/knm1y0maTEByrglDxE=; b=IvazcV8IoysxzrKPDVyx6RAXip
	Rib2rrG4jdru9KEyXUXQuSR1lkEv2TBcPS1H0uTCVe8FftsEaBDF8GoUM4/Hjh9hC9UaVEHJ4uAkp
	WOaT9SD8TdZNP+q4wFBvSKsO65JtG7zMatoJVGyk0jvcVPejn03FaudnbZRgrVHVhhzSKEZmKuocn
	cD+/7tUt1I/kPmjl+T2EAog+xlqO3P/igM5rwNEqApkRgpq6poDiJjJ3hZTOAgCBsiKvUjpb60w3S
	DMbymo7C3wWSLzGhr+ydFbFOv13lufc3bVqE/7vK9FkL26BiSE6fRtm/jbhqsrKtX98gI3zZlP4JE
	7zEV9nGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFW8-0000000GvFr-1OTU;
	Thu, 05 Dec 2024 17:19:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFNO-0000000Gt6e-1pYt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:10:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C531063;
	Thu,  5 Dec 2024 09:11:21 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9818A3F71E;
	Thu,  5 Dec 2024 09:10:51 -0800 (PST)
Message-ID: <5b232cf4-b8b5-44cd-977d-4a799f364e20@arm.com>
Date: Thu, 5 Dec 2024 17:10:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/8] Coresight for Kernel panic and watchdog reset
To: Linu Cherian <lcherian@marvell.com>, mike.leach@linaro.org,
 james.clark@arm.com
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 devicetree@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com
References: <20241129084714.3057080-1-lcherian@marvell.com>
 <20241129091255.GA1150491@hyd1403.caveonetworks.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241129091255.GA1150491@hyd1403.caveonetworks.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091054_575616_E25F785B 
X-CRM114-Status: GOOD (  24.76  )
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

Hi Linu


On 29/11/2024 09:12, Linu Cherian wrote:
> Hi,
> 
> On 2024-11-29 at 14:17:06, Linu Cherian (lcherian@marvell.com) wrote:
>> This patch series is rebased on coresight-next-v6.12.rc4
>>
>> * Patches 1 & 2 adds support for allocation of trace buffer pages from reserved RAM
>> * Patches 3 & 4 adds support for saving metadata at the time of kernel panic
>> * Patch 5 adds support for reading trace data captured at the time of panic
>> * Patches 6 & 7 adds support for disabling coresight blocks at the time of panic
>> * Patch 8: Gives the full description about this feature as part of documentation
>>
>> V11 is posted here,
>> https://lore.kernel.org/linux-arm-kernel/20241111124746.2210378-1-lcherian@marvell.com/
>>
>> Changelog from v11:
>> Convert all commands to literal code blocks, that was missed out in v11.
>> No other code changes.
> 
> To make it clear, this is just some missed out fixes in Patch 8,
> Documentation.
> 

I have completed the review of this series. If you could address 
comments on Path 5, I am happy to queue this


Suzuki


>>
>> Changelog from v10:
>> * Converted all csdev_access_* to readl functions in tmc_panic_sync_*
>> * Added "tmc" prefix for register snapshots in struct tmc_crash_metadata
>> * Converted dev_info to dev_dbg in panic handlers
>> * Converted dsb to dmb in panic handlers
>> * Fixed marking metadata as invalid when a user is trying to use the
>>    reserved buffer. Earlier this was wrongly set at the time of reading
>>    reserved trace buffer.
>> * Moved common validation checks to is_tmc_crashdata_valid and minor
>>    code rearrangements for efficiency
>> * Got rid of sink specific prepare/unprepare invocations
>> * Got rid of full from struct tmc_resrv_buf
>> * While reading crashdata, size is now calculated from metdata instead
>>    of relying on reserved buffer size populated by dtb
>> * Minor documenation fixes
>>
>> Changelog from v9:
>> * Add common helper function of_tmc_get_reserved_resource_by_name
>>    for better code reuse
>> * Reserved buffer validity and crashdata validity has been separated to
>>    avoid interdependence
>> * New fields added to crash metadata: version, ffcr, ffsr, mode
>> * Version checks added for metadata validation
>> * Special file /dev/crash_tmc_xxx would be available only when
>>    crash metadata is valid
>> * Removed READ_CRASHDATA mode meant for special casing crashdata reads.
>>    Instead, dedicated read function added for crashdata reads from reserved
>>    buffer which is common for both ETR and ETF sinks as well.
>> * Documentation added to Documentation/tracing/coresight/panic.rst
>>
>> Changelog from v8:
>> * Added missing exit path on error in __tmc_probe.
>> * Few whitespace fixes, checkpatch fixes.
>> * With perf sessions honouring stop_on_flush sysfs attribute,
>>    removed redundant variable stop_on_flush_en.
>>
>> Changelog from v7:
>> * Fixed breakage on perf test -vvvv  "arm coresight".
>>    No issues seen with and without "resrv" buffer mode
>> * Moved the crashdev registration into a separate function.
>> * Removed redundant variable in tmc_etr_setup_crashdata_buf
>> * Avoided a redundant memcpy in tmc_panic_sync_etf.
>> * Tested kernel panic with trace session started uisng perf.
>>    Please see the title "Perf based testing" below for details.
>>    For this, stop_on_flush sysfs attribute is taken into
>>    consideration while starting perf sessions as well.
>>
>> Changelog from v6:
>> * Added special device files for reading crashdata, so that
>>    read_prevboot mode flag is removed.
>> * Added new sysfs TMC device attribute, stop_on_flush.
>>    Stop on flush trigger event is disabled by default.
>>    User need to explicitly enable this from sysfs for panic stop
>>    to work.
>> * Address parameter for panicstop ETM configuration is
>>    chosen as kernel "panic" address by default.
>> * Added missing tmc_wait_for_tmcready during panic handling
>> * Few other misc code rearrangements.
>>
>> Changelog from v5:
>> * Fixed issues reported by CONFIG_DEBUG_ATOMIC_SLEEP
>> * Fixed a memory leak while reading data from /dev/tmc_etrx in
>>    READ_PREVBOOT mode
>> * Tested reading trace data from crashdump kernel
>>
>> Changelog from v4:
>> * Device tree binding
>>    - Description is made more explicit on the usage of reserved memory
>>      region
>>    - Mismatch in memory region names in dts binding and driver fixed
>>    - Removed "mem" suffix from the memory region names
>> * Rename "struct tmc_register_snapshot" ->  "struct tmc_crash_metadata",
>>    since it contains more than register snapshot.
>>    Related variables are named accordingly.
>> * Rename struct tmc_drvdata members
>>     resrv_buf -> crash_tbuf
>>     metadata  -> crash_mdata
>> * Size field in metadata refers to RSZ register and hence indicates the
>>    size in 32 bit words. ETR metadata follows this convention, the same
>>    has been extended to ETF metadata as well.
>> * Added crc32 for more robust metadata and tracedata validation.
>> * Added/modified dev_dbg messages during metadata validation
>> * Fixed a typo in patch 5 commit description
>>
>> Changelog from v3:
>> * Converted the Coresight ETM driver change to a named configuration.
>>    RFC tag has been removed with this change.
>> * Fixed yaml issues reported by "make dt_binding_check"
>> * Added names for reserved memory regions 0 and 1
>> * Added prevalidation checks for metadata processing
>> * Fixed a regression introduced in RFC v3
>>    - TMC Status register was getting saved wrongly
>> * Reverted memremap attribute changes from _WB to _WC to match
>>    with the dma map attributes
>> * Introduced reserved buffer mode specific .sync op.
>>    This fixes a possible crash when reserved buffer mode was used in
>>    normal trace capture, due to unwanted dma maintenance operations.
>>
>>
>>
>>   
>> Linu Cherian (8):
>>    dt-bindings: arm: coresight-tmc: Add "memory-region" property
>>    coresight: tmc-etr: Add support to use reserved trace memory
>>    coresight: core: Add provision for panic callbacks
>>    coresight: tmc: Enable panic sync handling
>>    coresight: tmc: Add support for reading crash data
>>    coresight: tmc: Stop trace capture on FlIn
>>    coresight: config: Add preloaded configuration
>>    Documentation: coresight: Panic support
>>
>>   .../bindings/arm/arm,coresight-tmc.yaml       |  26 ++
>>   Documentation/trace/coresight/panic.rst       | 362 ++++++++++++++++++
>>   drivers/hwtracing/coresight/Makefile          |   2 +-
>>   .../coresight/coresight-cfg-preload.c         |   2 +
>>   .../coresight/coresight-cfg-preload.h         |   2 +
>>   .../hwtracing/coresight/coresight-cfg-pstop.c |  83 ++++
>>   drivers/hwtracing/coresight/coresight-core.c  |  42 ++
>>   .../hwtracing/coresight/coresight-tmc-core.c  | 326 +++++++++++++++-
>>   .../hwtracing/coresight/coresight-tmc-etf.c   |  92 ++++-
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 181 ++++++++-
>>   drivers/hwtracing/coresight/coresight-tmc.h   | 104 +++++
>>   include/linux/coresight.h                     |  12 +
>>   12 files changed, 1222 insertions(+), 12 deletions(-)
>>   create mode 100644 Documentation/trace/coresight/panic.rst
>>   create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pstop.c
>>
>> -- 
>> 2.34.1
>>
>>


