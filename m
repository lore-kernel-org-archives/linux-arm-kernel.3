Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C55FCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2rOtavN8Yu5wp1NcVsRpxDZLel/3IAuBK2KE2s78bs=; b=T7Yhbjr0pRaXF9LZdCnajV5Qjl
	BUBk1l+6umyiTpqrraFYSCDLXDp0a0UA8xjxnHn7CWT8+nRSNWk9BpqfHMFzVJ33BZ3gOliLsNKbX
	WiwRdumuTD49F2hDRyzusf5cKzTM0Ev1WDrLdhMCizHAtXUPopXVna2GgdYCkgLK2Bw4A1Dn44t9e
	KJtYhrBHVCVS9P4OkoAxriFLf6XsE9bVM9IViRWgVgQm2Ld7MFJ93rfvY4CxUJ6HYUgqSAI5Dn2z2
	4+ZjVOlaZf5WCaJv7/tcn2O6oJtXdiefiYaJ5SAZzIDT+ekYJrnHjJTEFOhwrPRbfwHNM7lyaEfeG
	WOX+NvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytur-0000000CdZ1-2qjD;
	Wed, 17 Sep 2025 15:17:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytup-0000000CdXF-0e6T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d2rOtavN8Yu5wp1NcVsRpxDZLel/3IAuBK2KE2s78bs=; b=AXqMWWLOmPyRphOsbmVfXMxScx
	BvFgiufLKJWsHtvi3uUbeWEc2oY0SA/fHNKXxM650FCV4woIljD4ramthXo4iNMBYhqK3UpJ8urAI
	oNYWczNXp8U4ZI2MPeCdij3j7WPW5tN8oYv5wUaPNzUZYuG3/fYejTM4KsEMC/uuEhOzAum5lSUev
	y6iVlG6nM9qom0+6IU8Skhg3J5m/d0bWYCArtFXZMmkqhVWA/O+xCZzKQQZ+KT81ZxGJ9KpLwqQ+l
	ry/4hO5Nnr8PyWYjPO8CTax/TsxCv6qEdYqI4F2UHngp6KcQASfyK7LOAiiaLMzdejC+XOAwgT1jY
	Mylix9gQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uytug-000000004qV-2pGK;
	Wed, 17 Sep 2025 16:17:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uytud-000000000ID-028Q;
	Wed, 17 Sep 2025 16:17:39 +0100
Date: Wed, 17 Sep 2025 16:17:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
Message-ID: <aMrREvFIXlZc1W5k@shell.armlinux.org.uk>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk>
 <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
 <87y0qd89q9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0qd89q9.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081751_185372_C7679808 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, Sep 17, 2025 at 03:55:10PM +0200, Thomas Gleixner wrote:
> On Wed, Sep 17 2025 at 10:41, Russell King wrote:
> > On Wed, Sep 17, 2025 at 07:48:00AM +0200, Thomas Gleixner wrote:
> >
> > Putting together a simple test case, where the only change is making
> > __gu_val an unsigned long long:
> >
> > t.c: In function ‘get_ptr’:
> > t.c:40:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
> >    40 |         (x) = (__typeof__(*(ptr)))__gu_val;                             \
> >       |               ^
> > t.c:21:9: note: in expansion of macro ‘__get_user_err’
> >    21 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
> >       |         ^~~~~~~~~~~~~~
> > t.c:102:16: note: in expansion of macro ‘__get_user’
> >   102 |         return __get_user(p, ptr);
> >       |                ^~~~~~~~~~
> >
> > In order for the code you are modifying to be reachable, you need to
> > build with CONFIG_CPU_SPECTRE disabled. This is produced by:
> >
> > int get_ptr(void **ptr)
> > {
> >         void *p;
> >
> >         return __get_user(p, ptr);
> > }
> 
> Duh, yes. I hate get_user() and I did not notice, because the
> allmodconfig build breaks early due to frame size checks, so I was too
> lazy to find that config knob and built only a couple of things and an
> artificial test case for u64.
> 
> But it actually can be solved solvable by switching the casting to:
> 
>     (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;
> 
> Not pretty, but after upping the frame size limit it builds an
> allmodconfig kernel.

For me, this produces:

get-user-test.c:41:16: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
   41 |         (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;                \
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

with arm-linux-gnueabihf-gcc (Debian 14.2.0-19) 14.2.0

Maybe you're using a different compiler that doesn't issue that warning?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

