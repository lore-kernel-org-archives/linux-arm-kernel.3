Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A0ACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQE3wpLqYzkqVVGo5IykdkJujhJiTkAzNCjRXn40AUE=; b=X26e+FUnuUnpXDNpZiOgv6JEPu
	wlQYN9fH1FZtAXAPU6DgP8HhfmfdZgAhyG4Ir/U/gLDrCiu3EMuJ5Cn1N4KAGBBaW1kIO2klCkNsj
	/C63qUf03raJFgjneYQ/K/O9YeQgfBtkk2MNZ7ivSy+eSlM9ZWD89/HQkoSjvWXPYunwM5uJGtrNX
	EUpNwi1hTAB+8Hzn8XXR12NVxa2wRqg6RjA26L8tu5+8X73+ma7XT1Wo1cpnBL8TxzTWQSTSijFWB
	P3pw4EzpFoS1m/ULJuHMRR8fX53riEObhiJgNRbsCiDHK4QtNfv6+B8/PZF5rN/7AaFrVhbJYt6PX
	o84mUJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMUK-0000000CpFE-0t1g;
	Mon, 11 May 2026 08:59:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMUH-0000000CpET-2DJ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 703B343410;
	Mon, 11 May 2026 08:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D15C4AF09;
	Mon, 11 May 2026 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778489980;
	bh=pvy6NTMFmdxYmqrWBMSd1MjoiQi19wsMVW3eEKzhiNY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uC278g/6wcZXS/TECokjs2CKqBLAAIxUQXBQ4W6K/LvV2cTgxi3+2zo1RK1wLtotT
	 Qn6V56vnf5O4Z0ewruwmAxAlOlB5flBpO1rMunySxoPCyWmDW4zQVwUnIVoNZgd8rw
	 34xPqEQcU9tQ/jbYe3ELDh+VWdv6+1i1sK5qfRrOM8w1usBGEp+xYAJMs1ez3ge5pw
	 yG2mdBwYO7zGlnv8W8LAhZdPlNCRL62lqPK8T9aZQYfEi0ZnZCqXK1hwpeZYNP+YhJ
	 Nt6Sou/dVX74pLH9EoHCJAfc8sXz8WzyM4beQ4NWBlKrjLPLH9PqghlqB6sKYUDHtD
	 bU7jmckMb7LWA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D79BAF40085;
	Mon, 11 May 2026 04:59:38 -0400 (EDT)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Mon, 11 May 2026 04:59:38 -0400
X-ME-Sender: <xms:epoBauLUKWQQFlZDizE4OuZE6nJAHfoxTRN4JweXZ0D331C0Gx9k2w>
    <xme:epoBag-E-VKCrhgu6pw8Omzhcj6zCZiOwRk3M7qAOAuWkSHFeksC-b68pGQn6zV2B
    utsXaz8NMFa0DCSHbDGj34WYVjf2jkvaYQNfX7MXBNbmfao4rY71IXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefhefgtefgkefhgfdvffdukeejheeuvedthfdtiefhleejhfefjeffieeu
    jeefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    udejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhshhhumhgrnhdrkhhhrg
    hnughurghlsegrrhhmrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgr
    shesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtg
    homhdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphht
    thhopegrrhgusgdoghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhgrnhhnhh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhiiihprhhutghkrgesghhoohhglhgv
    rdgtohhmpdhrtghpthhtohepshgvthhhjhgvnhhkihhnshesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:epoBaoK2PXNYJrbD9UF4L2Rfa83SRHRE4Tx3RlxLmwBWbX8OHFdGYw>
    <xmx:epoBakdLmSzav7YxfV8QIgIsf4qOoKU27Ca4E2o7m-mLwVLuB7rQDQ>
    <xmx:epoBaqV5UGjTnEjdVxMC3Vd39E4_WOaS7hl6JmkVEkAAyxPW_yFdxg>
    <xmx:epoBaijI7jp1hWClAtSGGNjLOjDz0kfcPsFqs9xn0feG0Uj96kj0pA>
    <xmx:epoBakjFQJe8ZqPXns0Mett1u_CYVhCbwTSLmPbB_izBow8_pPo9ccGW>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AE438C4006E; Mon, 11 May 2026 04:59:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 11 May 2026 10:59:18 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
Message-Id: <31252c1d-a98d-4635-ab61-ce5b649e256f@app.fastmail.com>
In-Reply-To: <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
 <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015941_615431_50E41C4C 
X-CRM114-Status: GOOD (  32.29  )
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


On Fri, 8 May 2026, at 19:02, Jann Horn wrote:
> On Mon, Apr 27, 2026 at 5:44=E2=80=AFPM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
>> The empty zero page is used to back any kernel or user space mapping
>> that is supposed to remain cleared, and so the page itself is never
>> supposed to be modified.
>>
>> So make it __ro_after_init rather than __page_aligned_bss: on most
>> architectures, this ensures that both the kernel's mapping of it and =
any
>> aliases that are accessible via the kernel direct (linear) map are
>> mapped read-only, and cannot be used (inadvertently or maliciously) to
>> corrupt the contents of the zero page.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Reviewed-by: Jann Horn <jannh@google.com>
>

Thanks

> Sorry, I should have looked at this properly earlier instead of ending
> up duplicating this patch with
> <https://lore.kernel.org/all/20260508-ro-zeropage-v1-1-9808abc20b49@go=
ogle.com/>.
>

No worries. I might borrow some of that rationale btw

>> ---
>>  mm/mm_init.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index f9f8e1af921c..6ca01ed2a5a4 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -57,7 +57,7 @@ unsigned long zero_page_pfn __ro_after_init;
>>  EXPORT_SYMBOL(zero_page_pfn);
>>
>>  #ifndef __HAVE_COLOR_ZERO_PAGE
>> -uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
>> +uint8_t empty_zero_page[PAGE_SIZE] __ro_after_init __aligned(PAGE_SI=
ZE);
>
> I think this is fine as-is; but FWIW:
> "__ro_after_init __aligned(PAGE_SIZE)" means that this will land
> in the middle of the .data..ro_after_init section, with padding in
> front of it to create 4K alignment. So this probably wastes some
> RAM on padding.
>
> Looking at "nm ../linux-out/vmlinux | sort" with this patch applied
> (from a build without any LTO or such), I see this:
> ```
> [...]
> ffffffff8473d378 d shmem_inode_cachep
> ffffffff8473d380 d user_buckets
> ffffffff8473e000 D zero_page_pfn
> ffffffff8473f000 D empty_zero_page
> ffffffff84740000 D __zero_page
> ffffffff84740008 D pcpu_reserved_chunk
> [...]
> ```
> So I think there are almost 4K of padding between zero_page_pfn and
> empty_zero_page for alignment; and I think when the linker linked
> mm-init.o with the rest of the kernel, it also had to align the
> compilation unit's entire .data..ro_after_init section to 4K, which is
> why I also got ~3K of padding before zero_page_pfn, resulting in a
> total of ~7K of padding.
>
> If you want to change this:
> I searched through the arch-specific linker scripts, and I think they
> all rely on the generic RO_DATA() macro for emitting the rodata
> section; so creating an analogous page-aligned rodata section should
> be as simple as adding "*(.rodata..page_aligned)" directly after
> "__start_rodata =3D .;", as I did in my duplicate patch.

I think we should simply do something along the lines of the below,
considering that the size of a data object tends to correlate with
its minimum alignment.

I do find it rather puzzling that the compiler emits empty_zero_page
*after* zero_page_pfn - ideally, we'd combine the below with
-fdata-sections so that the linker sees all individual objects, but
I suspect that would create some problems elsewhere.


--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -452,7 +452,7 @@
 #define RO_AFTER_INIT_DATA                                   \
        . =3D ALIGN(8);                                         \
        __start_ro_after_init =3D .;                            \
-       *(.data..ro_after_init)                               \
+       *(SORT_BY_ALIGNMENT(.data..ro_after_init))            \
        JUMP_TABLE_DATA                                       \
        STATIC_CALL_DATA                                      \
        __end_ro_after_init =3D .;



