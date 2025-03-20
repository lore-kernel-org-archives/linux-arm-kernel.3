Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBD8C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xs+2LaReXeMSg7prIRwlEpMNVm9r1gq5TR6tQoW624=; b=u1OfZaQTsvbgn0MrTTSyHPbPs3
	RdZDIT8vpLytx8yFESlapOPnALRjSl/LWSrcNtUANMM+ILag17Dl+RttboXk2hICMXowO/o1ffUpU
	eCwp6vwekp95Dw6K4/bFQRGj8Y38Xox1P1g/GAvS33zzkYg2UohWTrTv4Jj4QmuVf5l0AXftZwimV
	bYC+KtAOiZI1w19dMQm4TXdrLqHFWw016DXI3t4LChPjEQNOniE47r33ydHr5Lz6nrujKmWkw4/tI
	vs9s7PfwI46CbKcBLozp4gSb6xCg69Kml+nMQWd0Po/d6mHm+x2OYTQmPHiEMRppr6dogkmNqkCFz
	bewjpYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE2t-0000000Bx2x-0Oxu;
	Thu, 20 Mar 2025 11:26:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvE1A-0000000Bwqa-1ZJs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 11:24:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C68371424;
	Thu, 20 Mar 2025 04:25:02 -0700 (PDT)
Received: from [10.57.84.158] (unknown [10.57.84.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 238CF3F694;
	Thu, 20 Mar 2025 04:24:53 -0700 (PDT)
Message-ID: <2cb92aaf-900e-4a30-beeb-50081afc85ec@arm.com>
Date: Thu, 20 Mar 2025 11:24:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64/mm: Remove randomization of the linear map
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <kees@kernel.org>
References: <20250318134949.3194334-2-ardb+git@google.com>
 <CAMj1kXHXAYt0xLnx4=+qiCbnuF5U+9dzwnds1yd+vhTtpP5v3Q@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXHXAYt0xLnx4=+qiCbnuF5U+9dzwnds1yd+vhTtpP5v3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_042456_502164_BA7AF2A4 
X-CRM114-Status: GOOD (  20.40  )
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

On 20/03/2025 07:57, Ard Biesheuvel wrote:
> On Tue, 18 Mar 2025 at 14:50, Ard Biesheuvel <ardb+git@google.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Since commit
>>
>>   97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")
>>
>> the decision whether or not to randomize the placement of the system's
>> DRAM inside the linear map is based on the capabilities of the CPU
>> rather than how much memory is present at boot time. This change was
>> necessary because memory hotplug may result in DRAM appearing in places
>> that are not covered by the linear region at all (and therefore
>> unusable) if the decision is solely based on the memory map at boot.
>>
>> In the Android GKI kernel, which requires support for memory hotplug,
>> and is built with a reduced virtual address space of only 39 bits wide,
>> randomization of the linear map never happens in practice as a result.
>> And even on arm64 kernels built with support for 48 bit virtual
>> addressing, the wider PArange of recent CPUs means that linear map
>> randomization is slowly becoming a feature that only works on systems
>> that will soon be obsolete.
>>
>> So let's just remove this feature. We can always bring it back in an
>> improved form if there is a real need for it.

The argument certainly makes sense to me.

>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Kees Cook <kees@kernel.org>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Additional note based on an off-list discussion with Kees and the KSPP team:
> 
> Initially, the randomization of the linear map was considered to be a
> layer of defense against the abuse of writable linear aliases of
> read-only mappings in the vmalloc range, such as module text and
> rodata. 

I would have assumed that there is already a level of randomization for this use
case because vmalloc will be allocating random pages from the buddy, so the
location of a given vmalloc alias in the linear map is already somewhat random?

Perhaps the regions of interest are allocated early in boot when the pages the
buddy gives you are still pretty predictable? In this case could there be any
argument for adding a capability to the buddy to give out somewhat randomised
pages, at least during boot?

> This has been addressed in the meantime, by mapping the linear
> region down to pages by default, and mapping linear aliases read-only
> if the vmalloc mapping is read-only.
> 
> So considering that, and the fact that randomization of the linear map
> occurs rarely if at all on recent CPUs, I think we should go ahead and
> remove this feature.


