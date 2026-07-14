Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15556C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCVaWlwXy1h6K7yqumgVi+lXEd0MerF1f9OEA/4dDMA=; b=gdFc3TEz7I2Ijv1+HdCRfiCdSg
	YusrekpgB7weNaXnQ7cH+oxbSeyMkfgmwzID3vmxChXg473AMyIb+qSTCwup83ziGSOhdkBd2GpiJ
	F5LL0Migv0a6NVAIECTjemCIjHYfyoragKuIV0bgMi4BZTH7y9dnAKLucHhRYr0C3G5UmlW4ByWTL
	Mejr/fo8J890S4PIZ/Lsvq3bYPVheaj4UQudbySmU6ryrtvpCFmT0g+4yM4oR2wQaD1SUioE5UnGn
	WXLrbSbRGgs3uaXwOBMAMbywkmfA5KR26eLO+Sdo2wJuTrzlcik5ef4ZR8IJcaAJIs2E9T1bma6Hf
	y26QCXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWq4-0000000B4pt-3Bls;
	Tue, 14 Jul 2026 06:41:56 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWq2-0000000B4oL-04tL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:41:55 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrSfjfsVJTLUvcmkVsjFT8Mnuzhi87mTpesL1dr+yPQCnnY/j1EJJ9t7sIXPl1pEW27RoQWUlg5yOoipAaf3jvo@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784011310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gCVaWlwXy1h6K7yqumgVi+lXEd0MerF1f9OEA/4dDMA=;
	b=b/HnzVI0YbAXigGfOF2kP+2zG0dWNGbUT6+mhLX+zHjWM7NhwmZEEhtKsTXecOTBfat5WE
	+Rx+aU2k8XEsHHBGzmUU5GbEFzyKqpzJhYv+jUJlu9fU17VNDfLGWAhkyFysBliacmocwA
	tv2FYiMXzpflOkeYSpDNAmV2ByPK5p0=
X-Gm-Message-State: AOJu0YwKmK/3Ey/7hylXGzFJIAbDQmGrm0XURi9i8GMbppsQxoEfrvBs
	FxZvvWD+GjPdLvLOR3jFlPu/gcLrxjkTedWR1Kd+ukEAFmL2mHINX75u7+uY7O131e9PtesOc0B
	aqBtm1IHAOf/zPsvLLz9nzbf5AnrD7SSD+tIJLQni
X-Received: by 2002:a05:622a:512:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-51d7bc994f7mr11182851cf.1.1784011304760; Mon, 13 Jul 2026
 23:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260706095927.560795-1-fuad.tabba@linux.dev> <20260706095927.560795-3-fuad.tabba@linux.dev>
 <alWDI7uj9YFedXET@kernel.org>
In-Reply-To: <alWDI7uj9YFedXET@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 07:41:08 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwX-q5WEJ0pF5CJvtxwc2Vy4y=mmEvzo07sUa1SiyCM0A@mail.gmail.com>
X-Gm-Features: AUfX_mw5sgsKATxPxS4kpnWDGYO2p3GXI8BHq80imxIR3rQoh-xFNvj2QTUN5uI
Message-ID: <CA+EHjTwX-q5WEJ0pF5CJvtxwc2Vy4y=mmEvzo07sUa1SiyCM0A@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_234154_193920_8E046C4F 
X-CRM114-Status: GOOD (  21.91  )
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

On Tue, 14 Jul 2026 at 01:30, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
>
> On Mon, Jul 06, 2026 at 10:59:21AM +0100, Fuad Tabba wrote:
> > The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
> > built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
> > shared with hyp code. exception.c already wraps them in
> > __vcpu_{read,write}_sys_reg(), which pick the host- or hyp-side accessor
> > via has_vhe() and so are valid in any context.
> >
> > Move those wrappers to kvm_emulate.h as kvm_vcpu_{read,write}_sys_reg()
> > and switch the callers over, so a follow-up series can share that
> > emulation code at EL2.
> >
> > No functional change intended.
> >
> > Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++---
> >  arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
> >  2 files changed, 28 insertions(+), 28 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index 5bf3d7e1d92c7..80b30fead3d16 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
> >       return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
> >  }
> >
> > +static inline u64 kvm_vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> > +{
> > +     if (has_vhe())
> > +             return vcpu_read_sys_reg(vcpu, reg);
> > +
> > +     return __vcpu_sys_reg(vcpu, reg);
> > +}
> > +
> > +static inline void kvm_vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
> > +{
> > +     if (has_vhe())
> > +             vcpu_write_sys_reg(vcpu, val, reg);
> > +     else
> > +             __vcpu_assign_sys_reg(vcpu, reg, val);
> > +}
> > +
>
> Can you instead name the wrappers vcpu_{read,write}_sys_reg() and rename
> the current implementations, like __vcpu_{read,write}_sysreg_vhe()?
>
> Just want to avoid confusion between kvm_vcpu_ and vcpu_

Will do, thanks!
/fuad

>
> Thanks,
> Oliver

