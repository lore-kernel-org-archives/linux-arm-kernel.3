Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EB8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94gmH3Aii328T2LxIisJLrjP7N1/DcobbLQGmKRXwlI=; b=zcDtWpci+iEIvupcjFpzEq8xdJ
	GKJIjit5z3oT9mS6gqZZEiP/JkkjD2Uj4qXWDC3lkTHcxnEfOwC5MH+mt3NXVwdiFaoDLSoxZwD9+
	FFPavBo4rJa8Fa2koCldaN6fAkZzbzhgcIs1q1rBdp3w2YzAIlRX+nxJiu7Taeq91vFkhAjKC8RHs
	S4Z7HXT9zIhjOk8bBJeRPp4aWlQG0AlV2npb26wvXuXuPle2GsRVi8D6zScj99EdV9NgvJmiEujGe
	FeDjdBkJEHb6HFFFRQG4GB6vOfFNeJJbzSZ4EAcmYz6ECrLuWhYbiZKL6r0IQ1fqS+oDIgb2luPlv
	YkwgLuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh54U-0000000EyHP-00s3;
	Tue, 07 Jul 2026 12:38:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh54Q-0000000EyH1-3zYv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:38:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B323C16F2;
	Tue,  7 Jul 2026 05:38:31 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29BB53F7B4;
	Tue,  7 Jul 2026 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783427916; bh=7EEsxew6Es02TjhE1aeKmN/R1EhwCRRSzzS0AJVGpTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ievhJzwQxPfTHhO74oWhdzyr6fOXat6wKNTrqB5pbhq5Rd3N1jUpOnw6Q8gKAaoEe
	 QZBMFUe5Uowmxp+eD/SUlKnniKay0rXFiGQyOwS4O4oCGn8129p1WpsY0v194k5iMa
	 tnvKLSmIh5yFq6KT9gpSCR2AwS2Li0qE8O8B/idc=
Message-ID: <d127e008-00bb-4557-b852-12eb4bdb41ba@arm.com>
Date: Tue, 7 Jul 2026 13:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] virt: coco: arm-cca-guest: Rename TSM report
 source file
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260707081351.1680209-1-aneesh.kumar@kernel.org>
 <20260707081351.1680209-5-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260707081351.1680209-5-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_053839_178934_4AEBA868 
X-CRM114-Status: GOOD (  18.21  )
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

On 07/07/2026 09:13, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/virt/coco/arm-cca-guest/Makefile                    | 2 ++
>   .../virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c}  | 6 +++---
>   2 files changed, 5 insertions(+), 3 deletions(-)
>   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (97%)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..778146148515 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-y += arm-cca.o
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> similarity index 97%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
> index d05acddf6c4e..0c9fb61a28f1 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> @@ -184,7 +184,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>   	return ret;
>   }
>   
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>   	.name = KBUILD_MODNAME,
>   	.report_new = arm_cca_report_new,
>   };
> @@ -205,7 +205,7 @@ static int __init arm_cca_guest_init(void)
>   	if (!is_realm_world())
>   		return -ENODEV;
>   
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
>   	if (ret < 0)
>   		pr_err("Error %d registering with TSM\n", ret);
>   
> @@ -219,7 +219,7 @@ module_init(arm_cca_guest_init);
>    */
>   static void __exit arm_cca_guest_exit(void)
>   {
> -	tsm_report_unregister(&arm_cca_tsm_ops);
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
>   }
>   module_exit(arm_cca_guest_exit);
>   


