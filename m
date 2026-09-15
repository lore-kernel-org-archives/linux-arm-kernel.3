Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF1FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30MMlGXh+eGIrSEBfjOVb1y+U1bZkjfhtS3PPHQCVcI=; b=nKAqaNoOtzcmrqxSRaqE8nedvL
	68HhKcvwDpO+5zaB/MM4xUkGkjWRKtXJOdxWHOle3eGdWLOIXA5ied310f7rTQq4MBeBE7hLDCBiZ
	SuJxzwr5zgMgAvu9LjL0dqp+8tImIhzCElXO/zdCxFu+Jyzqobo7c6k7Suef/165MAHm0CfmHIO2u
	sPic4o3f7Q30Fuo8OV+fAkneiUlIiMNqtrdSuFWsXXgwqqqQH11MRE2Sru9687kniE5o5d8mZGiTT
	beOIQu4x2gXVNq71DgeXqrzFArQj2Hvjk4QNrvwqmClgMiY3XjH/ZtHxo6vcoYhhT+5oPCIXrVlmn
	xiAPgFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Tty-00000006sun-3dpv;
	Tue, 15 Sep 2026 14:12:50 +0000
Received: from out-38.mta0.migadu.com ([91.218.175.38] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ttv-00000006su2-3BKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:12:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3G0O+OUF5QFvnfAby8EwEl11RBiKQK5gk892VXgZWD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789481564; v=1; x=1790086364;
 b=donS3I17xkYq+pUcl6z/Ju1A8L+ynRva9ROb7kJbkp6VoSeowuwrdta+yd4K4gJpGAiuG3Pk
 Fu8b71UcY6nArd7VcBrAhdb6ogzVmlfAZFsKig1eOtuok/wZykh1SCKUG45vmx4wPB0y2p3yn2c
 4k93DWve9pKS2QROu70EOJIY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 916469cfbab50fed;
	Tue, 15 Sep 2026 14:12:44 +0000
X-Mizu-Trace-ID: 916469cfbab50fed
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so302e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:12:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsofyIup4f0cV7d9rt0FpOaGuuya99cLBBCqnliFZRH0GpcX3fDYA8sU90/L8i9UrpwfQTYyj657EsHEon2QdC@lists.infradead.org
X-Gm-Message-State: AFuF++nKIbRzl90FbRjbggx1ySF1WIR++WOBBGyyXosZmDTMSqbbdPxm
	r3J/Gt6dCzZuJ4h+zv7wW0oQVF08BkmCcAKR88X2L4lIyU9uH5FdefjOOMkhfQON3d7bNIFKYjH
	4mGxugMwTtkicZZrUTCVviP/Trb3w3VcgIEGTG3c3
X-Received: by 2002:a05:6512:3dac:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8b2d0db8bmr195652e87.4.1789481559798; Tue, 15 Sep 2026
 07:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
 <20260915123846.2317931-2-fuad.tabba@linux.dev> <86v78662a6.wl-maz@kernel.org>
In-Reply-To: <86v78662a6.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 15:12:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxUTOj4D6Y-mjA6Wv+D-GWP1SaCBNgH_Ni=CQ3Y0zAK1g@mail.gmail.com>
X-Gm-Features: AcwNN1WrZ2vlMfsvR2ger9LO52Sjk_Eil6ga-Qs09jtEG-4giDpAv8q3LKgSy9Q
Message-ID: <CA+EHjTxUTOj4D6Y-mjA6Wv+D-GWP1SaCBNgH_Ni=CQ3Y0zAK1g@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: arm64: Reject the GICv5 CPU interface hypercalls
 under pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com, 
	Sascha.Bischoff@arm.com, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_071247_950537_54D9EFAD 
X-CRM114-Status: GOOD (  14.08  )
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

On Tue, 15 Sept 2026 at 15:02, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 15 Sep 2026 13:38:40 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
>
> [...]
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 9a3b92e626adb..7c939baf9c1ba 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -911,6 +911,8 @@ static const hcall_t host_hcall[] = {
> >       HANDLE_FUNC(__kvm_enable_ssbs),
> >       HANDLE_FUNC(__vgic_v3_init_lrs),
> >       HANDLE_FUNC(__vgic_v3_get_gic_config),
> > +     HANDLE_FUNC(__vgic_v5_save_apr),
> > +     HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> >       HANDLE_FUNC(__pkvm_prot_finalize),
> >
> >       HANDLE_FUNC(__kvm_adjust_pc),
> > @@ -932,8 +934,6 @@ static const hcall_t host_hcall[] = {
> >       HANDLE_FUNC(__tracing_write_event),
> >       HANDLE_FUNC(__vgic_v3_save_aprs),
> >       HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
> > -     HANDLE_FUNC(__vgic_v5_save_apr),
> > -     HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
> >
> >       HANDLE_FUNC(__pkvm_host_share_hyp),
> >       HANDLE_FUNC(__pkvm_host_unshare_hyp),
>
> Why moving things in the array? The whole point of HANDLE_FUNC() is to
> abstract the position.

It's only cosmetic. The array is in the same order as the enum today,
entry for entry.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

