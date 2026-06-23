Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8686ECDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F77g4j7YjD5E5qC6B2ZdRa5uX5Miz2j/ZR1CSt9++g4=; b=XEv1KXEE3f1srQ2gtU/b+HuZJK
	6bWWK0lbMmUVPNc3Vv3X+V0nqyxxCH4qfw/0cb/K2eCH5ApAzr/TEENypx4HBe2Y0igSaCNaexnsv
	gVzcbWPRrc4pbtzelPT3MaATsNQ6epjCb9oI822Ih1wYqRagQAAoaA6dj78391KKSA6zl0oLgWLM2
	usxyTNr3phPZuScYlzY13zTmMn1sbz/PlHzgR/c115QUMCSkn31KvpPkMNygoCSnbDwUrtMZfYGIf
	ExJwtRJPsPZta7yqhmsVYmnxMADTi6lbm/96IPQ9H3C0OmEtJFmokIeBKKEWF90zfg5OF1PGwxMPl
	gRN5smSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1YL-00000006NEU-3ezX;
	Tue, 23 Jun 2026 13:52:37 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1YI-00000006NDx-3aOm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:52:36 +0000
X-Forwarded-Encrypted: i=1; AFNElJ9zs/itlzuDMkDZXRkoij1P1FgHBb6ZbRAbxf1d3Hlm9fjQtLUwEX44hQHwvEM6t1CQ82RM3AsugpVN6HekDAnT@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782222750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F77g4j7YjD5E5qC6B2ZdRa5uX5Miz2j/ZR1CSt9++g4=;
	b=gVzTRPNu0aFxDov8CPyoT60I5VkmkLabRcx+yCJKozDsCzoDT3lImRJbXkBdBFxD6g20ec
	nXylqyBNKIONfXXI7vC7MofWMzEy7fiwDRtWEKlF6XDyvmes7kcv/IC+1wr5/gCB2sk5Ks
	OSjAFt9z9nDDmo2UmpQbH/009zw7Ufc=
X-Gm-Message-State: AOJu0YwdnZqosNlbCk3B3lH2S6FjdTJeuPzcB7E8S4D08HwOn8q0Eb+i
	o2SHrRUSzw+du3H7Fjpcxk30brNGiuPspFrLmGr+8phyC15fFYlhKUUbuv//RHLzzFHrYj0axoQ
	Iwi0FRy+ahrfw+lC9MTZ1ouUphFu96FfNlxiIFz0U
X-Received: by 2002:a05:622a:411b:b0:519:df4f:6c93 with SMTP id
 d75a77b69052e-51a5255375emr10017941cf.20.1782222746042; Tue, 23 Jun 2026
 06:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260622190701.2039766-1-fuad.tabba@linux.dev>
 <20260622190701.2039766-2-fuad.tabba@linux.dev> <86tsqtqu9u.wl-maz@kernel.org>
In-Reply-To: <86tsqtqu9u.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 23 Jun 2026 14:51:49 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxn8W=KYqTeqs-ZTw-SBD9tH0zUz_O9rTHsq3M7ELXn_w@mail.gmail.com>
X-Gm-Features: AVVi8CebMVsOKX8XmdbtdzDxdkE6ig5bh0MmMzjJbv-f8yL8AKg1mgeDyXjOPkk
Message-ID: <CA+EHjTxn8W=KYqTeqs-ZTw-SBD9tH0zUz_O9rTHsq3M7ELXn_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Fix sign-extension of MMIO loads
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Christoffer Dall <christoffer.dall@linaro.org>, Victor Kamensky <victor.kamensky@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_065235_627917_3A6925C1 
X-CRM114-Status: GOOD (  23.96  )
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

On Tue, 23 Jun 2026 at 14:08, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 22 Jun 2026 20:07:00 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > A sign-extending load from MMIO (LDRSB, LDRSH, LDRSW) delivers a
> > zero-extended value: in kvm_handle_mmio_return(), vcpu_data_host_to_guest()
> > masks the data to the access width after sign-extension, stripping the
> > sign bits.
> >
> > Move vcpu_data_host_to_guest() ahead of sign-extension so the width mask
> > runs first. trace_kvm_mmio() moves with it and keeps reporting the raw
> > access-width data.
> >
> > Fixes: b30070862edbd ("ARM64: KVM: MMIO support BE host running LE code")
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/mmio.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
> > index e2285ed8c91de..d1c3a352d5a22 100644
> > --- a/arch/arm64/kvm/mmio.c
> > +++ b/arch/arm64/kvm/mmio.c
> > @@ -126,6 +126,10 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
> >               len = kvm_vcpu_dabt_get_as(vcpu);
> >               data = kvm_mmio_read_buf(run->mmio.data, len);
> >
> > +             trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
> > +                            &data);
> > +             data = vcpu_data_host_to_guest(vcpu, data, len);
>
> This helper is in charge of the endianness of the read from the
> guest's PoV. How can the sign-extension (which happens from the host's
> perspective) correctly work if it takes place after the byte swapping?
>
> To me, the real issue appears to be in the that helper, which swaps
> the data based on the size of the access instead of the width of the
> register.
>
> Or am I once more completely confused with the endianness crap?

Endianess always confuses me too :D

My reading of the ARM ARM is that the byte reversal is keyed on the access
size there too. It lives in Mem{size}, with the register width handled
separately by SignExtend(regsize):

    data = Mem[address, 2];        // byte-reversed by the access size, BE
    X[t] = SignExtend(data, regsize);

So vcpu_data_host_to_guest(..., len) swapping by len matches the Mem-side
reversal. Swapping by the register width would reorder bytes that were never
loaded. An LDRSH into Wt reads 2 bytes but would bswap 4: the halfword
reaches the helper as 0x0180 host-native, cpu_to_be32 turns it into
0x80010000 instead of the 0x8001 cpu_to_be16 gives, and it never sign-extends
to 0xffff8001.

If that reading holds, none of the helper's ops are individually wrong, and
the only bug was the order, with the sign-extend running before the swap and
the width mask then dropping it. But I've gone round in circles on endianness
before (to say the least), so please say if I've done it again.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

