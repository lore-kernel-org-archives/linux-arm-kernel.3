Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E710FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eER2GCpD8B7GlhmETIiRKrTfvFHwkGHJ1zYSjhWxsec=; b=VeUyLlZPFWgDMhyzoTu3AtdhC2
	m0wTyEE6m/xtCqbruzFMKRpydnlBFc5dCj03EZc/dY8Dp3Oi5Hyra8OWlw25WV4ZAMj3O8IWvBoD0
	UXpNioRZeuPzyDzuGsUdFNJ8WKhcxOFn96KonwpYSnk68KqviDyZ7dm//sdkrK+mKk302soZWUG36
	BvxcbJt2gyaOUMfDYxEV8fCJZVEy5RL5UtRaT8JBwuA67bBn8RizOCNPUOTqmctc5d3VF+S8HKco9
	PVjQleBDPvRCByo+UkN9bdTf+U8tJc0kZIUTx70bU7hR/32ZubH3lBP1Za0KHrAeXsliORH6UCyP5
	SZNzqHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5pL-00000003kyZ-1KQY;
	Wed, 29 Apr 2026 14:23:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5pJ-00000003kyL-2ECD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F47F60139;
	Wed, 29 Apr 2026 14:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B605BC19425;
	Wed, 29 Apr 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777472624;
	bh=1DoYAyGOTScVVD3GXpdNNQST/38xq+/hMaqnmr473Bs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=D+d91KjTTrM+lBnQ44Qx5TmdF/ui8FYG7riluu2LEkceRos9M2RXCy/huWD2rHFbk
	 UZ0bxWyoCYJBzLVkVf2ZhXbnpzm/XXLxEYS7qjdAvLnsraGoQZe9UKyJnTuJgT974q
	 j+EkKT6u7bZ4J4CmzpGeolUiepyZgE/zABzHbergVuaLqEVNd6YD96dpQQzMP4Bzju
	 gN2G1YFkAt6HF5fb0NF2fHHdLnzgbb/Eay7BLp+q3r+uTOMXWyP2eFu+ml06IRx4AH
	 LHnKjiw12g7mYF/wPW2KJUDX1yM+xxwO5xeMlajk12CKWQlU2G3bYJsLxLi1zVDZ9R
	 HLwOZtcL0ayew==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C6D6EF40081;
	Wed, 29 Apr 2026 10:23:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 29 Apr 2026 10:23:42 -0400
X-ME-Sender: <xms:bhTyaRuedy8IaKVEUb6zYplqea_IyrVJ49HkQ4RUPpdmpAElw4kXEw>
    <xme:bhTyaVRnbbQOqYIc9uQZ-srPlIHJH6Ecz-9CNLTmo6l72SQrfGLC7rXy5RwNoSO5c
    PfLjljA9mfzOFgztLYmln-dyEK2WRsD3kpgdEUY7fyEOc7nsh2YDdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrnhhshhhumhgrnhdrkhhhrghnughurghlsegrrhhmrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehkvghv
    ihhnrdgsrhhoughskhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlh
    grnhgusegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhm
    rdgtohhmpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehlihiiphhruhgtkhgrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsvght
    hhhjvghnkhhinhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghvihgusehkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bhTyaYQqbQnVIvDQGr_EIyoNqMUxhwXG4G4jtXeNWeDmpwZFsfnQFA>
    <xmx:bhTyaZ5UU3sOLPELciR1S3yUNipryJRU-wfpnldnvQeR7ny2GQoX_A>
    <xmx:bhTyaS26ba8LHTkWKJhLTLhqgOLfm1ol0gbWKJiQ7XNXpSI0HVb3_Q>
    <xmx:bhTyaWlPWrFeCV-JEl10S10qMtJqxcSJLGeaFD4PPzxewiMEq2oA5g>
    <xmx:bhTyaYj-PQwy2tOxiSz7NljYKJXKPYJnt1JMl7HQF9Vpthrm4_c5Y-60>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9D519700065; Wed, 29 Apr 2026 10:23:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 16:23:22 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
Message-Id: <1f9c1ca5-c15c-4a08-aa8c-cbe64f7f205b@app.fastmail.com>
In-Reply-To: <8a315ca2-3754-4a66-990e-55b85191aa6e@arm.com>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-28-ardb+git@google.com>
 <8a315ca2-3754-4a66-990e-55b85191aa6e@arm.com>
Subject: Re: [PATCH v4 11/15] arm64: mm: Don't abuse memblock NOMAP to check for
 overlaps
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Wed, 29 Apr 2026, at 12:54, Kevin Brodsky wrote:
> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Now that the DRAM mapping routines respect existing table mappings and
>> contiguous block and page mappings, it is no longer needed to fiddle
>> with the memblock tables to set and clear the NOMAP attribute in order
>> to omit text and rodata when creating the linear map.
>>
>> Instead, map the kernel text and rodata alias first with the desired
>> attributes, so that they will not be remapped later with different
>> attributes when mapping the memblocks.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/mm/mmu.c | 24 +++++++-------------
>>  1 file changed, 8 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 5e2348b15783..1a4b4337d29a 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1148,12 +1148,15 @@ static void __init map_mem(void)
>>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>  
>>  	/*
>> -	 * Take care not to create a writable alias for the
>> -	 * read-only text and rodata sections of the kernel image.
>> -	 * So temporarily mark them as NOMAP to skip mappings in
>> -	 * the following for-loop
>> +	 * Map the linear alias of the [_text, __init_begin) interval
>> +	 * as non-executable now, and remove the write permission in
>> +	 * mark_linear_text_alias_ro() above (which will be called after
>> +	 * alternative patching has completed). This makes the contents
>> +	 * of the region accessible to subsystems such as hibernate,
>> +	 * but protects it from inadvertent modification or execution.
>>  	 */
>> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
>> +	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
>
> Is it now necessary for that mapping to be tagged? If so, it should
> probably be called out in the commit message.
>

As you've pointed out, the initial r/w mapping of the linear alias of rodata
will need to be mapped tagged before moving the zero page there. So this patch
will just preserve that, rather than remapping the region tagged explicitly as
it does now.

