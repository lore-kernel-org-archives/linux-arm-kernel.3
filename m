Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373E2C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxFMYaptLLUT//IK4P864ymdu1SsueZ98Tp1MNq3RV4=; b=2vtXb31HeGZGZ0kogAs2ojXRG3
	LxeP1zHVrvmLviJitTOtje4+P8kQGbeN2Ok1MZLlavKI+ZnEwLb1UYMTAJfwkkX5Sq1FmntO0kLwc
	6ijPZaWz9sDqk+g9HgwMX0hCKcQn3O3YUf41ONv50hlFwlrC3erYIg/HH8TKUhLEOtJu7vrxMnpMu
	ZQ+7o9eC+0XJbfHgGFTYPGnLqL2DkacBPNx1kwfagn1aJi7GS6bMOfkOySs0T7rwHd/8/eM0y2z8a
	yEDkV8PrMcCUno8PR1kXllPxWOXiCKOFm5l4pRiu3eh8babaUzwK8CDTNl91jWvocrwVcp23C98IL
	HLbGICAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUbF-000000006Ti-2mm3;
	Thu, 15 May 2025 09:09:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFULa-000000003NB-3QCB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 May 2025 08:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mxFMYaptLLUT//IK4P864ymdu1SsueZ98Tp1MNq3RV4=; b=CKw8fwcD5OcAL4Q/qil0LaVnqV
	kkVrGnQ3XN7sVRLScGkluj8PsK/gFdspi0e33SrlCfy9zVbquSu1oQloDKedE1uC1BXxsNRwbz/G0
	maR2/JmFB1Ji2bVTelQPxYk4/LdVV75P3FjzNwhjv8pSvPvjeOoJdvyL1G4DSgQDVsBJ+t+we+h8M
	HWYGF2bWJXuWUI9Q26UOmm8zWJ3+JO8NhXa89bZOU5mn+d1JaLjEnrI5T/6KlhkGCqTgnTvNhV1yY
	EIvqhA+6t4XR4jrQlJjZLLcRMvv+pc85YygR5+UtJZC6Hwo7t4XCfNkkJUUmCxDro6dPSC0kWaI5F
	qiVVyxCQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFULX-0000000HQ1W-2xPH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747299216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mxFMYaptLLUT//IK4P864ymdu1SsueZ98Tp1MNq3RV4=;
	b=XYzsaIhAvuQYvYZUCmR0QbGj8CBzSsTwDol7RBTgMMRiY7pfC1m2VJqC8VPWJURGmBwaPs
	wQYhAZX1AAnpoSO5jqHSAcSSPhJn3l5OLdbXW5Dd5ADbtY81d6Jo+ElPTkMOJSg8NUnSI/
	2Xk4IiVL5xr1qOKzJH1kTS8aShRyTok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747299216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mxFMYaptLLUT//IK4P864ymdu1SsueZ98Tp1MNq3RV4=;
	b=XYzsaIhAvuQYvYZUCmR0QbGj8CBzSsTwDol7RBTgMMRiY7pfC1m2VJqC8VPWJURGmBwaPs
	wQYhAZX1AAnpoSO5jqHSAcSSPhJn3l5OLdbXW5Dd5ADbtY81d6Jo+ElPTkMOJSg8NUnSI/
	2Xk4IiVL5xr1qOKzJH1kTS8aShRyTok=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-OIbzIA-dN7iCUJ1MQJvi2Q-1; Thu, 15 May 2025 04:53:35 -0400
X-MC-Unique: OIbzIA-dN7iCUJ1MQJvi2Q-1
X-Mimecast-MFC-AGG-ID: OIbzIA-dN7iCUJ1MQJvi2Q_1747299206
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a23c51816dso387261f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299206; x=1747904006;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxFMYaptLLUT//IK4P864ymdu1SsueZ98Tp1MNq3RV4=;
        b=FyC+3FBhKS9DTV6Kww91rdxIHp0lz9sgJFaK6xIx5fPjNRUBG88+vRcVJbaYR2iPVe
         0pw/2ghOANNMRwfUAd43VKelVy8YI6xb6HEhZiHQ6jpvIKhFAr7ieau4eXQrzIDMy1NT
         ItKUUQRKQq542Kr7hdccKH0SfBhih4/bGbMsFnuVRvXMBo5RwiUgPIpr10JOCceJjvtN
         V/BJwYBs5r36rHi82yvybYYzgrhCfZzx0huNbL3atzLg6x2vVfkO5hNXbXKX3DgRGca+
         x81GDN27ABHEvjNSRx7fLfw1UckWb1Ltpi/CcSilQ+NpJJmDmQ+diswxkSX0cBh8z6JT
         ORkg==
X-Forwarded-Encrypted: i=1; AJvYcCUEAsbpfiM1NdJ6UlFNYkKBeYpJR55tBXnNikwKTEhDoyKtwFrZeLU4kLXHPgRdGLwzl3HHJ5+B7XfnWOuhzwrP@lists.infradead.org
X-Gm-Message-State: AOJu0YwyRKQSH1oGF/XOHFukZUIcXc7JscuWFRSd2myUXOSYbZp7uI/n
	YYElPdtnJ5luIXc2ez1xo02q9EsKUwidFF0/5D4JCvG/Qz/kKgmMIow646gZaQpBW1RwG8N2sVM
	7i9ehRurHhdr0lKY0Glns0CCX/QIX+l4T8XGfrCN0TQ86PC5B9jGeudi8/oZKmWoDqZ42q4lL
X-Gm-Gg: ASbGnct8ANEBmPxrb1wdxd48ZiZvLKnpC7S6BAhVk85Ma51guo53y3Wrnf6M7b4zNYH
	ADi4iUcjoOroxH4Tt4/5Yc2lQhT5mDsvHoxIRF761cPbRItuTB1FEZzKNZDvTH/LtsgrypcxA+L
	t1x0b12Gsl2tSZaJqnt96fcsyOIUf1Z2nOYu0tuLIxKEMOcZVO3GVeN5riS/JvGbfa8+NUC0va2
	96Algke8+WrESVvOFemNST/wbX/Hubr5gu3fnvnAHHVzeCboToZ3Vics0y/97kJB0+VkkMITCMD
	NL6vLfh5zWJYUhNwCvDREWoXay6ZPza+MsuVYI89XF5AdusSmP8d9oxs6RnJQgPLc+3vxkMDizo
	CuSiHM1oCVCu/V0JCBemFiY0OB11QfV9IEoj1NN4=
X-Received: by 2002:a5d:588b:0:b0:3a0:b635:ea43 with SMTP id ffacd0b85a97d-3a35374176dmr1365851f8f.33.1747299206227;
        Thu, 15 May 2025 01:53:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEsJz5zNV7+Zfbrzpouk886RkGlZnICJAg6K6r7C6mHK9QfUY97jHM/U62zf/Yv0DULdBX7w==
X-Received: by 2002:a5d:588b:0:b0:3a0:b635:ea43 with SMTP id ffacd0b85a97d-3a35374176dmr1365828f8f.33.1747299205872;
        Thu, 15 May 2025 01:53:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c599sm22499647f8f.94.2025.05.15.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:53:25 -0700 (PDT)
Message-ID: <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
Date: Thu, 15 May 2025 10:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: ryan.roberts@arm.com, anshuman.khandual@arm.com, mark.rutland@arm.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
 <4904d02f-6595-4230-a321-23327596e085@arm.com>
 <6fe7848c-485e-4639-b65c-200ed6abe119@redhat.com>
 <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bc7pKPcFwpMrKt8BchejNm88gtKyW_JUTDET93rVCFE_1747299206
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_095343_954303_FDEC263B 
X-CRM114-Status: GOOD (  16.42  )
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

On 15.05.25 10:47, Dev Jain wrote:
> 
> 
> On 15/05/25 2:06 pm, David Hildenbrand wrote:
>> On 15.05.25 10:22, Dev Jain wrote:
>>>
>>>
>>> On 15/05/25 1:43 pm, David Hildenbrand wrote:
>>>> On 15.05.25 08:34, Dev Jain wrote:
>>>>> Commit 9c006972c3fe removes the pxd_present() checks because the caller
>>>>> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
>>>>> only
>>>>> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
>>>>> pmd_free_pte_page(), wherein the pmd may be none.
>>>> The commit states: "The core code already has a check for pXd_none()",
>>>> so I assume that assumption was not true in all cases?
>>>>
>>>> Should that one problematic caller then check for pmd_none() instead?
>>>
>>>    From what I could gather of Will's commit message, my interpretation is
>>> that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd.
>>> These individually check for pxd_present():
>>>
>>> if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
>>>      return 0;
>>>
>>> The problem is that vmap_try_huge_pud will also iterate on pte entries.
>>> So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page
>>> may encounter a none pmd and trigger a WARN.
>>
>> Yeah, pud_free_pmd_page()->pmd_free_pte_page() looks shaky.
>>
>> I assume we should either have an explicit pmd_none() check in
>> pud_free_pmd_page() before calling pmd_free_pte_page(), or one in
>> pmd_free_pte_page().
>>
>> With your patch, we'd be calling pte_free_kernel() on a NULL pointer,
>> which sounds wrong -- unless I am missing something important.
> 
> Ah thanks, you seem to be right. We will be extracting table from a none
> pmd. Perhaps we should still bail out for !pxd_present() but without the
> warning, which the fix commit used to do.

Right. We just make sure that all callers of pmd_free_pte_page() already check for it.

I'd just do something like:

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8fcf59ba39db7..e98dd7af147d5 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
  
         pmd = READ_ONCE(*pmdp);
  
-       if (!pmd_table(pmd)) {
-               VM_WARN_ON(1);
-               return 1;
-       }
+       VM_WARN_ON(!pmd_present(pmd));
+       VM_WARN_ON(!pmd_table(pmd));
  
         table = pte_offset_kernel(pmdp, addr);
         pmd_clear(pmdp);
@@ -1305,7 +1303,8 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
         next = addr;
         end = addr + PUD_SIZE;
         do {
-               pmd_free_pte_page(pmdp, next);
+               if (pmd_present(*pmdp))
+                       pmd_free_pte_page(pmdp, next);
         } while (pmdp++, next += PMD_SIZE, next != end);
  
         pud_clear(pudp);


-- 
Cheers,

David / dhildenb


