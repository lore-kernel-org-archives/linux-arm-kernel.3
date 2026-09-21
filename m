Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D997C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hw49sKCrk0TxQWy4HKwk2Z7RruqtWeFijH78wRP870=; b=r4bQf8nmRI/jzqoF9S5W5ZYaf0
	Mg6/qVe/O3qTSyohPEH+cKbTfAX0gsTur2fwvl7c/RzwHQTgwJJb+5JSaJ8o0ftsNDqgZj1YcLkI8
	/WEN6zVzZxmc6KOPnTborfGN//o5NovyYDB7Qmcc9xNLv8NfM8t3l5WbRBK/J+qIu01n0uchja5z5
	oBb8DXhDxBtnFSOTr3vX671AtvlDwJGsgV52OkXpQfvZGoLi5iqs//VPQ4XLWntMCf8L5paqrMk9F
	fEijLENMg+8QArm3Cvsyahtb3Wn5T5909ENEwQqigdcrAgkNtXfJEmXT+POTG3OVeblUbxpMjap5n
	GCMnSFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hDS-00000002slc-0TYY;
	Mon, 21 Sep 2026 16:50:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hDP-00000002sl2-3j32;
	Mon, 21 Sep 2026 16:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9Hw49sKCrk0TxQWy4HKwk2Z7RruqtWeFijH78wRP870=; b=W/fdNxX02vixRdaiDSwdcGj9C6
	gLXrODaitOzMy9U6MTVFedwCzG3uFDqvaT8/0TrM+zv9qmyGohdlc+ekWjKMM1kcbaQe+ifY295nc
	Nfu9rG64FSvo5rMp6CcgHlPkC1ST/znl/OWg9sEyQRNNka3VVRM0vjZefhO5hymPsOqiUVnP4sd3T
	3zFn/6CfhYsJP17aCW/cEI7c+IxVUiSmqgNn7nzoFCKGmKsuP+z9XNf3GSOSmIO8txtYMbpGbL5Qj
	wzK9CiSx11DZj8NPZdCaYIuPSqM8n65Cq8TvA+YYj/sWfakk3lWMvwVWduVoHfKtLmzlAPrNZ0ZL8
	YnYazToQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8hDM-0000000CaDP-0SHR;
	Mon, 21 Sep 2026 16:50:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9584919F0;
	Mon, 21 Sep 2026 09:49:53 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C3E73F9A2;
	Mon, 21 Sep 2026 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790009397; bh=Wdg09chPpqQgC/K0e8SKRfjnjFGDVmMx8BswypSmTA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XQmomevpZT09cy6cgr1kTzu2so5J171U16ite1cLw6tf7wJFB4IdlH5QxKz6sSd/4
	 qRHE98CmDqCVVIr1K3Cv1yP6IMXAdywdYQoc3xBrma/fZL4DL86RO08+Hgqua4e3tA
	 tpLMTY+ABzQMH+5gDW1Tr/akzSw8iQXUsL5/7yfc=
Message-ID: <21180ec6-b9ad-43fd-9e52-51df644e1b93@arm.com>
Date: Mon, 21 Sep 2026 17:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] dma: swiotlb: Centralize minimal pool sizing
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon
 <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
 Petr Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-4-aneesh.kumar@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260921063628.362078-4-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_175000_678464_11C7B4A7 
X-CRM114-Status: GOOD (  26.37  )
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

On 21/09/2026 7:36 am, Aneesh Kumar K.V (Arm) wrote:
> A default SWIOTLB pool used only for unaligned kmalloc bouncing can be
> smaller than one required for limited DMA addressing. Arm64 and RISC-V
> currently implement this sizing independently, using 1 MiB of SWIOTLB
> space per GiB of RAM.
> 
> The SWIOTLB core now identifies this case with SWIOTLB_POOL_MINIMAL.
> Size that policy in swiotlb_adjust_pool_size() and remove the
> architecture-specific adjustments.
> 
> Explicit swiotlb= sizing remains unchanged because swiotlb_adjust_size()
> preserves a user-configured size.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/mm/init.c | 11 -----------
>   arch/riscv/mm/init.c |  4 ----
>   kernel/dma/swiotlb.c | 11 ++++++++++-
>   3 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 7d51fb5f5a71..95075b5c8207 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -340,17 +340,6 @@ void __init arch_mm_preinit(void)
>   {
>   	unsigned int flags = SWIOTLB_VERBOSE;
>   
> -	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
> -		/*
> -		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
> -		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
> -		 */
> -		unsigned long size =
> -			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> -
> -		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> -	}
> -
>   	if (max_pfn > PFN_DOWN(arm64_dma_phys_limit))
>   		flags |= SWIOTLB_INIT_ADDRESSING_LIMIT;
>   
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e0e4c103d603..96856114b387 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -183,10 +183,6 @@ void __init arch_mm_preinit(void)
>   		 * memory when DRAM starts above dma32_phys_limit.  Allocate
>   		 * ~1 MB per 1 GB of RAM.
>   		 */
> -		unsigned long size =
> -			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> -		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> -		swiotlb = true;
>   		swiotlb_flags |= SWIOTLB_ANY;
>   	}
>   
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 8f86deb25be2..f368a73f4ed0 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -483,9 +483,18 @@ static bool __init swiotlb_kmalloc_needs_bounce(void)
>   static void __init
>   swiotlb_adjust_pool_size(enum swiotlb_pool_policy policy)
>   {
> +	if (swiotlb_default_size_changed())
> +		return;
> +

This appears to be entirely redundant, as ultimately the point of this 
function is to call swiotlb_adjust_size() (if it does anything at all), 
and the first thing that does is this same exact check. We hardly need 
to micro-optimise short-circuiting a handful of arithmetic in a one-off 
setup path, and it's convoluted enough as it is, so please try to avoid 
redundancy that makes it even more confusing to follow.

>   	switch (policy) {
> -	case SWIOTLB_POOL_MINIMAL:
> +	case SWIOTLB_POOL_MINIMAL: {
> +		unsigned long size;
> +
> +		/* Use 1MB per 1GB of RAM for kmalloc() bouncing. */
> +		size = DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> +		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
>   		break;

Similarly I think it would be clearer if we had a common 
swiotlb_adjust_size() call at the end of the function, and then either 
calculate a size or return early in each switch case as appropriate.

Furthermore, swiotlb_size_or_default() is awful IMO - and in fact after 
this series we could perhaps clean it up entirely by making the size 
implicit in swiotlb_init_late() - not to mention misleadingly redundant. 
I'd say just open-code "default_nslabs << IO_TLB_SHIFT" like elsewhere 
in the file, but in fact it may as well just be IO_TLB_DEFAULT_SIZE 
(think about it...)

Thanks,
Robin.

> +	}
>   	case SWIOTLB_POOL_CC_GUEST:
>   		break;
>   	case SWIOTLB_POOL_NONE:


