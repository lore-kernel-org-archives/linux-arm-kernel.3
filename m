Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83904C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO4iQPhA9Mv76+zFNoNc2B2VmUo8zzQByZGwLu+AzyQ=; b=KexLXZ3nIzIO8kqa9WFvxSesHg
	lm5/EPIppty7fo2nJoVCDPCahTBzxZvdYeTvNn1hMP5NmgW3DhA7mXZVX5NKEu+Xy60TUGFj6PMrn
	AxcYXSZb1BDlSMRQiSImBaHDsMfcHR3nEfB8LL3ljMVjN+dA96bN6G8tnEFrTWPNtcI4PcrAoGUPk
	BkRgQhXT7YVetFFlmXVB2212Mw7UK7wpjhsqxI9a/GUZ3vUe/JhYyIz7KbA6nFzrnPtvy4stjseVK
	uNI+UEkSHyNkZ26YoFG9EkEdaGxzYuGtKpJwAKApNF892JKQoktoEIHgsNcMDlVbsU31NlQdOF8rL
	rDYHUxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67ub-000000040ut-3EYg;
	Mon, 14 Sep 2026 14:44:01 +0000
Received: from out-94.mta0.migadu.com ([2001:41d0:1004:224b::5e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67uY-000000040uI-2o6Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:44:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZOxEFV6yKVa+U+wttltPLAq7YKcnlIAuux7OwLuKqMI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789397035; v=1; x=1790001835;
 b=m850LYJ8ZszbKnOwjq05uYTMJ1bCMRDKmkq5g/b8wrBqTUXF8h4nSNwkzkqvSZjxMQe+51Le
 XnZ+a0ST5f8/+Y588i7F+emV9cdUF7jWfh6r7HX3SZnrtCwdoMKSJJ+rW46009T9epnc2kBSilM
 Ru2ZstOjrJamyZpgp33WEMds=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 819778286b9fddf8;
	Mon, 14 Sep 2026 14:43:55 +0000
X-Mizu-Trace-ID: 819778286b9fddf8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so8567e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGC2Q+Th21UTpGQT6xS1IHHTUOX0e2zs9+b6OUGwSH6h+gRYmy6om0DNyBy9MSnptAbiP+3sIqkDc/Ay0s9FiM@lists.infradead.org
X-Gm-Message-State: AFuF++l0b4exMe2TZfPNQ7U9oc719NU7thPcU4YDXvDuoc5x3B5VqP/4
	wB9+yNJ637SUu/DpAYkylN+wQncz1TQeXw+htP37U/xLapRlFgKZI+wVzbzdKQN2j8wE9e2BAj6
	ZY4z1uuyE8SsD5WLS6xsNBa1DQxs7qrImTYQZlwGS
X-Received: by 2002:a05:6512:1555:b0:5b1:5e30:ab4d with SMTP id
 2adb3069b0e04-5b8af7a5089mr55808e87.5.1789397032407; Mon, 14 Sep 2026
 07:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-13-fuad.tabba@linux.dev>
 <8633vc6jag.wl-maz@kernel.org>
In-Reply-To: <8633vc6jag.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 15:43:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy6F9tG=eRLMuykc12P-Oc2pjMoQqAz34iGR+Q5GzV2jQ@mail.gmail.com>
X-Gm-Features: AcwNN1VwPAYbkVlaO1umpV1hjCIFKM3lgcDxKxOZL3M7XeNBLkF2CpyyCPMyBJY
Message-ID: <CA+EHjTy6F9tG=eRLMuykc12P-Oc2pjMoQqAz34iGR+Q5GzV2jQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] KVM: arm64: Prevent host PC adjustments for
 protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_074359_095324_21C84BC4 
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

Hi Marc,

On Mon, 14 Sept 2026 at 14:42, Marc Zyngier <maz@kernel.org> wrote:
[...]
> nit: it is really odd to see this 'pkvm' prefix in generic code. The
> point of it is not only to abstract the pvkm complexity away, but also
> to have a wrapper that may be of use in other situations.
>
> Don't respin the series just for this though, I may end-up changing
> this when applying it.

Agree, if I respin I'll rename it.

[...]

> > +   hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > +   if (!hyp_vcpu || hyp_vcpu->host_vcpu != vcpu)
>
> Under which circumstances do we get hyp_vcpu->host_vcpu != vcpu?

When EL2 calls __kvm_adjust_pc() on the hyp vCPU itself:
__kvm_vcpu_run() at guest entry and inject_sync64() in nvhe/sys_regs.c
both pass &hyp_vcpu->vcpu. There the vCPU passed is the one to adjust,
so it's returned as is.

> > +   if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +           return NULL;
>
> Is it always the case that a protected vcpu cannot see its PC adjusted
> at all? How is PC updated after an exit for MMIO? I feel there is an
> interaction with the above, but I'm not 100% certain...

The host can't adjust it directly, EL2 applies the host's request at
the next entry. For MMIO, handle_pvm_exit_dabt() sets mmio_needed on
the hyp vCPU from EL2's own syndrome, the host completes the access
and kvm_handle_mmio_return() sets INCREMENT_PC on the host copy, and
handle_pvm_entry_dabt() increments the hyp vCPU's PC at the next entry
if EL2 had an MMIO pending, through the &hyp_vcpu->vcpu case above.

The NULL return clears nothing, so the request stays on the host copy
for that entry. It's reached from the epilogue of
kvm_arch_vcpu_ioctl_run(), e.g. an MMIO completed on an immediate_exit
run, and consuming it on the host copy there would clear INCREMENT_PC
before EL2 sees it, so the guest would re-execute the access.

"Drop" in the commit message and the adjust_pc.h comment reads as
losing the request. I'll reword if I respin.

Cheers,
/fuad

