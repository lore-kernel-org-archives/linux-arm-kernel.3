Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AAECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8m8ART9uGtatKNIYvyyLoFqaRtCnziJZo3bw/694yoE=; b=3D5TxzrRZe7Zmj3crkdfwHoqiZ
	TRIwNtntiUAsJweqUEJYXyFNkoYJy2gZMh3ElJXK/JViFVgXcqVoc3s8872TNUfWx0c7uh0PuSqgN
	CIg5gDV4X1WINgj2/TjUsVyCAiXVOJ9i9OmZVCyfkVESh8Brqt/bRUuJzq53eZymKa+Pa6706V135
	9SwGig3KqmcSUIP+zmqQsEd7lY2eCGprTEOwbAnQFXRFIvSIWtieXVJqykpkW061n0Swudq0qyrnW
	qht+PiDdZ0YIOLlwXIhxdePa6O3HY1B/PC0zfQPVEn1GKhg8f+4ypw1jnfbFCCZJlv1LNFqLG57Rc
	QIaeKvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyofQ-0000000ApUN-06FS;
	Wed, 17 Sep 2025 09:41:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyofN-0000000ApSp-00Ki
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 09:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8m8ART9uGtatKNIYvyyLoFqaRtCnziJZo3bw/694yoE=; b=F6jd6Ef0slDx6KZTkSsFuYbYZP
	nFB5c/p9TCBpYhYgtXht07g+ywDnTKEtxX6GHWKLqwBeOC0sZgFO48KFbAxF9iTFD+BPBQLMT6whX
	iYKssWI5YmQzbMnwomOFNakbcfEaQkV43eUTRUMamh3fiN+Au8cdANEnP1wvOFDPnWT7SUUfomSY+
	4bYD3uIcHoAil2wwfMcQG53So7hfRnTh5uSeyee+fuWoo9U7HYLp7Yvp0lFjrAFSnFTH900aJbx8Y
	7mKOcIL4fV8CUm/U8ExbCUkptV+BpppC43jM+MaeqfnS+8HQZe6z87MCG53vjr2fwUHMUIEJY/sSS
	wsOZXCuQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47292)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyofB-000000003A2-2cyn;
	Wed, 17 Sep 2025 10:41:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyof7-0000000005z-1COi;
	Wed, 17 Sep 2025 10:41:17 +0100
Date: Wed, 17 Sep 2025 10:41:17 +0100
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
Message-ID: <aMqCPVmOArg8dIqR@shell.armlinux.org.uk>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk>
 <875xdhaaun.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xdhaaun.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_024133_505145_9275A9CF 
X-CRM114-Status: GOOD (  25.74  )
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

On Wed, Sep 17, 2025 at 07:48:00AM +0200, Thomas Gleixner wrote:
> On Tue, Sep 16 2025 at 22:26, Russell King wrote:
> > On Tue, Sep 16, 2025 at 06:33:09PM +0200, Thomas Gleixner wrote:
> >> When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
> >> for no real good reason. This prevents using get_user(u64) in generic code.
> >
> > I'm sure you will eventually discover the reason when you start getting
> > all the kernel build bot warnings that will result from a cast from a
> > u64 to a pointer.
> 
> I really don't know which cast you are talking about.

I'll grant you that the problem is not obvious. It comes about because
of all the different types that get_user() is subject to - it's not
just integers, it's also pointers.

The next bit to realise is that casting between integers that are not
the same size as a pointer causes warnings. For example, casting
between a 64-bit integer type and pointer type causes the compiler to
emit a warning. It doesn't matter if the code path ends up being
optimised away, the warning is still issued.

Putting together a simple test case, where the only change is making
__gu_val an unsigned long long:

t.c: In function ‘get_ptr’:
t.c:40:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
   40 |         (x) = (__typeof__(*(ptr)))__gu_val;                             \
      |               ^
t.c:21:9: note: in expansion of macro ‘__get_user_err’
   21 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
      |         ^~~~~~~~~~~~~~
t.c:102:16: note: in expansion of macro ‘__get_user’
  102 |         return __get_user(p, ptr);
      |                ^~~~~~~~~~

In order for the code you are modifying to be reachable, you need to
build with CONFIG_CPU_SPECTRE disabled. This is produced by:

int get_ptr(void **ptr)
{
        void *p;

        return __get_user(p, ptr);
}

Now, one idea may be to declare __gu_val as:

	__typeof__(x) __gu_val;

but then we run into:

t.c: In function ‘get_ptr’:
t.c:37:29: error: assignment to ‘void *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   37 |         default: (__gu_val) = __get_user_bad();                         \
      |                             ^
t.c:21:9: note: in expansion of macro ‘__get_user_err’
   21 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
      |         ^~~~~~~~~~~~~~
t.c:102:16: note: in expansion of macro ‘__get_user’
  102 |         return __get_user(p, ptr);
      |                ^~~~~~~~~~

You may think this is easy to solve, just change the last cast to:

	(x) = (__typeof__(*(ptr)))(__typeof__(x))__gu_val;

but that doesn't work either (because in the test case __typeof__(x) is
still a pointer type. You can't cast this down to a 32-bit quantity
because that will knock off the upper 32 bits for the case you're trying
to add.

You may think, why not  move this cast into each switch statement...
there will still be warnings because the cast is still reachable at the
point the compiler evaluates the code for warnings, even though the
optimiser gets rid of it later.

Feel free to try to solve this, but I can assure you that you certainly
are not the first. Several people have already tried.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

