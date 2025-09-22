Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C141CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y9nRJZjn7UQXQcYajKsmiFsdi64GekNX0k6uo49A+Y=; b=s0XxtO0bYipQLbr7+N7jrswalR
	l4HlnejW/kEg53NgSpLWPWQqbH3d+TWB4+WnlCTcfxOtK8UDlTDSH3Efi2Xf98cX7h7m/s683OX1k
	cCnOhgCzBjjGeD3GfcEsEjfqBjHlGa8epkjqqtvFsAzIb8Dc3r4LiPusn1plVAE4NqzmtEHkreIvX
	qjqeoDD5Us6L/A6846ZZKKJrcYiFQLPcLKpYF4wq2v0QIIv5gHjWlPVBrRUrx4AWl7gR+PXdkX/Nt
	XoswgaHSn9dikl0h0B/tGsLachPToPf36DxjE+CpH8cmK1ysgGcmf+e4FFGZOXP/7FPSpAS4UZBlQ
	BVZ3KasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lVr-0000000BGgD-1xTu;
	Mon, 22 Sep 2025 18:43:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lVq-0000000BGfy-3lEa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 18:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F253601ED;
	Mon, 22 Sep 2025 18:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36008C4CEF0;
	Mon, 22 Sep 2025 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758566625;
	bh=hvo9whrU6Oe08PtPIH2oc+mLj8QJ5uC8qV5k/Mjiz8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=moLJzsOWRr8vIRDkJ7j/azsOpKAfKWNvEmKAUaHVLd7rSG4XJkgFU+s6whwI3sjel
	 C9EE1spuHM2yOLUdoeDgTiYO31INGIEJ2KxMDy03bWzdW/uaFjsqcrY2jX2CWwFRCr
	 Uu1hf/Eds2tAnx3oKLrD1gdAeBQDS547Y0R2Ad9XBkH8FsEvoMQMww3PNS/Jk8/5eR
	 JnTEMkAZYldEur7UyQZ8VQrXgpzUa1kcRJXyR7RkTa/MNJTkgfDgMvmMjKl/1ezkft
	 EY2PO84e/1HbUE5Nm4qjJYR+JCJQHteKSHlg2j2jRIlkhMNgv2PZgJr15oyT/ToCgi
	 TQfnps53dLxXw==
Message-ID: <24bf4cd9-c992-463a-a17d-0a828c16f8f0@kernel.org>
Date: Mon, 22 Sep 2025 20:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/26] irqchip/apple-aic: Drop support for custom PMU
 irq partitions
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20250922082833.2038905-1-maz@kernel.org>
 <20250922082833.2038905-23-maz@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250922082833.2038905-23-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22.09.25 10:28, Marc Zyngier wrote:
> Similarly to what has been done for GICv3, drop the irq partitioning
> support from the AIC driver, effectively merging the two per-cpu
> interrupts for the PMU.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


>   drivers/irqchip/irq-apple-aic.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
> index cb8b6f40ce8d3..6305d25b9e77b 100644
> --- a/drivers/irqchip/irq-apple-aic.c
> +++ b/drivers/irqchip/irq-apple-aic.c
> @@ -578,16 +578,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
>   	}
>   
>   	if ((read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & (PMCR0_IMODE | PMCR0_IACT)) ==
> -			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
> -		int irq;
> -		if (cpumask_test_cpu(smp_processor_id(),
> -				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))
> -			irq = AIC_CPU_PMU_P;
> -		else
> -			irq = AIC_CPU_PMU_E;
> +			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT))
>   		generic_handle_domain_irq(aic_irqc->hw_domain,
> -					  AIC_FIQ_HWIRQ(irq));
> -	}
> +					  AIC_FIQ_HWIRQ(AIC_CPU_PMU_P));

Probably one of the most confusing diffs for a change that's actually 
fairly simple that the diff algorithm generated! I was only able to tell 
what's going on by looking at the file after applying this.





Sven

