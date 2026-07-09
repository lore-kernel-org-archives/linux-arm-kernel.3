Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2026CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWyoAHxEMVV608jOrqYC2KsrlAxu8Ngw10LrEAoukTs=; b=4tmZxNltapbhD4pNN8oOTXwVWb
	pwtnA9LVldBH+bAzRHhUXBUCaBlybP/kVKZAj8YvmcfRWz+1HkWqA/JulFBE/B8c4rjRmn8QyOhZc
	ELVzD33nZ+/xizqfSiVDJ8EqSxePon6zhaQXVh2gwYjDMapOXTOHHmm9m9Gv5JvrjI+UbUORiOUew
	O6buouMWguLtYsX07hYcUiN61DMCp5Sj7dCHa/k7aYCyfGwPGZ+akSolYU6akjuvhE6eP8TDMJYEe
	1igaWm/b8FTqkmOQVAfJYDA30a8c2B+fe2LZ3BmRmg42j6+5pXi2pNv0CJ7zd13lpkd6Ht0PyAaxX
	QwXNDscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkmU-00000001jfC-0Ynk;
	Thu, 09 Jul 2026 09:10:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkmQ-00000001jdH-1812
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:10:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB8A225E9;
	Thu,  9 Jul 2026 02:10:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20CDF3F66F;
	Thu,  9 Jul 2026 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783588249; bh=RfO6vOxvlqI8v4oqXlailBZAaEFV4XfG1mAigaiftxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdycN/bKUzXJei67dfuvgObI+ubEd99X/hhUVqLAsyUaTd5InVPrLLRpJs7Nug8v6
	 MkBkf4v15ViLGh/u1jNarDYmoblbgoqi2YxYnINKbzpCpGtnAokxX+f8q72ornx378
	 LFM6DKglOD0vW96KxQxSmRAVpUIO6VdHdtBSfkrA=
Date: Thu, 9 Jul 2026 10:10:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, will@kernel.org, rppt@kernel.org,
	maz@kernel.org
Subject: Re: [PATCH 3/3] arm64/coco: Add pKVM as a CC platform
Message-ID: <ak9llch9yNkCEC4K@arm.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-4-smostafa@google.com>
 <yq5a1pemsmuj.fsf@kernel.org>
 <aivG1rEi3y4GN8kX@google.com>
 <yq5av7bnlrup.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5av7bnlrup.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_021050_406081_1E240520 
X-CRM114-Status: GOOD (  27.79  )
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

On Fri, Jun 12, 2026 at 08:37:42PM +0530, Aneesh Kumar K.V wrote:
> Mostafa Saleh <smostafa@google.com> writes:
> 
> > On Thu, Jun 04, 2026 at 02:29:00PM +0530, Aneesh Kumar K.V wrote:
> >> Mostafa Saleh <smostafa@google.com> writes:
> >> 
> >> > pKVM does support memory encryption, expose that to the rest of
> >> > the kernel through cc_platform_has()
> >> >
> >> > At the moment, all devices inside the guest are emulated which
> >> > requires its memory to be shared back to the host (decrypted), so
> >> > set force_dma_unencrypted() to always return true.
> >> >
> >> > Although, typically pKVM guests rely on restricted-dma-pools to
> >> > bounce traffic, with this change, it is possible to solely rely on
> >> > the default SWIOTLB for that (assuming the appropriate size is set
> >> > from the command line)
> >> >
> >> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >> > ---
> >> > This change is critical for the ongoing refactoring of the DMA-API[1]
> >> > that will break protected guests under pKVM with this patch. That is
> >> > due to this rework will make the state of the SWIOTLB and restricted
> >> > dma pools depends on the value returned by cc_platform_has()
> >> >
> >> > [1] https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/
> >> > ---
> >> >  arch/arm64/include/asm/hypervisor.h           | 13 +++++++++++++
> >> >  arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
> >> >  arch/arm64/kernel/rsi.c                       | 12 ------------
> >> >  arch/arm64/mm/init.c                          | 15 ++++++++++++++-
> >> >  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  3 +++
> >> >  5 files changed, 32 insertions(+), 14 deletions(-)
> >> >
> >> > index d66291def0f4..26fe9c3f22e3 100644
> > [...]
> >> > --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> >> > +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> >> > @@ -17,6 +17,7 @@
> >> >  #include <asm/hypervisor.h>
> >> >  
> >> >  static size_t pkvm_granule;
> >> > +DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
> >> >
> >> 
> >> Do we need EXPORT_SYMBOL on this? 
> >
> > I was not sure about that, all users of this are in tree, I saw RME
> > code have the EXPORT but did not know why?
> >
> 
> arm-cca-guest is one example. I was assuming is_protected_kvm_guest()
> would be a helper that could get pulled into various code paths via
> force_dma_unencrypted().

For now, the only callers of force_dma_unencrypted() I can see are in
kernel/dma/*, so we can skip the exporting.

-- 
Catalin

