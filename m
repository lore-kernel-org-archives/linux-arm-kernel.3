Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xGp6uPx9;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XR/dnDfh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FfNDu2MufhqcFnIpc0s4LixzLKeopjshJLXr4fBuq00=; b=xGp6uPx9f2UmvV
	0fNyDEqsqsqw9Asuu+G3pQ9M1/rRlA9OOvHziUPwqSnmD9YLb2P1nOvDYqtLfOe6jI3ZbsppOVO+h
	nR95HRbP69hJegoaHG8N+VKpYs6LCJjnObAakjTxl0ZH4+zSdJZkWiiTeLM2mAisGP9iFs4UQY1MO
	RlyjBt7hT6WcE/s/V8HXMGmyIr00Z2RM/aJm+0Y3Nm2faK3wjDZq9cbpkxtEUwN6YpCzKe3jaLwXg
	lukeMZq590zWathaYdK/MhoYW/iW0bv7lY9MCEfVklXMkG/hD4LTkSfy33hVqSFM4mvzLxl7R9usd
	qoSlkKsSxwmGtJ4B3JLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE5Y-0000000GH5c-29Bo;
	Fri, 23 Oct 2026 12:09:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE5W-0000000GH5C-06rQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:09:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B2201691;
	Fri, 23 Oct 2026 05:09:29 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E5603F7B4;
	Fri, 23 Oct 2026 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792757372; bh=SN3o/iL4eW4PQ8inEqf1iSxxRY1YEBE8Xs4TQqQSkEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XR/dnDfhsetlYyRysR/TdIp7hgR49MPNIN0c61NBGGFqcnoT7qDagReEFlpg9etD4
	 WMBEPsWUbbYuQPKKN3qmV4zuVYjMm6cV2DwZ6HcjphHDKxudDCkExWOAd/82c3WuFw
	 oene2hPPyVAV8LBnaFLjJ8mnWpnhkZsZQZ+H6e4M=
Message-ID: <e267c3d5-a52a-4b55-9eb3-cf42160c3af0@arm.com>
Date: Fri, 23 Oct 2026 13:09:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/16] arm64: ras: Add probe/remove for arm64_ras
 driver
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Ruidong Tian <tianruidong@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
 <20260602071540.3711528-3-tianruidong@linux.alibaba.com>
 <01b1b1bd-2848-482e-af8b-8fab037c7a04@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <01b1b1bd-2848-482e-af8b-8fab037c7a04@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_050934_170602_92BF62EF 
X-CRM114-Status: GOOD (  18.55  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 10:59 am, Umang Chheda wrote:
> Hello Ruidong,
> 
> On 6/2/2026 12:45 PM, Ruidong Tian wrote:
>> Introduce the back-end platform driver that binds to the devices
>> created by the AEST front-end. Driver input is taken exclusively from
>> fwnode properties, so the same probe path serves any future front-end
>> (DT, hand-rolled) without conditional code.
>>
>> The probe builds two layers of state:
>>
>>    - struct ras_node:   one AEST error source
>>    - struct ras_record: one error record inside a node
>>
>> This split mirrors the hardware: a node owns the shared MMIO/ERRGSR
>> window and policy, while records are the unit at which errors are
>> reported, masked and polled. Later patches plug interrupts, decoding,
>> storm mitigation and userspace ABI onto these two objects without
>> touching the front-end.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
>> ---
> [...]
> 
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_ARM64_RAS_DRIVER) 	+= arm64_ras.o
>> +
>> +arm64_ras-y		:= ras-core.o
>> diff --git a/drivers/ras/arm64/ras-core.c b/drivers/ras/arm64/ras-core.c
>> new file mode 100644
>> index 000000000000..b5448f4a841f
>> --- /dev/null
>> +++ b/drivers/ras/arm64/ras-core.c
>> @@ -0,0 +1,266 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ARM Error Source Table Support
>> + *
>> + * Copyright (c) 2025, Alibaba Group.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/ras.h>
>> +
>> +#include "ras.h"
>> +
>> +#undef pr_fmt
>> +#define pr_fmt(fmt) "arm64_ras: " fmt
>> +
>> +static const char *const ras_node_name[] = {
>> +	[ACPI_AEST_PROCESSOR_ERROR_NODE] = "processor",
>> +	[ACPI_AEST_MEMORY_ERROR_NODE] = "memory",
>> +	[ACPI_AEST_SMMU_ERROR_NODE] = "smmu",
>> +	[ACPI_AEST_VENDOR_ERROR_NODE] = "vendor",
>> +	[ACPI_AEST_GIC_ERROR_NODE] = "gic",
>> +	[ACPI_AEST_PCIE_ERROR_NODE] = "pcie",
>> +	[ACPI_AEST_PROXY_ERROR_NODE] = "proxy",
>> +};
> 
> Now that the ARM RAS core framework is shared by both ACPI and DT
> platforms, should we consider dropping the "ACPI_AEST" naming in the
> common code and replacing it with a more generic prefix maybe something
> like "ARM_RAS" ?

But these names and values _are_ defined by AEST (literally "AEST node 
type", see table 4 in DEN0085) - they are not part of the RAS 
architecture itself. Even if you exactly copy all the AEST concepts into 
a DT binding, it doesn't really make them "common", it just means you've 
defined a DT binding in terms of what are still AEST definitions.

Thanks,
Robin.

> [...]
>> +
>> +const struct ras_group ras_group_config[] = {
>> +	[ACPI_AEST_NODE_GROUP_FORMAT_4K] = {
>> +		.errgsr_num = ERXGROUP_4K_ERRGSR_NUM,
>> +		.size = ERXGROUP_4K_SIZE,
>> +		.errgsr_offset = ERXGROUP_4K_OFFSET,
>> +	},
>> +	[ACPI_AEST_NODE_GROUP_FORMAT_16K] = {
>> +		.errgsr_num = ERXGROUP_16K_ERRGSR_NUM,
>> +		.size = ERXGROUP_16K_SIZE,
>> +		.errgsr_offset = ERXGROUP_16K_OFFSET,
>> +	},
>> +	[ACPI_AEST_NODE_GROUP_FORMAT_64K] = {
>> +		.errgsr_num = ERXGROUP_64K_ERRGSR_NUM,
>> +		.size = ERXGROUP_64K_SIZE,
>> +		.errgsr_offset = ERXGROUP_64K_OFFSET,
>> +	},
>> +};
>> +
> Thanks,
> Umang


