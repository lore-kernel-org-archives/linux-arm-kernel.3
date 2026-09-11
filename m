Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ADFC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQhRsXCO/cpXQsNM2sUDd87DVAvJ+ckgIuegEsXrox4=; b=0B5zR6DBGY4U6uUngl0BuIvAvn
	vjEmcWhEQVak77ZUU6vX2F9YGMn9p/+X1diSUArIadtsH+sVd2Ig12c7F9rQjKERt5G02DdCSvBkH
	QzlgTgGl1IKh2SgNSPlH8zkbp+T1y4pgtd6D2Fu3sIDUMZakdW3ueTaAkFHXP+764OyIa+EgY8jXT
	y5U4cSzgOgu2w3JqfLQn6vHhPfHkMMMx8vb3Ws5h6ZuP66v20KJDN3DbjsOVizia1I4tKVjeQb9m6
	4doGAxnDxKiR9efBADksBP4cmY41/jlmsXm9lPK+z8zPQfuuWXaX0VCZBnXJmtStwD8Xs7hg8/yoT
	I1g0jb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yyH-0000000GSCi-1JBB;
	Fri, 11 Sep 2026 10:59:05 +0000
Received: from out-136.mta0.migadu.com ([2001:41d0:1004:224b::88] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yyD-0000000GSBK-3vq2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:59:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=t54f66oISK5iLoC6zpVoCghpLtMAejdCBH7P2FWAB/4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789124339; v=1; x=1789729139;
 b=GtTzanoCyaTYfPB0iTx7dbIzypQJ3zUD1WPxTVYg5wnF45AQD1NYKLGPBPk81WmTMs2YV3Zw
 L2raq56ut2OFRnnP985/15TOyi+ZUb9CPfsny/tb6uUfGtP3FeV2h+yMfrCB4cdzVtd2wg08Zrx
 1H9rBUbF1rIQ6xLXGAyfsuYs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cdb98669a32fc975;
	Fri, 11 Sep 2026 10:58:58 +0000
X-Mizu-Trace-ID: cdb98669a32fc975
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so4063e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzEXycgqiO+ID+14wnw0jUEh6gH60hnHA7wqJ2cEI0Rk7HAaxs85zXwOAsOB7xs4joMqLlPhvpEjDUdqwretoy@lists.infradead.org
X-Gm-Message-State: AFuF++nQMedqFnFjXWW9VJnUhe5GzRUq5nXAU39wb7ZNI5bd7G5d1sj5
	z/FPmQ9Y6DwWlaB68t/TYQDtANDLJacUCKwZNrimlkxsX68KzUb09z9ql+M2+dcxw5pVmW62KAn
	QO80QCxzYZHgdNbel0BojhKtLaGr8wFT/6/OSHUek
X-Received: by 2002:a05:6512:405a:b0:5b8:9e63:dfb9 with SMTP id
 2adb3069b0e04-5b8a053c7f3mr113768e87.0.1789124334038; Fri, 11 Sep 2026
 03:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-14-fuad.tabba@linux.dev> <86ld986pyr.wl-maz@kernel.org>
In-Reply-To: <86ld986pyr.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 11:58:17 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy5LOs7Uan9iDBDnTFBPMaA39cy1eDHYgTu=kEDHSB85w@mail.gmail.com>
X-Gm-Features: AcwNN1Vx-RhBgSQI6So9JMpD9_gKVmdeipliE4IOgkG_23MW8gI5glXbC9akMCU
Message-ID: <CA+EHjTy5LOs7Uan9iDBDnTFBPMaA39cy1eDHYgTu=kEDHSB85w@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] KVM: arm64: Pend a protected guest's SError with
 HCR_EL2.VSE only
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_035902_255086_24288078 
X-CRM114-Status: GOOD (  19.11  )
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

On Fri, 11 Sept 2026 at 11:29, Marc Zyngier <maz@kernel.org> wrote:
...
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> > index d6c4fc16f8795..b88098a7e756c 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
> > @@ -378,8 +378,11 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
> >        *
> >        * As we're emulating the SError injection we need to explicitly populate
> >        * ESR_ELx.EC because hardware will not do it on our behalf.
> > +      *
> > +      * The host does not see a protected guest's PSTATE.A: leave the
> > +      * vSError to HCR_EL2.VSE below, which the guest masks itself.
> >        */
> > -     if (!serror_is_masked(vcpu)) {
> > +     if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu)) {
> >               pend_serror_exception(vcpu);
> >               esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
> >               vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
>
> I can't say I like this very much.
>
> The fundamental premise is that as far as the host is concerned,
> PSTATE.A is always set. So why can't we give the illusion of this at
> all times?
>
> That'd be a much cleaner approach.

I'll have EL2 copy PSTATE out to the host with A set instead, and drop
this patch in v3.

Cheers,
/fuad


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

