Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF0DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CUP2afo0J8CnMFqbpn1EyoxaUVXlazu0bjahBWSp50=; b=qjo+9peyYM2emEdO/xmBqYjkc0
	iIbyusefKkZ5UgqCvTNe6UAFeeh1NGJKNfrgl1vixnukSfnrAJ5k5s7BETLkTiqo5Ag5Pc2INJagq
	vG+wkhH4nEJTifzK5XYS4/eOg0dIfuh8KwNgllnPFw79GMKNZF9O3uUr89uKlxfyTQx8XG/Ehi6DU
	/v5Zrd3O02QwTE23+RPa+9U0JnD4uyye1m26CFVkx/r1exBZiHS5d4RL7ONn6HeSMlk1uxDTLS89B
	LiNUV3r8Y0FsQpBjA1p19QywAdqvqpLuIuaLUDZJ2YL4gDyMBQNEXVZ7+4nVriVGU09O1b/bhSz/O
	Gf9LBkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL2i-00000004h1F-0JCk;
	Wed, 26 Feb 2025 17:17:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKyp-00000004fqn-3f4W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740590034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2CUP2afo0J8CnMFqbpn1EyoxaUVXlazu0bjahBWSp50=;
	b=g5HwAmjoaEvmqdxEDGcmEOi0J9O+P/zEUs040r45L+wEbhQoyHSxv+rFcTgmqFToLdHRum
	iEuf7wvrazg55CTwpL8FM4/2QDNo/VRdaTvXw9OLpWgO6hhn0PBrH7s/ZhhCDo3yEVTOuN
	VdqY+7jaFJ2OKEqFyBb5RB85bH51Rps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-mFx2-F7FNBqufFQlJH1sqw-1; Wed, 26 Feb 2025 12:13:52 -0500
X-MC-Unique: mFx2-F7FNBqufFQlJH1sqw-1
X-Mimecast-MFC-AGG-ID: mFx2-F7FNBqufFQlJH1sqw_1740590032
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394c747c72so242425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 09:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590031; x=1741194831;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2CUP2afo0J8CnMFqbpn1EyoxaUVXlazu0bjahBWSp50=;
        b=jOHexDS4FHLE3nEC5n+NXS0VmLivCPkEclkfBnmj9dP0EXR2KBP636SLlHDmbhXSzM
         QSFgxYd4XLvLfmH37yTYr5jSkaNCwnW1MJcFylak0Labou/kTlrIkPQIFYUbwcpQKp4u
         a8Mzib3YL/o+NTba3FHphj8san/n6HIAOlQQwS/574Djwt6zPMj1hBSKAQDJZHLN6IFC
         +MCnnQnmZApw9u0D56cY1CJZZas/7KKWndyoB5MjYGIfxgMLWQk+zr1cv9i6DALdAvpv
         8azP7ha/3ghzwam4vCWCcRyU3/QMj/n2YX6gk9/pFPbo9dPt9fqJD/tdDpFqu46JWsvr
         X/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUuqaixPrrYTv/VWB0ynh8jOJcus3OYO5DRFl5doBNBJ5NNKH/8OqrFLkIRIwiJoKKtUxXXSyASvijye1j/LQ4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwlQ6pk5E4BENeno5jd4kUbwN9MS14GTmz+S/PrnBksMh2tbOFo
	tbE4ZKHTrtLZ0YVZgb8KSHgR6Yg+GyJhGDBKRcS04PTenK4c7E47P0wN1/vsKYXaEnjYg2Bve/O
	chXOKFFY6z25SKgJpfqeiKWAxUo6En425fpJG9DFAkihJB0OzDtDElstgMDqv4+0pvfNjT5Fz
X-Gm-Gg: ASbGncvrLnaJImPFQd3W8A90keZy+nLf1ppO96fpUTrUdnwu2961L8yihjfhJlsLxN9
	8o7/JpxiRC5jH+3hljYqxcefzbhv2RlAHsv14cqUERWrniQwGw1DgMCrsBg+GtoiCz6GvFvzM4N
	fpJOe/dGqM/B0cmQzArlrMNQUCGd0Vv76pc+FW7ekqTW8L+q00nCaKpplM+/7Wnstn8tV9N7k0y
	z2mQqpKjzwxWsNOO5xljc53x+GAU9rVWQuEVHqIU4XPAWmSzmDoqieOhloytXYmV82kQUzh1Txz
	50xbuJz9zFb/jHXSlXUUQf0vPAl5Hcgtu3tEY2vg9H+HIODPI0TzXvvlGbAAuWLdh5a7jBVx60K
	fcAoQJo3QhryL+fBIvBGwvuasqZOIebqh2pCee4T+mPY=
X-Received: by 2002:a05:600c:154b:b0:439:9f19:72ab with SMTP id 5b1f17b1804b1-43aa6d14bf5mr108533555e9.23.1740590031555;
        Wed, 26 Feb 2025 09:13:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0sC+EP7LuT2O8cDHJ5c4C4109uSObs54Fb8tpKj8SpndGbmz2+EBCMLHFpEQZIB3L69+v+Q==
X-Received: by 2002:a05:600c:154b:b0:439:9f19:72ab with SMTP id 5b1f17b1804b1-43aa6d14bf5mr108533305e9.23.1740590031151;
        Wed, 26 Feb 2025 09:13:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c747:ff00:9d85:4afb:a7df:6c45? (p200300cbc747ff009d854afba7df6c45.dip0.t-ipconnect.de. [2003:cb:c747:ff00:9d85:4afb:a7df:6c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882602sm6196411f8f.41.2025.02.26.09.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:13:50 -0800 (PST)
Message-ID: <00c82c92-35a0-441c-b5b5-e4a6c8a4a9b7@redhat.com>
Date: Wed, 26 Feb 2025 18:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] arm64: mm: Populate vmemmap at the page level if not
 section aligned
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
 catalin.marinas@arm.com
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com
References: <20250217092907.3474806-1-quic_zhenhuah@quicinc.com>
 <8c1578ed-cfef-4fba-a334-ebf5eac26d60@redhat.com>
 <ce2bd045-3e3a-42bf-9a48-9ad806ff3765@quicinc.com>
 <871c0dae-c419-4ac2-9472-6901aab90dcf@redhat.com>
 <a5439884-551c-4104-9175-f95b0895a489@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <a5439884-551c-4104-9175-f95b0895a489@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Swt8-abu4mDYS5-eq9EzQY0i9FTMgB-AsUwEvqE36Bs_1740590032
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_091355_987607_3636286A 
X-CRM114-Status: GOOD (  21.74  )
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

Sorry, I somehow missed this mail.

>>> Hi David,
>>>
>>> I had the same doubt initially.
>>> After going through the codes, I noticed for vmemmap_populate(), the
>>> arguments "start" and "end" passed down should already be within one
>>> section.
>>> early path:
>>> for_each_present_section_nr
>>>      __populate_section_memmap
>>>          ..
>>>          vmemmap_populate()
>>>
>>> hotplug path:
>>> __add_pages
>>>      section_activate
>>>          vmemmap_populate()
>>>
>>> Therefore.. focusing only on the size seems OK to me, and fall back
>>> solution below appears unnecessary?
>>
>> Ah, in that case it is fine. Might make sense to document/enforce that
>> somehow for the time being ...
> 
> Shall I document and WARN_ON if the size exceeds? like:
> WARN_ON(end - start > PAGES_PER_SECTION * sizeof(struct page))

Probably WARN_ON_ONCE() along with a comment that we should never exceed 
a single memory section.

> 
> Since vmemmap_populate() is implemented per architecture, the change
> should apply for other architectures as well. However I have no setup to
> test it on...
> Therefore, May I implement it only for arm64 now ?

Would work for me; better than no warning.

> Additionally, from previous discussion, the change is worth
> backporting(apologies for missing to CC stable kernel in this version).
> Keeping it for arm64 should simplify for backporting. WDYT?

Jup. Of course, we could add a generic warning in a separate patch.

> 
>>
>>
>>>> +/*
>>>> + * Try to populate PMDs, but fallback to populating base pages when
>>>> ranges
>>>> + * would only partially cover a PMD.
>>>> + */
>>>>     int __meminit vmemmap_populate_hugepages(unsigned long start,
>>>> unsigned
>>>> long end,
>>>>                                             int node, struct vmem_altmap
>>>> *altmap)
>>>>     {
>>>> @@ -313,6 +317,9 @@ int __meminit vmemmap_populate_hugepages(unsigned
>>>> long start, unsigned long end,
>>>>            for (addr = start; addr < end; addr = next) {
>>>
>>> This for loop appears to be redundant for arm64 as well, as above
>>> mentioned, a single call to pmd_addr_end() should suffice.
>>
>> Right, that was what was confusing me in the first place.
>>
>>>
>>>>                    next = pmd_addr_end(addr, end);
>>>>
>>>> +               if (!IS_ALIGNED(addr, PMD_SIZE) || !IS_ALIGNED(next,
>>>> PMD_SIZE))
>>>> +                       goto fallback;
>>>> +
>>>>                    pgd = vmemmap_pgd_populate(addr, node);
>>>>                    if (!pgd)
>>>>                            return -ENOMEM;
>>>> @@ -346,6 +353,7 @@ int __meminit vmemmap_populate_hugepages(unsigned
>>>> long start, unsigned long end,
>>>>                            }
>>>>                    } else if (vmemmap_check_pmd(pmd, node, addr, next))
>>>>                            continue;
>>>> +fallback:
>>>>                    if (vmemmap_populate_basepages(addr, next, node,
>>>> altmap))
>>>>                            return -ENOMEM;
>>>
>>> It seems we have no chance to call populate_basepages here?
>>
>>
>> Can you elaborate?
> 
> It's invoked within vmemmap_populate_hugepages(), which is called by
> vmemmap_populate(). This implies that we are always performing a whole
> section hotplug?

Ah, you meant only in the context of this change, yes. I was confused, 
because there are other reasons why we run into that fallback (failing 
to allocate a PMD).

-- 
Cheers,

David / dhildenb


