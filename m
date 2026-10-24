Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B88606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdQ1klOm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Aq0BzqOU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xgVmkxubDRg1cJuzFYDYMiEdO1rVdRyOgY/ruAhYY2s=; b=gdQ1klOm1qDWO7bRJcfhcEakvE
	iU6aHTGCeqiS6/b2UMnw5mgo+3XKimP3oZaWw/7qGrhMu75oyQpDVbHNPfuO1DJfHIRPguFcJLMfM
	3wvo2pHEyuK4UpRA2185lD5UYsdE5HibSk7ZumBc7UbNbXeOmjqfHND1Fy++N/kPRfRfCja2IUAyx
	d+s6CF78O6nAiMoKVuyNZEo9vjuuKXi1rIIP0xK8zTLu+3zSEuyusL/Jn3eXL8dULd3s5sXgVv/qB
	X7cdX7VoUN1IpN4KIzxIuLe/PT3XjkQRboA3zoSl34i18tiyC5YeZzLTY+vFlyJe7jhmQBR+mXaYF
	hOIGFsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVyl-0000000HXiL-4AfA;
	Sat, 24 Oct 2026 07:15:48 +0000
Received: from out-220.mta0.migadu.com ([2001:41d0:1004:224b::dc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVyh-0000000HXhq-2JvK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 07:15:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fS8yvEoIwEhEI1jeJexTVj+BAmw6eQpccC70A0wbAfc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792826141; v=1; x=1793430941;
 b=Aq0BzqOUljMMR5tzh7Kyv5yeWxOAyaaYbi+YtLE2cbYreaefc5j4CG0NjIHVwo0ho3SqZvw2
 B3ItMWMKFEtqQK42Qs8JMJc5DwFX2OlfzfBZHUfNke7xZiq14Prb87oEQSVJi159DCwwACOL33r
 vimuLFtJZeiPgdofygAY/Xws=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a70da685324af8da;
	Sat, 24 Oct 2026 07:15:40 +0000
X-Mizu-Trace-ID: a70da685324af8da
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso2052e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 00:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIYBU2eNIT8ZPI2chZDjfK0tqFg/Y/EpExrOBPzCEWBx8xDd5HyAiRaIYXF766DOm4LlDgXOwYO4Gu8UOtbCPE@lists.infradead.org
X-Gm-Message-State: AFq9FYK8KeVdTWsMLf2lP/XmPNT/h+iLkI6FKqPCXXroxJMP0bwwEWeT
	ZWcRrUD/bqx5K1LYYTRiEtce/BJcQA1+P7/UCveQrSich2wwQfxd/Zju7VRENlcqZUbTK+Jl/pV
	1LGQ/aDWG8qlK8hv1B1/WCo3XeDawBZb6FFC56jlD
X-Received: by 2002:a05:6512:3e1a:b0:5bf:b27b:6371 with SMTP id
 2adb3069b0e04-5bfb79f9850mr46341e87.10.1792826135785; Sat, 24 Oct 2026
 00:15:35 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
 <86ecdgzp6m.wl-maz@kernel.org> <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
 <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com>
In-Reply-To: <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 24 Oct 2026 08:14:59 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
X-Gm-Features: AclHuK9QvFT6f4TAsNTrh2PdecgAYJ19yM-sYm9uDvK9gvirJINXHV46-ipXL60
Message-ID: <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_001544_486217_BC80D9AA 
X-CRM114-Status: GOOD (  17.57  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arnd,

On Fri, 23 Oct 2026 15:10:23 +0100, "Arnd Bergmann" <arnd@arndb.de> wrote:
[...]
> That sounds good. For reference, I have prototyped support for
> LS64_ACCDATA in Linux drivers based on the corresponding x86 code.
> The code is not yet tested on hardware, but it may help understand
> how this may be used in the future.

Thanks, that's useful to see.

[...]
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
[...]
> @@ -254,6 +269,8 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
>          if (prev != next)
>                  __switch_mm(next);
>
> +        switch_iommu_mm(next, tsk); /* FIXME: is there a better place to do this? */

switch_mm() isn't enough when the same thread also runs a vCPU. In v2,
which I'll post soon, KVM will save and restore ACCDATA_EL1 only for
the guest, since nothing in the host uses it today. So after KVM_RUN
returns from a guest that has LS64_ACCDATA, the VMM thread's next
ST64BV0 would use the guest's value, unless KVM also saves and
restores the host's.

[...]
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
[...]
> +static bool try_enable_st64bv0(struct pt_regs *regs, unsigned long esr)
[...]
> +        isar1 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
> +        if (!(isar1 & ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA))
> +                return false;

v2 will add an ARM64_HAS_LS64_ACCDATA cpucap, so this could test that
instead. As written it tests bits [1:0] of the register, not the LS64
field, since ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA is the unshifted field
value.

> +
> +        sysreg_clear_set(accdata_el1, ACCDATA_EL1_ACCDATA, pasid);
> +        sctlr = current->thread.sctlr_user;
> +        sctlr |= SCTLR_EL1_EnAS0;
> +        current->thread.sctlr_user = sctlr;
> +        update_sctlr_el1(sctlr);

On a host that runs at EL1 (nVHE or hVHE), this also requires
__init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
__init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
access traps to EL2 and the hypervisor panics, and so does ST64BV0
once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
once you're ready to post this.

Cheers,
/fuad

