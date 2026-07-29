Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78A6C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1pEajGXSVhfxT8yUIcDvk7DK4wsMWfpWBc33/y8RKk=; b=fecIVYFuQnxGbHpkqRQtR1g6bG
	9kY464kg4mNlZJKqbDwlW7AyF5agPVpfPW6nbvgpb3ZQmDsmVJK4P4OaJLcHs9Fo6V4Et07NmA7OV
	eoiGfo6QknbSh42Os6KHh41mdRarnHPLpPGoyRICZpQ2nHKeWRXm/eDr8V9e6zV3Br7aVHXztEs9m
	1VtVb/ZcbUCPbYk/IOmyJae1WM81dI2z0Cbavewpa9/1tCmijsZu8Q9utfJRQssfV5aBcLbz28gjR
	1W01amCKxdHRQXQ9Fr8xsrfcS+UAVbWwLvTJENT5IeZrsT4k9blYN0Lv7g+mhRqpL4m+AdXQYfB/r
	hKzIAR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6JW-00000008Qcq-34q7;
	Wed, 29 Jul 2026 15:35:22 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6JU-00000008Qbk-07lO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:35:21 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoqwbVX/giSdqykFL9k4CVa4zQ3ydsqm5Zc4DY7/kmpF29CAlegAC0H5fyyr78gzTvw03kWfiLq67ckDV/8tPw+@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785339316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f1pEajGXSVhfxT8yUIcDvk7DK4wsMWfpWBc33/y8RKk=;
	b=gyRizr4Zkyr2wC67m9Muce+NVsdz9m1fw+9fHI2RBtrrAH0K3U0OyGxFm3UTN1lVQz3DIi
	sFG9t3inew2yslT4+EebFoH0w2AwQWfLY5eagtdnSZSWgJJnxx3FrqsQa7rckF+SO/nQRt
	2wKANMfQ7dIG10htkeRdi4ObdQl034s=
X-Gm-Message-State: AOJu0YyJT75RdnqKrZ8gh5Q7VT6E5mWNi6ciJwaI0XHgSLMC7l6mUn8P
	/ekKDx/LvIMpxuq7WXXnLwj/JT4/GEg5JDcqRWb3hf7Rf/00cjfvHupZ84y4o0ILpvynLOdcwrF
	V6Au4c/avBprPZsQEnjezk5F2bZnlwW5/cdg8jANA
X-Received: by 2002:ac8:7dc4:0:b0:528:3186:5799 with SMTP id
 d75a77b69052e-52b35089d24mr744871cf.10.1785339304844; Wed, 29 Jul 2026
 08:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-5-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-5-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 16:35:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwMt8WWi_UcjET9a50v-U6oFpQm7dRbm75W1fDQOzxS1Q@mail.gmail.com>
X-Gm-Features: AUfX_mxu8rOr8bOtktjWjxfsoHK7AgqNHWBimIK3hru5I0gqCv99uMo4IFXvW2M
Message-ID: <CA+EHjTwMt8WWi_UcjET9a50v-U6oFpQm7dRbm75W1fDQOzxS1Q@mail.gmail.com>
Subject: Re: [PATCH v9 05/16] KVM: arm64: PMU: Keep implemented counter mask EL-independent
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
X-CRM114-CacheID: sfid-20260729_083520_347495_6FD49701 
X-CRM114-Status: GOOD (  16.82  )
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
> kvm_pmu_implemented_counter_mask() derives the counter count from
> kvm_vcpu_read_pmcr(). For a nested vCPU outside EL2, PMCR_EL0.N reflects
> MDCR_EL2.HPMN instead of the VM-wide counter count.
>
> Consequently, processing a PMU reload while the saved context is L2 can
> clear and fail to recreate state for counters reserved for EL2.
>
> Build the implemented counter mask from nr_pmu_counters instead. Keep
> the EL-dependent HPMN restriction in
> kvm_pmu_accessible_counter_mask(), where it controls guest access.
>
> Fixes: 600f6fa5c90c ("KVM: arm64: Let kvm_vcpu_read_pmcr() return an EL-dependent value for PMCR_EL0.N")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index b4b877f31097..5281d37634a0 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -317,12 +317,12 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
>
>  u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
>  {
> -       u64 val = FIELD_GET(ARMV8_PMU_PMCR_N, kvm_vcpu_read_pmcr(vcpu));
> +       u64 n = vcpu->kvm->arch.nr_pmu_counters;
>
> -       if (val == 0)
> +       if (n == 0)
>                 return BIT(ARMV8_PMU_CYCLE_IDX);
>         else
> -               return GENMASK(val - 1, 0) | BIT(ARMV8_PMU_CYCLE_IDX);
> +               return GENMASK(n - 1, 0) | BIT(ARMV8_PMU_CYCLE_IDX);
>  }
>
>  static void kvm_pmc_enable_perf_event(struct kvm_pmc *pmc)
>
> --
> 2.55.0
>
>

