Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A03C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fN+pjpI+usN98u0XUHLnj1gtbbn9MyEdyfY62o2P6ts=; b=49izxWz9YMXGgu1gQXsq+Td3J0
	zr/cSIZBl+F52lcHaYyZXb76sY5DUbZCGwCT6cqjtZZmm/0hf9RZwPVd4s4AmolJFctg1/LVF2glW
	kUkaKttq1XVYNXRm2n+Xl33pA1Gc/erltNM3VdWbeBOqWKUIAw7docSbZtyEl6TI5tH78Ovql2L4J
	UCDFDZpcSeiCRAhMYusMs/zaobUK9IZh5j28jk5JzHcXrMdpevwIBJhvv+6QmpIckBLY2C1Cgffp7
	JFVLEnm1+tNizAHhKKzmZC40U0W+JjybAdJK+4ggvK6fyMfvCvQ3eX3TMlpHmh8Av9CYE6uQXfQQX
	puLxdClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMhs-0000000Cxna-0UUB;
	Tue, 20 May 2025 13:08:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMfl-0000000CxRB-03Gw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 13:06:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD1FB1516;
	Tue, 20 May 2025 06:06:04 -0700 (PDT)
Received: from [10.57.79.215] (unknown [10.57.79.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0CB13F5A1;
	Tue, 20 May 2025 06:06:15 -0700 (PDT)
Message-ID: <def13dd2-3a23-4091-a732-e4c079df7f41@arm.com>
Date: Tue, 20 May 2025 14:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
 <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
 <20250520113146.GA18435@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250520113146.GA18435@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_060621_134703_7FCABBAD 
X-CRM114-Status: GOOD (  20.91  )
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

On 2025-05-20 12:31 pm, Will Deacon wrote:
> On Thu, May 15, 2025 at 07:48:39AM -0700, Rob Clark wrote:
>> On Thu, May 15, 2025 at 7:33 AM Will Deacon <will@kernel.org> wrote:
>>>
>>> On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> In situations where mapping/unmapping sequence can be controlled by
>>>> userspace, attempting to map over a region that has not yet been
>>>> unmapped is an error.  But not something that should spam dmesg.
>>>>
>>>> Now that there is a quirk, we can also drop the selftest_running
>>>> flag, and use the quirk instead for selftests.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> Acked-by: Robin Murphy <robin.murphy@arm.com>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>   drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
>>>>   include/linux/io-pgtable.h     |  8 ++++++++
>>>>   2 files changed, 22 insertions(+), 13 deletions(-)
>>>
>>> [...]
>>>
>>>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>>>> index bba2a51c87d2..639b8f4fb87d 100644
>>>> --- a/include/linux/io-pgtable.h
>>>> +++ b/include/linux/io-pgtable.h
>>>> @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
>>>>         *
>>>>         * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
>>>>         * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
>>>> +      *
>>>> +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
>>>> +      *      mappings, but silently return -EEXISTS.  Normally an attempt
>>>> +      *      to map over an existing mapping would indicate some sort of
>>>> +      *      kernel bug, which would justify the WARN_ON().  But for GPU
>>>> +      *      drivers, this could be under control of userspace.  Which
>>>> +      *      deserves an error return, but not to spam dmesg.
>>>>         */
>>>>        #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
>>>>        #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
>>>> @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
>>>>        #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
>>>>        #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
>>>>        #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
>>>> +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
>>>
>>> This feels a bit fragile to me:
>>>    * IOMMU-API users of io-pgtable shouldn't be passing this quirk
>>>      but might end up doing so to paper over driver bugs.
>>>
>>>    * Low-level users of io-pgtable who expose page-table operations to
>>>      userspace need to pass the quirk, but might well not bother because
>>>      well-behaved userspace doesn't trigger the warning.
>>>
>>> So overall, it's all a bit unsatisfactory. Is there a way we could have
>>> the warnings only when invoked via the IOMMU API?
>>
>> iommu drivers _not_ setting this flag seems like a good way to achieve that ;-)
>>
>> The alternative is to move the warns to the iommu driver... but they
>> could just as easily remove the WARN_ON()s as they could set the
>> NO_WARN_ON quirk, so :shrug:?
> 
> Bah, I also don't have a good idea to improve this, so I guess I'll take
> what you have for now.

Hmm, just a nit on reflection, how about fixing up the name to just 
IO_PGTABLE_QUIRK_NO_WARN? Given that it's already quite long, and we 
have a well-established DMA_ATTR_NO_WARN with equivalent semantics over 
in the DMA API.

Cheers,
Robin.

