Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BA3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7Guwo0wpxf95Dj+W5UROJyXFGtl7LdcWRhhh/Qf98U=; b=oY+xxYTaiXIeXiP8GR3Cztaw62
	Lhv8lpf5TUmztAnH7O3ZqTMHaOl+BvtlUglJiOx3yF/zsy9zOiPHZ08rVWYMDS/14/Earui2ML61n
	zsf6luHkf7knShHwzR491pXXkxh1tjiSGHFsUSMoqxgHFIZ8uN/+PS0nmmZ/S/eI4wo1Ro8qMLdV0
	QCZAsIsjNTTaaNqojVJt1K7cN3+7LhyRlFV7ybNyKMRDrgxQlFMik7BTpgOcpFRELPBsg2GgREoMv
	S080bpMQgyh+G2p5EiDqKzVWyjldBhIM9ORPY6RUd/2usuGTN9LDUVS0WNiimuardyufvx3kHC8cm
	nHFBuj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINp2-0000000531L-2RQE;
	Mon, 10 Nov 2025 09:04:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINoy-0000000530X-0qu0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:04:23 +0000
Date: Mon, 10 Nov 2025 10:04:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762765458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7Guwo0wpxf95Dj+W5UROJyXFGtl7LdcWRhhh/Qf98U=;
	b=THzC1+ohs7W95eY6RMSRaFJ23VdVBGm5I563I8YASdM00wmofpB9awW1xssuqstq1G4GN9
	sOp/H73rX5A8lDzddsuk8aEuXZEoY8VatUS8uqdA4P1QwSycvK5U5xYCvCQW9Q155hvtp3
	7ckU266rRRDn0XAp4JFw8QggWtZsAdOzRHV27wCZCUOuJXVoY4kNpRUGWB5Gkn9W3A+Nid
	ZNdYJVGJc5HIjFvYZ80gZ8VPKbKpROUhWLEJnGJX/MlPmmtBKOsGsmRMNFy48oFYgIc0zU
	W+Yiule8nXEF4YfdxOus7DWnvJkK4zQXI2Nc/NhrrTfeic27du8bXWM6BV1vSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762765458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7Guwo0wpxf95Dj+W5UROJyXFGtl7LdcWRhhh/Qf98U=;
	b=+Nqx/ogPinQ4vfSfKxwtwM9MURpLI4OvfJJe18bf22Qbmt21zd133O7NoOhjUAYH62UQVr
	zbqasc8HiwXrEsDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	Russell King <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 19/34] random: vDSO: only access vDSO datapage after
 random_init()
Message-ID: <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
 <aQ6EvdukQytvqK-u@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ6EvdukQytvqK-u@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_010420_385970_37376970 
X-CRM114-Status: GOOD (  30.10  )
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

On Sat, Nov 08, 2025 at 12:46:05AM +0100, Jason A. Donenfeld wrote:
> I'm not a huge fan of this change:
> 
> On Thu, Nov 06, 2025 at 11:02:12AM +0100, Thomas Weißschuh wrote:
> > +static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
> >  
> >  /* Control how we warn userspace. */
> >  static struct ratelimit_state urandom_warning =
> > @@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
> >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> >  		return;
> >  
> > +	if (!static_branch_likely(&random_vdso_is_ready))
> > +		return;
> > +
> >  	/* base_crng.generation's invalid value is ULONG_MAX, while
> >  	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
> >  	 * former to arrive at the latter. Use smp_store_release so that this
> > @@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
> >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> >  		return;
> >  
> > +	if (!static_branch_likely(&random_vdso_is_ready))
> > +		return;
> > +
> >  	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
> >  }
> >  
> > @@ -925,6 +932,9 @@ void __init random_init(void)
> >  	_mix_pool_bytes(&entropy, sizeof(entropy));
> >  	add_latent_entropy();
> >  
> > +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > +		static_branch_enable(&random_vdso_is_ready);
> > +
> >  	/*
> >  	 * If we were initialized by the cpu or bootloader before jump labels
> >  	 * or workqueues are initialized, then we should enable the static
> > @@ -934,8 +944,10 @@ void __init random_init(void)
> >  		crng_set_ready(NULL);
> >  
> >  	/* Reseed if already seeded by earlier phases. */
> > -	if (crng_ready())
> > +	if (crng_ready()) {
> >  		crng_reseed(NULL);
> > +		random_vdso_set_ready();
> > +	}
> 
> The fact that the vdso datapage is set up by the time random_init() is
> called seems incredibly contingent on init details. Why not, instead,
> make this a necessary part of the structure of vdso setup code, which
> can actually know about what happens when?

The whole early init is "carefully" ordered in any case. I would have been
happy to allocate the data pages before the random initialization, but the
allocator is not yet usable by then.
We could also make the ordering more visible by having the vDSO datastore call
into a dedicated function to allow the random core to touch the data pages:
random_vdso_enable_datapages().

> For example, one clean way of
> doing that would be to make vdso_k_rng_data always valid by having it
> initially point to __initdata memory, and then when it's time to
> initialize the real datapage, memcpy() the __initdata memory to the new
> specially allocated memory. Then we don't need the complex state
> tracking that this commit and the prior one introduce.

Wouldn't that require synchronization between the update path and the memcpy()
path? Also if the pointer is going to change at some point we'll probably need
to use READ_ONCE()/WRITE_ONCE(). In general I would be happy about a cleaner
solution for this but didn't find a great one.


Thomas

