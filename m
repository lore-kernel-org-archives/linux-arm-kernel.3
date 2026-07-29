Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D50C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7xKPnebnrnj3oQ7O4pCZSku+N29w0+f4UqiJMIJTas=; b=AHfNA24zewZuqbOsc1eQI0vb0S
	BDlJMHKdd2qc0A1EZ0jDkrCMISvxs2NeZyRD+HF7uQN/U6GddkriGgy8CCWApLr10mNQVuV4hJx9X
	dMNRq04D9YMVcy1HKsHJs7uoM6pikW/nqVjqy/y8OmRu2WbrQrpVfj+UMDJvcIMrZ7n2k431LET0C
	HBs9QTaxHr593ahDhIDkn74ApjBMVWS8nO439RFVvREmsK10FQRXv8g/LRzKrmUojPEwimXh7GMB3
	wfqpilOUr4e4ARBI9uivt+ekmc5Jb5x0k9YUvy0uxXQYrXwxbYXtrccT0P8cN1G+El7cwI11MMohr
	mMohNqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp76W-00000008XjV-0R4v;
	Wed, 29 Jul 2026 16:26:00 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp76T-00000008XiI-2UJR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:25:58 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrFHv/9mtAV19G9WdEUMt6TGAJ5Qx124CaS6CTNr2z+19j/lED2FIYRnhIcNPev1IdVTuZfwBXkq20WCrsnODyX@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785342354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7xKPnebnrnj3oQ7O4pCZSku+N29w0+f4UqiJMIJTas=;
	b=m3e3OM86UNfb6sCdvSz5lOZ/ZLQqKGlleSJyBbCyi+UgjNWRfQLAA34dIlNe7Np7bXJ2Xt
	zq6eE55jl8GGkdJbKIF6zGBj5dYnqrYXT9uQXToDLIQ9oT72hefgn9QEfaftpY+usaqPZ0
	A030ntCy6NkpFqUI5mrOHLSSWwzUkbs=
X-Gm-Message-State: AOJu0YyXGAezeLsvnV/10auwcEzRpa1Ic1j23u9tc9JXLz4T/uwgGSLk
	NI4p29XzUsuivjQ411jWznU64l5/Gy40X04+AQ8KTgQqdFpALSs3t4qltFNPjJwu4X5uUdkeUCs
	CIKPrcceHyXU/Aaym6m4p7bcaFeiDbnXECfmilnFh
X-Received: by 2002:a05:622a:411b:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-52b350e5b35mr1825161cf.5.1785342329701; Wed, 29 Jul 2026
 09:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-9-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-9-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 17:24:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy1O=Hnw16vKL813sCpjBV7j61jr+BU+9G6dvVePNSwAA@mail.gmail.com>
X-Gm-Features: AUfX_myMVHKAsG5Q9-sL8f-xMHSuN9ptYr1gLGLLFeAl95SgQeRj9hCI0TZ8ETs
Message-ID: <CA+EHjTy1O=Hnw16vKL813sCpjBV7j61jr+BU+9G6dvVePNSwAA@mail.gmail.com>
Subject: Re: [PATCH v9 09/16] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
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
X-CRM114-CacheID: sfid-20260729_092557_772734_670CB2C0 
X-CRM114-Status: GOOD (  20.53  )
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
> KVM relies on ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS as a system-wide
> precondition for PMUv3 emulation on affected Apple CPUs. A local CPU
> erratum is too weak for that: once the workaround is enabled, a late CPU
> that misses it may still be onlined.
>
> Make the workaround an all-early-CPU capability instead. The matcher is
> still local because it depends on MIDR_EL1, but the capability is only
> advertised if all early CPUs match. A late CPU that misses an advertised
> capability is therefore rejected.
>
> Although kept in the errata capability table, this capability describes
> optional trap support rather than a workaround required for safe CPU
> operation. A late CPU may therefore match it when the system does not.
> KVM treats an IMPDEF PMU as unimplemented unless the capability was
> finalized system-wide, so the additional trap support remains unused.
>
> Fixes: bed9b8ec8c71 ("KVM: arm64: Advertise PMUv3 if IMPDEF traps are present")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad



> ---
>  arch/arm64/kernel/cpu_errata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 1995e1198648..a5ae628204a1 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -1005,7 +1005,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>         {
>                 .desc = "Apple IMPDEF PMUv3 Traps",
>                 .capability = ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
> -               .type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
> +               .type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
>                 .matches = has_impdef_pmuv3,
>                 .cpu_enable = cpu_enable_impdef_pmuv3_traps,
>         },
>
> --
> 2.55.0
>
>

