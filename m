Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4siBCCP0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZWqj29V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bWKiXG3ElnknqOKPl5yiz+3DIgvS5ZlK38NYWt7JxuI=; b=4siBCCP09myJ/n
	mz93vcs3heXwjiipI3apz6nfSB3eDFqtXl5N0qBRN3mn8p2wA/BwlICZwluZnFcEl6BoYcJssDG52
	0oLQPI5XE0ezVLiNdD0B3A063NnB1jZbxmdYW8AhE9pZLCQEC4zvyhXIO+p9AvpkuQb/htibQ6zdT
	GY9F9+zWAAPiXIcF9ZX4VAxOx6EFtUjcW/j4pxHTWzKBW7Pkzi3wPjpGJptOuE+0LcfwS8Ttt3OnN
	AmUivC1YPvX9+jVZtWY+mhqcj3UJ+Kc+De8KNL8vFJ07Bk5DmylultbzNbQBbBvywQ+fYK2hwuHHJ
	AgpictrXyZq5n55E6HMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwgy-0000000HaE3-43wX;
	Mon, 02 Nov 2026 18:23:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwgy-0000000HaDr-2QV6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:23:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACFBC601DE;
	Mon,  2 Nov 2026 18:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B981F00A17;
	Mon,  2 Nov 2026 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643815;
	bh=bWKiXG3ElnknqOKPl5yiz+3DIgvS5ZlK38NYWt7JxuI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=DZWqj29VZ6HGfZV8wFGF47axunH86VLe/SaEEqYYWghZR620E9Z6Gznkh10+J5+Qf
	 LTqmxrQ3TKNlk7YdwbZSMjQxi5FZCfCgNEIaRLSuQ8if/N3Pr9d34/bLZLWoe1erXQ
	 ZXJ1XiEf7rF6pIZNQtPBfDYzfW7WKoEIfozojWi7Al2+TurVCgS4mWDGtDnp1W+oBV
	 5ckMiWqXkxBvYgM3v6iMh8oPbATKe4CMFxxDMVYs7V1583RItR4mmi3h8H+N800m+F
	 ZYbN12+lb321WUU+TzPEQZY6+U6J5sbtVK32iJs5NFUo6n+DUqB1wVKos8GaDPeky4
	 r5tYz0ITIoR/Q==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7FD14198003A;
	Mon,  2 Nov 2026 13:23:32 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 02 Nov 2026 13:23:32 -0500
X-ME-Sender: <xms:ItXoalEFufhPd0Tq48u1vGJeYu-r3TZ0PKYHgtsGW9feoJYku10Ehw>
    <xme:ItXoalLdyCGtU819A6cOWlbEBqmSoLXpt-aJ8L4lQC0duUZVwPzhtJCd20UzgDr_W
    olCeUNcJABDC2c2PsiEhoO0rwr4ORjSjGJoY9ZbBNnbhKqMpX7__l0>
X-ME-Proxy-Cause: dmFkZTFTf7Wxa+noTiukk47AaQnuueo80ulUqsxjCDxx+RWUIQwdZt4iUaX15WE0divrsN
    XqWXmKgJsnN6+KlsXOD6y79Dfns05QZ0/MoeNo4xmk9MEj01STLOGvtrLbVqdknkBOUaiU
    hgxMCGmTDoqjh2zfWdvHjlB6SKTFGSxmDK6mEeRXGw3xPyAU2HGbpMorkvypQBfdnsn25c
    uYz5zmqgZE+nVi9jd7zJyKnzsB4V2bU7oIeSVJfUQmNHAj3tqf1qcy/bxwPz2FOyCYQciI
    OGEKR6Ex1GAyNKw98Fx8avZ0bhDCh0Jb0dMyDfyESIrBU380qKh/fEY8UkpFWoJKxavbB7
    WX6yvjonWJsbYoyicVrj0ctUt7ancowz3njKvlGiW/GYmCo2OnhySzPRqGIbTqrVlKk1tp
    IyXUFTjeJHf2EyB3QHLRdM09VzJBIZ4ZqjxstZA/b5uLXTfzwjFkYxcdBaEWkPVPGca9es
    tVwl5fs/RSteIvD6x+0GS3BK7LRz1Vk0URGnu/LjJlZVV1T9RN1JMvDVjhUecTdejkdtG9
    eWV5hzBaKvmDtXOAzJL/yXZerRaMAdlKSZ38HZZCt3i4svBgyQzYMAqFtkim5aHwaosD26
    677Pe33A9qC99y6orzFf5VBpRaHDR5Gh8++o1PkWk8H1hjelvMIcnvJwP2JQ
X-ME-Proxy: <xmx:JNXoamPBGnd6h_REFHShaTw83_Oa2esn14LnvCOsD-0AA7X8i9hE4w>
    <xmx:JNXoagy0mJ5-3xZK7gNXVBa8lwsglZtmXPvu3HDuD8M5-su-SOYgkQ>
    <xmx:JNXoaoqqKOQUrAja9ogILkS_mpwtQgFbLaW5FLdYYl3c0axggX79ng>
    <xmx:JNXoagPWbsSRSUMetox8WcsYOZnThhqEAU9_nG8-24FNGKsR56IZCw>
    <xmx:JNXoasdnxmJ8l5vmmGWpVoSr5l14sAgxUJnTFkn0jo9JVfDGT30ZS90G>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F1DE9F8008E; Mon,  2 Nov 2026 13:23:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 02 Nov 2026 19:23:09 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Marc Zyngier" <maz@kernel.org>, "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: "Will Deacon" <will@kernel.org>, "Ard Biesheuvel" <ardb+git@google.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Oliver Upton" <oupton@kernel.org>, "Joey Gouly" <joey.gouly@arm.com>,
 "Steffen Eiden" <seiden@linux.ibm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>
Message-Id: <08db10ef-c3d8-44b8-9d80-e7505400bf12@app.fastmail.com>
In-Reply-To: <86bj872n1b.wl-maz@kernel.org>
References: <20261102094748.2638468-2-ardb+git@google.com>
 <auiXMN5td-2QlDkd@willie-the-truck>
 <CA+EHjTxVPyY70Dm+BiwgQQNwx1cJpEKvJBJGZWPCKLx2M8X2FA@mail.gmail.com>
 <86bj872n1b.wl-maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault IPA
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Mon, 2 Nov 2026, at 17:52, Marc Zyngier wrote:
> On Mon, 02 Nov 2026 15:57:51 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
>> 
>> Hi Will,
>> 
>> On Mon, 02 Nov 2026 14:17:10 +0000, Will Deacon <will@kernel.org> wrote:
>> > On Mon, Nov 02, 2026 at 02:09:25PM +0000, Marc Zyngier wrote:
>> > > On Mon, 02 Nov 2026 13:59:12 +0000,
>> > > Will Deacon <will@kernel.org> wrote:
>> [...]
>> > > > > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> [...]
>> > > > >  static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
>> > > > >                                                 u64 *exit_code)
>> > > > >  {
>> > > > > -        if (!__populate_fault_info(vcpu))
>> > > > > +        if (!__populate_fault_info(vcpu)) {
>> > > >
>> > > > Presumably we need a barrier (DSB?) here, to ensure that the TLBI happens
>> > > > after the AT instruction?
>> 
>> I don't think the TLBI requires a barrier before it, because it
>> doesn't matter if the AT's walk allocates entries after the TLBI.
>> Anything it allocates matches memory, and the stage-2 descriptor the
>> AT faulted on has AF clear, so that descriptor can't be cached:
>> 
>> R_XCLRD: Translation table entries that generate a Translation
>> fault, an Address size fault, or an Access flag fault are never cached
>> in a TLB.
>> 
>> The stale entries the guest keeps hitting were already there before
>> the TLBI, and the dsb(nsh) and isb after it are what complete it
>> against them.
>> 
>> [... your other reply ... ]
>> > > Alternatively, VMALLE1 or even VAE1 should be enough to get rid of the
>> > > S1 TLB.
>> >
>> > Ah, sorry, VMALLE1 is what I meant to ask about. I basically haven't
>> > understood the need to invalidate the stage-2.
>> 
>> The guest's walk can also go through a stage-2 entry for its
>> page-table page, cached before the aging cleared that page's AF, and
>> nothing requires the AT to use that entry:
>> 
>> R_NPZWX: When an address translation instruction is executed, it is
>> IMPLEMENTATION DEFINED whether the result can be returned from a TLB,
>> or a translation table walk occurs.
>> 
>> So if my reading is correct, on a CPU whose AT walks memory instead,
>> the AT keeps failing while the guest's walk goes through the stale
>> entry, and the guest takes the same permission fault again. VMALLE1
>> and VAE1 only cover stage 1, so they'd leave that loop in place.
>
> If we assume that the TLB covers VA->PA (which is a very likely case),
> TLBI VAE1 should nuke the permission fault that brought the vcpu to
> EL2, and instead walk the page tables, getting the access fault.
>
> The only case I can imagine where invalidating S2 would matter is if
> you are running under NV, because there is an independent S2 TLB (the
> shadow S2), and then VMALLS12E1 makes total sense.
>
> Ard, was this solely observed under NV? Or did you see it on a non NV
> guest as well?
>

No it happens with guests running at EL1 too.

My experiments seem to indicate that on this uarch, the AT instruction
does not hit in the TLB, and so it can fail on AF==0 for an IPA that
is covered by a S2-only TLB entry (with AF==1 and XN==1 due to lazy exec).

So after the VAAE1, the S1 walk happily produces the same translation
we just invalidated, without taking a S1PTW fault, and the guest faults
again on the I-fetch that took us to hyp the first time around.









