Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJcLFKuVNtRfzh7rxnD3XjTpwza5xFZ3kE2C5rssaTI=; b=aPG9e+k7YyTHOm/mSjZ8I2uqLY
	ZwXVi3vt9yrpFnNJBHhWdWBBsObgOZ5qEoiZWO774bK07ADmazyQ1pMWvwwfic2L3r8e5D776tCMy
	9d9Ijjl+DzQJsfkH2z829sgl8fGsyCAIm00O2fFvz4b880LQvg5x0CXxzRXC2vMUBBoyS8ypDQ9mX
	mvSJL2nLdTQC9713KPM3P9w6KLAbYo222suovabb9+XK7l3SaFk/yjvC+1Eul6EZufcoxMSqyZwyH
	Gsm+v2Bqw/Onj9c9r8tnwks2DHqv25Dp/FZ9JGZKf3Vf0V3xYC/dCvymVxEN3sL2kcRKnAVZqRM3v
	xiHJghrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujieE-0000000G2Ns-1SvK;
	Wed, 06 Aug 2025 18:13:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiUp-0000000G14c-2fO7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:04:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04131176C;
	Wed,  6 Aug 2025 11:04:07 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B85C3F738;
	Wed,  6 Aug 2025 11:04:09 -0700 (PDT)
Message-ID: <6a77726d-1881-4590-8021-623c877bb5d7@arm.com>
Date: Wed, 6 Aug 2025 19:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/36] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-14-james.morse@arm.com> <aIIiazUK4S_G6loe@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aIIiazUK4S_G6loe@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110415_715709_7024C7B4 
X-CRM114-Status: GOOD (  16.38  )
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

Hi Catalin,

On 24/07/2025 13:09, Catalin Marinas wrote:
> On Fri, Jul 11, 2025 at 06:36:25PM +0000, James Morse wrote:
>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
>> only be accessible from those CPUs, and they may not be online.
>> Touching the hardware early is pointless as MPAM can't be used until
>> the system-wide common values for num_partid and num_pmg have been
>> discovered.
>>
>> Start with driver probe/remove and mapping the MSC.

>>  arch/arm64/Kconfig                          |   1 +
>>  drivers/platform/arm64/Kconfig              |   1 +
>>  drivers/platform/arm64/Makefile             |   1 +
>>  drivers/platform/arm64/mpam/Kconfig         |  10 +
>>  drivers/platform/arm64/mpam/Makefile        |   4 +
>>  drivers/platform/arm64/mpam/mpam_devices.c  | 336 ++++++++++++++++++++
>>  drivers/platform/arm64/mpam/mpam_internal.h |  62 ++++
>>  7 files changed, 415 insertions(+)
>>  create mode 100644 drivers/platform/arm64/mpam/Kconfig
>>  create mode 100644 drivers/platform/arm64/mpam/Makefile
>>  create mode 100644 drivers/platform/arm64/mpam/mpam_devices.c
>>  create mode 100644 drivers/platform/arm64/mpam/mpam_internal.h

> Bikeshedding: why not drivers/resctrl to match fs/resctrl? We wouldn't
> need the previous patch either to move the arm64 platform drivers.

Initially because I don't see any other architecture having an MMIO interface to this
stuff, and didn't want a 'top level' driver directory for a single driver. But, re-reading
RISC-Vs CBQRI[0] it turns out that theirs is memory mapped...


> I'm not an expert on resctrl but the MPAM code looks more like a backend
> for the resctrl support, so it makes more sense to do as we did for
> other drivers like irqchip, iommu.

Only because there are many irqchip or iommu. I'm not a fan of drivers/mpam, but
drivers/resctrl would suit RISC-V too. (I'll check with Drew)


Thanks,

James

[0] https://patchew.org/linux/20230419111111.477118-1-dfustini@baylibre.com/

