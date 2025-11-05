Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F9CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1kjwvsagYmMzNuZ/CDg1YQEqNnD94LL7vwY0lbT+zs=; b=0YNEZVV+F2OZxp+Vv5g8rjro1E
	0rFDP6Nch3K9JyxTIcEu5rclV17oQ76wtHP/R1H2sO3P2qxG7jbgq1uFkT0noNNt4OjZdUmj8hyRE
	J8zCY+xLXZpsa2WLxM56XJ7hrPNPsR6re3LmAz8sznx9UiD/xUT5Jx4hxrOVyZlnYJMdFyCypRsav
	sMZU8gPcCigTC27Ro0KNefHh4DeCMQkXsGLF8Ud+6r939Y6ryZfp+UPhZWMyf5xGN5eDHGcRq09pP
	DwQwznDvChHyr/L4iWe38yw32bPHCi7zHSYTxKh7Hgwnf/1gUjwyAV89F2aS7Bm9aT8vrNZo2poEO
	v9H54mdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg90-0000000E2C6-3HDL;
	Wed, 05 Nov 2025 16:13:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg8x-0000000E2AM-3OSm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:13:57 +0000
Date: Wed, 5 Nov 2025 17:13:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762359231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1kjwvsagYmMzNuZ/CDg1YQEqNnD94LL7vwY0lbT+zs=;
	b=DXD+P7YTv6IEX026kjt1F8YVXgIehfvUAI2O1StYFCuCM36Ax/oj2ROl9Escj22TUSaV4K
	XfImvsPVa/mQ0I7DEHuibSVfWzOlMz3M+KgDJSXVorRx5bGPSFHoqM9FycVPirDojnhUtq
	CbfssrMGHETE2LY0v3CA6uyP4tl9UFs8OzAbl8KW55+3K2/fgA63xL1Sl97z/Vk28JOo6U
	6Mgp/npslthxLyh+pFwUz6WNsceCFuwjKZjnO/eE/Z4H1ieVecgE0St4CC4+WoGo8HhH3T
	8wcbegPnMEc80NKfWlyWW2w+PimxAYcJeifVJHoT6Gus/rczh64e5m+aNhrDRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762359231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1kjwvsagYmMzNuZ/CDg1YQEqNnD94LL7vwY0lbT+zs=;
	b=uBx1FG075ggbcRA5/Y07q3BLRHNQ+GDoQ7eqUFqWhPI3pyBOqf8No/MhlVY8xo1RqAIQA2
	9qHdPiWxMev3tkDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 24/35] vdso/datastore: Allocate data pages dynamically
Message-ID: <20251105170813-070d53d9-aa2a-4cb6-bcda-3bce8c5be9c1@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
 <20251105153426.16228C13-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105153426.16228C13-hca@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081356_035334_35DD4F65 
X-CRM114-Status: GOOD (  25.01  )
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

On Wed, Nov 05, 2025 at 04:34:26PM +0100, Heiko Carstens wrote:
> On Tue, Oct 14, 2025 at 08:49:10AM +0200, Thomas Weiﬂschuh wrote:
> > Allocating the datapages as part of the kernel image does not work on
> > SPARC. It is also problematic with regards to dcache aliasing as there is
> > no guarantee that the virtual addresses used by the kernel are compatible
> > with those used by userspace.
> > 
> > Allocate the data pages through the page allocator instead.
> > Unused pages in the vDSO VMA are still allocated to keep the virtual
> > addresses aligned.
> > 
> > These pages are used by both the timekeeping, random pool and architecture
> > initialization code. Introduce a new early initialization step, to make
> > sure they are available when needed.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > Tested-by: Andreas Larsson <andreas@gaisler.com>
> > Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> > ---
> >  include/linux/vdso_datastore.h |  6 ++++++
> >  init/main.c                    |  2 ++
> >  lib/vdso/datastore.c           | 44 ++++++++++++++++++++++--------------------
> >  3 files changed, 31 insertions(+), 21 deletions(-)
> 
> ...
> 
> > +void __init vdso_setup_data_pages(void)
> > +{
> > +	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
> > +	struct folio *folio = folio_alloc(GFP_KERNEL, order);
> 
> I'm seeing random hangs on s390 too with our CI, but unfortunately I cannot
> reproduce it manually. But looking at one of the dumps it looks to me like the
> vdso time page contains (more or less) random junk at the end. Or in other
> words, shouldn't this be:
> 
> 	struct folio *folio = folio_alloc(GFP_KERNEL | __GFP_ZERO, order);
> 
> ? At least that is a difference to before as far as I can tell.

Thanks! This perfectly explains all the weird issues. It also does fix
the issue on the affected hardware which Mark kindly let me use.
I'll test it some more and send a fixed series tomorrow.


Thanks again!
Thomas

