Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA458C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZfB6rVZVRvFwPOC2mIb+Lex3AbasEMEJSEtzwVhu8Y=; b=TgV1c1HLFarDtv6iK6Kkwhl5nu
	xL5NAree9Ln2vr1yAK7+e4KlA+jkpELTNPmk31HLltp/37YX1PyxGTja/qQeoKAH0XfKzIbxR/Tjl
	1a/CTb+XDNrRPFEYWFBeDp26OF/Kupe1w3/PBoVvwtYTv3ok1DVoS/trz2PJvkp/mLchGaoC2zK71
	hHU+IGtf6xO06TDNxJ0vofmUe1aUO5DYLBru4BuJf5Ljw3BFpPnCv48JMkUewm0lyvTFj15ktP0nV
	hKnL8ZZfY4cjSves8cMR74fIKM61XHc9qWKbTsCg/4Y/xcwMqKtB6pk4tjH6vuJXKavw5n2B08lgQ
	IoUa/9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8M4a-00000000Fdz-01hh;
	Fri, 25 Apr 2025 16:38:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L4l-000000003tM-2udl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:34:52 +0000
Date: Fri, 25 Apr 2025 17:34:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745595289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZfB6rVZVRvFwPOC2mIb+Lex3AbasEMEJSEtzwVhu8Y=;
	b=CAQGX5ZMKcx+gH46PjJwuLZ1t9TcvbFo6LX/q/nmTvNk7kW23MJ+hE5FxgJ1hv0yB1DRzF
	KBOXWWgV6pIivBMErwQOuB2nWprnnWM+up3MqP4Ih22BAYn4qU07DRa9Uf//zzQtKVgwE8
	PrStc/hUc0DrQL3XjwjkiR3COHh8ojkW7XMUpITrGH+GccFDvCHrA83Ciy/Q7mL2jN+mO9
	RlfK6xHBf8DfsaeyHq3S8SDdGX7y16K3lUSrDrQJ7hXLypPEkTW7rOSXRjBU0M/ryqhqDz
	Nqy0F1Q98GgBeEueZGvb5xIpOQnpcHUE+GPVlH8lQEdxyMNIS4X0gw5x7P5H4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745595289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZfB6rVZVRvFwPOC2mIb+Lex3AbasEMEJSEtzwVhu8Y=;
	b=oeQCafVZQ1lKq1NxkoOK+UaNraaSv3v3lJOx0jFFppeRLdPcSyF7n/HCmoLGD7aHpjxMs8
	fv0uqcFsR4LPQCAA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jan Stancek <jstancek@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <20250425165448-f2ba7d6d-e54e-4f3e-ac14-5986bb1a74fc@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
 <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
 <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
 <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
 <aAueO89ng7GX2iyl@t14ultra>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAueO89ng7GX2iyl@t14ultra>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_083451_869074_C9783766 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, Apr 25, 2025 at 04:37:47PM +0200, Jan Stancek wrote:
> On Fri, Apr 25, 2025 at 03:40:55PM +0200, Thomas Weißschuh wrote:
> 
> <snip>
> 
> > 
> > Some more information:
> > 
> > The crash comes from the address arithmetic in "vc = &vc[CS_RAW]" going wrong.
> 
> That appears to be because it's not doing any arithmetic, but using value
> from some linker-generated symbol (I'll refer to it as "7a8").

The compiler emits a absolute relocation:


$ objdump -r --disassemble-all -z arch/arm64/kernel/vdso/vgettimeofday.o
...
Disassembly of section .text:

0000000000000000 <__kernel_clock_gettime>:
...
 29c:   d503201f        nop
 2a0:   00000000        udf     #0
                        2a0: R_AARCH64_ABS64    vdso_u_time_data+0x100e0
 2a4:   00000000        udf     #0


Which then gets resolved by the linker to the absolute address from the
symbol table.
As the vDSO is placed completely dynamically this can't work.
One central idea behind the vDSO is that the compiler will only ever generate
PC-relative relocations. To force this the symbols are marked as "hidden".
But apparently that assumption is not always true.

One way around would be to add an implementation of __arch_get_vdso_u_time_data()
to arch/arm64/include/asm/vdso/gettimeofday.h which mirrors the one from
arch/arm64/include/asm/vdso/compat_gettimeofday.h.
The generated code does look a lot better (to my untrained eye).

(Another workaround I stumbled upon was -fno-ipa-cp)

__arch_get_vdso_u_time_data() can also be simplifed with OPTIMIZER_HIDE_VAR().
I have been wondering before if this should be done in the generic vDSO code.

And on top of that we should validate at buildtime that no absolute relocations
sneak in.


Thomas

