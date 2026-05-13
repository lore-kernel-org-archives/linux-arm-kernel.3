Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92B5CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2zm1YLpEK/K6NLs3kxOMAiwgi/0XR4he6JT6xLecSg=; b=g3JLuetFg0J+3Oyom7GcVrVsyV
	FHsKPSJzl5pNOI8y94kzulgbwx0EAqthMrjnJ03obT7KPQ65C86HwI1J2FxC+V3zMiVFMLMgfBJiM
	95XXcIGhiftCoHjCph+agAnq8K3N+a12uvYQpDiJXOlqk40WbXqwP8PcVkRRQcurEe8zeTSHh8clu
	PYdeCx7IW5lf3ODkZCLZsT87N3Yp/1/G10r3v3Kp1aAqCSXpkJM/tfA0OGv5ggFPTq3yT6zOA/J8B
	h2JCpgXp3xUZtMmFTdy4JIQecHv61pMMtW4sV1YOYg56jIhavI4qp+7WPIGlda9Mx3XCDkc5RfFpe
	VSFexeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5LS-00000001oWr-40SW;
	Wed, 13 May 2026 08:53:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5LO-00000001oVd-0suk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7DE543639;
	Wed, 13 May 2026 08:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6965DC2BCC6;
	Wed, 13 May 2026 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778662409;
	bh=udpx4tAi5cV12nowkKiduLaSTNB4aDhgn4UtaDGhwjc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Y+F6N46rmLahxexTiMU0v4RWCo847tkdJ3czz6DiwEacEa1J226dAgDQ05U5ndGec
	 7QrxMQfYEiY6oGvyF4tdYqwgN790mcU1v6j61y67yjrPlTn+SOAZLJRxZEcIcsTxR1
	 8VdVvUi9uMNX9LZSjZTtkW5wpuCDn2gnX9YNzDnYAhdkFsMZqYNZqf3Honbjq+8APS
	 SLSOqBYJ+MBrNFTKPyhcrUQxx7dKaApQBMzcpfo/YV+6d/eflluYowGzXemx1uP+zt
	 SFTtrtZxXSc2g+QLsROD77a91K05LcO5O5NIUcMC9CBbzfJ1jP4JTnbYeIIf3bNl2P
	 CgUcxisDpmK/A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7CDE2F40085;
	Wed, 13 May 2026 04:53:28 -0400 (EDT)
Received: from phl-imap-14 ([10.202.2.87])
  by phl-compute-01.internal (MEProxy); Wed, 13 May 2026 04:53:28 -0400
X-ME-Sender: <xms:CDwEakOyH6OqlreTlGvvT2Crs3Oc2Zreu7-Y5q5ti18GeFTbRP4siw>
    <xme:CDwEalzs-Tm8WR_tpsIrmFwaojRXZTlrvddgPEBnyrn7qd9Oa-XmzW17Ajb5W1rsm
    ENwQdTzAdrLZQPEASmu0GifNfjvpqY9OP_ABNVIbFtnP35Hd7w8YX0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdegvdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:CDwEanu0ZxvdrKWQDcCPlWGRQUZs_3Zu2ihfUq1ao8QuBRliJl_ZJA>
    <xmx:CDwEakwkNJDN5jK8LR56K91k_tsmxmY540V_2TCcSC26-5LgRKOeqA>
    <xmx:CDwEasZe1VaZQUnuPI0TcP3cnwXPrIei1cw3PCWgTVdElaZhAV0cuA>
    <xmx:CDwEajX9ywcTlL_5nyroUU_gaoxjHhgQTX7qic9mAwdpmvWY8RlFgA>
    <xmx:CDwEatEJFr18fZzdaekmfSF2cVsV5T1A9rG4sRBjctmlK2Mk6iEtPuAb>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 58AEAC4006E; Wed, 13 May 2026 04:53:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 13 May 2026 10:53:08 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: "Jann Horn" <jannh@google.com>, "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
Message-Id: <49d30ffe-b7e1-4b05-89e0-c3fe01348bb6@app.fastmail.com>
In-Reply-To: <agQ7RMAw51RlNUOj@kernel.org>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
 <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
 <31252c1d-a98d-4635-ab61-ce5b649e256f@app.fastmail.com>
 <CAG48ez2xJwJDgxSH0u2G==9dOQJQxQ7WsQfU14O1H5hEWic1eA@mail.gmail.com>
 <fb5749bb-bc87-4f0b-9ec9-8a1eb7ded3b5@app.fastmail.com>
 <agQ7RMAw51RlNUOj@kernel.org>
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015331_552871_5CDC163B 
X-CRM114-Status: GOOD (  22.72  )
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



On Wed, 13 May 2026, at 10:50, Mike Rapoport wrote:
> On Tue, May 12, 2026 at 02:56:16PM +0200, Ard Biesheuvel wrote:
>> On Mon, 11 May 2026, at 16:40, Jann Horn wrote:
>> > On Mon, May 11, 2026 at 10:59=E2=80=AFAM Ard Biesheuvel <ardb@kerne=
l.org> wrote:
>> >> I think we should simply do something along the lines of the below,
>> >> considering that the size of a data object tends to correlate with
>> >> its minimum alignment.
>> >>
>> >> I do find it rather puzzling that the compiler emits empty_zero_pa=
ge
>> >> *after* zero_page_pfn - ideally, we'd combine the below with
>> >> -fdata-sections so that the linker sees all individual objects, but
>> >> I suspect that would create some problems elsewhere.
>> >>
>> >>
>> >> --- a/include/asm-generic/vmlinux.lds.h
>> >> +++ b/include/asm-generic/vmlinux.lds.h
>> >> @@ -452,7 +452,7 @@
>> >>  #define RO_AFTER_INIT_DATA                                   \
>> >>         . =3D ALIGN(8);                                         \
>> >>         __start_ro_after_init =3D .;                            \
>> >> -       *(.data..ro_after_init)                               \
>> >> +       *(SORT_BY_ALIGNMENT(.data..ro_after_init))            \
>> >
>> > Oh, neat, I didn't realize that's possible. That seems like a nicer
>> > approach...
>>=20
>> Neat but rather ineffective, unfortunately. (I don't see a size
>> difference with the arm64 defconfig kernel)
>>=20
>> Given that empty_zero_page only ever gets its address taken, we
>> might just move it into the linker script if that requires tweaking
>> anyway. We can just place it at the start of .rodata, which is
>> already page aligned on most architectures (and will become page
>> aligned unless EMPTY_ZERO_PAGE is #define'd by the arch linker
>> script to something else)
>>=20
>>=20
>> --- a/include/asm-generic/vmlinux.lds.h
>> +++ b/include/asm-generic/vmlinux.lds.h
>> @@ -472,6 +472,17 @@
>>  #endif
>>  #endif
>> =20
>> +#ifndef EMPTY_ZERO_PAGE
>> +#ifndef __HAVE_COLOR_ZERO_PAGE
>
> I don't think we want let architectures that don't use colored zero pa=
ges
> redefine it.
> If it will be really required we can add the ability to redefine
> EMPTY_ZERO_PAGE later.
>

I was actually intending to add use this for arm64 in the next patch. It
already has a reserved_pg_dir in .rodata which is page-sized (i.e., up
to 64k in size) and guaranteed to remain all zeroes, so empty_zero_page
could actually be an alias for that. This is what I had in a previous
revision, before you turned the empty_zero_page definition into common
code:

https://lore.kernel.org/all/20260320145934.2349881-16-ardb+git@google.co=
m/




