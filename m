Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6193CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQDHOplHUGv77hfd0oQ4n9tB9YO6bJ+Eq2WryDRF/Ms=; b=tu8JKXWW3R+fwm9jEXy0kInZK+
	Hzj/A7sZg6KVL4t4uw/yUrU7tMVHmd0vTKqaDNDO6xEgu1bs2F7qL26d4dmoHbpLQsaFRolPme9aB
	Rwp8npS3LmbYF/K4BWi1RmLfHoy5nTf3zHSUeCHEuisiyAQh5vRkXaUZszT5Af4iHmlu6L5lPcq3A
	T32w6xwjm6bhg2m8JzVuRLTt8JH5F0CrhrytYdnzQOIkmjd1Gl96WI/xJdBB9RA2b/GSzeNnAXKeJ
	llyh+lDSNa6VSNqIgbitblqw9r61Ni+4oYdQsHAS6fIqE0JkkiW/aBFL86IjHzdn+CLvWPybOyyTl
	eFKallUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMEy-00000000LHR-1H7F;
	Thu, 15 Oct 2026 14:15:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMEx-00000000LH9-0z1o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:15:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EA14601EF;
	Thu, 15 Oct 2026 14:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5F61F000C4;
	Thu, 15 Oct 2026 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073726;
	bh=hQDHOplHUGv77hfd0oQ4n9tB9YO6bJ+Eq2WryDRF/Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X4imKHXQU3mX+G+97i7d9YoI/2vFiBhh0JQYSQKFsOwO2eicg91lXDJH8PiED+5er
	 limSY8Ce5fa1JofCh0RSo/iBQlHhnJL210tZ2mEedz5IdhT554maeW0L8YVY7YK0iJ
	 RVwkA5/IuVdekUztByKBWESMPgDPpX62VXUZaMVV4GtMai4jpWCFrXmYuZ5u1EVQOq
	 zvcV2RJRV+GE9Yz/PxxQ6Wae449E+F1AeUGPQg+0S01CihYkNPiqaaIwBZABKxeWz0
	 kIiUxZ6Q97Y4HpfZFr+qHYEvNTU4+RZ7XwQkCUfFo53Qy12FzR8zl9W6D2lp0iyrEn
	 +FCQpqL0l6xRg==
Date: Thu, 15 Oct 2026 15:15:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 03/28] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
Message-ID: <atDa-BSF3RMzJSdE@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-4-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-4-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:05:58PM +0100, Alexandru Elisei wrote:
> Add a new configuration option that will be used for KVM SPE emulation.
> CONFIG_KVM_ARM_SPE depends on the SPE driver being loaded because:
>
> 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
>    and that will be used by KVM to emulate SPE on heterogeneous systems.

I guess e.g. big.LITTLE?

>
> 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
>    level.
>
> The option will become user selectable after SPE support in KVM is
> implemented.
>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

With nit addressed the redundant dependency removed (both noted below),
LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/kvm/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 449154f9a485..fece4c02b97c 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -103,5 +103,14 @@ config PKVM_STACKTRACE
>  	  If unsure, or not using protected nVHE (pKVM), say N.
>
>  endif # NVHE_EL2_DEBUG
> +
> +config KVM_ARM_SPE

NIT: Nothing else in the file has the _ARM_ prefix, so is that redundant
here?

> +	bool
> +	depends on KVM && ARM_SPE_PMU

I think KVM should be removed here, this is within an 'if KVM' block
already, and nothing else here depends on it either so not a convention.

> +	default n
> +	help
> +	  Adds support for Statistical Profiling Extension (SPE) in virtual
> +	  machines.
> +
>  endif # KVM
>  endif # VIRTUALIZATION
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

