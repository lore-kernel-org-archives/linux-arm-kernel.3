Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F171BCDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9fHKpp0hsSkHZoVgpfSSRVfUXpN+LFN7Jx/OE3znng=; b=ZSVkGc0YaXc+SsmDuxGclLZwdH
	DFBsQoLYB1iLeIVQazYg8RTvsfQdHxj0QsL6yoNRG1lQm8vh2CeYQT9c9BZGycBiapGkqNPAcrY8u
	/H1PiApw+YbrF+IB3oYWgKh8gdVdqDUKArrEN1ZnAV4nMyKOu4dYlS+5V1CLL6GpEiaqMRYA6K348
	qGSgspM0DdjsjJ1wCaq0XRGEbXpEz2nqgMIPr+Alg89K+uZKxLFc/n9soqO4kGR2OFXPZ76JF75LM
	UEGDvUfJ2O5crTUVm9lpWFKAyv/d0VvovdA9RTuJxSjSZikYDrdBwY5vBm/BmfG01qkmbZouB11W+
	48CVdMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO1r-00000007rGw-2QH4;
	Wed, 24 Jun 2026 13:52:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO1o-00000007rFz-2lxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:52:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8007105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782309150; x=1782913950; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9fHKpp0hsSkHZoVgpfSSRVfUXpN+LFN7Jx/OE3znng=;
        b=ZE8tQC7q0BTKRg6tmk7VYYSoQK4Mmv+G+rdGS+2a91PngZA7BbfAF1ts7q5xcCed0r
         Vg9UYr1YnnsbvPNvgfpWzAiCd+JvIT0SG0rRujPJiRh2h4HU/uXYdZhNPXHiVveD9nIj
         OKBay2y1rERYiJwdiHAwgQTgKI5w5nrhcHfqqqqu7PHzRzjoxCtKMtXCmpgFzmzosHw8
         14K60yC+UT9KBI7cTQn3W1zu1oaUP44Fwq2Xl9oEye5+v2csx0v/uMtqPDMIJHPeiNZm
         foWkT29rGwzOeUJqVKg814JATYztolbkdXsnGAKEwXEdUT/7J/caFdA2nnzKweUenQpk
         HEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309150; x=1782913950;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9fHKpp0hsSkHZoVgpfSSRVfUXpN+LFN7Jx/OE3znng=;
        b=XyS6iL6jsB6Pm9B8pnhRltVrAU1ZZY38UlxsY1Ew+qV4rA7f55u9dGlebbc4aYG2lx
         375RK6/CsALvRuf+RR2XW/QcMg/ZmMjOQq22hC7VKYEa51Qcyocj8yVQGQ4Dh4U2xeXM
         9LWm56YvOflrFs55cqAl9o8tNKTKMp7/Tuw5AD6LvcaVvzOJNLwVjWuzYj7wTjUsTz7e
         r3vpI0s0Jmamk+8FsaHCGm1oyf/WThjJ1uYLltm22AAnj9UstrM2QWTs8ukZOkr/SEMD
         e16g//19Q4cXDg0QFI6mkOHS0rUVEjYdfAjUBL4dERyUQhTnQWJ8bNu5b0JqUwQfVpnm
         l1Jg==
X-Gm-Message-State: AOJu0YwZV+MxwQz2S5E2ZuBjWrOUL/TaN4e/7/YgUp57z8mV6zgCC32X
	IwVAMOQ7RoAGATjexyQWe9Bn40mhrlr45D7rlrsHVCb2aUnziO4sgXTnY2dyqMQTClnAluZaPGN
	CC2b5WQ==
X-Gm-Gg: AfdE7ckWCS074NUpVbDZwlFVmdZx2rQR8t4z379LnGh7TQzQDeSZRvTLoMpIBRQw5H4
	AyQPjj/TzfPBmhKHgiR589T3pMjVShNcRh6+pbuH9eD6k0X6UPwGNvcHGOSUN79v8JZNjHTsHct
	YHDVdHPIDSWpmkZnJMWIe7Nj43xOdsYeFa/SeEY62FkaFfa7hODjFzSjSqQ6dYOtF5aW9suc/ni
	GlEBTBcBdAHYaA2ByjWXwmUbSRCK3zSZXVKX8EJXeYQADpLjasYXpaQiguIBn0qCMMy2ctmKs2S
	3UmXeBqzLjnu34AOwJVjDGl5MQlpxmYq6Fk3vyZRuA0lDy3h5ZTJUXtbpMPs5M8hY/1qtzSNXWR
	RhD4qvy7xTWvuw1KoVQ4fTnvUiUcoLev27aBEC053LuGRUcWijasVO53kRFlELzNvNBNNSFOsHz
	V18CnczSVhqwLyvyPyNoAGp0LdbJ40bzLjMfW/fN98oAMLp0g=
X-Received: by 2002:a05:600c:8b71:b0:492:59a0:4a65 with SMTP id 5b1f17b1804b1-4925b3802a0mr117077955e9.27.1782309149240;
        Wed, 24 Jun 2026 06:52:29 -0700 (PDT)
Received: from google.com (97.113.76.34.bc.googleusercontent.com. [34.76.113.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494496cdsm341827885e9.10.2026.06.24.06.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:52:28 -0700 (PDT)
Date: Wed, 24 Jun 2026 13:52:25 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <ajvhGajVO_GFlcrY@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <402e247d-1eb9-4842-ba9a-712a3bb9b438@arm.com>
 <751c564b-d6c3-4bd5-a269-e3de89e8cf13@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <751c564b-d6c3-4bd5-a269-e3de89e8cf13@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065232_770126_93B1CC56 
X-CRM114-Status: GOOD (  25.08  )
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

On Fri, Jun 19, 2026 at 09:33:18AM +0100, Ryan Roberts wrote:
>On 18/06/2026 16:05, Ryan Roberts wrote:
>> On 11/06/2026 14:01, Adrian Barnaś wrote:
>>> Strip the read-only attribute from the selected memory range when
>>> restoring the linear map after an execmem cache clean.
>>>
>>> An execmem cache clean is performed when a cache block becomes empty
>>> after unloading a module. When making the memory valid again, the linear
>>> memory alias must also have its read-only attribute cleared.
>>>
>>> Without this change, the linear memory alias remains read-only even
>>> after the execmem cache block itself is freed, which prevents subsequent
>>> allocations from writing to that memory.
>>>
>>> Signed-off-by: Adrian Barnaś <abarnas@google.com>
>>> ---
>>>  arch/arm64/mm/pageattr.c | 17 ++++++++++++++++-
>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index 88720bbba892..eaefdf90b0d5 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -239,6 +239,13 @@ int set_memory_x(unsigned long addr, int numpages)
>>>  					__pgprot(PTE_PXN));
>>>  }
>>>
>>> +static int set_memory_default(unsigned long addr, int numpages)
>>> +{
>>> +	return __change_memory_common(addr, PAGE_SIZE * numpages,
>>> +				      __pgprot(PTE_VALID),
>>> +				      __pgprot(PTE_RDONLY));
>>
>> This is not sufficient to convert an invalid entry to valid. As well as setting
>> the PTE_VALID bit, you would also need to clear the PTE_PRESENT_INVALID and set
>> PTE_MAYBE_NG.
>>
>> e.g:
>>
>> int set_memory_valid(unsigned long addr, int numpages, int enable)
>> {
>> 	if (enable)
>> 		return __change_memory_common(addr, PAGE_SIZE * numpages,
>> 					__pgprot(PTE_PRESENT_VALID_KERNEL),
>> 					__pgprot(PTE_PRESENT_INVALID));
>>

Thanks, I will fix that

>>
>>> +}
>>> +
>>>  int set_memory_valid(unsigned long addr, int numpages, int enable)
>>>  {
>>>  	if (enable)
>>> @@ -362,7 +369,15 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>>>  	if (!can_set_direct_map())
>>>  		return 0;
>>>
>>> -	return set_memory_valid(addr, nr, valid);
>>> +	/*
>>> +	 * Execmem cache uses this function to reset permissions on linear mapping
>>> +	 * when freeing unused cache block. On x86 it makes memory RW which is
>>> +	 * desirable. On ARM64 set_memory_valid() just change valid bit which
>>> +	 * leave direct mapping read-only so use set_memory_default instead.
>>> +	 */
>>> +
>>> +	return valid ? set_memory_default(addr, nr) :
>>> +		       set_memory_valid(addr, nr, false);
>>
>> Surely execmem should just be using set_direct_map_default_noflush() if that's
>> the behaviour it wants?
>>
>> I think that the current implementation of set_direct_map_default_noflush()
>> doesn't undo the effects of set_memory_nx() / set_memory_x(). That might be
>> worth checking?
>
>It's also worth mentioning that set_direct_map_valid_noflush() has "noflush" in
>the name, implies it doesn't expect/require any TLB flushing to occur. But the
>implementation will perform tlb flushing for any case that is not just a
>invalid->valid transition (which for the existing impl is the case when
>valid=true and for your changes is never the case - see __change_memory_common).
>
>But execmem doesn't do any tlb flushing so it looks to me like it actually
>requires that set_direct_map_valid_noflush() handles the tlb flushing? All seems
>a bit fishy and probably warrants a cleanup to make things clearer.
>

I think that the clean approach would be to have the `set_direct_map_default`
function (without `noflush`) that does flushing as needed (like the current
one on ARM64). I am not entirely sure but x86 seems to handle permission
faults gracefully while on ARM64 those would cause panics. Is that correct?


>>
>> Thanks,
>> Ryan
>>
>>
>>>  }
>>>
>>>  #ifdef CONFIG_DEBUG_PAGEALLOC
>>
>


Thanks,
Adrian

