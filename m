Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43244606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbkfReep;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=epSR5qLo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=22l6K0vc3gDu3+b6teU5yRSj5i9d0PgiGkuk6VorJmM=; b=NbkfReeplexssEPQiOtX78sOBn
	1v8gtNhRtDa4jb36kK5OsgriJZUaH59Afz3bop9//GOHvmlSD/IzT1irGaXlarXJvNlegqO3M9vy6
	zujgX8LCVHNQwosHzaRy3jkXTpSm57V5GxfWmZjBjSnd+kadjewQSk/EPZ6sOuHtwdDzA+ISbnwUe
	hkyPiIh1Sxm4kZLUCDE099LQ8Uy0syCYpcdpi0LXdIINYwANtcrP5fu3k+aYTKm20ynwkteN+CkYI
	9s5KXvua+3iyaEIPohfKIMOeKmANMWFbkbGbfMrNdeymIwfU2IdX17fqQs+5+jQMbV2K+gfg3+/fg
	fys9FK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYWg-000000052fz-06X8;
	Wed, 04 Nov 2026 10:47:30 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYWb-000000052bT-2MgU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1793789245; x=1825325245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bX+/GudjC/kKj8X2pfBeTqIEajpanRfKGl78WAKq9sc=;
  b=epSR5qLozPMMuOhQtoyOoEs9MaFNI0OQ3x/bLaOfqh80FP0zRn4Ttv3s
   EmXLinUPQI2SksmsJ29A3k6uSDxV7cH8Vsg0gbUUKRW+xaiIHuXLyyYNi
   AJXo0zWaY3x5LiMLF7uyR8PNXyEgzB6HRYM0hy7CsNXgpyn5PC2fC+gbL
   rgmlyR+Y2SDaAv9P9lLhe4VdReV6cVoXNEPef7NzxAIKUcv7DyPW+19p5
   GHyB7aUfSsCC3KUVBAN17cie2lZmcQbdYj/XpcFwgp2bDNmVv6rZmOtCM
   qie9FX0KulyUyTGpx5AS0i24EmJUSixwz57/D14YLQ08GGgsvIZYV/HyP
   w==;
X-CSE-ConnectionGUID: iKk9goJ1R/uWPR8/PLCeHQ==
X-CSE-MsgGUID: F/cBx1aCQbOQv7J+vgzq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="248113154"
X-IronPort-AV: E=Sophos;i="6.27,195,1786978800"; 
   d="scan'208";a="248113154"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:47:23 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8F6F31C00640
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:47:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 409D91C000C7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 10:47:23 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.61.160])
	by az2nlsmom3.fujitsu.com (Postfix) with SMTP id 246CD100A6C9;
	Wed,  4 Nov 2026 10:47:13 +0000 (UTC)
Date: Wed, 4 Nov 2026 19:47:12 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 03/11] KVM: arm64: CCA: Check for RMI support at KVM init
Message-ID: <ausMpjow5k9wnO_Q@FCCLS0092175.localdomain>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-4-steven.price@arm.com>
 <ausEnXB1TE_moI0E@FCCLS0092175.localdomain>
 <ausIgejq7Io9VjZL@FCCLS0092175.localdomain>
 <415f6a96-9ac2-4256-a9b9-e976bd0e73a8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <415f6a96-9ac2-4256-a9b9-e976bd0e73a8@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_024725_869755_43D76BE2 
X-CRM114-Status: GOOD (  26.79  )
X-Spam-Score: -4.4 (----)
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

On 11/04 10:39, Suzuki K Poulose wrote:
> Hi Kohei
> 
> On 04/11/2026 10:27, Kohei Enju wrote:
> > On 11/04 19:23, Kohei Enju wrote:
> > > Hi Steven,
> > > 
> > > On 11/02 14:12, Steven Price wrote:
> > > > Check if the RMI support is sufficient for using in KVM. Specifically, we
> > > > will only support creating realm VMs when KVM is set to 'rmm' mode.
> > > > 
> > > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > > ---
> > > >   arch/arm64/kvm/Kconfig | 1 +
> > > >   arch/arm64/kvm/rmi.c   | 4 +++-
> > > >   2 files changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > > > index cecea0820e52..d067063a3686 100644
> > > > --- a/arch/arm64/kvm/Kconfig
> > > > +++ b/arch/arm64/kvm/Kconfig
> > > > @@ -34,6 +34,7 @@ menuconfig KVM
> > > >   	select GUEST_PERF_EVENTS if PERF_EVENTS
> > > >   	select KVM_GUEST_MEMFD
> > > >   	select KVM_GENERIC_PRE_FAULT_MEMORY
> > > > +	select ARM_RMM_RMI
> > > >   	help
> > > >   	  Support hosting virtualized guest machines.
> > > > diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> > > > index 5ecc8b349869..9d118768550d 100644
> > > > --- a/arch/arm64/kvm/rmi.c
> > > > +++ b/arch/arm64/kvm/rmi.c
> > > > @@ -3,6 +3,7 @@
> > > >    * Copyright (C) 2023-2026 ARM Ltd.
> > > >    */
> > > > +#include <linux/arm-rmi-cmds.h>
> > > >   #include <linux/kvm_host.h>
> > > >   #include <asm/virt.h>
> > > > @@ -12,7 +13,8 @@ void kvm_init_rmi(void)
> > > >   	if (kvm_get_mode() != KVM_MODE_RMM)
> > > >   		return;
> > > > -	/* TODO: Check if the RMI is available */
> > > > +	if (!is_rmi_available())
> > > > +		return;
> > > 
> > >  From an admin/operator's perspective, kvm_rmi_is_available would
> > > silently remain FALSE in either of the following cases:
> > > - kvm-arm.mode=rmm is set, but RMI is not available for some reason.
> 
> We could add a kvm_info() message for this.
> 
> > > - RMI is available, but the admin forgot to set kvm-arm.mode=rmm.
> 
> But not this one. We are additionally planning to move the RMM
> activation to gate on kvm-arm.mode=rmm. I will send out a patch
> soon.

I wasn't aware of that plan. In that case, this scenario will be
unreachable, so I have no concerns.

Thanks,
Kohei

