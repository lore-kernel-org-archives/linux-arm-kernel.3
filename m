Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C8ED185CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80K+d4Szn6RvlP9wVPPYJwKN3aMRnNo3dCDMAoay0As=; b=g4tj0mIa1bt9Ex
	EaZs4WHkKe/G/0mX4Ys5A6ozcO0F94KJtBbaJNlGfOlEG6YSjs23ha51wqSQRU6L0UopvN7jmUU85
	5fNIZtXusJScAJWhJUi/4WISM4ZhNz1xo3c0EKUoGTn9/bFCgmbRnP1H37ZsLL84au1mCU9CBHiJa
	fLinQFXtlT0gCj8KVxI14BJUGzELy6PgboyW5cZOuC6S7w73NzijZgL8fYs8q5F7rbGO3l6F4X6lu
	NZnkTXCECMEi9e/ICV45xp1ZTXe2aBYk3j0h1pwtuHbMX71mYyOMPsO4eYhdJQ3pQjYobLqT7emXT
	AWbIcn53VXFDgVRxukFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoS0-0000000GtKI-3Kl0;
	Thu, 08 Jan 2026 11:45:12 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoRw-0000000GtIm-328x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:45:10 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260108114503euoutp0162493f06a5aa00dad98fc1ae94961ce6~Ivtt19nno1561415614euoutp01d
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 11:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260108114503euoutp0162493f06a5aa00dad98fc1ae94961ce6~Ivtt19nno1561415614euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767872703;
	bh=80K+d4Szn6RvlP9wVPPYJwKN3aMRnNo3dCDMAoay0As=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=J2E4DuaCy6+4FUxry+Tn1XeH87/YA0Nm4UjVkxrph9SmNJ2a1v6zW2o9uouRlYEw2
	 1c9XdXUQVm5I2ZNtBxe3VoeEt91ceOeW9lZzN5rAjuzl7L+j7KDFSFmuEWTieDulaq
	 ApUx4sYyPm8IAEoAXJLbbAvSh0YdDr+VrE/+/ohI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260108114503eucas1p1a3e0deb0e605e7382bf16448c83ec6f8~Ivtth0YBR2914529145eucas1p1x;
	Thu,  8 Jan 2026 11:45:03 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260108114501eusmtip15f0fd6545e69b98729bf484cf7dc88fd~IvtsWADvp1512515125eusmtip1d;
	Thu,  8 Jan 2026 11:45:01 +0000 (GMT)
Message-ID: <b331d1a8-e5ff-40ae-89b8-e1e30f523d06@samsung.com>
Date: Thu, 8 Jan 2026 12:45:01 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
To: Robin Murphy <robin.murphy@arm.com>, Barry Song <21cnbao@gmail.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <551bb2e3-d7c7-4949-a9bd-ce0cf70e7134@arm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260108114503eucas1p1a3e0deb0e605e7382bf16448c83ec6f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107131700eucas1p17e2d8e705c31f81d861d02588380ea16
X-EPHeader: CA
X-CMS-RootMailID: 20260107131700eucas1p17e2d8e705c31f81d861d02588380ea16
References: <20251226225254.46197-1-21cnbao@gmail.com>
	<20251226225254.46197-6-21cnbao@gmail.com> <20251227200933.GO11869@unreal>
	<CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
	<20251228145041.GS11869@unreal>
	<CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
	<de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
	<CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
	<CGME20260107131700eucas1p17e2d8e705c31f81d861d02588380ea16@eucas1p1.samsung.com>
	<551bb2e3-d7c7-4949-a9bd-ce0cf70e7134@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_034509_388261_2AEA8FEA 
X-CRM114-Status: GOOD (  27.77  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 07.01.2026 14:16, Robin Murphy wrote:
> On 2026-01-06 7:47 pm, Barry Song wrote:
>> On Wed, Jan 7, 2026 at 8:12 AM Robin Murphy <robin.murphy@arm.com> 
>> wrote:
>>>
>>> On 2026-01-06 6:41 pm, Barry Song wrote:
>>>> On Mon, Dec 29, 2025 at 3:50 AM Leon Romanovsky <leon@kernel.org> 
>>>> wrote:
>>>>>
>>>>> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
>>>>>> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> 
>>>>>> wrote:
>>>>>>>
>>>>>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
>>>>>>>> From: Barry Song <baohua@kernel.org>
>>>>>>>>
>>>>>>>> Instead of performing a flush per SG entry, issue all cache
>>>>>>>> operations first and then flush once. This ultimately benefits
>>>>>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
>>>>>>>>
>>>>>>>> Cc: Leon Romanovsky <leon@kernel.org>
>>>>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>>>>> Cc: Will Deacon <will@kernel.org>
>>>>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>>>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>>>>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>>>>>>> ---
>>>>>>>>    kernel/dma/direct.c | 14 +++++++-------
>>>>>>>>    1 file changed, 7 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> <...>
>>>>>>>
>>>>>>>> -             if (!dev_is_dma_coherent(dev)) {
>>>>>>>> +             if (!dev_is_dma_coherent(dev))
>>>>>>>> arch_sync_dma_for_device(paddr, sg->length,
>>>>>>>>                                         dir);
>>>>>>>> -                     arch_sync_dma_flush();
>>>>>>>> -             }
>>>>>>>>         }
>>>>>>>> +     if (!dev_is_dma_coherent(dev))
>>>>>>>> +             arch_sync_dma_flush();
>>>>>>>
>>>>>>> This patch should be squashed into the previous one. You introduced
>>>>>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
>>>>>>
>>>>>> Hi Leon,
>>>>>>
>>>>>> The previous patch replaces all arch_sync_dma_for_* calls with
>>>>>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
>>>>>> functional change. The subsequent patches then implement the
>>>>>> actual batching. I feel this is a better approach for reviewing
>>>>>> each change independently. Otherwise, the previous patch would
>>>>>> be too large.
>>>>>
>>>>> Don't worry about it. Your patches are small enough.
>>>>
>>>> My hardware does not require a bounce buffer, but I am concerned that
>>>> this patch may be incorrect for systems that do require one.
>>>>
>>>> Now it is:
>>>>
>>>> void dma_direct_sync_sg_for_cpu(struct device *dev,
>>>>                   struct scatterlist *sgl, int nents, enum 
>>>> dma_data_direction dir)
>>>> {
>>>>           struct scatterlist *sg;
>>>>           int i;
>>>>
>>>>           for_each_sg(sgl, sg, nents, i) {
>>>>                   phys_addr_t paddr = dma_to_phys(dev, 
>>>> sg_dma_address(sg));
>>>>
>>>>                   if (!dev_is_dma_coherent(dev))
>>>>                           arch_sync_dma_for_cpu(paddr, sg->length, 
>>>> dir);
>>>>
>>>>                   swiotlb_sync_single_for_cpu(dev, paddr, 
>>>> sg->length, dir);
>>>>
>>>>                   if (dir == DMA_FROM_DEVICE)
>>>>                           arch_dma_mark_clean(paddr, sg->length);
>>>>           }
>>>>
>>>>           if (!dev_is_dma_coherent(dev)) {
>>>>                   arch_sync_dma_flush();
>>>>                   arch_sync_dma_for_cpu_all();
>>>>           }
>>>> }
>>>>
>>>> Should we call swiotlb_sync_single_for_cpu() and
>>>> arch_dma_mark_clean() after the flush to ensure the CPU sees the
>>>> latest data and that the memcpy is correct? I mean:
>>>
>>> Yes, this and the equivalents in the later patches are broken for all
>>> the sync_for_cpu and unmap paths which may end up bouncing (beware some
>>> of them get a bit fiddly) - any cache maintenance *must* be completed
>>> before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 
>>> thing,
>>> and appears to be entirely dead now.
>>
>> Thanks, Robin. Personally, I would prefer an approach like the one 
>> below—
>> that is, not optimizing the bounce buffer cases, as they are already 
>> slow
>> due to hardware limitations with memcpy, and optimizing them would make
>> the code quite messy.
>>
>> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
>> index 550a1a13148d..a4840f7e8722 100644
>> --- a/kernel/dma/direct.c
>> +++ b/kernel/dma/direct.c
>> @@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>>          for_each_sg(sgl, sg, nents, i) {
>>                  phys_addr_t paddr = dma_to_phys(dev, 
>> sg_dma_address(sg));
>>
>> -               if (!dev_is_dma_coherent(dev))
>> +               if (!dev_is_dma_coherent(dev)) {
>>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
>> +                       if (unlikely(dev->dma_io_tlb_mem))
>> +                               arch_sync_dma_flush();
>> +               }
>>
>>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, 
>> dir);
>>
>> I’d like to check with you, Leon, and Marek on your views about this.
>
> That doesn't work, since dma_io_tlb_mem is always initialised if a 
> SWIOTLB buffer exists at all. Similarly I think the existing 
> dma_need_sync tracking is also too coarse, as that's also always going 
> to be true for a non-coherent device.
>
> Really this flush wants to be after the swiotlb_find_pool() check in 
> the swiotlb_tbl_unmap_single()/__swiotlb_sync_single_for_cpu() paths, 
> as that's the only point we know for sure it's definitely needed for 
> the given address. It would then be rather fiddly to avoid 
> potentially-redundant flushes for the non-sg cases (and the final 
> segment of an sg), but as you already mentioned, if it's limited to 
> cases when we *are* already paying the cost of bouncing anyway, 
> perhaps one extra DSB isn't *too* bad if it means zero impact to the 
> non-bouncing paths.

I agree with Robin, optimizing the swiotlb path doesn't make much sense.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


