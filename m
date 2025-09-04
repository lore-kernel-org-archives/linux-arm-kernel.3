Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C535CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5y9V1ppOYqaC50IOGXlzQi9tRwG12IidZz/lClMuKU=; b=lvIICRMQQw1AltAXJdpNVvuVE+
	WIOcNd64A0HIpA5RHp8CnSESxe76TEn3HpBcLWnGHbb9LkxwTIXI8gR6KNKGFY5OAOPAUDqtHVbph
	8cHdfqB/gVn3ngVhjMx1FjiAdaHIfGJIkzc+M3fLgzLybqB+76fTCisZyAALitiV7NsEhCdtFMfI3
	ddVghZQKcn2CGsqZp7Eg1vQWWcm8YxirSfMIBOorPl6lIMVF075Xy6YDOER7Vp7YYPTAC/VwS+vUd
	W8PQIumL+9xUIZ6MVrRr/+BGmFS67YIy7DcwmR1UARjD7EvsBroFBOCNGMNnVkOfTyqaZW+JTru0o
	8fb5xSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGLh-0000000EBhb-0SYz;
	Thu, 04 Sep 2025 20:14:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDl3-0000000DG4i-23HL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 17:28:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F2651596;
	Thu,  4 Sep 2025 10:28:12 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14AF53F6A8;
	Thu,  4 Sep 2025 10:28:15 -0700 (PDT)
Message-ID: <978cf822-4d7c-4301-bbc4-752f184c93d6@arm.com>
Date: Thu, 4 Sep 2025 18:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] arm64: kconfig: Add Kconfig entry for MPAM
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
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
 <aK7llvNbXZKWhtoo@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7llvNbXZKWhtoo@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_102825_625035_C33A69C1 
X-CRM114-Status: GOOD (  43.28  )
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

Hi Dave,

On 27/08/2025 12:01, Dave Martin wrote:
> <super-pedantic mode enabled>

Uh oh!

> (Since this likely be people's go-to patch for understanding what MPAM
> is, it is probably worth going the extra mile.)
> 
> On Fri, Aug 22, 2025 at 03:29:48PM +0000, James Morse wrote:
>> The bulk of the MPAM driver lives outside the arch code because it
>> largely manages MMIO devices that generate interrupts. The driver
>> needs a Kconfig symbol to enable it, as MPAM is only found on arm64
> 
> Prefer -> "[...] to enable it. As MPAM is only [...]"
> 
>> platforms, that is where the Kconfig option makes the most sense.
> 
> It could be clearer what "where" refers to, here.

Sure,


> Maybe reword from ", that is [...]" -> ", the arm64 tree is the most
> natural home for the Kconfig option."
> 
> (Or something like that.)

Sure,


>> This Kconfig option will later be used by the arch code to enable
>> or disable the MPAM context-switch code, and registering the CPUs
> 
> Nit: "registering" -> "to register"
> 
>> properties with the MPAM driver.
> 
> Nit: "CPUs properties" -> "properties of CPUs" ?
> 
> (Maybe there was just a missed apostrophe, but it may be more readable
> here if written out longhand.)

Done, it just takes one person to think its clearer!


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
> 
> <pedantic mode on>
> 
>> +	  Memory Partitioning and Monitoring is an optional extension
>> +	  that allows the CPUs to mark load and store transactions with
> 
> Nit: "memory transactions" ?

Sure,

> (I'm wondering whether there are some transactions such as atomic
> exchanges that are not neatly characterised as "load" or "store".
> Possibly MPAM labels some transactions that really are neither.)

Equally instruction fetch and possibly even CMOs get these labels.
I wanted something other than 'transactions' so it wasn't confused with
transactional memory - and traffic seemed to vauge.

I don't think anyone expects a formal definition in the Kconfig text...


>> +	  labels for partition-id and performance-monitoring-group.
> 
> Nit: the hyphenation suggests that these are known terms (in this
> specific, hyphenated, form) with specific definitions somewhere.
> I don't think that this is the case?  At least, I have not seen the
> terms presented in this way anywhere else.
> 
> Also, the partition ID is itself a label, so "label for partition-id"
> is a tautology.
> 
> How about:
> 
> --8<--
> 
> 	  Memory System Resource Partitioning and Monitoring (MPAM) is an
> 	  optional extension to the Arm architecture that allows each
> 	  transaction issued to the memory system to be labelled with a
> 	  Partition identifier (PARTID) and Performance Monitoring Group
> 	  identifier (PMG).
> 
> -->8--

Done,


> (Yes, that really seems to be what MPAM stands for in the published
> specs.  That's quite a mounthful, and news to me...  I can't say I paid
> much attention to the document titles beyond "MPAM"!)
> 
>> +	  System components, such as the caches, can use the partition-id
>> +	  to apply a performance policy. MPAM monitors can use the
> 
> What is a "performance policy"?

A bunch of controls, the value of which reflect some kind of policy.


> The MPAM specs talk about resource controls; it's probably best to
> stick to the same terminology.
> 
>> +	  partition-id and performance-monitoring-group to measure the
>> +	  cache occupancy or data throughput.
> 
> So, how about something like:
> 
> --8<--
> 
> 	  Memory system components, such as the caches, can be configured with
> 	  policies to control how much of various physical resources (such as
> 	  memory bandwidth or cache memory) the transactions labelled with each
> 	  PARTID can consume.  Depending on the capabilities of the hardware,
> 	  the PARTID and PMG can also be used as filtering criteria to measure
> 	  the memory system resource consumption of different parts of a
> 	  workload.
> 
> -->8--

Done,


> (Where "Memory system components" is used in a generic sense and so not
> capitalised.)

(I can't wait for the Memory System Component on the Memory Side Cache!)


>> +
>> +	  Use of this extension requires CPU support, support in the
>> +	  memory system components (MSC), and a description from firmware
> 
> But here, we are explicitly using an architectural term now, so
> 
> 	"Memory System Components" (MSC)
> 
> makes sense.
> 
>> +	  of where the MSC are in the address space.
> 
> Prefer "MSCs" ?  (Not everyone agrees about whether TLAs are
> pluralisable but it is easier on the reader if "are" has an obviously
> plural noun to bind to.)

Sure,


Thanks,

James

