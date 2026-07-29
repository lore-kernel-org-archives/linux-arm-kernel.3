Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDD7C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeiwwUTVEJhKZbSrlTRImNB7jVC969Sz3ID5XycdSNM=; b=Hit5g9Oh44ko5zyqpUcEzuS+KQ
	L+2u4dNT+YZ4iOuvYoHiiM2SaYKTMjxA5sVuBujzrTlsZdkyx/fAH7Emd0avHx6DmM+hAbsGHQem7
	fCnGwujn2PHBftihkZSm/FEQKJQteD6ERLx9ZOvsJFLMIf/KpZ2hj926II/B7dm0EAd9dqogQwM6/
	9Qh0+Qu7czEJAl+xhvLjw7i3YdWIljmE/hdIcIFyjCA1gV+DRYUjOUtAvec6fnQTqEm3/DMJHUy8k
	yoGnereeK+MuiremfOUIS/UMRkJNlKVFdoFAea//JgVYAbaCg0NztsGUv0SE4Uc6GBTLJ3JgRQeTY
	p33Ez/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Mr-00000008jcq-2tSu;
	Wed, 29 Jul 2026 17:46:57 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Mo-00000008jcA-15Ga
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:46:56 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrcI0cw2TPf8dzu0T/FRNhI8xK6DRrJcaAmJMUPICRnniFVW6qdf70FiDW8GVmoJiOrYMqdeGvJwJHvWPDJGALV@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785347211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VeiwwUTVEJhKZbSrlTRImNB7jVC969Sz3ID5XycdSNM=;
	b=axa4NubprqeOEnt2YufAhhzXPySeW5jkEL9qeaP6IdZNtB+GALATKIPAYjN+AnBuKCurWX
	leQ+70m06F0RpdIdOl1VpYrVIN2f4+5u9CoUGfk2axGh2i+ISbzrz4t0NDz9KotRUjxJKc
	73RBbGIO0N5x+YJuPrJBvfg0UpM2IGk=
X-Gm-Message-State: AOJu0YxzKb2GMtt7I4TJ7jUTUWIbQn/WYblQJUpaQD1qxYKVjpPd2aDk
	558Km0fZANk/bg8g0RycuQvBnM2C3tg9JMB7Ih9wkcLIbE3mtXzXipvOaslWI9aDGmAxInWjAaX
	kBwQEQc4kJ4W7n39CtEftXYphP7jEzSy3UplPp+Lx
X-Received: by 2002:a05:6512:340b:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b2d9b5e246mr38229e87.8.1785347192415; Wed, 29 Jul 2026
 10:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-12-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-12-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 18:45:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzqXV7wmzevDdiezK+dbXYB-+SHOTu==_EiBrGpcekMSw@mail.gmail.com>
X-Gm-Features: AUfX_mxRkX-Zqid_e-BAuwcS03ps7VJdHqOkA3Ldb7q_0YRC6ZP02uwIv7QUnxo
Message-ID: <CA+EHjTzqXV7wmzevDdiezK+dbXYB-+SHOTu==_EiBrGpcekMSw@mail.gmail.com>
Subject: Re: [PATCH v9 12/16] KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_104654_690091_6EF7564F 
X-CRM114-Status: GOOD (  18.55  )
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

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Replace the VM argument with the pPMU used for event creation. The
> current caller still passes the VM's default pPMU, but this removes the
> implicit lookup from kvm_map_pmu_event() so later changes can map events
> against the pPMU selected for an individual vCPU.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index c5c505b6fc61..27db8877f96e 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -670,10 +670,8 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
>         return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
>  }
>
> -static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
> +static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
>  {
> -       struct arm_pmu *pmu = kvm->arch.arm_pmu;
> -
>         /*
>          * The CPU PMU likely isn't PMUv3; let the driver provide a mapping
>          * for the guest's PMUv3 event ID.
> @@ -725,7 +723,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>          * Don't create an event if we're running on hardware that requires
>          * PMUv3 event translation and we couldn't find a valid mapping.
>          */
> -       eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
> +       eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
>         if (eventsel < 0)
>                 return;
>
>
> --
> 2.55.0
>
>

