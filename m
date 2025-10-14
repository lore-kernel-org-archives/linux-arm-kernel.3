Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73CACCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYVbINRSmFk2th/S/4+k/CpnsMJciemy/4mjE5VYBng=; b=WnLuqyadhmRIbDeCxfN4Nmrxfg
	wXGaQz/Gf7iBrFYwCnnnGHprL7zSpPefZJ+FonGPZtI71Jevzo1hx3mx1HO2mZTiYkeHZxRStDQ2K
	6eGAPpYPpjtGzfsd3S3EAjpiRPbZiX7VOGNVeVSmYcrRUPb1o0ovzJrMHHUjXBoFQaPEZwyclx5y0
	NiQ85RMHYLkz2EXKzcQziVbCn/VtfVY9CCbatWn5pSQxFcPykunVjLHL42FJtRH5pb5jpcARc+c5Y
	eGn9SJUmZHDFDgRVU7QJmF/oZ5wyVpFBGYy62B403j3a+n3O4gx6nDD4kbh2q+ZSgiIl2auCLDiB6
	75mArznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gUN-0000000Ghbk-3Ypy;
	Tue, 14 Oct 2025 14:58:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gUL-0000000Ghba-3SOu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 14:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AYVbINRSmFk2th/S/4+k/CpnsMJciemy/4mjE5VYBng=; b=kZ6TkblAM3+VJiaCO6KQ6QU2+i
	/yAkZdL5UWj+pVq3odktZZEoUFXdmk6JTO46m78SMMteptrEbpudK4klBExAlFrNzAS3QvXeB3Hge
	ZP1GM1tCJp3f1Jl1bWW/uzSZQLTUsU5vjeHlt8JOuM3U1uyEkZm+9SiXWNyM8vdG/wOl/lVXkBBAg
	LCtpAWXFSnkRHHkFsk3zqkWx8wsm8zzc+as6aXGdwSc3FAENAiDr7j1y4xNhT2YoF6fKGVr2lxI87
	+bO+0mT17kBC7fkKQxshEc7WiwUckUvNG9CNXpFwAC52mAGjfsJaO0YTe38UhsLfgkt003huHC/si
	3HmB0bAQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gUF-00000005GFS-3Sfm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760453928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYVbINRSmFk2th/S/4+k/CpnsMJciemy/4mjE5VYBng=;
	b=gLO7rds4P1DT5e9vFNGD5mS7dTT2hdBTjPH7tYEp/YVo6EqBrMDrdqMCXIcgZ1ynwV62zp
	gJRJ2/jsclRKjmnFIm2UUzJIrsa0aEmfnyTFqB08ixdrwhjgWK4JHsUSIHn3qn8GdQaZ6o
	NICgjVqe7jow/i3wOotQOGv7D0MmRTA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760453928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYVbINRSmFk2th/S/4+k/CpnsMJciemy/4mjE5VYBng=;
	b=gLO7rds4P1DT5e9vFNGD5mS7dTT2hdBTjPH7tYEp/YVo6EqBrMDrdqMCXIcgZ1ynwV62zp
	gJRJ2/jsclRKjmnFIm2UUzJIrsa0aEmfnyTFqB08ixdrwhjgWK4JHsUSIHn3qn8GdQaZ6o
	NICgjVqe7jow/i3wOotQOGv7D0MmRTA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-4YoxhiEzPC2ZpsBcvS-VuA-1; Tue, 14 Oct 2025 10:58:47 -0400
X-MC-Unique: 4YoxhiEzPC2ZpsBcvS-VuA-1
X-Mimecast-MFC-AGG-ID: 4YoxhiEzPC2ZpsBcvS-VuA_1760453926
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e36686ca1so50626805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453926; x=1761058726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYVbINRSmFk2th/S/4+k/CpnsMJciemy/4mjE5VYBng=;
        b=gm3Zz/DomOfEUiPcxt3JRkInIxL+DEIFgp7xObfRpWBFgl1/mMdwbbafhw5n4Ru/7O
         hTP+KeP9YJSLsEH/LstR0XWiqCXuHsVaD0l93wGPncHxlAgU2BgsR9ouROGrBq4u9lfv
         lPeoGpIuaN+ozDFilBaH6i3s3kU1AIpXBiFIix16XyYiJRfvUGcp83/T703Wd96OLvMh
         dSIp3Uc3WToh8INzVP9ktFaQEJ8mrgV19nT4MX2E/kn2Puz8VoBnubtRnGMtPIQtBjWP
         +nSCruDybU2HORO6Lt+TOo578sYb/w6VsQ8cCYBVBTnUCxU0oGSxSRgMc0gyU/mndWNp
         rxYg==
X-Forwarded-Encrypted: i=1; AJvYcCX97cBlSHIMcYc80aH9fdJGI1F64JiP0sfdTJRzsPR+AnJCGZ4bPBAgNtdY3LkLyb0+k2tCo57Mr674iBGzsPFN@lists.infradead.org
X-Gm-Message-State: AOJu0YweWmMomrPVXEoLuSU8jWgc597bK0sjhOvdsVb770+nRQvc+UVt
	xxa225uqdA+Sjx2fUFO7zogZMJlpG3YPfwpv5oQndS8lW/4zlgT0kzd00eDXqU7M3cJyuSprJ+1
	JgK/lCjnsGtWbnc+WYcTC/MRJs24pSAqjn+vWnn892AXm6rfyvjossYUf9OdC1YDxUO41MWi86m
	bY
X-Gm-Gg: ASbGncsXDr/RHR+HkIQYqv3URrE0hnWS3H4sUZeREqwdexLSOSeQWLliiWn5LWs1Qzv
	2gtiaGPHeSCvdPM5shoMPyQdeAdHv7Gl7oiIzdS9x4FCoUiAfsmBeyAVQKaPXvd41oNWltjQirp
	tUvUjEWrLDXurjzZgNglBPn39gi6R1F8XtTBOCj7yyrfy82ymbaonJM4IqdQVCv9HJ52OSzgCTv
	FlA2/amxmeQUQpSm4Mgqf3L0PzA6B/ZvrEPfu4Bq4yrBZW91UJYWL2OWjnzE7AQWkzLbBCtl2u+
	4mmCDSJBOSWnv07C326Zr7RLKXVxRiCiFnaV5uqOIcv5vyed1Dl6aUxv52lYToaqei4w2bAfjQ=
	=
X-Received: by 2002:a05:600c:4688:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-46fa9b18258mr188890455e9.33.1760453926213;
        Tue, 14 Oct 2025 07:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8kReNouh/FMllDhZL1/LjU5H2+MzwpSXXqIoRDT/EXSsokN8bUOOMTMa3S5ppFayGgVWyaA==
X-Received: by 2002:a05:600c:4688:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-46fa9b18258mr188890205e9.33.1760453925803;
        Tue, 14 Oct 2025 07:58:45 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm24159844f8f.44.2025.10.14.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:58:45 -0700 (PDT)
Message-ID: <313d2c86-d13e-4f79-b977-81a43d685cf6@redhat.com>
Date: Tue, 14 Oct 2025 16:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v2 1/2] mm: add spurious fault fixing support for huge
 pmd
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Huang Ying <ying.huang@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-2-ying.huang@linux.alibaba.com>
 <4c453dcc-2837-4f1a-905b-3462270f5e31@lucifer.local>
 <2861a35d-4f8e-4ee1-bd11-b915580c9ce3@redhat.com>
 <86bb70dd-2602-48f3-a683-5ec62b37fd46@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <86bb70dd-2602-48f3-a683-5ec62b37fd46@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _cngVswaMr7wW_owpLOvkyf9NlHwNVIVvwr6qdVVHmA_1760453926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_155853_696189_1889BB52 
X-CRM114-Status: GOOD (  13.76  )
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

On 14.10.25 16:49, Lorenzo Stoakes wrote:
> On Tue, Oct 14, 2025 at 04:38:05PM +0200, David Hildenbrand wrote:
>>
>>>
>>> 		/* Skip spurious TLB flush for retried page fault */
>>> 		if (vmf->flags & FAULT_FLAG_TRIED)
>>> 			goto unlock;
>>> 		/*
>>> 		 * This is needed only for protection faults but the arch code
>>> 		 * is not yet telling us if this is a protection fault or not.
>>> 		 * This still avoids useless tlb flushes for .text page faults
>>> 		 * with threads.
>>> 		 */
>>> 		if (vmf->flags & FAULT_FLAG_WRITE)
>>> 			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
>>> 						     vmf->pte);
>>>
>>>
>>> So I don't see why it's so egregious to have the equivalent here, or actually
>>> ideally to abstract the code entirely.
>>
>> Let's definitely not duplicate such comments whereby one instance will end
>> up bitrotting.
> 
> We're duplicating the code in two places, how would that bitrot happen exactly?

Often we adjust/fix comments to make scenarios/conditions clearer or 
extend them to cover some new conditions.

So even without any code changes people will just ignore to update other 
comments.

Code you can at least test with the hope to find inconsistencies.

So copying rather large comments is usually never the answer :)

Well, just like copying larger chunks of code, agreed.

-- 
Cheers

David / dhildenb


