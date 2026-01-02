Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6265FA373C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sNsz3nStghYSzY+sXXm0yt/UqQQAPm0N+js139ygxI=; b=JZDw8XXsmB5J9g1Wbk19F41d2o
	MccBWnwwAfzLaj6awzzUl9eOtv2Eh4rrgxi+16hBOUGZTzEDTFnscZnZTlDIFeEcNDgeJOxTmemOp
	s2zfm7CyB87x5PS08XresNVBG7tKJM7eIApB9xoYrM+4dPX/KJgn7nWryEEDdmO1bDTG3NwhaFoLu
	mrbg9n9ngqanm56e297GO/QbqOEgXwfkX4rlbZKfTNzItsXmfvc0V+AFDRlQggsm78FBLelzjazQg
	JYHngX2nLky8aTNU+rdYfFJ/lpX8Qui3RhTlFq9NJ6SSCQcRYBUpMC9o6d0VUE1zZcrmBeIFEQsV+
	g+ohvpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbe1b-00000008B4s-3cbM;
	Fri, 02 Jan 2026 12:12:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbe1Z-00000008B3x-0Z25
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6sNsz3nStghYSzY+sXXm0yt/UqQQAPm0N+js139ygxI=; b=eWZ6M1LxOy7uZXqanWlIQGUAO+
	MOCPLQXa7avZ/2SNw8YuSx1jkWfO8OQ2ROHAeH7unCs2xIfsNw/4UUpt+9+QVaCduJDkuggJPHLqQ
	+327Ef6QUxiHHK2+tyxckPNJbeSqfqB6lFY8F/tWC93NKL95phJOb//iOLMJMQJmVuTwom+mEt04b
	5Jm12IMW8W3uamxmcV+Go/CNG2VMe2q6mX+OUHl+3P1DTg2N6vBeNSeV7P/d//HXpT0+RBtxTu/kl
	GvnzBlqGY0Vl6AzymRFKx//5iAs1ik1f8ldQMYgjme1eLHQ5KGd/U/ZHPOLaXzgvaQ1tX+Vf6IOu9
	+Nmf+7Aw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vbe1F-000000005x6-2g7a;
	Fri, 02 Jan 2026 12:12:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vbe1A-00000000523-3D6T;
	Fri, 02 Jan 2026 12:12:32 +0000
Date: Fri, 2 Jan 2026 12:12:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 3/4] ARM: remove support for highmem on VIVT
Message-ID: <aVe2MH0TUsobPaKL@shell.armlinux.org.uk>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-4-arnd@kernel.org>
 <20251219171412.GG254720@nvidia.com>
 <513078d3-976a-4e6d-b311-dcfcfea99238@app.fastmail.com>
 <aUtPRFdbpSQ20eOx@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUtPRFdbpSQ20eOx@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_041257_197332_6DA665D4 
X-CRM114-Status: GOOD (  21.22  )
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

On Tue, Dec 23, 2025 at 10:26:12PM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 09:34:33PM +0100, Arnd Bergmann wrote:
> > On Fri, Dec 19, 2025, at 18:14, Jason Gunthorpe wrote:
> > > On Fri, Dec 19, 2025 at 05:15:58PM +0100, Arnd Bergmann wrote:
> > >>  arch/arm/Kconfig                    |  1 +
> > >>  arch/arm/configs/gemini_defconfig   |  1 -
> > >>  arch/arm/configs/multi_v5_defconfig |  1 -
> > >>  arch/arm/configs/mvebu_v5_defconfig |  1 -
> > >>  arch/arm/include/asm/highmem.h      | 56 ++---------------------------
> > >>  arch/arm/mm/cache-feroceon-l2.c     | 31 ++--------------
> > >>  arch/arm/mm/cache-xsc3l2.c          | 47 +++---------------------
> > >>  arch/arm/mm/dma-mapping.c           | 12 ++-----
> > >>  arch/arm/mm/flush.c                 | 19 +++-------
> > >>  9 files changed, 16 insertions(+), 153 deletions(-)
> > >
> > > This looks great, but do you think there should be a boot time crash
> > > if a VIVT and HIGHMEM are enabled, just incase?
> > 
> > Do you mean in the common code or just for Arm?
> > 
> > We could use the Arm specific cache_is_vivt() macro, but it feels like
> > the 'dpends on !CPU_CACHE_VIVT' Kconfig check I added is both
> > safer and simpler.
> 
> Okay, so maybe I'm asking if !CPU_CACHE_VIVT then the kernel fails to
> boot on vivt systems, maybe it already does?

The cache modes (CPU_CACHE_xxx) are (were) selected by the processor
config entries. Not having the correct processor support built in to
the kernel will cause a boot failure.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

