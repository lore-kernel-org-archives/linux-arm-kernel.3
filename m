Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D51C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97lpMmpGkBe+Mb14/P1tUQXFde+nOmpBzLtJXB8znb8=; b=gfovJuvNV9E99b2ufBcxmnAQ/+
	CQLIHzJx/eZsPkeXOthznZalRLIFj6bkxSSvD68zvBXdh9tIEt7+P8KVrpDSQf5EpCSdpj/xGK4/K
	+TrvlTUq/Lp0IODTRjuCrCxaUNt1Vs42Q6z75ZNo1F+b+/cS9gtnDE9UGfJhZiKkY2P4W63NmIJ1Y
	eSZ2ygdzHpnI8TpyuJWkUdfaVpvfWMbW7ICaGMQPpUpJYNhFxybeodjOH+5lRD7jeIf7l6eQMjTkP
	T+b4HgPsETK05fZs4Nl9cMplQw8FtnlcTJ4JzQevMMkEPM3iLFLRick2YXDAf/BF7Vf5+xP2I3Gp+
	kfSjrKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDF0-000000077cM-3JpX;
	Tue, 24 Jun 2025 23:39:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD4f-000000076L1-1EYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE8C25C0865;
	Tue, 24 Jun 2025 23:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC45C4CEE3;
	Tue, 24 Jun 2025 23:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750807748;
	bh=PqyAtI8+FqX4t197/rnCaW4yfc0U9GL7ohSipMR5UL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch5fOtcrbuGHpgMIfznlKR/7PXVy1rdVA+MqOQUrCkWeGivP8wHm/AnkMqGCjXpow
	 AYN10ajfS41HTxuck9gTlZMEHwtR2F1kVWyfN5h0M88PPBxA+445S0Ls5gjJgg2uwQ
	 laOhMDqvJGU9Q8kTT8LOkedBa+SHdhgJJYpMtCsImA52sQWjURIvqBaTazi35XOXmT
	 4ynj0c259FqHnpH6cwAq1BPavT0EQ131TlubCItpDoUTzrG+5yIlK/K8Yy3/iRdA/N
	 oxZlOUIZOqGWogm/iyTpqdPU/Fqky1MrAwGdhv+T7PSwvmdpgkypKj91xzLg7FMuYg
	 u7ql87d2XTvmg==
Date: Wed, 25 Jun 2025 02:29:04 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 1/2] firmware: arm_ffa: Change initcall level of
 ffa_init() to rootfs_initcall
Message-ID: <aFs0wHrcQPFFmZYz@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <20250618102302.2379029-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618102302.2379029-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_162909_413582_F2B3936C 
X-CRM114-Status: GOOD (  25.42  )
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

On Wed, Jun 18, 2025 at 11:23:01AM +0100, Yeoreum Yun wrote:
> The Linux IMA (Integrity Measurement Architecture) subsystem used for secure
> boot, file integrity, or remote attestation cannot be a loadable module
> for few reasons listed below:
> 
>  o Boot-Time Integrity: IMA’s main role is to measure and appraise files
>    before they are used. This includes measuring critical system files during
>    early boot (e.g., init, init scripts, login binaries). If IMA were a module,
>    it would be loaded too late to cover those.
> 
>  o TPM Dependency: IMA integrates tightly with the TPM to record measurements
>    into PCRs. The TPM must be initialized early (ideally before init_ima()),
>    which aligns with IMA being built-in.
> 
>  o Security Model: IMA is part of a Trusted Computing Base (TCB). Making it a
>    module would weaken the security model, as a potentially compromised system
>    could delay or tamper with its initialization.
> 
> IMA must be built-in to ensure it starts measuring from the earliest possible
> point in boot which inturn implies TPM must be initialised and ready to use
> before IMA.
> 
> To enable integration of tpm_event_log with the IMA subsystem, the TPM drivers
> (tpm_crb and tpm_crb_ffa) also needs to be built-in. However with FF-A driver
> also being initialised at device initcall level, it can lead to an
> initialization order issue where:
>  - crb_acpi_driver_init() may run before tpm_crb_ffa_driver()_init and ffa_init()
>  - As a result, probing the TPM device via CRB over FFA is deferred
>  - ima_init() (called as a late initcall) runs before deferred probe completes,
>    IMA fails to find the TPM and logs the below error:
> 
>    |  ima: No TPM chip found, activating TPM-bypass!
> 
> Eventually it fails to generate boot_aggregate with PCR values.
> 
> Because of the above stated dependency, the ffa driver needs to initialised
> before tpm_crb_ffa module to ensure IMA finds the TPM successfully when
> present.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index fe55613a8ea9..1a690b8186df 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2058,7 +2058,7 @@ static int __init ffa_init(void)
>  	kfree(drv_info);
>  	return ret;
>  }
> -module_init(ffa_init);
> +rootfs_initcall(ffa_init);
>  
>  static void __exit ffa_exit(void)
>  {
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

