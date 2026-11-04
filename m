Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPAVrIMJ;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=r+Yfsyxv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7veRrT8eWAeBKJG1Q0lJd1x2zWh4g6/qHWjAZxV9nEY=; b=zPAVrIMJax31RdXmJ0bNXH2tt7
	UuWLJ9VlwqcLYL1wf59HVxozk/wKqlE82QpPgzcqFSIk6LwK05qD93tfigHR3C78L6i6Zfqfo67kP
	5JO8DbqJ42zsP1OwyXqclb2wHwgka3/EdpQP0Gzlf7AvjyClRogLSQs4I8TYu5wlqvEe4PrEr6NRZ
	UBjJdzWDXeIfCNUsaCzABPus+MtCGbfJVHiprIo2piI+JgtcgR7mIWUpeiD09JmzWeR9UptHimG7Z
	uTYMUZBkHB/WisXo+BLoeiYhN14MvIVTAa9X11iRwzd0dTGF3E5a1guxldsH1O3qmD3+7vCBKJtqV
	hhoagQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYDq-00000005020-3NMo;
	Wed, 04 Nov 2026 10:28:03 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYDo-0000000501V-3DWS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793788087; x=1825324087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wlmr7Aue0wdrqc12Gk8qvFNC+7tKFeGN9AZd173LYv8=;
  b=r+Yfsyxv3ZsU93L0t1aRj13omNo9csRJCtFNLlspdXm2no6h1VQs67Bv
   p1vUqJPTqGGfYyeUTH3DiGsg3QeYu0lzn+MZ222TrS6vRUyv2af2fqV0V
   j/azbsjvK3y8h7+JjmWUe3+LykektFY+y7xbh+oe88dGc/h23erdD7XxY
   N3NtnAGJf5XOPa0HeUNZXW38QrT0XTOC1/jJX7qcZVvow9u3LKEaebYJ0
   dOd/yE1oQMOuAB1UaysJNlSEOIXjq/4IY6ITG8pAjAmf2klq9BN+DWuBP
   NYEnt7GdTEqTyZuoZRpc79rARdiaRc3yBtJC3mY7F1ypOYlgjROIqrCYg
   w==;
X-CSE-ConnectionGUID: U+Bq3iDNQIuY8GLW8+wSQQ==
X-CSE-MsgGUID: ksdK95fGQp+2yXcLU/NxRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="246776614"
X-IronPort-AV: E=Sophos;i="6.27,195,1786978800"; 
   d="scan'208";a="246776614"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:28:05 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BB1AF1002B9D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:27:58 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 6F899C00836
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:27:58 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.61.160])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id A62E61800599;
	Wed,  4 Nov 2026 10:27:50 +0000 (UTC)
Date: Wed, 4 Nov 2026 19:27:49 +0900
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
Message-ID: <ausIgejq7Io9VjZL@FCCLS0092175.localdomain>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-4-steven.price@arm.com>
 <ausEnXB1TE_moI0E@FCCLS0092175.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ausEnXB1TE_moI0E@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_022801_356291_473A67C6 
X-CRM114-Status: GOOD (  25.62  )
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

On 11/04 19:23, Kohei Enju wrote:
> Hi Steven,
> 
> On 11/02 14:12, Steven Price wrote:
> > Check if the RMI support is sufficient for using in KVM. Specifically, we
> > will only support creating realm VMs when KVM is set to 'rmm' mode.
> > 
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> >  arch/arm64/kvm/Kconfig | 1 +
> >  arch/arm64/kvm/rmi.c   | 4 +++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index cecea0820e52..d067063a3686 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -34,6 +34,7 @@ menuconfig KVM
> >  	select GUEST_PERF_EVENTS if PERF_EVENTS
> >  	select KVM_GUEST_MEMFD
> >  	select KVM_GENERIC_PRE_FAULT_MEMORY
> > +	select ARM_RMM_RMI
> >  	help
> >  	  Support hosting virtualized guest machines.
> >  
> > diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> > index 5ecc8b349869..9d118768550d 100644
> > --- a/arch/arm64/kvm/rmi.c
> > +++ b/arch/arm64/kvm/rmi.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2023-2026 ARM Ltd.
> >   */
> >  
> > +#include <linux/arm-rmi-cmds.h>
> >  #include <linux/kvm_host.h>
> >  
> >  #include <asm/virt.h>
> > @@ -12,7 +13,8 @@ void kvm_init_rmi(void)
> >  	if (kvm_get_mode() != KVM_MODE_RMM)
> >  		return;
> >  
> > -	/* TODO: Check if the RMI is available */
> > +	if (!is_rmi_available())
> > +		return;
> 
> From an admin/operator's perspective, kvm_rmi_is_available would
> silently remain FALSE in either of the following cases:
> - kvm-arm.mode=rmm is set, but RMI is not available for some reason.
> - RMI is available, but the admin forgot to set kvm-arm.mode=rmm.
> 
> So I think it would be useful to emit diagnostic messages for these
> cases, for example:
> 
> if (!is_rmi_available()) {
>     if (kvm_get_mode() == KVM_MODE_RMM)
>         pr_info("Realm VM support is disabled because RMI is not available\n");
> 	return;
> }
> 
> if (kvm_get_mode() != KVM_MODE_RMM) {
>     pr_info("Realm VM support is disabled. Use kvm-arm.mode=rmm to enable it\n");
> 	return;
> }

Sorry, the indentation got mangled :(

> 
> Thanks,
> Kohei

