Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AA8CC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blI+0pSqSuATt3s7ccT3kLKAD9SFsP3tmGqnNgFKm2c=; b=PV/XHykIXkoOaAS/vucFg1mEVt
	YOp3e0nZN9nEyPtU70JXrjrINd4KbdOa/yX398Ki8RmZp2PSWmFRctMSRtSPesHtF5O+i/L6us1WF
	G2xQSA+ORE++Y8+WgH6pIDQGiSyd0rh+oD3oXpnTx0OvTK0R0rpi8NbRGdASL3CkUxemF3xU1ADDl
	lueqRESxoWPJGKr+vco80rULnc12rjfYDEZRC/m2m/ZPIYQo/iTeVvJnBkvzO6fJC0ZAaaR+GhVvt
	9ie4DoMZqFaO7zQfTU/f31wmMF3e5ZeHdAq2u1gp2qs5sE8tjwMSmmuXoSUGYyGncTydvRVOgRgme
	1L46yE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwUP-0000000FEsZ-1lS9;
	Wed, 14 Oct 2026 10:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwUO-0000000FEs2-0qua
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 10:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=blI+0pSqSuATt3s7ccT3kLKAD9SFsP3tmGqnNgFKm2c=; b=WONz7JMW2Oh1vMOMQIOt4lWhgF
	OpsLOm7zlgHUgGAiFuXjUGzGgm2X4CEMZg29Syt8oX+lhZuOD3L4PcBTSVWKekOak9phdGzhyR0yf
	Ib+ATTeNIPIgP9q94SzFSUTOmFgg8DAfRqPKEeMRluGE6XjalO6y0loC/50EmIpHs16sC9I6APqHZ
	YVmllPnw+Q76RmkEyZAgSVs32Fw3ip2Hua+9lkqMjAGyJAWNt+9cW7d5Pu6ouJN9bOod6O5KGvkYu
	W2RLbDmWcd94Kj512LJ3ZV+8YDqg51fO9Z7rgKZe0W1IvIldnQ6uImIgluC2upU9gNU490F/pI9R+
	XPGEpy7g==;
Received: from out-100.mta1.migadu.com ([2001:41d0:203:375::64] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGwUK-0000000Ge8Y-2pvF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:45:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4j71whs7pU+NnCMQt6l/U/Btk6pFemJHjPQ5tC3+JVI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791974733; v=1; x=1792579533;
 b=FYzHg0XnYGEUQq4gQZ5cIbHAgUUe4PpGS1L3xemdo1QSXQzcIC76202IsBVcUhpf6mVVskX/
 XK4ZbrCHKtKxf26lrd1wGSJh0rbd9KbjJDTAkElHSfV7oM+6YU8/nTeRR4QAv4kDQFKqJpC0wiE
 r0uD1vFxp4NgP+ne0cKlS/C8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 767be9f59756f718;
	Wed, 14 Oct 2026 10:45:21 +0000
X-Mizu-Trace-ID: 767be9f59756f718
X-Migadu-Flow: FLOW_OUT
Message-ID: <44aba42f-0355-4643-826f-0c7abec4499c@linux.dev>
Date: Wed, 14 Oct 2026 18:45:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: restrict transparent contpte mappings to valid
 PTEs
To: Dev Jain <dev.jain@arm.com>, Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 baolin.wang@linux.alibaba.com, mark.rutland@arm.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261013093600.54995-1-zhaogongyi@bytedance.com>
 <20261013153953.77575-1-lance.yang@linux.dev>
 <516828fb-558d-4a20-9532-51f50d6ba042@bytedance.com>
 <0bbbe312-47a4-4eeb-8299-1f20daf4e949@arm.com>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <0bbbe312-47a4-4eeb-8299-1f20daf4e949@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_114537_137020_1CE453B4 
X-CRM114-Status: GOOD (  14.59  )
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



On 2026/10/14 18:03, Dev Jain wrote:
> 
> 
> On 14/10/26 12:01 pm, Zhao Gongyi wrote:
>> On 10/13/26 11:39 PM, Lance Yang wrote:
>>>>
>>>> +	/*
>>>> +	 * Keep the producer-side invariant documented in pgtable.h true even
>>>> +	 * if a direct caller passes an invalid descriptor with PTE_CONT set.
>>>> +	 */
>>>> +	if (!pte_valid(pte))
>>>> +		return __set_ptes(mm, addr, ptep, pte_mknoncont(pte), nr);
>>>
>>> set_ptes() is the only in-tree caller, and it already clears PTE_CONT
>>> before we get here ... no? Why not fold !pte_valid(pte) into the
>>> !mm_is_user(mm) check below and return __set_ptes() directly?
>>>
>>> 	if (!mm_is_user(mm) || !pte_valid(pte))
>>> 		return __set_ptes(mm, addr, ptep, pte, nr);
>>>
>>> If a direct caller does pass a !pte_valid PTE with PTE_CONT set, I'd
>>> rather add a VM_WARN_ON() to catch that. Silently clearing the bit would
>>> hide a caller bug :)
>>>
>>
>> Hi Lance,
>>
>> Thanks for taking a look.
>>
>> Yes, you are right. The public set_ptes() wrapper already strips PTE_CONT
>> before calling contpte_set_ptes(), so the pte_mknoncont() in the invalid
>> path is unnecessary for the current in-tree path.
>>
>> The issue I was trying to avoid is not that the incoming pte already has
>> PTE_CONT set, but that contpte_set_ptes() rebuilds the pte from pfn/prot
>> and then adds PTE_CONT again based on alignment. For an invalid descriptor,
>> that transparent contiguous encoding should be skipped entirely.
>>
>> So your suggested shape makes sense to me. I will change this to return
>> through __set_ptes() directly for invalid descriptors, and add a warning
>> for any unexpected direct caller that passes an invalid PTE with PTE_CONT
>> set, e.g.:
>>
>> 	if (!mm_is_user(mm) || !pte_valid(pte)) {
>> 		VM_WARN_ON_ONCE(!pte_valid(pte) && pte_cont(pte));
> 
> set_ptes does pte_mknoncont(), so the warning will *never* fire I think?

YES. Just a sanity check to catch a future direct caller passing
a !pte_valid PTE with PTE_CONT set, rather than silently clearing
the bit :)

Cheers, Lance

> 
>> 		return __set_ptes(mm, addr, ptep, pte, nr);
>> 	}
>>
>> That keeps the fix focused on not creating new invalid contpte entries,
>> while still catching a bad direct caller instead of silently sanitizing it.
>>
>> Thanks,
>> Zhao
> 


