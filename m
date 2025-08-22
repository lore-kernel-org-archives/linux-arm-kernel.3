Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01D9CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMJSNEUSKKDn7Dffolj3gAHZX6/fUfm0lTvkTxBDCHk=; b=ufwlfj+C4FrTEOudKaphRQr9X9
	8aeYFQKNizPBxmas8es/0EuiwsnKKxi/8175y+zjMS1NvhjE3tUpJY+J5EOV1+FiveEGaqnImQADV
	fpWAlufX3U3Q03lMKiTiRwbYV7VabwaHkAAtGm/G2NU3mdcb7bMISEzxSUkFGdb7t16+bmqldEUja
	XbUBl4fdyjJI5RpBN4TbfZotE8ybn70GSespy+cmr7xxgzhuwxKtmiRr645rBANqfTSYphbIgu+ww
	0Oc9OyhnPLxhsQ6D1n9Ed9XN4xqV8mzIMXOcuHzuFzc30uNqD1p81LX7x6VYCouoK/SWve3ag5O7B
	44RyVQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upR6c-00000002WRE-3Jbv;
	Fri, 22 Aug 2025 12:42:55 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLqb-00000001mCo-44HA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 07:06:06 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8A902EC0958;
	Fri, 22 Aug 2025 03:06:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 22 Aug 2025 03:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755846360;
	 x=1755932760; bh=oMJSNEUSKKDn7Dffolj3gAHZX6/fUfm0lTvkTxBDCHk=; b=
	WFiZvrYrZDGDgFIeP2gDUyu1lZ0OTNIxL8He8RvJV1mCiJo6JsRO20F6M+5rSPsd
	OcL55vkPHIuRBOUQG4UYlKizEuIMWt2FbRqPrXcNyPT6zy9vOoySHKIowQOjD4gz
	xMHI0qkt85bpIrZ9FLikJbwtrCxb0ZjWepQb2+yrC4K1vbpHo2nD1sETbiRtaSN+
	2Dx5v01Zc5yYPMJIB85Pqy/MEQNaItgCPDF2Kw34Vmo8C6F6EGwsWmtfbdWHvD8M
	SFeMH/uwoRXC/JjOGfcQowVWR+N/q+6aUROulrW+n1Qk0U9/RR9FC8ZrVchUJiB4
	h9dL7832YWYw9v1LPTEXiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755846360; x=
	1755932760; bh=oMJSNEUSKKDn7Dffolj3gAHZX6/fUfm0lTvkTxBDCHk=; b=T
	Qa2Lw8IsH7CgksQbCfiAXgGJ6Q6WDsnBSrBgBJYLQ2AQHlyPP9M+IgR/NU5sHCu9
	YtcugPu5usZTlGrlgCfndU3Ql6KhqUgD6whCr0WTZ4BBQQv42coIavErY4qGgEsG
	/f67tn3p5AuN+JNPwrJjr0ecyEjrIf+H9RLSwJ716DBTTWzvghuKGbhEl0aptY9W
	nT//CQfw0vxd/I+wGVqOvYqGAkCeE06Q6hRrMEm9gl46pB1KaLernRuHQPZHcjLc
	rVwhAgBF/vjjYSYMCW4SOU+mjGwU2aagKuPhnVwX28P4UtRUo0AkPsrKt03ivyaB
	XiGNvEQQOMcT3bzK+Y2XQ==
X-ME-Sender: <xms:2BaoaOLaWKSmrt1w6Rz5mEIUTSxDRXFsnfmLjr6i_Fb3FjJfW78b6g>
    <xme:2BaoaGJaytqaykyXZ6D4GOTJfBtxh6-botUl-TMU-QvSND3v8xxXIzpLnrbh7Yjqx
    98N_B1JKkHPHGizqIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieefudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpth
    htohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:2BaoaHX-rBzOi4fEzVlO_r-b6O12-Gd2BQqvF1-u7ZKpmJW09pV8dQ>
    <xmx:2BaoaKCDunUP6cGWqSpPLXrcfnSk3O0vFgdrz12DZPYi43gJO068kg>
    <xmx:2BaoaK5JlhyQr4SR8w-x-xYIUQddJ3ChifOGxZJbBcQ7IGhZ58B-0g>
    <xmx:2BaoaJ3Uh3_j5Rrj0JYci63M16Tb-5bboRUvoOh-cNjk9AA9Q7BWKQ>
    <xmx:2BaoaESHR9avTufRWoOnB7jyYuS4O_fJriKScgy4arR5vT0HhzH2TWW6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0E72B700065; Fri, 22 Aug 2025 03:06:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AlhDZOV2HdTF
Date: Fri, 22 Aug 2025 09:05:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Kees Cook" <kees@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 "Russell King" <linux@armlinux.org.uk>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <35178205-7cff-4b4b-abdd-b4cfb9e69dc2@app.fastmail.com>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-3-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
 <20250821-bump-min-llvm-ver-15-v2-3-635f3294e5f0@kernel.org>
Subject: Re: [PATCH v2 03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_000602_484030_BB7FD91B 
X-CRM114-Status: GOOD (  18.33  )
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

On Thu, Aug 21, 2025, at 23:15, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 15.0.0, the first depends line of
> ARM_HAS_GROUP_RELOCS is always true, so it can be safely removed.
> Combine the !COMPILE_TEST dependency into the 'def_bool' line and update
> the comment as well.
>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

>.
> 
>  config ARM_HAS_GROUP_RELOCS
> -	def_bool y
> -	depends on !LD_IS_LLD || LLD_VERSION >= 140000
> -	depends on !COMPILE_TEST
> +	def_bool !COMPILE_TEST
>  	help
>  	  Whether or not to use R_ARM_ALU_PC_Gn or R_ARM_LDR_PC_Gn group
> -	  relocations, which have been around for a long time, but were not
> -	  supported in LLD until version 14. The combined range is -/+ 256 MiB,
> -	  which is usually sufficient, but not for allyesconfig, so we disable
> -	  this feature when doing compile testing.

The change is obviously correct by itself, but can we revisit the
question of whether the COMPILE_TEST check is still needed?

Trying it out, I single link issue using llvm-21:

ld.lld-21: error: vmlinux.a(arch/arm/kernel/entry-armv.o):(function __bad_stack: .text+0x110): relocation R_ARM_LDR_PC_G2 out of range: 10168 is not in [0, 4095]; references 'overflow_stack_ptr'
>>> defined in vmlinux.a(arch/arm/kernel/traps.o)

which is from this line

arch/arm/kernel/entry-armv.S:   ldr_this_cpu_armv6 ip, overflow_stack_ptr

with the macro expanding to

        .macro          ldr_this_cpu_armv6, rd:req, sym:req
        this_cpu_offset \rd
        .globl          \sym 
        .reloc          .L0_\@, R_ARM_ALU_PC_G0_NC, \sym
        .reloc          .L1_\@, R_ARM_ALU_PC_G1_NC, \sym
        .reloc          .L2_\@, R_ARM_LDR_PC_G2, \sym
        add             \rd, \rd, pc
.L0_\@: sub             \rd, \rd, #4
.L1_\@: sub             \rd, \rd, #0
.L2_\@: ldr             \rd, [\rd, #4]
        .endm

Would it be possible to either change the macro or to move
the overflow_stack_ptr closer in order to completely eliminate
the CONFIG_ARM_HAS_GROUP_RELOCS symbol and have VMAP_STACK
enabled for all CONFIG_MMU builds?

Are there any other build testing issues with ARM_HAS_GROUP_RELOCS
besides the one I saw here?

      Arnd

