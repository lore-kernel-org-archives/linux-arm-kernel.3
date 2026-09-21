Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3A0C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSPBjOWn5CsFPyDGmxFlZSgrzmDQuJdpSbhAoe0g5MU=; b=ER+w1tufKgH5oMrPSEbVr8+3d2
	dSwzmtVffnO8jztFoTLRYXHhtuvjqsGE65bnWTiFtndWhHoAM3JFKPpVV66XkWiO+VlPzHI3H2+k/
	hPkDeGynADBATK8x+d1CofbabrtAXUROm0wbIQE7G/6SIOY3k7LbmVNNx1G4U9KP6fcOreBqUwhX3
	5c6y7S+/cCPaxVDHqOVOllJtKh8vBQkDpQQ485ev5FBTFa40BwQtzpVPGA3slrNkHvspQWOVUAEhY
	rV1Fuq1xqOpEZ+UWX4Sdg3JVlugeUNe2YUQRfnPOhYJQPj8orLqnjvUKWW4Un6I24NAAoFc6T36d5
	JngL7WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gDS-00000002gD1-48tu;
	Mon, 21 Sep 2026 15:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gDS-00000002gCQ-16Sh;
	Mon, 21 Sep 2026 15:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dSPBjOWn5CsFPyDGmxFlZSgrzmDQuJdpSbhAoe0g5MU=; b=QWp15F9+ZWrllC7Nz5KctSQ2ka
	aTijCTynluzN5BPKmq58CSdTIDXXqeYpsMkQ0nb9pNCG+HjqTDyGpA2uCmw4AmOPxHHwPu+svBs50
	IXTDV3IiwlsP6a990zwW3o+MY+DTJbFvJ5kJMWII93TuNZcoGd/KfW1hZTjYCayktZM0Kl5Qt3KRA
	e/EOnkWPWzdckp9z8eyBicNoWKBzSUz2VGp0om0Ro5P6dL0X83jXYROhJE0d66FrgsHjQsF/JxTEw
	ScR5QJvmvUDPA/BoBteP7Qmy4xUONuSdpBc0vN0BidaTUWbsMLrkFAf5xC5ohLGYwsmDQsdDoYT57
	ud+rNwNQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gDO-0000000CUmv-1aCV;
	Mon, 21 Sep 2026 15:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CE1C176C;
	Mon, 21 Sep 2026 08:45:52 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5CD83F632;
	Mon, 21 Sep 2026 08:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790005555; bh=cIKZrmFNDgxQa0qqmau+ZqQxkkl6FQkDRcq1dC9miXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EoC0cuIQz6hLQwqx0QF1eocGbFHcONiXNcdsw4wKNlOhOiOhVhiSZSeViIz1bFPb7
	 muOHOKkL6n9D40Sc0M8nsRMGJOPM/9pqWCmEHDGay46C0wCozVnJkI6euIIJu4A7eT
	 wCKvl5TAYjrxpCiY2Dw1a5LcGTlG38H10QNCNR8Y=
Message-ID: <94630348-d295-4424-9f6c-0dc3b8704077@arm.com>
Date: Mon, 21 Sep 2026 16:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] dma: swiotlb: Track whether the pool size was
 explicitly set
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
 <20260921063628.362078-3-aneesh.kumar@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260921063628.362078-3-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_164558_857117_EF524941 
X-CRM114-Status: GOOD (  21.20  )
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
> swiotlb_adjust_size() must not override a pool size supplied through the
> swiotlb= command-line parameter.
> 
> Currently, it determines whether a size was supplied by comparing
> default_nslabs with IO_TLB_DEFAULT_SIZE. This fails when the user
> explicitly requests the compiled-in default size, allowing the request
> to be overwritten by automatic pool sizing.
> 
> Record whether swiotlb= supplied a numeric size and add
> swiotlb_default_size_changed() to query that state.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   kernel/dma/swiotlb.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index aa19e81ae544..8f86deb25be2 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -107,6 +107,7 @@ static struct io_tlb_mem io_tlb_default_mem;
>   
>   static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
>   static unsigned long default_nareas;
> +static bool swiotlb_size_set __initdata;

Nit: there are various ways and reasons that the size is set in general; 
could this please be named something clearer, e.g. 
"swiotlb_cmdline_size_set"?

>   /**
>    * struct io_tlb_area - IO TLB memory area descriptor
> @@ -269,6 +270,7 @@ setup_io_tlb_npages(char *str)
>   		/* avoid tail segment of size < IO_TLB_SEGSIZE */
>   		default_nslabs =
>   			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
> +		swiotlb_size_set = true;
>   	}
>   	if (*str == ',')
>   		++str;
> @@ -304,6 +306,11 @@ unsigned long swiotlb_size_or_default(void)
>   	return default_nslabs << IO_TLB_SHIFT;
>   }
>   
> +static bool __init swiotlb_default_size_changed(void)

...and then do we really need a trivial wrapper function with the exact 
same scope as the variable itself? (Plus the name is similarly confusing 
as the places this is used are themselves potentially changing the 
default size, if you consider "default" to mean "not explicitly 
specified"...)

With the naming improved,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> +{
> +	return swiotlb_size_set;
> +}
> +
>   void __init swiotlb_adjust_size(unsigned long size)
>   {
>   	/*
> @@ -311,7 +318,7 @@ void __init swiotlb_adjust_size(unsigned long size)
>   	 * architectures such as those supporting memory encryption to
>   	 * adjust/expand SWIOTLB size for their use.
>   	 */
> -	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
> +	if (swiotlb_default_size_changed())
>   		return;
>   
>   	default_nslabs = swiotlb_aligned_nslabs(size);


