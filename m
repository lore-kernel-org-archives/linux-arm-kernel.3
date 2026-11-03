Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ukn+Rev5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnMn7RCn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uys6yr4tcLiwlwRTacuVA59XDMV3OBaXJTAYNtM0vm8=; b=Ukn+Rev5UX6swffBKw21QVX1Ub
	9o5J54+/0dzzQTVpvxCa9s6gxFVvgsIVsdAunBbF7U4MM8ZuOHEnUo9dIEhmZY4UVbrECr8T0n88w
	Et8YIgDMEypMCLzJKU/Phca0fHM9j4P293oaBmWx2k69K2qakDLUB8UH64vGflTw1bt309juZkuwV
	rQ0ZoWBFEtpPGWjDxg/T4v51giPR7vdkWo/VGbIaz7fbDNUZ1ysnxBmCgaTbINiLJwLAeNXIIBq27
	0np1JSRi6Xy2NrBhx7+XcTOsf0RssjwQ56UzL67AfG16i2L+91vAj386C5El95lPC0+l6zu5zZ0nw
	x4Djgxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKJp-00000003XZP-1oPd;
	Tue, 03 Nov 2026 19:37:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKJn-00000003XYx-2ZtG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:37:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 398E0403DF;
	Tue,  3 Nov 2026 19:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907651F000C1;
	Tue,  3 Nov 2026 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734635;
	bh=Uys6yr4tcLiwlwRTacuVA59XDMV3OBaXJTAYNtM0vm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EnMn7RCncExjnU/CMRONUA4eU5A4fG2orJRsNdZOyZfTHU3KfzxCB96ykG2mta+iE
	 0kEXhOQOHIoUy4abkDxFcwcI2oGF/AfW1wjxZDUCWdSwpM1cM7SbrDzz0MhG8jP//0
	 l5+byyGP/p/zrAzujcnBuLmdK+vZl7BHzxPi5PKDiaHt0R0l+jTy4HrzOmf3dfoQ/c
	 PVu6NkcmSw8zEqkHVs9BYVoJDmCn7E5LJR5v/o0fAVK58fjzMnsiiy1FPuXVv59MS1
	 zdZdEA/C3JbbU9ILmKOQbfo6RuKeMxHavsIOBH+F6rZNffrb+qCGJyKKbpMGevfWUL
	 fwjxhTgeNCBBA==
Date: Tue, 3 Nov 2026 19:37:08 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 23/28] KVM: arm64: Add kvm-arm.ignore_spe_errata
 kernel parameter
Message-ID: <auoxMOkCaxjbjiJY@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-24-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-24-alexandru.elisei@arm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:18PM +0100, Alexandru Elisei wrote:
> Add a new kernel command line parameter, kvm-arm.ignore_spe_errata with the
> effect of ignoring any errata that might inhibit userspace from creating a
> SPE enabled virtual machine.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Hmm, is this for testing purposes somehow? If so it should say so, if not
then why don't we specifically detect the erratum and handle it by default?

Also you're explicitly addressing ARM64_ERRATUM_3023823, I think you should
explicitly mention this and explain what it is and why this is worth doing.

And in general - does it make sense to have a generalised 'ignore errata'?
Surely you either want to workaround the errata automatically or disallow
broken things?

And if you want to do the latter you'd want to be able to specify which?

In which case perhaps you could specify a comma-separated list of the
specific errata you want to workaround perhaps?

> ---
>  Documentation/admin-guide/kernel-parameters.txt |  3 +++
>  arch/arm64/kvm/spe.c                            | 10 +++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd2..2d91ce8e8c4b 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3299,6 +3299,9 @@ Kernel parameters
>
>  			notrap: clear WFI instruction trap
>
> +	kvm-arm.ignore_spe_errata=
> +			[KVM,ARM] Ignore SPE errata and expose SPE to guests.
> +

NIT: Should be in alphabetical order. Also this is very bare-boned, should
mention the erratum and the consequences of ignoring it.

If it's got security implications this should be mentioned here too.

>  	kvm_cma_resv_ratio=n [PPC,EARLY]
>  			Reserves given percentage from system memory area for
>  			contiguous memory allocation for KVM hash pagetable
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index ce68789d184b..3e82edc8be85 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -21,8 +21,16 @@ struct spe_pmu_entry {
>  	struct arm_spe_pmu *spe_pmu;
>  };
>
> +static bool ignore_spe_errata;
> +
>  static void kvm_spe_update_irq_level(struct kvm_vcpu *vcpu, bool level);
>
> +static int __init kvm_ignore_spe_errata(char *arg)
> +{
> +	return kstrtobool(arg, &ignore_spe_errata);

This will be an error if empty (e.g. just kvm-arm.ignore_spe_errata).

if intended, you should document that, otherwise you should handle an empty
input.


> +}
> +early_param("kvm-arm.ignore_spe_errata", kvm_ignore_spe_errata);
> +
>  void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
>  {
>  	struct spe_pmu_entry *entry;
> @@ -290,7 +298,7 @@ static int kvm_spe_set_spe_id(struct kvm_vcpu *vcpu, int spe_id)
>  		return 0;
>  	}
>
> -	if (spe_pmu->has_workaround_3023823)
> +	if (spe_pmu->has_workaround_3023823 && !ignore_spe_errata)

Small note, but seems odd for something that is called a workaround to
actually be indicating that a bug exists. Maybe 'has_erratum_3023823'? Will
comment on relevant patch obv.

>  		return -EINVAL;
>
>  	if (!try_module_get(spe_pmu->pmu.module))
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

