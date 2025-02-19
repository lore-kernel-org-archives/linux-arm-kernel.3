Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD9CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRT/IgJnObHJsJ494Yx6gTPW97xtrnWs3GkfE4H87RM=; b=njme05/m7TTXQAfL3IrG2fbpNC
	lhCe7s3kgdLkeIYbvMYzqxIZQMLnhfyBQ/GfvPHkS06AVJyXY05/vJzsdeGolIwxjRN2Qg1b2iNEj
	7r8rr1DNNkaJf69owGZEx7wsLU6dPkHlI/iYVMc7Uo83Gadj0AMAlIu7JQhr19YsHUm/uhg5+gmSS
	jrXTZ91g1ZN3XFHn3VTT0VKYqpr8wYWi3j8olq99GebG0Z+N9CdxPXYOCKd8pBw34JdVbn8kMg/92
	jTJPdFDyV8yMAwr8kdcAd38rqj+E6gsol9ya3IWeByvHrSgpz1ce0hJNMeq6Mut7XiJHQVUUJif3r
	sEjzjeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmvB-0000000DoUw-1jl0;
	Wed, 19 Feb 2025 16:27:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmtg-0000000Do1g-3bJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 16:26:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4EB81682;
	Wed, 19 Feb 2025 08:26:22 -0800 (PST)
Received: from [10.57.35.204] (unknown [10.57.35.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40A3C3F6A8;
	Wed, 19 Feb 2025 08:25:58 -0800 (PST)
Message-ID: <e0a6308f-5628-4698-95a7-ec1b918358b0@arm.com>
Date: Wed, 19 Feb 2025 16:25:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: Add BBM Level 2 cpu feature
To: Ryan Roberts <ryan.roberts@arm.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org,
 joey.gouly@arm.com, broonie@kernel.org, mark.rutland@arm.com,
 james.morse@arm.com, yangyicong@hisilicon.com, anshuman.khandual@arm.com,
 maz@kernel.org, liaochang1@huawei.com, akpm@linux-foundation.org,
 david@redhat.com, baohua@kernel.org, ioworker0@gmail.com,
 oliver.upton@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
 <20250219143837.44277-5-miko.lenczewski@arm.com>
 <a6846db8-9efa-46f8-9939-7727c83d1601@arm.com>
 <cbc3f62b-8890-42ca-81ff-66f1e4ea1cf3@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <cbc3f62b-8890-42ca-81ff-66f1e4ea1cf3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_082604_937749_5C044580 
X-CRM114-Status: GOOD (  15.01  )
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

On 2025-02-19 3:43 pm, Ryan Roberts wrote:
> On 19/02/2025 15:39, Robin Murphy wrote:
>> Hi Miko,
>>
>> On 2025-02-19 2:38 pm, Mikołaj Lenczewski wrote:
>>> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
>>> and this commit adds a dedicated BBML2 cpufeature to test against
>>> support for.
>>>
>>> This is a system feature as we might have a big.LITTLE architecture
>>> where some cores support BBML2 and some don't, but we want all cores to
>>> be available and BBM to default to level 0 (as opposed to having cores
>>> without BBML2 not coming online).
>>>
>>> To support BBML2 in as wide a range of contexts as we can, we want not
>>> only the architectural guarantees that BBML2 makes, but additionally
>>> want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
>>> us having to prove that no recursive faults can be induced in any path
>>> that uses BBML2, allowing its use for arbitrary kernel mappings.
>>> Support detection of such CPUs.
>>
>> If this may be used for splitting/compacting userspace mappings, then similarly
>> to 6e192214c6c8 ("iommu/arm-smmu-v3: Document SVA interaction with new pagetable
>> features"), strictly we'll also want a check in arm_smmu_sva_supported() to make
>> sure that the SMMU is OK with BBML2 behaviour too, and disallow SVA if not. Note
>> that the corresponding SMMUv3.2-BBML2 feature is already strict about TLB
>> conflict aborts, so is comparatively nice and straightforward.
> 
> Thanks for catching this, Robin, as I completely forgot to pass this onto Miko
> yesterday after our conversation. I suggest we tack a commit on to the end of
> this series to cover that?
> 
> I think that strictly this is not needed for Yang's series since that only uses
> BBML2 for kernel mappings, and those pgtables would never be directly shared
> with the SMMU.

Yup, it's really more just a theoretical correctness concern - certainly 
Arm's implementations from MMU-700 onwards do support BBML2, while 
MMU-600 is now sufficiently old that nobody is likely to pair it with 
new BBML-capable CPUs anyway - so it's just to cover the gap that in 
principle there may be 3rd-party implementations which might get confused.

Cheers,
Robin.

