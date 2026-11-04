Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3626E606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGcxnGZC;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=gz0yrFio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n4Ps0qSkWYG+d69oSo/IEmxe2Snl/v2IpZ6SrpXA0rw=; b=qGcxnGZCej/r38VQd0xr+fn3Zw
	GLwk+pcT8R4vBPpLlqVybkPlBzYaxefBEa9Yy3OvFEYqLx4ACRxxnRV48FsmNe4ytfeYLVcWfcyUO
	4kt0kHclRHEi6dtRDmEa0JT1mS9NnDMnrW4obVeMNNTUvskBP25WYABwcy//9yh3cKvBUj/MJsspY
	f/ISnQ9UImaAZ35S6UKzCoEIICiuhCzBKCgIFVOcyCIFRR+e5tSMvdGdMRL5jtPTNEfdTN3D3WAIm
	aPKDq7ZHwUKNfoO5Qylq/B/+wYFq7q4iSc5wp9FEwGrd9SOAB23VJekCRvGb13FAST1Fj0zmCUOYL
	VrvEkfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY9f-00000004zI5-3Vqz;
	Wed, 04 Nov 2026 10:23:43 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY9d-00000004zHY-1lXd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793787828; x=1825323828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NSpsS79pjRX5vqOjgAJTbb2PTGzrYCU3NoXWTJpFtPw=;
  b=gz0yrFio6se4NdgATw2Vxsvfrf3Cb8YvdDubH0OuyVseSjQQISpebUdH
   jHbuD/r0ZtxcB7ULvjnwQJ3awekH0MiWtAk2DvXItpqHhdbQl6XNMLl68
   sA7DKjLtGfq5xlmISVVbYOjmUOt1UjuKg9mlNIxmiikGk1dP3dasNBpTf
   lIClvl/ZubKncLugjSo2tgEHNeX6ysAhTkNK/kSKd53QWNMskt6iS8uY9
   p2vPC01cUdObZm85mzMKbcb7zQF85WvjKQ+ngOuS+mUSGMF6YjQ5k5mmn
   6urdQ7oDuiECDNZSzbrLq2JiI0u4+NpqgJ8QlA1fkvfAaX/ospakhLNHH
   Q==;
X-CSE-ConnectionGUID: IAeYP4IJTGmJKea91lyNgw==
X-CSE-MsgGUID: 41NYYyEWSDK/jzOpsc8Edw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="246776278"
X-IronPort-AV: E=Sophos;i="6.27,195,1786978800"; 
   d="scan'208";a="246776278"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:23:46 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 584081C1C724
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:23:39 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0900BC00234
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:23:39 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.61.160])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with SMTP id 12AB04059A5;
	Wed,  4 Nov 2026 10:23:30 +0000 (UTC)
Date: Wed, 4 Nov 2026 19:23:29 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 03/11] KVM: arm64: CCA: Check for RMI support at KVM init
Message-ID: <ausEnXB1TE_moI0E@FCCLS0092175.localdomain>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-4-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102141304.126883-4-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_022341_742484_D0947927 
X-CRM114-Status: GOOD (  22.17  )
X-Spam-Score: -2.1 (--)
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

Hi Steven,

On 11/02 14:12, Steven Price wrote:
> Check if the RMI support is sufficient for using in KVM. Specifically, we
> will only support creating realm VMs when KVM is set to 'rmm' mode.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/kvm/Kconfig | 1 +
>  arch/arm64/kvm/rmi.c   | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index cecea0820e52..d067063a3686 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -34,6 +34,7 @@ menuconfig KVM
>  	select GUEST_PERF_EVENTS if PERF_EVENTS
>  	select KVM_GUEST_MEMFD
>  	select KVM_GENERIC_PRE_FAULT_MEMORY
> +	select ARM_RMM_RMI
>  	help
>  	  Support hosting virtualized guest machines.
>  
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 5ecc8b349869..9d118768550d 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2023-2026 ARM Ltd.
>   */
>  
> +#include <linux/arm-rmi-cmds.h>
>  #include <linux/kvm_host.h>
>  
>  #include <asm/virt.h>
> @@ -12,7 +13,8 @@ void kvm_init_rmi(void)
>  	if (kvm_get_mode() != KVM_MODE_RMM)
>  		return;
>  
> -	/* TODO: Check if the RMI is available */
> +	if (!is_rmi_available())
> +		return;

From an admin/operator's perspective, kvm_rmi_is_available would
silently remain FALSE in either of the following cases:
- kvm-arm.mode=rmm is set, but RMI is not available for some reason.
- RMI is available, but the admin forgot to set kvm-arm.mode=rmm.

So I think it would be useful to emit diagnostic messages for these
cases, for example:

if (!is_rmi_available()) {
    if (kvm_get_mode() == KVM_MODE_RMM)
        pr_info("Realm VM support is disabled because RMI is not available\n");
	return;
}

if (kvm_get_mode() != KVM_MODE_RMM) {
    pr_info("Realm VM support is disabled. Use kvm-arm.mode=rmm to enable it\n");
	return;
}

Thanks,
Kohei

