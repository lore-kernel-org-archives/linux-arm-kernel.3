Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A2CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2xc5XImhz7yv/LH3/qlvK74Dh7JZH9qnVWu+RRjZYc=; b=KGAK6p7vC362E1Nrs3NM56/C42
	V3NZfvVEswGzFdEcYFFXAQB9iXiGBHKDLqjuwF+MBOxVE8ru0yXCG1dIAOx1qMg5Q4VIEOa4Thjrm
	Bc8qCZ+8nwaNmKqr52KZe603QsbB3qYbESkRCr0fgziObylLIXwCmwPkO5D5RNUjeNS9M2zfckEBy
	szQPRkxvdkk4rft1aPMYtyHwpT779YHJpibzzHO8v8kq8+5ylkTjFrMKlUJpV8I6rh9vIwQ21axK9
	eumBWHSgsT/rTX27AyawDhuYbYVQ11mSnKwlZigJbu34jE77ZSEaEYwlexPGZg79Xxz5xXzHU7sT6
	GjMaB/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxgJ-0000000EYpq-3DRV;
	Wed, 15 Jul 2026 11:21:39 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxgG-0000000EYob-1Hrp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:21:38 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrsySWJm2IFsZ9uKhk9xjoL/K7MKGF1iRorrvu0GghmfkqrrheAqWPyDPhMZpa0Xu0nwgAsZRC8xWA9bbagXI1c@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784114493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g2xc5XImhz7yv/LH3/qlvK74Dh7JZH9qnVWu+RRjZYc=;
	b=XC9VB1IcWiYrdLpIRhMUY4hcz4Bn5YfaYrLcR0FafgjPiZ5oxCMOZhbTdi1nak6gG2gv7c
	JnZS/uqRSqeHM8le6lhgJZU0yng94gZlPVawBp/WwU2M9y9O8zAoo9sxSoFa1vdoDD2zXP
	GwVjW23uIGGMRFYjSKCAynuZuLyY8qk=
X-Gm-Message-State: AOJu0YysobKTYg9nHs+AFUJ52SA7mQbAwM7YbbUPlCV1m0PhHdhabLbz
	19iY+Z67IwCdwCsbIN0mwremWIKJEs71pXggHh2+cEXzUwgmxA6/rPCmX7D3noe316xilZgLFPF
	eIr24waVgFEgXfVxd9YorieUraHgyDg/Qj60zpev6
X-Received: by 2002:a05:622a:1803:b0:51b:fd21:c077 with SMTP id
 d75a77b69052e-51d7bd8c7aemr25509781cf.21.1784114490270; Wed, 15 Jul 2026
 04:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-12-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-12-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 12:20:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwcz8T_RfgE46+xMKP_nz7Mi9rVCdhtnC2CbjtO1O5xCQ@mail.gmail.com>
X-Gm-Features: AUfX_mz1RLvH9JXOmIBy2vCcAXLuKzZgjvV33kiVgqna39ElIrdN_-tuf2FZors
Message-ID: <CA+EHjTwcz8T_RfgE46+xMKP_nz7Mi9rVCdhtnC2CbjtO1O5xCQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] KVM: arm64: Add a shrinker for pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_042136_557824_47D72460 
X-CRM114-Status: GOOD (  19.00  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Integrate the pKVM memory reclaim interface with the host's memory
> management subsystem.
>
> This allows the host to automatically recover unused memory fom the
> hypervisor's heap allocator when the host is under memory pressure.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..3dc2b9d2c322 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -122,6 +122,8 @@ static bool vgic_present, kvm_arm_initialised;
>
>  static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
>
> +static struct shrinker *pkvm_shrinker;
> +
>  bool is_kvm_arm_initialised(void)
>  {
>         return kvm_arm_initialised;
> @@ -2526,8 +2528,8 @@ static void __init teardown_hyp_mode(void)
>                 }
>
>                 free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
> -
>         }
> +       shrinker_free(pkvm_shrinker);
>  }
>
>  static int __init do_pkvm_init(u32 hyp_va_bits)
> @@ -2713,6 +2715,18 @@ static void pkvm_hyp_init_ptrauth(void)
>         }
>  }
>
> +static unsigned long
> +pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +       return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
> +}
> +
> +static unsigned long
> +pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +       return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
> +}
> +
>  /* Inits Hyp-mode on all online CPUs */
>  static int __init init_hyp_mode(void)
>  {
> @@ -2883,6 +2897,16 @@ static int __init init_hyp_mode(void)
>                         kvm_err("Failed to init hyp memory protection\n");
>                         goto out_err;
>                 }
> +
> +               pkvm_shrinker = shrinker_alloc(0, "pkvm");
> +               if (pkvm_shrinker) {
> +                       pkvm_shrinker->count_objects = pkvm_shrinker_count;
> +                       pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
> +                       shrinker_register(pkvm_shrinker);
> +               } else {
> +                       kvm_err("Failed to register shrinker for pKVM\n");
> +               }
> +
>         }

Sashiko might be onto something here. The shrinker goes live in
init_hyp_mode(), but kvm_protected_mode_initialized isn't set until
finalize_pkvm()...

Cheers,
/fuad

>
>         return 0;
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

