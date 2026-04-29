Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA661FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTK3qGUH+aUg0IddMUS22SwIVSfAhQliFGGy5MXuCIA=; b=3+bWYMW5OcRPLcfmSAGzMLT7ZT
	d2nJq4L3hdGM6zhBcuyE/k2Hz3fkGagmLYWkNQP1u4HvyidmYqmImfeGGjm+T3XHWdPap54m4NyD1
	HuDVXhu06uOahzDTQ32qocU4yLhxXRyvgmjBQleH9rbXJGzl5AnL/BrweUAwoGNElpgDKsUM7ofns
	pFKXtpPXhOyW6AkIkQVaDqJs3mscKqLb/Gm90tCIWh/0mmkcFj7fsuFxasvnP0sdGWZ+u0Pnor0f7
	nOhND7JtiQvMaxKOhZZxIR49SxEW0SZVOobhhyNsqUEAZZSzzPrtnYluP3+JZtu8dMGq9eVu1epVt
	9ifzK7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzof-00000003Cbv-3Ol2;
	Wed, 29 Apr 2026 07:58:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzoe-00000003CbO-0lkX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:58:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48CBB61119;
	Wed, 29 Apr 2026 07:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C462C19425;
	Wed, 29 Apr 2026 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777449519;
	bh=kTK3qGUH+aUg0IddMUS22SwIVSfAhQliFGGy5MXuCIA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=B/9DmbHe9Zx3tx4XoFCLnlVKMDd5o3tkJbuhE+zeQksaqLVZhAkAGI/sqJiERpslr
	 lnbMnYoUKe68v+IIY+uCqJTykHJmuRiU9c2//F/nKax1RGdwnqVSxNLJKthyDljx1M
	 +DGloNRAxTzgSaHb7C12gqPiW04yftfesGO5neQC3iCgfMOAY+eX4EAnEXUWdHTXJ0
	 QOFW45zX0nzYI5Wwc+jKwjpNqpVqPku6ACup69zrRhgkiHO/qSbr5CyNU95diMEZEw
	 FoiT9p6QeLPHjB0nykiMdfXnMyeidkoioVRDol7NOI33gqnxMOgxl524EaW/kGtNa2
	 3F717YoAZ3RWA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 90CB5F40068;
	Wed, 29 Apr 2026 03:58:37 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 29 Apr 2026 03:58:37 -0400
X-ME-Sender: <xms:LbrxaRqGdWmZ1tX1KnyB6z_EAWRwBySpqD3hiG1Lo4ytAygqDaNxsA>
    <xme:LbrxaedIDIWTyrLDlpTj5w2tFIbr_WTR4bhpVqHPO1DIj8Fa15tZsSDe2hf12-5bw
    UjwiBKB7JN4GUcSRRzXK1zE0RcZKJ59uMLNRxH6b5BLlovsKmZkd1Y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfeeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepueetieduieegkeejvdehudeiheettefgtdeugffhjefghfeftdelhedvheff
    hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
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
X-ME-Proxy: <xmx:Lbrxafro3OLUJNn86b6FPikqswzxctD_qpKHOBFuA9DZhcKtzOUQ_w>
    <xmx:LbrxaV-YWVHHjDOZlHgCdDgRvlcSeqdJVX_MH-xN6eHuRh5wuIuzOQ>
    <xmx:Lbrxad3clLUDIPOx5_C_ayrmhCBYPJ4hIbqjYZRoneS28njVdlaMZA>
    <xmx:LbrxaQBX0Zm3uKvCFB7fkOXwyBIPWXewzXr4On1MI0BtIGYvq9iYyg>
    <xmx:LbrxaUCnLYkPVEumERG95cJ0uQUbH1yPaoNj4X0h-KiukPgc15xcscqs>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D702700069; Wed, 29 Apr 2026 03:58:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 29 Apr 2026 09:58:17 +0200
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
Message-Id: <e0f0052b-b28c-41ad-8a82-18cebe5141e4@app.fastmail.com>
In-Reply-To: <1ba0b6ce-3e71-45f7-a3c8-cdc5aadcaf27@arm.com>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-18-ardb+git@google.com>
 <82091dd4-9d11-4054-89ec-99aadaeec7b2@arm.com>
 <6f514d91-c8ce-473f-8383-f3b9a4cc2f7a@app.fastmail.com>
 <1ba0b6ce-3e71-45f7-a3c8-cdc5aadcaf27@arm.com>
Subject: Re: [PATCH v4 01/15] arm64: mm: Map the linear alias of text/rodata as tagged
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Wed, 29 Apr 2026, at 09:57, Kevin Brodsky wrote:
> On 28/04/2026 18:23, Ard Biesheuvel wrote:
>> Hi Kevin,
>>
>> On Tue, 28 Apr 2026, at 16:16, Kevin Brodsky wrote:
>>> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>
>>>> Before moving the empty_zero_page into the __ro_after_init section,=
 make
>>>> sure it has the memory-tagged type. This is needed to ensure that
>>>> cpu_enable_mte() will be able to initialize the tags correctly.
>>> mark_linear_text_alias_ro() is called after all features have been
>>> detected and enabled, so do we actually need this?
>>>
>>> AFAICT the lines that matter for cpu_enable_mte() are those, in map_=
mem():
>>>
>>> =C2=A0 =C2=A0 __map_memblock(pgdp, kernel_start, kernel_end,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_KERNEL, =
NO_CONT_MAPPINGS);
>>>
>>> It is probably this call that needs to be changed to use
>>> pgprot_tagged(PAGE_KERNEL).
>>>
>> I see. I guess we should probably update both, no?
>
> We could, but would we ever access the tags in data mapped read-only?
> cpu_enable_mte() needs tag access to zero them, but AFAIU it's really a
> special case that is only relevant to the situation where the data is =
RW.
>

Right, that makes sense.


