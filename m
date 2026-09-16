Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A93C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbbUmrdGU6bz0H3n83rBFxfE3QoKPmrdlRRBmXNDWvI=; b=YxhSduQJb+Q7tiSXWdAkyvbBU+
	+QTjgq0MmwbI1cJYm5CLg59YIY+MRbYyQ5IOA6E1tEFznUP3ZzCE/BrxAQ/ksZduxZNRPh9l/G7H1
	fh47m96N6xD742gSQaUfYZd5xYwlzExd3EINaxjP1YD8coJKdZ0jQw/MaGPD5zfmysX5+Wgc9pI5O
	FjqtKqSZANp0TS5pkxSz+LGIkfdYgqfFURFZjqFS/fHtYlT6BctBdXaWFZ+kivZXuSw4gYPmLWJpc
	Ej8VHA8O4Ooy9KhzKGQt9om9uSp6hV2dsHDvftSiVxbIyz4nCq7+kTHypse+rU9M6OjnvpbyfVYEA
	gnA3AtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uxw-0000000A0IV-0fY1;
	Wed, 16 Sep 2026 19:06:44 +0000
Received: from out-239.mta0.migadu.com ([2001:41d0:1004:224b::ef] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uxt-0000000A0I6-0hQo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:06:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=clIAd+ElCPuqeSOiRCrGYr2080Rs0+u4Ja4zpAJS57o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789585598; v=1; x=1790190398;
 b=j4HVSBXlzGh/HNYrMKRKgUlTOPXfajjOzXSSEYprn75koVYDytcKHIm5UkY2GJdJ8UuWJKG4
 DLffegUpHQdbYEkeiPb0zLGjiBgAJPZGgoXQg0Iw9e59NsCfO4fev3FBVMahHC8sd0W74pY40Dc
 Fsnx2gST7SYrNbJR47JvBLys=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3e262ba15e872a09;
	Wed, 16 Sep 2026 19:06:38 +0000
X-Mizu-Trace-ID: 3e262ba15e872a09
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so847e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:06:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByV5/RChlL2e+xQoXFIZssWhyTfdZwXS6BDbLKD8WQN6LQ+vLo/AFoA2s2wb67tSHyrqsZj5xMuhNFon5fN/jI8@lists.infradead.org
X-Gm-Message-State: AFuF++mibT/7UjDpB6CvipEiNzgGLGMkej8vvSGAKXm0vlsWoAAw3RHB
	VGsxFN6ASWfimiTZsvwcSFYH2a9ptOTScJPpwEMZriW0Ia02vBzs8ooDugqbGH3lFz9eS66NNZ8
	5nzcYwLkwqwgyNpELohAM6WqQ33aolnfpQZda+fQV
X-Received: by 2002:a05:6512:3d10:b0:5b8:b380:3c89 with SMTP id
 2adb3069b0e04-5b8ba99b7ffmr23508e87.0.1789585593571; Wed, 16 Sep 2026
 12:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-15-fuad.tabba@linux.dev>
 <86bj9x5fhj.wl-maz@kernel.org>
In-Reply-To: <86bj9x5fhj.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 16 Sep 2026 20:05:57 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy8R3yxFHmTti9mBgjQGJKnH44v9WvDQ2k9cWFECaYoQg@mail.gmail.com>
X-Gm-Features: AcwNN1X5PZX5WDCSedlv_R_n84PSTr-QRRvORTCqs34THsNi7n9PRABFR4_9-2c
Message-ID: <CA+EHjTy8R3yxFHmTti9mBgjQGJKnH44v9WvDQ2k9cWFECaYoQg@mail.gmail.com>
Subject: Re: [PATCH v3 14/18] KVM: arm64: Add per-EC entry/exit state
 marshalling for protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_120641_436204_C2433F39 
X-CRM114-Status: GOOD (  17.67  )
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

Hi Marc,

On Wed, 16 Sept 2026 at 17:27, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
[...]
> > +static void handle_pvm_entry_sys64(struct pkvm_hyp_vcpu *hyp_vcpu)
[...]
> > +        /* If the host emulated a read access, update the register */
> > +        if (pc_update &&
> > +            !pvm_sys64_is_write(hyp_vcpu->vcpu.arch.fault.esr_el2)) {
> > +                /* r0 as transfer register between the guest and the host. */
> > +                u64 rt_val = READ_ONCE(host_vcpu->arch.ctxt.regs.regs[0]);
>
> Why isn't this
>
>                 rt_val = READ_ONCE(vcpu_gp_regs(host_vcpu)->regs[0]);
>
> and similarly everywhere else?

Old code momentum. I'll use the accessors throughout in v4.

[...]
> > +static void handle_pvm_exit_sys64(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +        struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > +        u32 esr_el2 = hyp_vcpu->vcpu.arch.fault.esr_el2;
> > +
> > +        /* The mode is required for the host to emulate some sysregs */
> > +        host_vcpu->arch.ctxt.regs.pstate =
> > +                pvm_host_pstate(hyp_vcpu->vcpu.arch.ctxt.regs.pstate);
> > +
> > +        /* r0 as transfer register between the guest and the host. */
> > +        if (pvm_sys64_is_write(esr_el2)) {
> > +                int rt = kvm_vcpu_sys_get_rt(&hyp_vcpu->vcpu);
> > +                u64 rt_val = vcpu_get_reg(&hyp_vcpu->vcpu, rt);
> > +
> > +                host_vcpu->arch.ctxt.regs.regs[0] = rt_val;
>
> and this should be
>
>                 vcpu_set_reg(host_vcpu, 0, rt_val);
>
> assuming you don't need a WRITE_ONCE() to match the READ_ONCE() in the
> other direction.

No WRITE_ONCE() needed, EL2 is the only writer on the way out. I'll
switch to vcpu_set_reg().

[...]
> > +static void handle_pvm_exit_iabt(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +        hyp_vcpu->host_vcpu->arch.fault.hpfar_el2 =
> > +                hyp_vcpu->vcpu.arch.fault.hpfar_el2;
>
> Please keep assignments on a single line (everywhere).

Will do.

Cheers,
/fuad

