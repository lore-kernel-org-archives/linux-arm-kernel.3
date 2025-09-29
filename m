Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23954CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nT1i9g4Cw8/ERstNnGlgIxhUW3IxWJKDph/13ccc7E=; b=fUIckpkHVnxeSsGvnXZUbwB2xX
	D3PZlLFQvfXqRGCeifL54U+jI3sWY06t5E6FNRKsAiJJJWuu9XHcFgZLQzj13pGVj1m8LHs94bDjY
	Hy2ZK8mh6wa6zu7GYgND5FvvVHqZxtcVkZnW80tsqcrlaTWAvRZbX4yV5QZ7ZFgi0YrcNLCmdyrsK
	euNSAgjjM+e0epxYd4056JifG+a+F26qWa3tdNJ21IvKbInwQsGLtdEI57awQfchpDalukzJWPq9q
	AbmbxN4c0BODLlHuzbNdTFj27vJdA4dhF1AXJbEino1i0T9E40HV+56saYvGFzCrniFF2QEVTF4/L
	7RmRifLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HvC-000000039eg-0e0c;
	Mon, 29 Sep 2025 17:44:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hv9-000000039e6-1oO8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:44:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52EC9150C;
	Mon, 29 Sep 2025 10:44:08 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D5963F59E;
	Mon, 29 Sep 2025 10:44:10 -0700 (PDT)
Message-ID: <4d037a74-966c-497d-a9b7-6cdffdf31020@arm.com>
Date: Mon, 29 Sep 2025 18:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/29] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
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
 <20250910204309.20751-8-james.morse@arm.com>
 <d9f6bfa6-4d58-4467-aa97-4e46f88e919e@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <d9f6bfa6-4d58-4467-aa97-4e46f88e919e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104419_511035_1F945C10 
X-CRM114-Status: GOOD (  10.85  )
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

On 17/09/2025 12:03, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
>> only be accessible from those CPUs, and they may not be online.
>> Touching the hardware early is pointless as MPAM can't be used until
>> the system-wide common values for num_partid and num_pmg have been
>> discovered.
>>
>> Start with driver probe/remove and mapping the MSC.

>> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
>> new file mode 100644
>> index 000000000000..92b48fa20108
>> --- /dev/null
>> +++ b/drivers/resctrl/Makefile
>> @@ -0,0 +1,4 @@
>> +obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
>> +mpam-y						+= mpam_devices.o
>> +
>> +cflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> 
> s/cflags/ccflags/


Fixed, thanks,

James

