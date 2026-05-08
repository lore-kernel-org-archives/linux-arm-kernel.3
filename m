Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA68CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0QpackSFBJzqZdIHYwEvKpC3AAOM/CtfFY+JF5sqMo=; b=yabx7tHr3v3hktuyut574aCRHs
	dQ0hC751KKJkjBZ3oSwA+qoXjlN7OHClKTsWcZKNj7AOTmMsJJ5IGojIIT7iJ9UexWbRM367/ir3C
	Owr7YVW1y6duM7B5WnqSL/31akpl0NjPY/1bDbu3VpBZXk6zNgNpZLk0XYOVklaNx3VNk0yI+R6F6
	khzW5SChKODhQ6tX1eHj0MXxuSarS3+LOEIBsM6NRFJxFdqx9cnrgnUi0cCNluW5MrqJGc8rbwA3k
	WhLNSgkD6J6Qh8lRaQyFdsS3VGAibHb0v9BV8X3HUGva+JIIgiftnZJZ7SneZsmhCyqQy5+XpVzta
	jb30ZPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIiY-00000006GO9-2qrq;
	Fri, 08 May 2026 10:46:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIiV-00000006GN3-1S3i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C128B1C01;
	Fri,  8 May 2026 03:45:52 -0700 (PDT)
Received: from [10.57.63.248] (unknown [10.57.63.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 847223F763;
	Fri,  8 May 2026 03:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778237158; bh=yyZzoYvssdmpBPRlr1SJGXb2t0ugmFYZleDiF4Y/D5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KA0eieWeLNPgGr4n8aoPRUnkbT8E4iRGWp0RUrRa49SRyuVOv1N1sDkNm3t3stpI6
	 v1GwklLlCbo96Le5Flzdm3+ihD+p7kNSNC6JdvDw62LmHlg8wlHvUDlEoHCb73WJl7
	 q+KVVETaIvT6Q/oEAyLPh7f87zK2Ng7uMffYH+2o=
Message-ID: <b00c0492-e71a-4be6-b95f-ec3b424cc8ac@arm.com>
Date: Fri, 8 May 2026 11:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iommu: Add PCI vendor:device ID to IOMMU fault logs
To: Yigit Oguz <yigitogu@amazon.de>, joro@8bytes.org, will@kernel.org,
 baolu.lu@linux.intel.com, dwmw2@infradead.org, suravee.suthikulpanit@amd.com
Cc: jgg@ziepe.ca, nicolinc@nvidia.com, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260506150541.60467-1-yigitogu@amazon.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260506150541.60467-1-yigitogu@amazon.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_034559_526360_EB831317 
X-CRM114-Status: GOOD (  18.01  )
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

On 2026-05-06 4:05 pm, Yigit Oguz wrote:
> IOMMU fault and event logs currently identify devices using only their
> PCI segment/bus/device/function (SSSS:BB:DD.F). While mapping a single
> BDF to a device type is straightforward, doing so at scale across many
> hosts and thousands of fault events requires additional tooling and
> manual cross-referencing. Including the vendor:device ID directly in
> the log line makes each event self-contained and immediately actionable
> without any post-processing.

Sorry, but why are unexpected DMA faults happening "at scale" in the 
first place? If you have so many broken drivers that disambiguating them 
needs help from the kernel, something seems fundamentally wrong with 
that picture. Conversely if these are devices assigned to userspace then 
we should perhaps reconsider their ability to spam up the host kernel 
log at will anyway.

I'm not saying I necessarily have anything against this change in 
particular, but it has a strong smell of effort being spent on the wrong 
thing...

(And even then AFAICS it only really helps in the specific scenario of 
having only one of each type of device, otherwise you're back to still 
needing per-system knowledge of how BDFs map to physical instances to 
know what's what.)

Thanks,
Robin.

> This series adds vendor:device ID (VVVV:DDDD) to IOMMU event logs for
> ARM SMMUv3, Intel VT-d and AMD IOMMU.
> 
> Before:
>    arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0000:2b:11.6
>      sid: 0x158e ssid: 0x0 iova: 0x280000000000 ipa: 0x0
>    DMAR: [DMA Write NO_PASID] Request device [86:00.0] fault addr 0xe0000000
>      [fault reason 0x05] PTE Write access is not set
>    AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 domain=0x000a
>      address=0xe0000000 flags=0x0020]
> 
> After:
>    arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0000:2b:11.6 [8086:1533]
>      sid: 0x158e ssid: 0x0 iova: 0x280000000000 ipa: 0x0
>    DMAR: [DMA Write NO_PASID] Request device [0000:86:00.0 8086:1533] fault addr 0xe0000000
>      [fault reason 0x05] PTE Write access is not set
>    AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 8086:1533 domain=0x000a
>      address=0xe0000000 flags=0x0020]
> 
> Patch 1 adds vendor:device ID to ARM SMMUv3 translation fault logs.
> Patch 2 adds PCI segment and vendor:device ID to Intel VT-d DMAR
>          fault logs.
> Patch 3 adds a devid_str helper and vendor:device ID to all AMD IOMMU
>          event log paths.
> 
> Testing:
> Build-tested against mainline Linux (torvalds/master).
> 
> Runtime-tested on a custom downstream branch on ARM SMMUv3, Intel VT-d and
> AMD IOMMU hosts. Translation faults were induced in a virtualized setup
> by removing DMA mappings for an in-use region, causing the assigned device's
> subsequent DMA transactions to hit unmapped IOVAs and produce
> translation fault events. The resulting log lines were verified to
> contain the PCI vendor:device ID on all three platforms.
> 
> Lilit Janpoladyan (1):
>    iommu/arm-smmu-v3: Print PCI vendor:device ID in SMMU translation
>      fault logs
> 
> Yigit Oguz (2):
>    iommu/vt-d: Add PCI segment and vendor:device ID to DMAR fault logs
>    iommu/amd: Add vendor:device ID to AMD IOMMU event logs
> 
>   drivers/iommu/amd/iommu.c                   | 94 +++++++++++++--------
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 29 ++++++-
>   drivers/iommu/intel/dmar.c                  | 33 +++++---
>   3 files changed, 104 insertions(+), 52 deletions(-)
> 


