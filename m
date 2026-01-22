Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE4D3EE74
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itxzz9rW6UB+hnH8/y6sDVbDURwfIpkRMPdEt5xG1SI=; b=O9+XBG5B6m9gsv7GKWr3NR7Q/G
	XwtODgtXo9Bd5Hcs/XxTjFVzN4lFYqSC8qYdZ7kyUMrmxTJE/3rnhsDtzWsCxE5v+0CMq/QSUnv3e
	BxY1nsUm0gIXygXpvCI240x81SGgGGJJFUE7Zt+h5fVHTfGwBZjx7dopIbqDIXAKJhKYII+fr2rVk
	7HnjQQOfFiiaKzpWkK9a5xJHKOi0bP0rUhzSBT8QSjcxfotlC6KLD272F8/XvokN4HCWyXWNl0Cbo
	75+Fcwtlswxc4xC0HunwFIvadZoebDDUdtk7aLbtxKbl8Y39nVSGkCh6RBy1cIUuzSK17IYLKWNcS
	0ftoDQjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwNp-00000007JL1-3cjO;
	Thu, 22 Jan 2026 15:14:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwNm-00000007JJp-43FC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:14:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF2B91476;
	Thu, 22 Jan 2026 07:13:50 -0800 (PST)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 050223F632;
	Thu, 22 Jan 2026 07:13:54 -0800 (PST)
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	oliver.upton@linux.dev,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yezhenyu2@huawei.com,
	xiexiangyou@huawei.com,
	zhengchuan@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v2 1/5] arm64/sysreg: Add HDBSS related register information
Date: Thu, 22 Jan 2026 15:12:28 +0000
Message-ID: <aXI-XHF2jz7arOwg@devkitleo>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <86wm3iqlz8.wl-maz@kernel.org>
References: <20251121092342.3393318-1-zhengtian10@huawei.com> <20251121092342.3393318-2-zhengtian10@huawei.com> <86wm3iqlz8.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_071403_044877_DD7D6E82 
X-CRM114-Status: GOOD (  19.81  )
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

On Sat, Nov 22, 2025 at 12:40:27PM +0000, Marc Zyngier wrote:
> On Fri, 21 Nov 2025 09:23:38 +0000,
> Tian Zheng <zhengtian10@huawei.com> wrote:
> > 
> > From: eillon <yezhenyu2@huawei.com>
> > 
> > The ARM architecture added the HDBSS feature and descriptions of
> > related registers (HDBSSBR/HDBSSPROD) in the DDI0601(ID121123) version,
> > add them to Linux.
> > 
> > Signed-off-by: eillon <yezhenyu2@huawei.com>
> > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > ---
> >  arch/arm64/include/asm/esr.h     |  2 ++
> >  arch/arm64/include/asm/kvm_arm.h |  1 +
> >  arch/arm64/tools/sysreg          | 28 ++++++++++++++++++++++++++++
> >  3 files changed, 31 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> > index e1deed824464..a6f3cf0b9b86 100644
> > --- a/arch/arm64/include/asm/esr.h
> > +++ b/arch/arm64/include/asm/esr.h
> > @@ -159,6 +159,8 @@
> >  #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)
> > 
> >  /* ISS2 field definitions for Data Aborts */
> > +#define ESR_ELx_HDBSSF_SHIFT	(11)
> > +#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
> >  #define ESR_ELx_TnD_SHIFT	(10)
> >  #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
> >  #define ESR_ELx_TagAccess_SHIFT	(9)
> > diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> > index 1da290aeedce..b71122680a03 100644
> > --- a/arch/arm64/include/asm/kvm_arm.h
> > +++ b/arch/arm64/include/asm/kvm_arm.h
> > @@ -124,6 +124,7 @@
> >  			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
> > 
> >  /* VTCR_EL2 Registers bits */
> > +#define VTCR_EL2_HDBSS		(1UL << 45)
> 
> I think it is time to convert VTCR_EL2 to the sysreg infrastructure
> instead of adding extra bits here.


Hi Marc, Tian,

Marc, IIUC the above was implemented by 
https://lore.kernel.org/all/20251210173024.561160-1-maz@kernel.org

Which was recently applied to next, and it its way to mainstream.

Tian, I think it's worth rebasing this patchset on top of the above.

BTW, I am working on using the feature enabled by this patchset on a new 
optimization, so please include me on any new release.

Thanks!
Leo

