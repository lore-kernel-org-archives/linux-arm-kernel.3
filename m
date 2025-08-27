Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7966CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+vft1O4j7bzhrigQaNq75cEj1lanLo5Kb6/StfmDGg=; b=1Qzwgs7YscXpLgecnfzQWwp/8l
	45+xaFZ9THjgKc6WzaW/6JQhOaSRE0r595UyZz5RrD8hqM2ehB41jtk8rTYpLpNLt+FGlToxMWwVI
	u9lG3UtjVEkh+w8LE3/P7vDOBxwkXcS7cX9by6vMK5ZgpUSROUnLq5kEAH6U/kd+ZSUZiyD9Um4Bn
	CV6x5T+8Iun71juZ3RvDMzWKWaOXiKua3CdPuRUOA4kI2TAHUWSu2LZ9P/7/4iHfnvAgmmEEB07UZ
	v+iPUYR154Jx+Tr4ZU154BYCf/gd+cqLPN8TCbs6sNzQfKE2ZeJ9VO5DMY5mCO3EYC1n+ShnW/jhH
	XHYAopMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEmE-0000000FM18-4A22;
	Wed, 27 Aug 2025 11:57:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDuZ-0000000F9Ac-46da
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:01:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2EB1688;
	Wed, 27 Aug 2025 04:01:42 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24B543F694;
	Wed, 27 Aug 2025 04:01:45 -0700 (PDT)
Date: Wed, 27 Aug 2025 12:01:42 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 07/33] arm64: kconfig: Add Kconfig entry for MPAM
Message-ID: <aK7llvNbXZKWhtoo@e133380.arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-8-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822153048.2287-8-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_040152_058335_CA950197 
X-CRM114-Status: GOOD (  35.40  )
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

<super-pedantic mode enabled>

(Since this likely be people's go-to patch for understanding what MPAM
is, it is probably worth going the extra mile.)

On Fri, Aug 22, 2025 at 03:29:48PM +0000, James Morse wrote:
> The bulk of the MPAM driver lives outside the arch code because it
> largely manages MMIO devices that generate interrupts. The driver
> needs a Kconfig symbol to enable it, as MPAM is only found on arm64

Prefer -> "[...] to enable it. As MPAM is only [...]"

> platforms, that is where the Kconfig option makes the most sense.

It could be clearer what "where" refers to, here.

Maybe reword from ", that is [...]" -> ", the arm64 tree is the most
natural home for the Kconfig option."

(Or something like that.)

> This Kconfig option will later be used by the arch code to enable
> or disable the MPAM context-switch code, and registering the CPUs

Nit: "registering" -> "to register"

> properties with the MPAM driver.

Nit: "CPUs properties" -> "properties of CPUs" ?

(Maybe there was just a missed apostrophe, but it may be more readable
here if written out longhand.)


> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  arch/arm64/Kconfig | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..658e47fc0c5a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2060,6 +2060,23 @@ config ARM64_TLB_RANGE
>  	  ARMv8.4-TLBI provides TLBI invalidation instruction that apply to a
>  	  range of input addresses.
>  
> +config ARM64_MPAM
> +	bool "Enable support for MPAM"
> +	help

<pedantic mode on>

> +	  Memory Partitioning and Monitoring is an optional extension
> +	  that allows the CPUs to mark load and store transactions with

Nit: "memory transactions" ?

(I'm wondering whether there are some transactions such as atomic
exchanges that are not neatly characterised as "load" or "store".
Possibly MPAM labels some transactions that really are neither.)

> +	  labels for partition-id and performance-monitoring-group.

Nit: the hyphenation suggests that these are known terms (in this
specific, hyphenated, form) with specific definitions somewhere.
I don't think that this is the case?  At least, I have not seen the
terms presented in this way anywhere else.

Also, the partition ID is itself a label, so "label for partition-id"
is a tautology.

How about:

--8<--

	  Memory System Resource Partitioning and Monitoring (MPAM) is an
	  optional extension to the Arm architecture that allows each
	  transaction issued to the memory system to be labelled with a
	  Partition identifier (PARTID) and Performance Monitoring Group
	  identifier (PMG).

-->8--

(Yes, that really seems to be what MPAM stands for in the published
specs.  That's quite a mounthful, and news to me...  I can't say I paid
much attention to the document titles beyond "MPAM"!)

> +	  System components, such as the caches, can use the partition-id
> +	  to apply a performance policy. MPAM monitors can use the

What is a "performance policy"?

The MPAM specs talk about resource controls; it's probably best to
stick to the same terminology.

> +	  partition-id and performance-monitoring-group to measure the
> +	  cache occupancy or data throughput.

So, how about something like:

--8<--

	  Memory system components, such as the caches, can be configured with
	  policies to control how much of various physical resources (such as
	  memory bandwidth or cache memory) the transactions labelled with each
	  PARTID can consume.  Depending on the capabilities of the hardware,
	  the PARTID and PMG can also be used as filtering criteria to measure
	  the memory system resource consumption of different parts of a
	  workload.

-->8--

(Where "Memory system components" is used in a generic sense and so not
capitalised.)

> +
> +	  Use of this extension requires CPU support, support in the
> +	  memory system components (MSC), and a description from firmware

But here, we are explicitly using an architectural term now, so

	"Memory System Components" (MSC)

makes sense.

> +	  of where the MSC are in the address space.

Prefer "MSCs" ?  (Not everyone agrees about whether TLAs are
pluralisable but it is easier on the reader if "are" has an obviously
plural noun to bind to.)

> +
> +	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
> +
>  endmenu # "ARMv8.4 architectural features"
>  
>  menu "ARMv8.5 architectural features"

Cheers
---Dave

