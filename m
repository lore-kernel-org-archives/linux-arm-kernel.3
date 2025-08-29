Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED22CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjuXMBMcmzq+emhjc+4nz3INVtnsR/3o1W/HmfSMpGo=; b=Lmser4Fka2z8RYMXUOiuVL+59h
	qylhyOrAYdLKX62ogDz+k+DctyU8TTbKCO0T00rJV/3qvXFD+Tcp5juw7/tUiryqVXz8O1hW8e6ds
	UcitMcwDJvHXayFnrml9U5YYwg0vt8DZl31WRxY0fRYpPhnE5OxfUJq06R+6MUiE8WSYspWgpmbvB
	SkkQkURSem7aXQImApyzznEOR197FsUlUFYpDJa7CYe2QrGDC0FOta5MPeTLuu5LgCyQcfERLCc+Z
	7IaofhVHwtfKFY0vwHNXdE1s/5arFRLX266daMe2HoZutnNzvgvVC3nA8KmY8OGffKdyIsjVLt6uW
	rFkBKTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3Ib-00000006a6l-1BRx;
	Fri, 29 Aug 2025 17:54:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzPK-00000005scJ-3WFr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 13:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qjuXMBMcmzq+emhjc+4nz3INVtnsR/3o1W/HmfSMpGo=; b=ZhyElNI7rZzl01LsvNVPOXoGUP
	ijuA6QRnIJERKjx/fZe4KM+X9o4Uzno2WIRbOfN7A9HV507Ih8zwTE1TsAsXLkNPux5y2LOUW29vF
	9+jquzQ29IldRuxZukQCSh79aPW/iFduDYWemBKAkNP3VuC8CItMwNpjFLh3K6HDjDxUI48GJ9DJq
	ag9UHiO3tGKDCipMEow2Hq3nSzhpYffm1TLCTek6L0uDqfCqDmObiTcVJYCnsa9IKHG3bG7t/djv1
	vJ5C2aPViIedHEtaFJOZ65Sy4kpxANtyM0T9t0vAo4nezU4SSWyzuosrMCf41PctAFetyfMTszAaW
	pJK9/R1g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzPH-00000003A8X-429e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756475082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qjuXMBMcmzq+emhjc+4nz3INVtnsR/3o1W/HmfSMpGo=;
	b=IhypiPrXIiH4erFr4ZpsWw+nbkEmef2iT1YO+XOixQMWEXQ31R2MG5r3MFjvvao8BZLAyb
	UTss3jeODMS51C8X0daiJIv2c1oZ48gT/TZd4TVLHCfUXsLFTw+wUl2mscpv3jxX2KkWhu
	XLjNTIkqi/QoBZ9nKkAoBpWfjwbpxjo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756475083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qjuXMBMcmzq+emhjc+4nz3INVtnsR/3o1W/HmfSMpGo=;
	b=MrZBHJUzGUCgoJCcf2h8odP1CGpleUoKLi85kT7xETd5R74W+v6qTeDF5MUO6AV+/KULVd
	t0TUd9gcoz4B8w1fa7d51MXFAcFIYp4gNI4sdgJ/y3WbEHF6wOCjFHtEuJfp1OXlZit39t
	KLZocrRdGqUQg2bBtp8H38gIfEROlA0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-WqEpXdrGOESFUOmhE2EYcQ-1; Fri, 29 Aug 2025 09:44:26 -0400
X-MC-Unique: WqEpXdrGOESFUOmhE2EYcQ-1
X-Mimecast-MFC-AGG-ID: WqEpXdrGOESFUOmhE2EYcQ_1756475065
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3cceb92ea73so1232202f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 06:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756475065; x=1757079865;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjuXMBMcmzq+emhjc+4nz3INVtnsR/3o1W/HmfSMpGo=;
        b=TSR3iDQtkl1SQF+uALIbBzmnjilrfQ1tSwCkD+elheQ52gUg4U9mgegKHju79C6S+e
         B+FpIrCi8EHHIxtNRJgESD7fRVPoWm9/J7nbLk4KWF3Xw1OC84Jm0/nFa3APhrfdUTSM
         liyWeB4jgeb7OHWdkfr6f7OY9pvOHv1AqVW6n1fTtHe3N39vdRTc6nar4VkbT8u7pmCu
         O1UOuh/gk9vGvnvgaqyFGVqomyw/Tk2KWkNCIDOgUACxoMInMc4t8puAq2ddADH7U4sC
         iU1Jt9f43t+GnWvyemvXGZdymix1U16ceeb/VsHwZDausS7GRbV1IoPk3fzbVKlqG0Oi
         k3qg==
X-Forwarded-Encrypted: i=1; AJvYcCWxW7MDkwfZoXvbX7aPyQH+hxMBH1kN5zk2gU1PIGKNQyD3Fmt+Kp3lLF2A3lGyGVgYuncgrJISdLF/7vUgOZRs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe9qe2uDgVPbe/Y4HqXFyZBuTkX7mVPbjCFwewV7d+f1WOH8Hl
	nvT46bqhE37S43Yw4LRJGXXW0MU5jMc0e/1nBuTu77bUI091GuMLjuqNuYEi+SS/6RzHFGmk/pH
	n6EKm9/T11u4vEZonSXVKzrFz9dFSoF1Hfg5U3dBGkPxMiqeQNHLn8V6Ik+QpbZ14AJXtlVh0zR
	bZ
X-Gm-Gg: ASbGncuiTcUVMVqQ5SUtVlRnaV4zo7CFXHEQQz+n5ObZu63gu2QW359kgg1QTZVBj/D
	8CgMBOt8WnXOYIHUR/2fiuSihyIvwK22AmTqGCLcTLm5AHderkgMycTFdrD7Q09Hnv2rYwH9lKn
	n3A6Ynwrp9r5yM7R1MW2VGdyga/VBw5j4Tkp7Nlg2SViJcniv2tKHDAAcEgi4lk8Ol5zGUznxad
	u5nxFF9x+/D7HNuSRi4oOiU3Wj+8nbZr+IYpBofZksR7ER2IqVwUW1En2fhkg8cenddoVzqJqAa
	eZ6vACXaXwfizQflnM1pcc1Er/VsYq67T3FG1dm3iTgovfMH/8kK1e+9d8pqKmZLifXwiWukPCL
	jk8m2I3XPpZIObrAl3B+fc/lM1D3xcwV9aCAXc0+Xcgy8E2Dxnfa1dBRHmMIjSwxc
X-Received: by 2002:a05:6000:4383:b0:3b7:882c:790 with SMTP id ffacd0b85a97d-3c5dc73625cmr21478709f8f.37.1756475064909;
        Fri, 29 Aug 2025 06:44:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+LDG7SGqPVe42ftCg4HBC4EBVhYJgcuG7xRsE/56l9/NNaGo5xTMXjkE7lTdlBAQ5z49MkQ==
X-Received: by 2002:a05:6000:4383:b0:3b7:882c:790 with SMTP id ffacd0b85a97d-3c5dc73625cmr21478675f8f.37.1756475064268;
        Fri, 29 Aug 2025 06:44:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:100:4f8e:bb13:c3c7:f854? (p200300d82f1d01004f8ebb13c3c7f854.dip0.t-ipconnect.de. [2003:d8:2f1d:100:4f8e:bb13:c3c7:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c22sm121018675e9.13.2025.08.29.06.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 06:44:23 -0700 (PDT)
Message-ID: <e877229a-ffd8-4459-a31b-ecabde28e07f@redhat.com>
Date: Fri, 29 Aug 2025 15:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/36] mips: mm: convert __flush_dcache_pages() to
 __flush_dcache_folio_pages()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-21-david@redhat.com>
 <ea74f0e3-bacf-449a-b7ad-213c74599df1@lucifer.local>
 <2be7db96-2fa2-4348-837e-648124bd604f@redhat.com>
 <549a60a6-25e2-48d5-b442-49404a857014@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <549a60a6-25e2-48d5-b442-49404a857014@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cgpETMVehD5UP-JyrZ3YvDjxY9eiNpCBbaPe-dUlU1k_1756475065
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_144444_225936_FC2EFCDB 
X-CRM114-Status: GOOD (  16.36  )
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

On 29.08.25 14:51, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 10:51:46PM +0200, David Hildenbrand wrote:
>> On 28.08.25 18:57, Lorenzo Stoakes wrote:
>>> On Thu, Aug 28, 2025 at 12:01:24AM +0200, David Hildenbrand wrote:
>>>> Let's make it clearer that we are operating within a single folio by
>>>> providing both the folio and the page.
>>>>
>>>> This implies that for flush_dcache_folio() we'll now avoid one more
>>>> page->folio lookup, and that we can safely drop the "nth_page" usage.
>>>>
>>>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    arch/mips/include/asm/cacheflush.h | 11 +++++++----
>>>>    arch/mips/mm/cache.c               |  8 ++++----
>>>>    2 files changed, 11 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
>>>> index 5d283ef89d90d..8d79bfc687d21 100644
>>>> --- a/arch/mips/include/asm/cacheflush.h
>>>> +++ b/arch/mips/include/asm/cacheflush.h
>>>> @@ -50,13 +50,14 @@ extern void (*flush_cache_mm)(struct mm_struct *mm);
>>>>    extern void (*flush_cache_range)(struct vm_area_struct *vma,
>>>>    	unsigned long start, unsigned long end);
>>>>    extern void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page, unsigned long pfn);
>>>> -extern void __flush_dcache_pages(struct page *page, unsigned int nr);
>>>> +extern void __flush_dcache_folio_pages(struct folio *folio, struct page *page, unsigned int nr);
>>>
>>> NIT: Be good to drop the extern.
>>
>> I think I'll leave the one in, though, someone should clean up all of them
>> in one go.
> 
> This is how we always clean these up though, buuut to be fair that's in mm.
> 

Well, okay, I'll make all the other functions jealous and blame it on 
you! :P

-- 
Cheers

David / dhildenb


