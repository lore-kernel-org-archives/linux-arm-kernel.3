Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB1CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQJWVWk3onBDr0Grdd3BKv67WqnsifJhtWM7wbH9OiI=; b=TaY+8ePLHiFzA8YO58lkBKOACt
	nLOkpKJ4RrJHXEe87KEWHFjVSEo22J5dGCbKUea3JHXi3lZKxityEdLNam3w9qd74tedw+gDTOGy9
	UfuE7mXcOuh7fC5GqLegW5oIWje+AX9aCuG9WswGtNakBCNzEbbhSJWPKX443VYc0NyVwICkiP4r+
	Uc+1R2/ezSewidezgs+bRCPr9vJlC6+edAcleluOkP7VOxk9oEsxWUrcZ1G+ideBpDkmEZJE/JL5M
	DiJn9XAq1cK2fb44GuWD0Q9+gkDPEF1HLwAaN0MPspQvhsqxXjP5okvWkx+xdobx0z3opLSxvdZ7C
	h0MG7CNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcMm-00000004GJK-0Fcv;
	Tue, 29 Sep 2026 18:15:48 +0000
Received: from out-155.mta1.migadu.com ([95.215.58.155] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcMj-00000004GIV-2V1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 18:15:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PS53pggHQszgAXTyeJLWzhz2Iy6aaILaNoIH2bVSKrk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790705741; v=1; x=1791310541;
 b=KvNCeOLtgYPaopkh17HGhrikC43/DgwuG5wf+LIuQKUDl5Fdiiz9+6PDhJCbS07/8z268iG1
 I5qHIyo4RE64I7mlcSlYCtqVwSWvIqPAtfyVuqXjEqw92XnP/UihUxJZtP4lUjK539KgAA+LzBO
 U4JxYnUn7yATWNyeeNAXANFs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 75b993313ddb705c;
	Tue, 29 Sep 2026 18:15:29 +0000
X-Mizu-Trace-ID: 75b993313ddb705c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b8c42da963so964e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyxk/Va3PI/CtW0hNTD+U2xrpVrSJuqZaHg3skaBA619RWT+ffMYWE9b3URiQX4CKXjxmreTjbJfgOA22Xg3VX@lists.infradead.org
X-Gm-Message-State: AFq9FYKVVgpu7aolV0JBA8z6e/FCp1nwn8EThNC8UZ0PGWjtPIKUisun
	+td5RO+7BCzUYX6oCiKQ3YjJ8k9PSk/K0LDfmi96U7hjNgjbtc9bh1T2AFNyzlftalKw9ur9qe5
	J1MSfin3c4syeUimrLTNCx2eZKeOallfQ2wzHQhhf
X-Received: by 2002:a05:6512:3d04:b0:5b8:d830:be30 with SMTP id
 2adb3069b0e04-5ba2f9ac722mr166505e87.16.1790705724240; Tue, 29 Sep 2026
 11:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <20260929093548.3598547-7-maz@kernel.org>
In-Reply-To: <20260929093548.3598547-7-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 19:14:48 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyRRJjhaud-OHyAWh0z4Pj=o-jmvN8tJ=3h+Qrb6Lzm5w@mail.gmail.com>
X-Gm-Features: AclHuK9Zph6dxjBIAdQsEIxcU3zk8Se6Fy_owHYC72h8LnPnQU2hVuTRl5zAeJ8
Message-ID: <CA+EHjTyRRJjhaud-OHyAWh0z4Pj=o-jmvN8tJ=3h+Qrb6Lzm5w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] KVM: arm64: vgic-its: Fix MOVALL handling of
 source redistributor
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_111545_843913_E2CEC528 
X-CRM114-Status: GOOD (  23.02  )
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

On Tue, 29 Sept 2026 at 10:36, Marc Zyngier <maz@kernel.org> wrote:
>
> The MOVALL command moves the pending state of all LPIs targeting a given
> redistributor to another one. However, we seem to have lost the
> filtering on the source RD, which means we move all LPIs to the target.
>
> Not quite what the spec mandates.
>
> Hack update_affinity() to take an optional source vcpu that is used as a
> filter when non-NULL, restoring the filtering that was performed by
> vgic_copy_lpi_list() back in the days.
>
> Fixes: 11f4f8f3e6e06 ("KVM: arm64: vgic-its: Walk LPI xarray in vgic_its_cmd_handle_movall()")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 9e782a4fea7e5..cc02d9b62bd95 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -319,12 +319,16 @@ static int update_lpi_config(struct kvm *kvm, struct vgic_irq *irq,
>         return ret;
>  }
>
> -static int update_affinity(struct vgic_irq *irq, struct kvm_vcpu *vcpu)
> +static int update_affinity(struct vgic_irq *irq,
> +                          struct kvm_vcpu *from_vcpu, struct kvm_vcpu *vcpu)
>  {
>         struct its_vlpi_map map;
>         int ret;
>
>         guard(raw_spinlock_irqsave)(&irq->irq_lock);
> +       if (from_vcpu && irq->target_vcpu != from_vcpu)
> +               return 0;
> +
>         irq->target_vcpu = vcpu;
>
>         if (!irq->hw)
> @@ -362,7 +366,7 @@ static void update_affinity_ite(struct kvm *kvm, struct its_ite *ite)
>                 return;
>
>         vcpu = collection_to_vcpu(kvm, ite->collection);
> -       update_affinity(ite->irq, vcpu);
> +       update_affinity(ite->irq, NULL, vcpu);
>  }
>
>  /*
> @@ -856,7 +860,7 @@ static int vgic_its_cmd_handle_movi(struct kvm *kvm, struct vgic_its *its,
>
>         vgic_its_invalidate_cache(its);
>
> -       return update_affinity(ite->irq, vcpu);
> +       return update_affinity(ite->irq, NULL, vcpu);
>  }
>
>  static bool __is_visible_gfn_locked(struct vgic_its *its, gpa_t gpa)
> @@ -1383,7 +1387,7 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
>                 if (!irq)
>                         continue;
>
> -               update_affinity(irq, vcpu2);
> +               update_affinity(irq, vcpu1, vcpu2);
>
>                 vgic_put_irq(kvm, irq);
>         }
> --
> 2.47.3
>

