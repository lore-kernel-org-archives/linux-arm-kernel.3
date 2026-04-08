Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D8E10F994F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gj8jaWioaF9H0YGrruFt05uhtIOSLQ2QvQUkHGAhtYA=; b=StwXBEH7/UIJfgtRXDo8HU6Ovk
	XrtkwWuG93akS9+iY/5Y41AoXKRHjm4WqhjM8+ckZglT46kC8HOJSLPJWKlqJcweRGDsXsGmoEjsS
	XnTn/g8UkkvZQjyJJZhhzbr1FeDUrFeHc3qzAh0snXsfktwUz0qM5VyTIsG9rwYiSLU1Obpf3ilvJ
	7Z0r+0RwKEhl+cSWcCJITstUBEL99mHz+Vj5gz/ji+XDYQZVCI1M7pfr8JoyBuP3KMd/eAXEzyNzk
	t2DCSkfNw8LVQ4b/nuSleMx+8ikHDSIMwhuCgQeFgQWTdRVt1udjnKHaOSF8mrNR8NgYgAa1QUClA
	aFLSccKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUXQ-0000000920f-3hHE;
	Wed, 08 Apr 2026 15:09:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUXO-0000000920I-249L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 15:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7709442D3;
	Wed,  8 Apr 2026 15:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB81C19421;
	Wed,  8 Apr 2026 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775660989;
	bh=mGjriEUZMr+g1US10EShfrBqzpTUxxutiWrD+5RgSQA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rPNSFvNwU9jUtaJkM6mI86/toyzKHxm0pb4sc8hYlgcvdzpXI/tmpLVuJKLupvvXS
	 InsiegzET6+urXis2LaRuun+w+XYJ42FqQeAYhwlfVP56LYM5h9zSZO4Ds2HKBP/YW
	 N4VQ0B1MeL5ppNRABL9U8MaIotmsI9URRiJmrgjE/y7X0nxgkEbQQE3YBlem/wDXCL
	 77whK/enQA/j6MjtdK77Uz35+JctjdJkcpUnnF/Yco11/Y7JfacGi7vAGCyHR/qcPY
	 mBNNTQPOtHBsQ+zZwp0BiWOQoia2iCnJstAvRse5f/7yKtRORnz5yyaBO8uBWK5ul/
	 pgEBui0w7LdCA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 21B8FF4007E;
	Wed,  8 Apr 2026 11:09:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 08 Apr 2026 11:09:48 -0400
X-ME-Sender: <xms:vG_WaSW2T0IDV5IhknxKHye7IAvdBN05GVF0K1UTR3cSTuIj32wYTQ>
    <xme:vG_WaZafQLXikZhBFOkTobqaBllyDe5eDbOCV38dXYSOzanJUKXElLQaf9XCiyBpT
    nsjVRGNh0ujXaBkZmBKfL34yp8W1mZvxtLYdfEhLEG3qP14hYOVCrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvfeeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepuddvvdfhgfetueevleejvdejudeigfekheeggeetteetueeitdfgieelfeej
    kedunecuffhomhgrihhnpehlughsrdhssgdpshgrshhhihhkohdruggvvhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhguodhmvghsmhht
    phgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdeffedvudeigeduhe
    dqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurdgtohhmpdhnsggp
    rhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnshhhuh
    hmrghnrdhkhhgrnhguuhgrlhesrghrmhdrtghomhdprhgtphhtthhopegtrghtrghlihhn
    rdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnh
    gusegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgt
    ohhmpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehlihiiphhruhgtkhgrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsvghthhhj
    vghnkhhinhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vG_WaaTndSDqM8rvYCzXCurufS_g5gaePe1OFHhpwGY20cQHYEBycg>
    <xmx:vG_WaWJ369XN4dDFHzXG379k7hR9VwtaBG7BzOD1GWUzNdkGao1K6w>
    <xmx:vG_WaUECzCmOnWaaoNBzviV2d6HqqY21_KQW2-mjV6yB9uE-uip9iQ>
    <xmx:vG_WaT37PO0vSGNgj1WyXpV6jvRd_wfPkbo0qFGVBzO0lRunMPq7Xg>
    <xmx:vG_WacLR1efsObTuQS-qBINiOr_7UseIdHQ1uy5t31lM2Gxq-brV63Lp>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2328700065; Wed,  8 Apr 2026 11:09:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AVizydSA80Ew
Date: Wed, 08 Apr 2026 17:09:26 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, linux-hardening@vger.kernel.org
Message-Id: <52abb233-80c5-4363-871d-cd52667291ad@app.fastmail.com>
In-Reply-To: <adZbgYJqY6bisaoZ@arm.com>
References: <20260320145934.2349881-15-ardb+git@google.com>
 <20260320145934.2349881-16-ardb+git@google.com> <adZbgYJqY6bisaoZ@arm.com>
Subject: Re: [PATCH v3 01/13] arm64: Move the zero page to rodata
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_080950_596578_B33E7B5B 
X-CRM114-Status: GOOD (  20.35  )
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


On Wed, 8 Apr 2026, at 15:43, Catalin Marinas wrote:
> Hi Ard,
>
> On Fri, Mar 20, 2026 at 03:59:36PM +0100, Ard Biesheuvel wrote:
>> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
>> index 2964aad0362e..2d021a576e50 100644
>> --- a/arch/arm64/kernel/vmlinux.lds.S
>> +++ b/arch/arm64/kernel/vmlinux.lds.S
>> @@ -229,6 +229,7 @@ SECTIONS
>>  #endif
>>  
>>  	reserved_pg_dir = .;
>> +	empty_zero_page = .;
>>  	. += PAGE_SIZE;
>>  
>>  	swapper_pg_dir = .;
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index a6a00accf4f9..795743913ce5 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
>>  
>>  /*
>>   * Empty_zero_page is a special page that is used for zero-initialized data
>> - * and COW.
>> + * and COW. Defined in the linker script.
>>   */
>> -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
>>  EXPORT_SYMBOL(empty_zero_page);
>
> I looked at Sashiko's reports
> (https://sashiko.dev/#/patchset/20260320145934.2349881-15-ardb+git@google.com)
> and it has a point here that with MTE, map_mem() doesn't map the
> empty_zero_page as Tagged in the for_each_mem_range() loop. The
> subsequent cpu_enable_mte() will fail to initialise the tags. I think
> this problem disappears with patch 11 where all the linear map is now
> Tagged.
>
> We either ignore it or we temporarily map the kernel as Tagged until the
> linear alias is removed later:
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 795743913ce5..5290f7537074 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1175,7 +1175,7 @@ static void __init map_mem(pgd_t *pgdp)
>  	 * so we should avoid them here.
>  	 */
>  	__map_memblock(pgdp, kernel_start, kernel_end,
> -		       PAGE_KERNEL, NO_CONT_MAPPINGS);
> +		       pgprot_tagged(PAGE_KERNEL), NO_CONT_MAPPINGS);
>  	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>  	arm64_kfence_map_pool(early_kfence_pool, pgdp);
>  }
>

OK. There were some other very good comments too, I'll look into those and respin this for the next cycle.

