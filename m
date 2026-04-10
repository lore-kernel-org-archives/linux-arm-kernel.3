Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749EBF44850
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA0gQtLpnpN6dJllUvcccJ/r+mNlQ650rHe5aRjH1/Y=; b=Ps3ne2N50tSylMHkblt79du7Id
	ekb3C26GyF1ROaYuQVoIoOX81SzTCgfRTXqcsq1pyxknSIdCUeKpgr2VHet8wgrDZ9chjdsbfTp/O
	R30sLRLMSKODQPExs237hSXR0tZDshquS9pDhyU/eo++A5IHY1PQVykYMXAHU4gEJpdA1eD+7L356
	i1YALDIGxG+gDJ6umD9AwXDqioltT8Iju7Ux1b5IHbEdWM85w4V9I/Sos4dK5ZLM5kllxRXU3p2rC
	anRZBVKAIOkxbqaPuvbfzOaFthH+f9wV8d9LBtzF7UVB7XcWqPwn/PXPTuinSLlFEUjEWTcOXFMV5
	geb/Kp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApl-0000000CA9Y-3fHR;
	Fri, 10 Apr 2026 12:19:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApk-0000000CA6p-2tUM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 12:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xA0gQtLpnpN6dJllUvcccJ/r+mNlQ650rHe5aRjH1/Y=; b=BeEn1a88GlTAzhLKCHDuhUj5H8
	0LENaov2MI8QTy/a30Ubjg4zLLD/V0YH1PuL6bIyUoV9/DNcdK+a+GmCLWfOMd5hkK4vrpe/25UcI
	/Y8Ta+9f2vcLpVeNV+YT88SPt5lag2XBnL5ANNUytBfFC/VCirIHDtcGye0xucfXPSmtgrxcmuWLD
	Kt4MQnMXX6IMjiBcVZys7yG0Yr+NRyude1dsow9WUyQaDPGESUcsH2YEr1pJ0dydGzEBdH2sqyRwB
	bETfMmGXdoR9o6EHKE+xay2wyYfVGfa1ceh4v2CnG1lggeG5FhdZMflsSH2c8MGx291hrBTETVgkU
	3a1Bf88A==;
Received: from mta1.migadu.com ([2001:41d0:203:375::] helo=out-183.mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApg-0000000DQah-0j22
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:19:35 +0000
Message-ID: <5f99b289-629c-47c4-bef0-966d6678a2a8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775823558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xA0gQtLpnpN6dJllUvcccJ/r+mNlQ650rHe5aRjH1/Y=;
	b=ItHIgZPXvITZaz44MjQUvDrn8+360iGxPQ4SupGVPlQJSXbTrdOrEoo4Y8x9OckfubKKuC
	WCMKPWu6Y4cbfbIrxy7yYu6g7lZP/gF4pNlezFZTINd4MZl80c4szu9X77x7P2SVip02/X
	skUbST20k2vhZ6MlLVxYCHvrmnVFaWs=
Date: Fri, 10 Apr 2026 13:19:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] mm: improve large folio readahead and alignment
 for exec memory
Content-Language: en-GB
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc,
 jack@suse.cz, ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 dev.jain@arm.com, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, Liam.Howlett@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, mhocko@suse.com, npache@redhat.com,
 pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
 surenb@google.com, vbabka@kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 leitao@debian.org, kernel-team@meta.com
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev> <adjkCOiLgZ_-zovg@lucifer>
 <adjllNan2vgBNBHJ@lucifer>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <adjllNan2vgBNBHJ@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_131932_830779_215293DD 
X-CRM114-Status: GOOD (  17.08  )
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



On 10/04/2026 12:57, Lorenzo Stoakes wrote:
> On Fri, Apr 10, 2026 at 12:55:42PM +0100, Lorenzo Stoakes wrote:
>> On Fri, Apr 10, 2026 at 12:03:03PM +0100, Usama Arif wrote:
>>>
>>>
>>> On 02/04/2026 19:08, Usama Arif wrote:
>>>> v2 -> v3: https://lore.kernel.org/all/20260320140315.979307-1-usama.arif@linux.dev/
>>>> - Take into account READ_ONLY_THP_FOR_FS for elf alignment by aligning
>>>>   to HPAGE_PMD_SIZE limited to 2M (Rui)
>>>> - Reviewed-by tags for patch 1 from Kiryl and Jan
>>>> - Remove preferred_exec_order() (Jan)
>>>> - Change ra->order to HPAGE_PMD_ORDER if vma_pages(vma) >= HPAGE_PMD_NR
>>>>   otherwise use exec_folio_order() with gfp &= ~__GFP_RECLAIM for
>>>>   do_sync_mmap_readahead().
>>>> - Change exec_folio_order() to return 2M (cont-pte size) for 64K base
>>>>   page size for arm64.
>>>> - remove bprm->file NULL check (Matthew)
>>>> - Change filp to file (Matthew)
>>>> - Improve checking of p_vaddr and p_vaddr (Rui and Matthew)
>>>>
>>>
>>> Hello!
>>>
>>> Just wanted to check if there was any feedback/review on the latest
>>> revision?
>>
>> It's -rc7, this is definitely something for next cycle :)
>>
>> On my part, my upstream bandwidth has drastically reduced, and review is
>> probably going to have to be a hobbyist thing at least for now.
>>
>> Also, not to be mean but:
>>
>> $ git log -E -i --grep "(Reviewed|Acked)-by: Usama Arif" --oneline | wc -l
>> 21
>>
>> So... :)
>>
>> Review in mm is very lop-sided, let's try to balance it out a bit!
>>
>>>
>>> Thanks!
>>>
>>
>> Thanks, Lorenzo
> 
> (Note that we're in a 'quiet period' from here until -rc1 of next cycle and
> won't be taking anything new until then. We plan to do this from around rc5 or
> rc6 of each cycle in future).

Thanks! Just wanted to check, as I am always confused about this. Is it ok
to send patches for review for next release at this time? So that they
are in a good state when rc1 comes. I wanted to send PMD swap entries
for review after I am finished testing, but I want them for review for
next release.

