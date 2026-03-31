Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF7109B485
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Su+Y79F5E4CjjUoOmvgq514oWRWN3SeHtjNRKt4ht4o=; b=QDhpypBVdKM1vKVlHJhpK1m+wM
	tHaRT/LIHdLi7JEOz+w5+WXSLNyTOOSk5HxOrknOJFmXtK9am99JP74KSVPJMi3fpP2xTA3elw4V8
	XQiOIL7VQPjApCc7Z13JyYCDsVW8HTxmZ/3PDpIVZ7w3otO++h/dlmIe7axl3ACBQH5NmeNFvAuen
	cq/zUKWr3GuNQxjpUyUxB/zbJtoEUWhN+LIXouQgo5egt3nH28YZbM1kX4Om/D4hLVxTO4hSwQG15
	wNrM23IbQUgPLYTPUh9WEJX+LwM/77oOWQKLPXlMy/yagQb0HGZpaILM3wKLasvlDmImM69oQ88rE
	TWS7Td9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aWO-0000000D8Ik-1E2B;
	Tue, 31 Mar 2026 14:56:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aWL-0000000D8IO-2eE2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:56:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0870743969;
	Tue, 31 Mar 2026 14:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6B3C19423;
	Tue, 31 Mar 2026 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774969004;
	bh=XP3qUWeZ9phQ+SLaiNfegvZjrxfOs6ykqkYVKNib+Sw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=GoPWr15Qt+SH9l9gWYtBVHu8qUC7UlvUr/u3Y2oPImgpP0DB7aHVG70mMCRslaMgM
	 9b0SZUVD//0yCGrwXjfgQcsd+TiL3SMxrfOPcqieb4gafwG4x+IRJ2ygP/bBHvibAj
	 X4mLrYMYjlBzl6YzbBOzCzDGJ+x3h8AQN80sHw0DtNecLtHu5RG45UkX7ge/EaMkUJ
	 IMfOrtCJ2EbUYY133V2jbx1NQO/2Mtij5qlqyN4JO0pjzWEampPo3CPkNUDid6xbP2
	 qQQ/vVNJ+5j7z4aoXzbEYEy0Z1gzy1HObncbxy48ezwYrVE29EClCk3QHrFWSTVseJ
	 WjraiyffJ0i0w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 36B2AF4006F;
	Tue, 31 Mar 2026 10:56:43 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 10:56:43 -0400
X-ME-Sender: <xms:q-DLaattDJgVdDAk1nrrnRJEhrVGQk8d8naOOwBTjKsENLp9lW25mQ>
    <xme:q-DLaaQnBSeMqOqN9Fmm3pPubJZfSFEJEE74jSED5uWseMog8sWPZLjywWpM6x8ak
    fNT1df5-A9IGGup0VrrLQdsY1Sa67p-REGn3fyQKAY_QebuxwAHECA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhguuceuihgv
    shhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnheptdefveduheffgeeggeehiedtuddvhfevtefgieeugfdtffejtdekgeejkeevvddu
    necuffhomhgrihhnpehlihhnuhigrdhorhhgrdhukhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhguodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdduieejtdehtddtjeelqdeffedvudeigeduhedqrghruggspeepkh
    gvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurdgtohhmpdhnsggprhgtphhtthhopedu
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopegrnhgrnhgurdhgohhrvgessghrohgruggtohhm
    rdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhish
    htsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgv
    lhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepkhhurhhsrggurdhonhgvhi
    essghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfihilhhlihgrmhdriihhrghnghes
    sghrohgruggtohhmrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghroh
    ihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehmtghgrhhofheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:q-DLaWZUMcUZsz-m2Wc71QzGaTI-pF_aqmWRuqODa4y3djeXBNJJ2g>
    <xmx:q-DLaX7RYmmE8LNKgzoH83jPGQnHDrE9JuW-7eCX0UZnxuZJ1Os9dw>
    <xmx:q-DLaXyCboGuHDLtlnRJudsGl8dIaJShdcvxXe8bP1WYG6vdaKmymg>
    <xmx:q-DLaYpC_wi-0Y-YwiwLwJFhkbLrerUU2fPhFV74v9k5jiYBga-6eg>
    <xmx:q-DLaZ2Orv3OTSZpL_uwcTTb_ECEN12tIXegaxppbOq9IXRUCCXzl_8O>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02793700069; Tue, 31 Mar 2026 10:56:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AX_XmZLnGFDV
Date: Tue, 31 Mar 2026 16:56:22 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "William Zhang" <william.zhang@broadcom.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Song Liu" <song@kernel.org>, linus.walleij@linaro.org,
 florian.fainelli@broadcom.com, anand.gore@broadcom.com,
 "Broadcom Kernel List" <bcm-kernel-feedback-list@broadcom.com>,
 kursad.oney@broadcom.com,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, linux-kernel@vger.kernel.org,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Petr Pavlu" <petr.pavlu@suse.com>, "Russell King" <linux@armlinux.org.uk>
Message-Id: <bb48f874-b80f-41ef-a1a3-81f2e0a7de65@app.fastmail.com>
In-Reply-To: <CAHi4H7EC9+7yBofXE=AabeHtHFsrzOQA9kAq4of8Eu0CG2dfnA@mail.gmail.com>
References: <20250922202438.496433-1-william.zhang@broadcom.com>
 <CAHi4H7EC9+7yBofXE=AabeHtHFsrzOQA9kAq4of8Eu0CG2dfnA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: module: fix unwind section relocation out of range error
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_075645_732363_720A242D 
X-CRM114-Status: GOOD (  19.04  )
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

Hi,



On Mon, 23 Feb 2026, at 03:30, William Zhang wrote:
> Hi,
>
> On Mon, Sep 22, 2025 at 1:24=E2=80=AFPM William Zhang
> <william.zhang@broadcom.com> wrote:
>>
>> In an armv7 system that uses non-3G/1G split and with more than 512MB
>> physical memory, driver load may fail with following error:
>>    section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 =
->
>> 0x7fad5998)
>>
>> This happens when relocation R_ARM_PREL31 from the unwind section
>> .ARM.extab and .ARM.exidx are allocated from the VMALLOC space while
>> .text section is from MODULES_VADDR space. It exceeds the +/-1GB
>> relocation requirement of R_ARM_PREL31 hence triggers the error.
>>
>> The fix is to mark .ARM.extab and .ARM.exidx sections as executable so
>> they can be allocated along with .text section and always meet range
>> requirement.
>>
>> Fixes: ac3b43283923 ("module: replace module_layout with module_memor=
y")
>>
>> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>>
>> ---
>>
>> Changes in v2:
>> - Fix the comment in code and commit message regarding the unwind
>> section location
>> - Add fix tag for more visibility
>>
>>  arch/arm/kernel/module-plts.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-p=
lts.c
>> index 354ce16d83cb..b5338fe59706 100644
>> --- a/arch/arm/kernel/module-plts.c
>> +++ b/arch/arm/kernel/module-plts.c
>> @@ -225,6 +225,18 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, El=
f_Shdr *sechdrs,
>>                         mod->arch.init.plt =3D s;
>>                 else if (s->sh_type =3D=3D SHT_SYMTAB)
>>                         syms =3D (Elf32_Sym *)s->sh_addr;
>> +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
>> +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND ||
>> +                        (strncmp(".ARM.extab", secstrings + s->sh_na=
me, 10) =3D=3D 0)) {
>> +                       /*
>> +                        * To avoid the possible relocation out of ra=
nge issue for
>> +                        * R_ARM_PREL31, mark unwind section .ARM.ext=
ab and .ARM.exidx as
>> +                        * executable so they will be allocated along=
 with .text section to
>> +                        * meet +/-1GB range requirement of the R_ARM=
_PREL31 relocation
>> +                        */
>> +                       s->sh_flags |=3D SHF_EXECINSTR;
>> +               }
>> +#endif
>>         }
>>
>>         if (!mod->arch.core.plt || !mod->arch.init.plt) {
>> --
>> 2.43.7
>>
>
> Is this version okay to be accepted?
>

Please put it in Russell's patch tracker.

https://www.arm.linux.org.uk/developer/patches/


