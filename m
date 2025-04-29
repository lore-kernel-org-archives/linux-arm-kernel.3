Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10DDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=; b=IdClrBYy6kbN7808u1ZSXducBK
	Mr4Qy1G1xgOypr60MCK3arLkdz7ic5mg26F6SEvSj+AapgP+XLbrE3pM6SrPLE6hZ1bR+jWgbVyyR
	mOFuBa4D5kdHDCM9KcLsXGxTmQSIvNDiMhFi93VnkZtpX4IZyXHXoeZ5TzWH38ZbFTo/vq9+CBQGL
	sIHdgbPYRfXzDfi+RwE+Zu8Xb7H2HSL9UrqJNxom6Yx9W41g3SgkrtWBoMn24QL5GcRJX2etmKbOa
	j94CzbPa780hA6lv+9IHeQU+k/4UNS8FmnXB7tTJus7awiwszltwi2lFTO10sc0cOUmutHh8Jhq8I
	ScwEXUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hHm-000000098o6-0VwK;
	Tue, 29 Apr 2025 09:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hFr-000000098Pp-3xZG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 09:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=; b=TMDsRju3jWB+xrSYTN2Fk9lK/z
	OtwMrMAhMlyO/hTzhZ9TPOgoJwlKRElPxku355Cu57aFFRbffWCVISAbIaf5DVk3rnNizxnysV2zp
	N7oeoQXZalHfjAXSv77wPXGo8BzqSARDvLCGqW4XnU1w1AqiPDOmQ2OC5EIDYWi+8iYVfi+yTofPl
	gp9NSoKDHBBzgs/WNTzNMyUrA66KhpimUsTVoHtNnQeKFHS5ECqXDYJGcKLozodffL1aXSEfUUw0H
	HtRyQMz1hxdCQV0JeE3bOGN5zFR9p4B70xi6mD5ZESAFopYEEZTpxpzWH2dJHhvWQFCSlKwtAZyjC
	GXqTLDig==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9hFn-0000000DFXI-1NYR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=;
	b=NAhswpOMWgBc7UD5KkvNLsdPJHV9QbD44IlH1JefuEGdSNZugTNID79UofdL3q1QEPgp0G
	IFx7RolNXh+S+ZzBJ1ozwfza8MGpodMWuOZYK0DaI//UBuH8P/cVoFdNrVmWKhl8CbThxi
	1da4VtS3wrVUYDG9j/hgA1TtdkMPTT4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=;
	b=NAhswpOMWgBc7UD5KkvNLsdPJHV9QbD44IlH1JefuEGdSNZugTNID79UofdL3q1QEPgp0G
	IFx7RolNXh+S+ZzBJ1ozwfza8MGpodMWuOZYK0DaI//UBuH8P/cVoFdNrVmWKhl8CbThxi
	1da4VtS3wrVUYDG9j/hgA1TtdkMPTT4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-v9JUrks2OvO1ZWtg5buMIA-1; Tue, 29 Apr 2025 05:27:47 -0400
X-MC-Unique: v9JUrks2OvO1ZWtg5buMIA-1
X-Mimecast-MFC-AGG-ID: v9JUrks2OvO1ZWtg5buMIA_1745918866
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39143311936so1937238f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 02:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918866; x=1746523666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=;
        b=PAcIvPwxzPyZ2xE0tM7pTjleM3pDV0u4x2cfJsYUTMNFXUnMh4QW/JJCssW1a2wpPj
         7kO92xe/ebhp1BdI7vFBU0C6TTLXJLkwef0uBQFL4v3HX0CUeff4FbGjW+khk0HK22na
         7IxW1xvD5wKebcopjousONbh9As8vK7OwMGdi0UFsOUG3K1fJcgCwIA2b3FWdg2Whj89
         AP/jGh7c23IX7BYAMW9sb73SP5SJGc+mdfuArzK3bTW0fL++XY3s5I1wRzZp5bE5yT72
         JCkjWlgB4NbSbVhEOWlctC90ujTfM4mR4vrzSGbZagkLGlalJQ9+PnkNADdoc4wkvZmm
         QxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYVwwD0kDQFD4Ys9sIeNUkvJ4knPHG9nsWP0D0fxdD23otEemUCwGmdO3g7AOHio2J04Rr2Y7sV07YcJmAC/s6@lists.infradead.org
X-Gm-Message-State: AOJu0YxnS8cQykWXux21DdTaZAJNvxGC41tM9Eji34asZupYh7p53CQh
	A0HQkSsHrG78b5it9p/Dmrk3gtl1pwh0c0j8rD+LohWasqpgFxUdQYYWI8kccAWT39aZrG7ZXjb
	v7g9WEzgabwy1w8/6XIFZCSR+1Or7AJzrlsWAdQ7r3O1busy7XHGZAk2+IjHWapAUVllbJ+6k
X-Gm-Gg: ASbGncuACz+n6gY8kLuuBHQbEf2L/CEQLMrbQB6zsabwZ24xWWNgc6s2uZ+3DLsv3cg
	dMdAInhKSkyfJIF2bgkgINeUpqlJsnGd2zYQ6cbonIshjiBGpAAgo1/RnyDmlY8BkFmw7y0Hv5o
	/j02//Px5zDG8HBDPJ1kHo0qmMMGPRxGi8a/jX+sftcuSwMPjXLAmqVWlm2GPXqir1eFf61gC43
	4rBN3rUMGOBcvy8uEd+4teC7IffXTmdOieBL4Ilp+mxMe8TiuJYRs+ibW7FVxMZ5FWXCgTMe+KX
	dYSBNA5p3YFZ8/56EOOME+tBiGm9L4qPLhIsKNunRh1kBLuGMYmUnR0GtrT0TIRXoUGCkCpORYm
	CT/ls3QRViv3O8Yb3wo6HPV5+UCQGP4kHpAz4OIA=
X-Received: by 2002:a05:600c:4e54:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-441ac91ce3fmr23580755e9.30.1745918866339;
        Tue, 29 Apr 2025 02:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjHWG3JA2ydXcTpqmzjCTS1CxLqIa0iOQT/f4ABfKTOjSI117XybK9mJBeuL0JFNSojm5kYw==
X-Received: by 2002:a05:600c:4e54:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-441ac91ce3fmr23580295e9.30.1745918865908;
        Tue, 29 Apr 2025 02:27:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5394bfasm151677125e9.40.2025.04.29.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:27:45 -0700 (PDT)
Message-ID: <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Date: Tue, 29 Apr 2025 11:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
From: David Hildenbrand <david@redhat.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CefJbHt7r-F3oCAs2BdGis0KC3RbDSkXoFVqp0-Zhno_1745918866
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_102751_546447_DF00EAF1 
X-CRM114-Status: GOOD (  12.98  )
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

On 29.04.25 11:19, David Hildenbrand wrote:
> 
>>    #include "internal.h"
>>    
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			      pte_t pte, struct folio *folio, unsigned int nr)
>>    {
>>    	struct page *page;
>>    
>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>    		 * write-fault handler similarly would map them writable without
>>    		 * any additional checks while holding the PT lock.
>>    		 */
>> -		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		if (!folio)
>> +			folio = vm_normal_folio(vma, addr, pte);
>> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
> 
> Oh no, now I spot it. That is horribly wrong.
> 
> Please understand first what you are doing.

Also, would expect that the cow.c selftest would catch that:

"vmsplice() + unmap in child with mprotect() optimization"

After fork() we have a R/O PTE in the parent. Our child then uses 
vmsplice() and unmaps the R/O PTE, meaning it is only left mapped by the 
parent.

ret = mprotect(mem, size, PROT_READ);
ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);

should turn the PTE writable, although it shouldn't.

If that test case does not detect the issue you're introducing, we 
should look into adding a test case that detects it.

-- 
Cheers,

David / dhildenb


