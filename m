Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D695E9538C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXFbGUaTRc27Gg/mkTDm2ud1ZC3qfqrbMm6Kd130aJk=; b=3F5vvOpFuh16ozCwiCnF+jbhez
	N2wXQSyE7EbX0shihUhXOnt/pchRjJS8simU2WeTK+hqzH29rWBRQSWIIUTfOkHRB7O+t/iblK6RW
	e6HHNLKaipP71euO12kj/psRAo9DAPyXOVS2hImbRZiE1oMuStGRagwDSIkUHf9tXCoTHlkHB/+1v
	Jia+bi8VKfaynrrCK7zKwAnM2zECZ2qsSHbEO4IEGnFw/y5zaWiBA5ScXfQHLwUj6e7IzycDr2z/I
	lWoj1SJiDoSY6BcD4YLql09M0GZqOnXbPO1W0sCAZd1EElv6Ovk2AeYku/JDZgb09z+Jn1YWkutZa
	blJRUnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbTf-00000008OXK-2Z8s;
	Wed, 04 Feb 2026 11:55:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbTc-00000008OWz-41rD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 11:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eXFbGUaTRc27Gg/mkTDm2ud1ZC3qfqrbMm6Kd130aJk=; b=q/AbKVZ6+U7v+Irjsxp+zWYhPB
	GsoftaZQ8v7s/xoW60KXi3ZFRObZGXdfLUbyRJvXXeo6AWt7JfSKeZTjeQmJgkSQFPwwR6uxM7ded
	sPzCAxEJsl/Q/BJoEvXCJwdvZFKh2ejawWYtbeQw8396q7iBvmxXn0mpfeBVLC4k9mr9h4rOzTjEn
	RhKMUig/9lVjvyyNbXJ4YOSUrXh52LerpNSWid2zokehT+IB4ZbJKIpzuUHhPQUDJWNNoDS+dG/dZ
	uw0y4qUrQNeqaG4V434u5WDTmfP+n2I+6iMKILzf5P1SUQlwYdGUD9HUJMg1w3q0kfdzkZkEevoEX
	fQ38Uwvw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38630)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnbTM-000000006HX-06bB;
	Wed, 04 Feb 2026 11:55:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnbTH-000000005K8-1TTx;
	Wed, 04 Feb 2026 11:54:59 +0000
Date: Wed, 4 Feb 2026 11:54:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
Message-ID: <aYMzk9cIgD-XDujY@shell.armlinux.org.uk>
References: <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk>
 <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
 <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org>
 <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk>
 <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_035521_019074_4B9B4D1A 
X-CRM114-Status: GOOD (  34.63  )
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

On Wed, Feb 04, 2026 at 11:53:30AM +0100, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> On Wed, 4 Feb 2026 at 02:27, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> > > However, I think it is a thick requirement to put on hobbyist
> > > contributors to go and write entite boot loaders from scratch,
> > > I think it's a fine requirement to put on Qualcomm or Renesas
> > > paid maintainers.
> >
> > If we're talking about older boards, then why have they only recently
> > became a problem, when, presumably, they've been working fine for a
> > decade or so?
> 
> These boards may have been working fine, given the right "legacy"
> kernel config options were used.  However, some of these option make
> the resulting kernel limited to that platform or even to a specific
> board (e.g. when CONFIG_CMDLINE needs to be used).

The 32-git ARM kernel has had a way to pass the command line to the
kernel from the boot loader since day one.

	First it was the struct param_struct.
	Then it was the ATAGs that was introduced pre-git.
	Now it is DT.

The kernel retains code to parse all three methods of passing data
from the boot loader to the kernel. The decompressor has support
for merging the ATAGs into the appended DTB, which includes merging
the command line into the DTB.

Without an appended DTB, the pointer to one of the above will be
passed to the kernel, the kernel will figure out what it has and
parse one of the three ways, and use the command line there.

The only case where CONFIG_CMDLINE should be used is when there is
no command line passed, no way to change it, etc. At that point
there are two options:

1. Augment the kernel's generated FDT with the command line node
   and load that modified FDT or append it to the compressed image.

2. Use CONFIG_CMDLINE, which means that the kernel _will_ become
   specific to the platform that needs those arguments. No getting
   away from that in this case.

Maybe you haven't explained the problem very well, but I don't see
any issue with this.

> The KZM-A9-GT I "need" this for never had upstream U-Boot (I don't
> think I ever had any U-Boot sources).  I can boot a shmobile_defconfig
> multi-platform kernel[*] fine, iff the first patch is applied.

So, what have you been doing for the last 14 years to boot this
platform (merged in 2012) without this patch?

Please explain:

- how it worked before - I want to know how the DTB is passed to the
  kernel, what information is provided from the boot loader, whether
  that gets merged into the DTB, etc. All the fine nitty gritty of
  how it worked and what doesn't work, what the problems were etc.

- what changed (it sounds like you want extra features)

- why (in detail) it doesn't work now.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

