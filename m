Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B1BCF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuCDx4s05cQdAOlVhp2Q3nlLMT+y4nMhSQsIMvIWmQk=; b=aGXyfQ3AoMz7Flgc00MiNs71Uo
	rO85iqBCg5GDf06vjRnC/C0LBkryUQPG3Hh3Kjy6V7dWiFSXXZsMljRUuzLE3uZuGtYqNd7Y5wHnq
	JAtxxn4eSDfvnCqpXLfiZvAX7HKKjkXlhEXTZSz/7gABbnNGHTZtO/tpyubQYLyyv2ET2DkO9G9Dp
	fMk0VWVqp9eoGhXEg7jok7hl4mhiY5c3KXAp5EjowUPeOCiqCD2A2mujcwKneRRv3EFYXKNotO5Y/
	E9Bf5e0k6S/UjHcQ0eVSCVcnnh437nUDW2ULTJaWCQkqB/IhaE7cAESfatjJtW31qLzFV6Q82AqRq
	1/Sg7moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL8f-0000000CTTP-1ieU;
	Mon, 26 Jan 2026 11:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL8c-0000000CTT1-0nJD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 11:52:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7C4339;
	Mon, 26 Jan 2026 03:51:59 -0800 (PST)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 207E73F5CA;
	Mon, 26 Jan 2026 03:52:04 -0800 (PST)
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
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
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v2 1/5] arm64/sysreg: Add HDBSS related register information
Date: Mon, 26 Jan 2026 11:50:35 +0000
Message-ID: <aXdVCla1wV3sfcJd@devkitleo>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f27c6ada-7994-4ef8-a10e-27d26ed5af0f@huawei.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com> <20251121092342.3393318-2-zhengtian10@huawei.com> <86wm3iqlz8.wl-maz@kernel.org> <aXI-XHF2jz7arOwg@devkitleo> <f27c6ada-7994-4ef8-a10e-27d26ed5af0f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_035210_346656_77AABD6B 
X-CRM114-Status: GOOD (  27.55  )
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

On Mon, Jan 26, 2026 at 10:21:42AM +0800, Tian Zheng wrote:
> 
> 
> On 1/22/2026 11:12 PM, Leonardo Bras wrote:
> > On Sat, Nov 22, 2025 at 12:40:27PM +0000, Marc Zyngier wrote:
> > > On Fri, 21 Nov 2025 09:23:38 +0000,
> > > Tian Zheng <zhengtian10@huawei.com> wrote:
> > > > 
> > > > From: eillon <yezhenyu2@huawei.com>
> > > > 
> > > > The ARM architecture added the HDBSS feature and descriptions of
> > > > related registers (HDBSSBR/HDBSSPROD) in the DDI0601(ID121123) version,
> > > > add them to Linux.
> > > > 
> > > > Signed-off-by: eillon <yezhenyu2@huawei.com>
> > > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > > ---
> > > >   arch/arm64/include/asm/esr.h     |  2 ++
> > > >   arch/arm64/include/asm/kvm_arm.h |  1 +
> > > >   arch/arm64/tools/sysreg          | 28 ++++++++++++++++++++++++++++
> > > >   3 files changed, 31 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> > > > index e1deed824464..a6f3cf0b9b86 100644
> > > > --- a/arch/arm64/include/asm/esr.h
> > > > +++ b/arch/arm64/include/asm/esr.h
> > > > @@ -159,6 +159,8 @@
> > > >   #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)
> > > > 
> > > >   /* ISS2 field definitions for Data Aborts */
> > > > +#define ESR_ELx_HDBSSF_SHIFT	(11)
> > > > +#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
> > > >   #define ESR_ELx_TnD_SHIFT	(10)
> > > >   #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
> > > >   #define ESR_ELx_TagAccess_SHIFT	(9)
> > > > diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> > > > index 1da290aeedce..b71122680a03 100644
> > > > --- a/arch/arm64/include/asm/kvm_arm.h
> > > > +++ b/arch/arm64/include/asm/kvm_arm.h
> > > > @@ -124,6 +124,7 @@
> > > >   			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
> > > > 
> > > >   /* VTCR_EL2 Registers bits */
> > > > +#define VTCR_EL2_HDBSS		(1UL << 45)
> > > 
> > > I think it is time to convert VTCR_EL2 to the sysreg infrastructure
> > > instead of adding extra bits here.
> > 
> > 
> > Hi Marc, Tian,
> > 
> > Marc, IIUC the above was implemented by
> > https://lore.kernel.org/all/20251210173024.561160-1-maz@kernel.org
> > 
> > Which was recently applied to next, and it its way to mainstream.
> > 
> > Tian, I think it's worth rebasing this patchset on top of the above.
> > 
> 
> Indeed, I've been following Marc's VTCR_EL2 patch and will rebase my
> changes on top of it.
> 
> > BTW, I am working on using the feature enabled by this patchset on a new
> > optimization, so please include me on any new release.
> 
> Sure, I'll make sure you're on the Cc list for the next revision.

Thanks!


