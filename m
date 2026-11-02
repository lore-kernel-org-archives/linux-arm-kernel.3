Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C190C606A592
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLtv8pdq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jlUB+x6e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zqk5EosFBXrVefcK+m2mlV2/eICrUeTU+WY9gyPrY4E=; b=qLtv8pdqGWdpwqW5mYUZioYxgI
	A9eBG0cOvcEM3MeJgTRu6LLuomhO3/gy/WOOx89BaVyMtQM6YcQuK4w63rGND4gY2urs109D5jKhO
	tFJ+LnrJ/piC1XupG7V/D/yDEV7goCvpypYJtw8vISj5Wui5/63pkWk8vaBSMnS+DgkjG3ujK8WaY
	CG85/aZ6bQkII5PEJgfCmjGVkCMtEBDAm5GLPvAZyOeDq8gQPDUDMjh+vW8QzwURCu77JcpKdIkEw
	5c3Oamql9CgohzSmcO+OVRWRvawQQ5RRS16nEXfkYFIVHUneMfZd2kqG519IDd5n//m4lpbp+30hc
	gtxDFF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuQg-0000000HEO7-1eAt;
	Mon, 02 Nov 2026 15:58:38 +0000
Received: from out-253.mta0.migadu.com ([2001:41d0:1004:224b::fd] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuQc-0000000HENO-2awt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:58:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IOueXIDbWvxDU66CPZpA4KpxoAIR1G1INRDIBFHDNvQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793635112; v=1; x=1794239912;
 b=jlUB+x6ex3LCCvvapbmJp7wKjf2SWpcLSao8poQgpqsDDOFEblJ3xtVEFwVT8hyC42dCUCfd
 oEHaA4pDw3GwFQgwtBluBaVt5O+U5PQrygsIg9xxjZgg8+2EkH5m+mjZSLNjjTuqX8RkjTzdzR5
 f+2dNaLydMBuOGsnUR1zCSSI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3d33d31c60601fc6;
	Mon, 02 Nov 2026 15:58:32 +0000
X-Mizu-Trace-ID: 3d33d31c60601fc6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so11202e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:58:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByx5Min/20Pgr529G4dLtx+VIgcym/KqsrE5OpLNPNqVDeWYKyoGHKWaLYkRCpPBpqzskXY3VJLNMwdic7f50Jf@lists.infradead.org
X-Gm-Message-State: APuU4Z/vDDVxQsMQiEXvLYLrISm35PZaD+0XRc0kdG0KLvFhF3yNiiWv
	HxvIqq9HVJFlNxMXmLAkVQ82z86mwsUsay0/ejeN/9oBKy4th0BD142PaZfeEv4En6UAKcjFfd4
	LIIGmMt6/LjKnBilL4c7lm+C7sXw7bmsDhynKlmG2
X-Received: by 2002:a05:6512:118f:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5bfd13d8cdbmr607141e87.3.1793635107619; Mon, 02 Nov 2026
 07:58:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102094748.2638468-2-ardb+git@google.com> <auiXMN5td-2QlDkd@willie-the-truck>
In-Reply-To: <auiXMN5td-2QlDkd@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 2 Nov 2026 15:57:51 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxVPyY70Dm+BiwgQQNwx1cJpEKvJBJGZWPCKLx2M8X2FA@mail.gmail.com>
X-Gm-Features: AclHuK9bY5GhZz09yeG7qP1mqDl9dnGaY92IKxCsC7wirWm_wSZDIj5t5JuS5VU
Message-ID: <CA+EHjTxVPyY70Dm+BiwgQQNwx1cJpEKvJBJGZWPCKLx2M8X2FA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault IPA
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_075835_483629_0014F42E 
X-CRM114-Status: GOOD (  18.91  )
X-Spam-Score: -2.1 (--)
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

Hi Will,

On Mon, 02 Nov 2026 14:17:10 +0000, Will Deacon <will@kernel.org> wrote:
> On Mon, Nov 02, 2026 at 02:09:25PM +0000, Marc Zyngier wrote:
> > On Mon, 02 Nov 2026 13:59:12 +0000,
> > Will Deacon <will@kernel.org> wrote:
[...]
> > > > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
[...]
> > > >  static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
> > > >                                                 u64 *exit_code)
> > > >  {
> > > > -        if (!__populate_fault_info(vcpu))
> > > > +        if (!__populate_fault_info(vcpu)) {
> > >
> > > Presumably we need a barrier (DSB?) here, to ensure that the TLBI happens
> > > after the AT instruction?

I don't think the TLBI requires a barrier before it, because it
doesn't matter if the AT's walk allocates entries after the TLBI.
Anything it allocates matches memory, and the stage-2 descriptor the
AT faulted on has AF clear, so that descriptor can't be cached:

R_XCLRD: Translation table entries that generate a Translation
fault, an Address size fault, or an Access flag fault are never cached
in a TLB.

The stale entries the guest keeps hitting were already there before
the TLBI, and the dsb(nsh) and isb after it are what complete it
against them.

[... your other reply ... ]
> > Alternatively, VMALLE1 or even VAE1 should be enough to get rid of the
> > S1 TLB.
>
> Ah, sorry, VMALLE1 is what I meant to ask about. I basically haven't
> understood the need to invalidate the stage-2.

The guest's walk can also go through a stage-2 entry for its
page-table page, cached before the aging cleared that page's AF, and
nothing requires the AT to use that entry:

R_NPZWX: When an address translation instruction is executed, it is
IMPLEMENTATION DEFINED whether the result can be returned from a TLB,
or a translation table walk occurs.

So if my reading is correct, on a CPU whose AT walks memory instead,
the AT keeps failing while the guest's walk goes through the stale
entry, and the guest takes the same permission fault again. VMALLE1
and VAE1 only cover stage 1, so they'd leave that loop in place.

Cheers,
/fuad

