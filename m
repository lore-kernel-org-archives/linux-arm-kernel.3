Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AFAFCB618
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSd9zazpeEUkbX9AobtFu4U51XtTMlxh1cdxXWtdwAE=; b=wy74VMMZ+R2MRGl0oS4NNB7aHS
	NI9GM9vE6kkPnc97043kD3s8bOqLOpFBHJTN5/HDREcv5SwAtvXZg56V4yxH0Z8IFHUK1+vSgq+rq
	wSRegxDXSZsWlveU/KYqac6kgiUGBa7CFoxoiZMN/e1qz9goA5mXWo3dSwS+SaR9JXKdJ9P35Fu9W
	QGDpncNKJlpA6mybPeLiTG0FfA+TEyYVjsuPIlOXBiaNOwkQ29X0QyWhLTU+YYdYEvpZUnFMfKADU
	CVmxXWf2KeBREmmvhYHKJdiuWYSwfoCBKPP3WRJGNW5Cn9oyaH1PQe6MIMQ2bIXN31ZQF1VCCSBFu
	X1ihZSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX2U-000000041Qx-1xWH;
	Fri, 06 Mar 2026 15:24:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyX2S-000000041Qb-0K7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:24:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B97B0497;
	Fri,  6 Mar 2026 07:24:19 -0800 (PST)
Received: from [10.57.57.97] (unknown [10.57.57.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEDC63F836;
	Fri,  6 Mar 2026 07:24:22 -0800 (PST)
Message-ID: <03461707-783e-403a-86fa-ae7a5107fa30@arm.com>
Date: Fri, 6 Mar 2026 15:24:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, bhelgaas@google.com, rafael@kernel.org,
 lenb@kernel.org, praan@google.com, kees@kernel.org,
 baolu.lu@linux.intel.com, smostafa@google.com,
 Alexander.Grest@microsoft.com, kevin.tian@intel.com,
 miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, vsethi@nvidia.com
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <a5ff7a43-ea52-462d-a316-d3a6c08410e0@arm.com>
 <aanwTQtMMplXY3du@Asurada-Nvidia> <20260305235252.GC1651202@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260305235252.GC1651202@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_072428_161710_516F54D2 
X-CRM114-Status: GOOD (  14.61  )
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

On 2026-03-05 11:52 pm, Jason Gunthorpe wrote:
> On Thu, Mar 05, 2026 at 01:06:21PM -0800, Nicolin Chen wrote:
>> That sounds like the IOPF implementation. Maybe inventing another
>> IOMMU_FAULT_ATC_TIMEOUT to reuse the existing infrastructure would
>> make things cleaner.
> 
> I think the routing is quite different, IOPF wants to route an event
> the domain creator, here you want to route an event to the IOMMU core
> then the PCIe RAS callbacks.
> 
> IDK if there is much to be reused there, especially since IOPF
> requires a memory allocation and ideally we should not be allocating
> memory to resolve this critical error condition.

Yeah, sorry, for a moment there I somehow forgot that we can expect to 
use ATS without PRI, so indeed tying this to IOPF wouldn't be 
appropriate. And given the general difficulty of trying to infer what 
went wrong and what to do from the CMDQ contents alone, I do like your 
idea of trying to return a new kind of sync failure back to 
arm_smmu_atc_inv_{master,domain}() so that we can take any defensive 
action from there, with all the information to hand. We'd just have to 
ensure that if a large set of ATCI commands needs to span multiple 
batches, every batch must contain its own sync (since if some other 
batch of unrelated commands could get interleaved in the middle and 
issue a sync that then fails due to someone else's ATC timeout, 
everything's likely to get confused and go wrong).

The fiddly thing then is that we might also have to be prepared to 
"handle" CMD_SYNC timeout by manually checking for GERRORs, in case the 
whole invalidation is in the context of an dma_unmap within some other 
device's IRQ handler, which happens to be on the same CPU where the 
GERROR IRQ is now pending, but can't be taken until we can complete the 
inv and return out of the current IRQ :/

Thanks,
Robin.

