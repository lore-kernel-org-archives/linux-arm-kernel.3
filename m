Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62187FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOKe62HEKKKWgBcjnuqJwjaBz64blRZ88qadx/8RQEg=; b=xZhFSmS4Sp6x5bGzaBWfV4T6N1
	eSKMj5eRQEYyh1qBp4bSb3RVu57q7BQUcm/nBi8GlIvSMpzeh411VCEMuw+NNZfo51Uotsh0D6K8O
	TxFpRFzkLOJ2gYzqJtUdm6EclQFQEMifr2aWofhCp2P8RBGLjUDgQtY0iIpjpVJh3Nu+3df5/oCwQ
	SLDRQErhhL4vCUtgdTOZPiH9PCvFDdaGzbuIDDeb7YYSDRct0f1lkVX5BJ008kVJKDy+OpaZ+RoWO
	2x0BN1gginSs+rSrQXQDrii9kscMsLJCF8W66AMyMJ0lyQUYIJ+TudwqIj2/0+HoamvD9EOG1ezIc
	KqIzs57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6C5-00000003msO-2Mbz;
	Wed, 29 Apr 2026 14:47:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6C4-00000003msH-1mdt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:47:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88A7E60138;
	Wed, 29 Apr 2026 14:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013C3C19425;
	Wed, 29 Apr 2026 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777474035;
	bh=7Z35J/ZrfKtRqAQn9Q7Ex+MS9IkQxmcfqwce4UOcZcE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pN74wno3T4T6KJdd64tkp31Q7DAQwW2YK1pEmLzaAkq9VGqlb3DOzwq1MdKxYxQYS
	 hdzp0osC0QmRjfCoViwi9+1aNelz9YdkOkY9Hh8hxaz1oiCO+Cm0S7rxGZI/T8aPUH
	 NiQ975nzmPLNNjG1ADiF6SKwkfdqHovXw2O4BzwC7+SCMuoCH7DGdIHha4XYTATWZe
	 lJvAoe+Ql8GWdLQa3eIHz1LZ5xYYWbHWWYaDEeN/alvj7LqtqMbEkPg/aqevGj0xca
	 8MMv7YwaZOYRQjIfZy6ota1FpgDHOEH4Nc1pcO0iJ+SAolEciPWES3IbHeLC/V5P3h
	 JiMxGdRJFtS8Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id F22C5F40071;
	Wed, 29 Apr 2026 10:47:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 29 Apr 2026 10:47:14 -0400
X-ME-Sender: <xms:8RnyadBBxdrHCM7yqLvYcm18trsy8qo2fJZIqXxK9lwhXEP70yCBbQ>
    <xme:8RnyaWW5bEY2lce2uVwjp760NyAziTK_0kTYol5NL_8QzOxJ2OwS6_WbQZEg7M1vY
    tEKbwOpWsUfB2729bjsD92wuVo4JacFSCigIJBo0bw8GXnsgmjys5xE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeejvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:8RnyacDCA-_xULqEbSEn6qUEKIfcqZmZMgD2vngfLOCaS-7bnXJy8g>
    <xmx:8Rnyaa01FNwVKS3EliWzZ4mey9F9CoOOYXIkrMVxN53h6Bqg3olQpA>
    <xmx:8RnyaRPrRRhxHtTOFw9QjLScU1rhydSF0AulCpbyxA3vqnv-EvzdxA>
    <xmx:8Rnyaf7nwJ9jaH5184hz3DwfsV7DwAGLoAEpEkqmdhAD1e2WLmyo7A>
    <xmx:8RnyaWaXmjpCpPsayF2cXuU48fUOtfHGVFHUoo9an_HSWgc9Do6qSxqP>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CEE11700065; Wed, 29 Apr 2026 10:47:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 16:46:53 +0200
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
Message-Id: <9ff1d19d-f3f8-4106-aeeb-66c4c21742b9@app.fastmail.com>
In-Reply-To: <a8740f95-e167-48ae-ae65-97c6701d9c94@arm.com>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-29-ardb+git@google.com>
 <a8740f95-e167-48ae-ae65-97c6701d9c94@arm.com>
Subject: Re: [PATCH v4 12/15] arm64: mm: Map the kernel data/bss read-only in the
 linear map
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



On Wed, 29 Apr 2026, at 15:54, Kevin Brodsky wrote:
> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> On systems where the bootloader adheres to the original arm64 boot
>> protocol, the placement of the kernel in the physical address space is
>> highly predictable, and this makes the placement of its linear alias in
>> the kernel virtual address space equally predictable, given the lack of
>> randomization of the linear map.
>>
>> The linear aliases of the kernel text and rodata regions are already
>> mapped read-only, but the kernel data and bss are mapped read-write in
>> this region. This is not needed, so map them read-only as well.
>>
>> Note that the statically allocated kernel page tables do need to be
>> modifiable via the linear map, so leave these mapped read-write.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/include/asm/sections.h |  1 +
>>  arch/arm64/mm/mmu.c               | 16 ++++++++++++++--
>>  2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
>> index 51b0d594239e..32ec21af0823 100644
>> --- a/arch/arm64/include/asm/sections.h
>> +++ b/arch/arm64/include/asm/sections.h
>> @@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
>>  extern char __mmuoff_data_start[], __mmuoff_data_end[];
>>  extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
>>  extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
>> +extern char __fixmap_pgdir_start[];
>>  
>>  static inline size_t entry_tramp_text_size(void)
>>  {
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 1a4b4337d29a..9361b7efb848 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1122,7 +1122,9 @@ static void __init map_mem(void)
>>  {
>>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>>  	phys_addr_t kernel_start = __pa_symbol(_text);
>> -	phys_addr_t kernel_end = __pa_symbol(__init_begin);
>> +	phys_addr_t init_begin = __pa_symbol(__init_begin);
>> +	phys_addr_t init_end = __pa_symbol(__init_end);
>> +	phys_addr_t kernel_end = __pa_symbol(__fixmap_pgdir_start);
>
> Using fixmap_pgdir as an anchor seems a bit arbitrary... Couldn't we use
> __bss_end instead?
>
> It could also be helpful to add comments in vmlinux.lds.S clarifying
> which sections are RO/RW in the linear map, it's getting pretty
> difficult to follow.
>

Ack.

>>  	phys_addr_t start, end;
>>  	int flags = NO_EXEC_MAPPINGS;
>>  	u64 i;
>> @@ -1155,7 +1157,11 @@ static void __init map_mem(void)
>>  	 * of the region accessible to subsystems such as hibernate,
>>  	 * but protects it from inadvertent modification or execution.
>>  	 */
>> -	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
>> +	__map_memblock(kernel_start, init_begin, pgprot_tagged(PAGE_KERNEL),
>> +		       flags);
>> +
>> +	/* Map the kernel data/bss so it can be remapped later */
>> +	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
>
> Maybe I'm missing something obvious, but considering patch 3/4 couldn't
> we directly map the range RO here?
>

After 3/4, __map_memblock() will no longer combine new mappings with existing
ones into block mappings or contiguous ranges. However, it will still set the
requested type and permission attributes on the entire range, and so the second
invocation is needed to restore the read-only bit.

IOW, we could also map it read-only twice, the result would be the same, but the
second call is still needed.


