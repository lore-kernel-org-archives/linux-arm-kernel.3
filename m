Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569EAC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GmWkJKTnBdNV2hP6Xjy+IJiy6R2UIBNEb3oOngv4Tw=; b=XSkL3Ar9qEy3WAUwPmW//2CGsH
	7AFlIgJCBImZS9gnE0w9uecyTHfISqvfgZ9+M6HNtsxzbKWvc/1m5pE5xWINFyjorUCqCnZO4SBY5
	IUSwiqxXuYD+6hPChrHG90EnpaHd7RuHgUkdx6dUuRe6tF10zJTnAFmz+spkmbTd5MRQanjMJ0wtZ
	v0ZLZHhWQYqu7ntQSanUZ+q3jAqgY//ved6CUKsTP16YrOnLrAspySrYJp9Zh9MOKluR6I7uku3ZV
	ZmTXBpBiUaLOxcZ+wPQlRvwVrnYMFmw7N/x6ZG1pu57HeyGMwUa5NL4Mo7EyMMlcgkD+UNkkIMV2v
	4IMXfn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhdj-00000002qpV-0ug7;
	Thu, 28 Aug 2025 18:46:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf1I-00000002AiK-42Oi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:58:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6912C40;
	Thu, 28 Aug 2025 08:58:28 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322993F694;
	Thu, 28 Aug 2025 08:58:27 -0700 (PDT)
Message-ID: <fb8731ac-49ef-4a1a-91f2-daa1531c9ea7@arm.com>
Date: Thu, 28 Aug 2025 16:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] arm64: kconfig: Add Kconfig entry for MPAM
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-8-james.morse@arm.com>
 <0c8a6a7c-3d0d-4093-8bc5-3a04f70b00fa@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <0c8a6a7c-3d0d-4093-8bc5-3a04f70b00fa@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085837_122947_ED7543AC 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Ben,

On 27/08/2025 09:53, Ben Horgan wrote:
> On 8/22/25 16:29, James Morse wrote:
>> The bulk of the MPAM driver lives outside the arch code because it
>> largely manages MMIO devices that generate interrupts. The driver
>> needs a Kconfig symbol to enable it, as MPAM is only found on arm64
>> platforms, that is where the Kconfig option makes the most sense.
>>
>> This Kconfig option will later be used by the arch code to enable
>> or disable the MPAM context-switch code, and registering the CPUs
>> properties with the MPAM driver.

>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index e9bbfacc35a6..658e47fc0c5a 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2060,6 +2060,23 @@ config ARM64_TLB_RANGE
>>  	  ARMv8.4-TLBI provides TLBI invalidation instruction that apply to a
>>  	  range of input addresses.
>>  
>> +config ARM64_MPAM
>> +	bool "Enable support for MPAM"
>> +	help
>> +	  Memory Partitioning and Monitoring is an optional extension
>> +	  that allows the CPUs to mark load and store transactions with
>> +	  labels for partition-id and performance-monitoring-group.
>> +	  System components, such as the caches, can use the partition-id
>> +	  to apply a performance policy. MPAM monitors can use the
>> +	  partition-id and performance-monitoring-group to measure the
>> +	  cache occupancy or data throughput.
>> +
>> +	  Use of this extension requires CPU support, support in the
>> +	  memory system components (MSC), and a description from firmware
>> +	  of where the MSC are in the address space.
>> +
>> +	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
>> +
>>  endmenu # "ARMv8.4 architectural features"

> Should this be moved to "ARMv8.2 architectural features" rather than the
> 8.4 menu? In the arm reference manual, version L.b, I see FEAT_MPAM
> listed in the section A2.2.3.1 Features added to the Armv8.2 extension
> in later releases.

Hmmm, I don't think we've done that anywhere else. I'm only aware of one v8.2 platform
that had it, and those are not widely available. As it was a headline v8.4 feature I'd
prefer to keep it there.

I think its more confusing to put it under v8.2!


Thanks,

James

