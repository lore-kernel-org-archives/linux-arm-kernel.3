Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vee/TLMNG6EI8Cz9DnAPyhQqR0gceHv7S+20tpt4Xgk=; b=b/Dgx68jVpsmDm82ZZJdFW0YGN
	YBb/y3ZhLnTh1rFroRoQwjpUqX8Iq075Qn5K6arhlsjBieSurzVcHnl2B+zAgm7Z9e43yICQb+6YW
	4tgorvGln5fRUhaPMy/7aUBMmxv7BCoieWSCNJShseGgVEbh4pQtXwkD/9ic3U0h6fjNDwI6TpIhH
	pRufgKvrplbJNdQcUg3szzYfopo+fJew2EqTmEnwIbnMZdeAf348N3aaROJlwUMUrGAl5QjV8gng3
	GGsTQ8EpeAJ0TUt+/C1d1D0eSeemwBi08eGJkt4xw3WIulhSfkGsLkBjTdJ57UMn47xk6Y7A7LK0X
	eUBsEkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0o9-00000008Vmk-15sE;
	Fri, 12 Sep 2025 10:15:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0o7-00000008Vko-0h1T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:15:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7973916A3;
	Fri, 12 Sep 2025 03:14:57 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563A93F66E;
	Fri, 12 Sep 2025 03:15:01 -0700 (PDT)
Message-ID: <3a93f4f3-cafc-40f5-b405-d42d5f5c9525@arm.com>
Date: Fri, 12 Sep 2025 11:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/29] arm64: kconfig: Add Kconfig entry for MPAM
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-6-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250910204309.20751-6-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_031507_326796_6B8C2B0B 
X-CRM114-Status: GOOD (  24.84  )
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

Hi James,

On 9/10/25 21:42, James Morse wrote:
> The bulk of the MPAM driver lives outside the arch code because it
> largely manages MMIO devices that generate interrupts. The driver
> needs a Kconfig symbol to enable it. As MPAM is only found on arm64
> platforms, the arm64 tree is the most natural home for the Kconfig
> option.
> 
> This Kconfig option will later be used by the arch code to enable
> or disable the MPAM context-switch code, and to register properties
> of CPUs with the MPAM driver.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> CC: Dave Martin <dave.martin@arm.com>
> ---
> Changes since v1:
>  * Help text rewritten by Dave.
> ---
>  arch/arm64/Kconfig | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..4be8a13505bf 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2060,6 +2060,29 @@ config ARM64_TLB_RANGE
>  	  ARMv8.4-TLBI provides TLBI invalidation instruction that apply to a
>  	  range of input addresses.
>  
> +config ARM64_MPAM
> +	bool "Enable support for MPAM"
> +	help
> +	  Memory System Resource Partitioning and Monitoring (MPAM) is an
> +	  optional extension to the Arm architecture that allows each
> +	  transaction issued to the memory system to be labelled with a
> +	  Partition identifier (PARTID) and Performance Monitoring Group
> +	  identifier (PMG).
> +
> +	  Memory system components, such as the caches, can be configured with
> +	  policies to control how much of various physical resources (such as
> +	  memory bandwidth or cache memory) the transactions labelled with each
> +	  PARTID can consume.  Depending on the capabilities of the hardware,
> +	  the PARTID and PMG can also be used as filtering criteria to measure
> +	  the memory system resource consumption of different parts of a
> +	  workload.
> +
> +	  Use of this extension requires CPU support, support in the
> +	  Memory System Components (MSC), and a description from firmware
> +	  of where the MSCs are in the address space.
> +
> +	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
> +
>  endmenu # "ARMv8.4 architectural features"
>  
>  menu "ARMv8.5 architectural features"

Seems good to me. I guess we can consider separately whether we want
this to be default or not.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


