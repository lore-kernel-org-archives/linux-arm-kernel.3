Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B83CFA773
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLITRhok25tkEJqOhFpmjgfHxigOgpBDTIjHKBmgH00=; b=QVPy6Z7ZEjedojfIF7ZARfVkhG
	Fzb2zZ12trXkuCjoNEpskrVXx+JO9CFduP45BTSlewPfwWSH+/mK4L0wNC2xNPBbbhIi+N6PAZMRB
	RHn8IXdpknLSD7tkKQ9lUvHtz0CqFt2Y5j2BUf+XX1tYrmUKqLVtyBH1htCaqH7wWZGH/3pJkDOIH
	cxoUNhYwTkWxf7SBKETnffttRiDcGQRZi+2oQWtE0ckjzVAqw5GvqOL/UVlYNj0+8/fVOYoCMub25
	xJJBkgCDVFkLt7zfbFAlp6mjeTFCaJUdTnBg+ZjboTfdgCBgSHi6qJtW8B+URnSAYj60DVFtg3L0V
	enPSVaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOh1-00000008FnH-35qN;
	Fri, 21 Nov 2025 10:48:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOgz-00000008Fmk-1J5E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:48:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dCX3y3zXdzJ46bL;
	Fri, 21 Nov 2025 18:47:42 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 896481402EF;
	Fri, 21 Nov 2025 18:48:29 +0800 (CST)
Received: from localhost (10.122.19.247) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 21 Nov
 2025 10:48:28 +0000
Date: Fri, 21 Nov 2025 10:48:27 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
	<conor@kernel.org>, <linux-arm-kernel@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Will Deacon <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	<wangyushan12@huawei.com>
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
Message-ID: <20251121104827.00005033@huawei.com>
In-Reply-To: <a6fff5b6-7e7f-4883-b905-500d55dbf21e@infradead.org>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
	<aR9QRuUigBsxxelm@arm.com>
	<20251120-ruined-liability-9ecbf53affd1@spud>
	<669d4bbb-4011-493c-b056-34e682a1ac26@infradead.org>
	<aR-KxRIDvGNlW2jy@arm.com>
	<a6fff5b6-7e7f-4883-b905-500d55dbf21e@infradead.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_024841_644948_500B220F 
X-CRM114-Status: GOOD (  25.75  )
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

On Thu, 20 Nov 2025 15:25:46 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 11/20/25 1:40 PM, Catalin Marinas wrote:
> > On Thu, Nov 20, 2025 at 12:13:10PM -0800, Randy Dunlap wrote:  
> >> On 11/20/25 11:29 AM, Conor Dooley wrote:  
> >>> On Thu, Nov 20, 2025 at 05:30:46PM +0000, Catalin Marinas wrote:  
> >>>> On Wed, Nov 19, 2025 at 07:08:27PM +0000, Conor Dooley wrote:  
> >>>>> index 09aec4a1e13f..ac223e627bc5 100644
> >>>>> --- a/lib/Kconfig
> >>>>> +++ b/lib/Kconfig
> >>>>> @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >>>>>  	bool
> >>>>>  
> >>>>>  config GENERIC_CPU_CACHE_MAINTENANCE
> >>>>> -	bool
> >>>>> -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >>>>> +	def_bool y
> >>>>> +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >>>>> +	depends on ARM64  
> >>>>
> >>>> That's what we do if GENERIC_CPU_CACHE_MAINTENANCE depends on some arch
> >>>> code but that's not the case here. GENERIC_CPU_CACHE_MAINTENANCE is an
> >>>> alternative implementation that an arch can select if it does not
> >>>> provide its own. I find the current code without the above patch better.  
> >>>
> >>> Right, I am going to leave it as-is for now then. That's both you and I
> >>> (and presumably Jonathan) finding the current form more natural. Sorry
> >>> Randy!  
> >>
> >> Thanks. I tried.
> >>
> >> I still say that it makes no sense for something generic
> >> (GENERIC_CPU_CACHE_MAINTENANCE in lib/Kconfig) to inform the
> >> config system that the config has something $ARCH-specific
> >> (ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION).  
> > 
> > Yes, that's not great either but the solution with the GENERIC depending
> > on ARCH does work since there's no actual dependency between them.
> > 
> > As an alternative, I'm happy for arm64 to select both the ARCH and
> > GENERIC options if you think that works better.
> >   
> 
> Yes, I think that would be much better.
> Thanks.
> 

I'm fine with that as well (was where we were in earlier versions).
I'm offline for 10 days from tomorrow, but wangyushan +CC has been heavily
involved in this series throughout if we need to test anything etc.

For a patch that is basically just (this to me seems fine to squash
as well if that is easier)

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>


diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 893e0af0bc51..b4507eeabc4c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -20,6 +20,7 @@ config ARM64
        select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
        select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
        select ARCH_HAS_CACHE_LINE_SIZE
+       select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
        select ARCH_HAS_CC_PLATFORM
        select ARCH_HAS_CURRENT_STACK_POINTER
        select ARCH_HAS_DEBUG_VIRTUAL
diff --git a/lib/Kconfig b/lib/Kconfig
index e11136d188ae..2923924bea78 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -544,7 +544,6 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION

 config GENERIC_CPU_CACHE_MAINTENANCE
        bool
-       select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION

 config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
        bool

If not I'm guessing no one will mind too much if we tidy this up post or
late in merge window.

Thanks,

Jonathan



