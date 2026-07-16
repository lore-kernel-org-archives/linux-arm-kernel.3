Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1430BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NOe5ksl2vlSwjo56KjbWsmML1a42hyFiwBD/c9eZDU=; b=wxiUHg2mp6TYqhpJ4bRPO6ven9
	etk5uQMpgVbrkw9pQv0RNnXesPYdDjIzjkiK1XYy+8usz3a7+Tha8aRMgFamcuolicBgLkg2g7jBw
	hsxNHi0k0ntPKU3SN/JdRceTfB56V3LvKwUD3WQbRif47c80sZnQkO7SWZKV5bXiaw9DrbhMoDR/D
	f8c1MEA/On/6L+37sLSIbryrtOxrprxie+F0ZYRP857TjveYYb65GuGIAF7vqvLdrCSc0sQWc6Pl5
	4IFbFKvnFzUqomJf317lf1yYHDY7ljxaitbDJmiEFL4YJ2DKZ2QhjNffpqbhR7TbNWz5IVdetpbCW
	G6aXtywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJZd-0000000H39V-09bI;
	Thu, 16 Jul 2026 10:44:13 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJZX-0000000H38h-3kwD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:44:11 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260716104401euoutp0162896187b46659a20abee1581481c5cc~CvzYh7gBq1199711997euoutp01Z;
	Thu, 16 Jul 2026 10:44:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260716104401euoutp0162896187b46659a20abee1581481c5cc~CvzYh7gBq1199711997euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784198641;
	bh=4NOe5ksl2vlSwjo56KjbWsmML1a42hyFiwBD/c9eZDU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=MSTbwqnbrDKyLKGraNwvsA+y4j51U4MbSsUqWrLD7zYBuseQk2jHYvQzKWIBHlqF3
	 POTrMf4g8ZRPRjBC3B//DjIkSnL2hCqPkA9P1ECuexq2YdaXf+5B3xWtrCF/91gL8O
	 xIohKEswRPMt4SaVihbMOLSt8JqgZ1C22LyTuDUo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260716104401eucas1p1f2c155f5f3a4655c82e831bffdeeece7~CvzYOfJRQ0283202832eucas1p1K;
	Thu, 16 Jul 2026 10:44:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260716104357eusmtip2cc624be619bcd0856727825883ac67e0~CvzVIUrCg2851928519eusmtip2d;
	Thu, 16 Jul 2026 10:43:57 +0000 (GMT)
Message-ID: <1eec88e6-1ea8-4525-bb17-e41444d715dc@samsung.com>
Date: Thu, 16 Jul 2026 12:43:56 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
To: Thierry Reding <thierry.reding@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko
	Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>, Rasmus
	Villemoes <linux@rasmusvillemoes.dk>, Russell King <linux@armlinux.org.uk>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew
	Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
	Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
	Hocko <mhocko@suse.com>, Robin Murphy <robin.murphy@arm.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
	Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org, linux-trace-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ak_E4UxfnFJywJa7@orome>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260716104401eucas1p1f2c155f5f3a4655c82e831bffdeeece7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c
X-EPHeader: CA
X-CMS-RootMailID: 20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
	<CGME20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c@eucas1p1.samsung.com>
	<20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
	<3f47aeab-33b1-4966-a5ce-5d6d5261e0e2@samsung.com>
	<e212caac-6c30-448a-9e10-32fff8b842f6@kernel.org>
	<83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com> <ak_E4UxfnFJywJa7@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_034408_540326_96334043 
X-CRM114-Status: GOOD (  23.05  )
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

On 09.07.2026 17:59, Thierry Reding wrote:
> On Thu, Jul 09, 2026 at 07:56:45AM +0200, Marek Szyprowski wrote:
>> On 08.07.2026 10:35, David Hildenbrand (Arm) wrote:
>>> On 7/7/26 12:02, Marek Szyprowski wrote:
>>>> On 01.07.2026 18:08, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> There is no technical reason why there should be a limited number of CMA
>>>>> regions, so extract some code into helpers and use them to create extra
>>>>> functions (cma_create() and cma_free()) that allow creating and freeing,
>>>>> respectively, CMA regions dynamically at runtime.
>>>> Well, the technical reason for not creating cma regions dynamically at
>>>> runtime is that on some architectures (like 32bit ARM) the early fixup
>>>> for the region is needed to make it functional for DMA.
>>> Can you point me at the code that does that? Thanks!
>> Check dma_contiguous_early_fixup() and dma_contiguous_remap() in 
>> arch/arm/mm/dma-mapping.c. Those functions ensures that the CPU mappings for
>> the CMA reserved region in linear map are remapped with 4k pages instead
>> of the 1M sections, so later, it will be possible to alter the mappings and
>> change them to coherent when needed (altering 1M sections is not possible,
>> because each process has it's own level-1 array even for the kernel linear
>> mapping).
>>
>>
>>
>> However, in the use case in this patchset the reserved region is only shared
>> with buddy allocator by using the CMA infrastructure, not registered to the
>> regular DMA-mapping API, so it would work fine. I'm not convinced that this
>> is the right API to use for this though.
> Are you saying you're not convinced that CMA is the right API to use for
> this? Or something else?
I read this again and indeed CMA seems to be right solution. I only wonder
why do You want to create the CMA areas dynamically? Imho it would work if
You just create large enough CMA area on boot, what would automatically
share the memory with buddy allocator and then allocate dynamic VPR regions
with cma_alloc(), potentially unmapping or marking the allocated region as
reserved in linear kernel mapping to avoid any potential speculative access
to the protected memory.

In both cases You will probably won't need the DMA-mapping API on top of
it, although it might be even possible to partially use with by
registering custom dma_ops for the devices using the protected region
(assuming that it would support only DMA_ATTR_NO_KERNEL_MAPPING
allocations).


> I certainly don't think we want to get the DMA-mapping API involved for
> this because that always implies that we perform cache operations, which
> we specifically don't want for this memory.
>
> Thierry

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


