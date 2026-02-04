Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE80DE95398
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OE3Y7fLeZPRewo7EBhh65kVu2li8CGC4bTrvBrJ/zrc=; b=bVmfe8jrupCl5XjD4sez/SEAwM
	sxVSPM9xKYgOXb4/CEJTtehjvjqr9q/MvNOgpdGqsRToXPJjqgELwK23KEn4aQvbLS3p0zq9OXp+I
	Wq1WhWqXpCV0hWLPbriyKffMkCumEyXuvEOQDtkxFDfgktE2/AzoQgdNpwGrFOmlgedoltEOB1WYm
	E0TJlKirM0qIkevOQuFBw1U9aFVyl1zHFqB6ueiu7mLZD7Cgjj6y0EyINZNCpfE+sddBSQnqW9y/V
	CObiJCGmfuW6c1pTToeih1vsqVGHUsX7tHtRXnZQos5PQVDCkWYop07TH/xImnG9kGsRcVLkkkJ6P
	iu1zL6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncIz-00000008SgK-01sj;
	Wed, 04 Feb 2026 12:48:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncIw-00000008Sfw-0nCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OE3Y7fLeZPRewo7EBhh65kVu2li8CGC4bTrvBrJ/zrc=; b=Rem122p7lChgfwBXwf4hbVCmpF
	zB6lj5hzsYaobmcgi9Z7hHQQ8bElojxgFsEstJc9/2DFpzoAgb/hpWsLGsx2UUxgVx5O6W7OskvFf
	cxIDREBnYRqCbJnRowgSFsqHwT2ae/OTV2pgTXKLwGn3i1TSKkqIaeMbn/2B1r6J7WUfTsBS5Xc6j
	sWrzqiAV6dv4RQGJrLu4/9NZGpnV1h1DtH/KNHtVfLvYabsGfRQHDRA7WBWcIz28bcacTYSNdvnlM
	qGVH5vs/2mdRnM+8edSbt9DrVux/za4OOz8/B2tnFH+isYkiuw24AM20uTLUobiBRhBEgyIMub5NZ
	+K6drk4A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52140)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vncIg-000000006Kn-1ubA;
	Wed, 04 Feb 2026 12:48:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vncIc-000000005ND-2GCi;
	Wed, 04 Feb 2026 12:48:02 +0000
Date: Wed, 4 Feb 2026 12:48:02 +0000
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
Message-ID: <aYNAAsD6dlMi-35Q@shell.armlinux.org.uk>
References: <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk>
 <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
 <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org>
 <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk>
 <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
 <aYMzk9cIgD-XDujY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYMzk9cIgD-XDujY@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_044822_258714_AE5C03A1 
X-CRM114-Status: GOOD (  47.53  )
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

On Wed, Feb 04, 2026 at 11:54:59AM +0000, Russell King (Oracle) wrote:
> On Wed, Feb 04, 2026 at 11:53:30AM +0100, Geert Uytterhoeven wrote:
> > Hi Russell,
> > 
> > On Wed, 4 Feb 2026 at 02:27, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> > > > However, I think it is a thick requirement to put on hobbyist
> > > > contributors to go and write entite boot loaders from scratch,
> > > > I think it's a fine requirement to put on Qualcomm or Renesas
> > > > paid maintainers.
> > >
> > > If we're talking about older boards, then why have they only recently
> > > became a problem, when, presumably, they've been working fine for a
> > > decade or so?
> > 
> > These boards may have been working fine, given the right "legacy"
> > kernel config options were used.  However, some of these option make
> > the resulting kernel limited to that platform or even to a specific
> > board (e.g. when CONFIG_CMDLINE needs to be used).
> 
> The 32-git ARM kernel has had a way to pass the command line to the
> kernel from the boot loader since day one.
> 
> 	First it was the struct param_struct.
> 	Then it was the ATAGs that was introduced pre-git.
> 	Now it is DT.
> 
> The kernel retains code to parse all three methods of passing data
> from the boot loader to the kernel. The decompressor has support
> for merging the ATAGs into the appended DTB, which includes merging
> the command line into the DTB.
> 
> Without an appended DTB, the pointer to one of the above will be
> passed to the kernel, the kernel will figure out what it has and
> parse one of the three ways, and use the command line there.
> 
> The only case where CONFIG_CMDLINE should be used is when there is
> no command line passed, no way to change it, etc. At that point
> there are two options:
> 
> 1. Augment the kernel's generated FDT with the command line node
>    and load that modified FDT or append it to the compressed image.
> 
> 2. Use CONFIG_CMDLINE, which means that the kernel _will_ become
>    specific to the platform that needs those arguments. No getting
>    away from that in this case.
> 
> Maybe you haven't explained the problem very well, but I don't see
> any issue with this.
> 
> > The KZM-A9-GT I "need" this for never had upstream U-Boot (I don't
> > think I ever had any U-Boot sources).  I can boot a shmobile_defconfig
> > multi-platform kernel[*] fine, iff the first patch is applied.
> 
> So, what have you been doing for the last 14 years to boot this
> platform (merged in 2012) without this patch?
> 
> Please explain:
> 
> - how it worked before - I want to know how the DTB is passed to the
>   kernel, what information is provided from the boot loader, whether
>   that gets merged into the DTB, etc. All the fine nitty gritty of
>   how it worked and what doesn't work, what the problems were etc.
> 
> - what changed (it sounds like you want extra features)
> 
> - why (in detail) it doesn't work now.

I want to know:

- Where RAM is located.
- Where the kernel is being loaded.
- Whether the platform reserves any RAM that may overlap with the kernel
  or where the kernel wants to locate itself in RAM.

From what I can see from arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts,
memory is at 0x4000000..0x5fffffff - 512MiB.

So, provided you load and execute the compressed kernel image within
the first 128Mi of memory (0x40000000 - 0x48000000), then it will select
0x40008000 to decompress itself. I can find no mention of any reserved
memory regions in the DT file, so this should be fine.

If you're loading the compressed kernel at some wildly different
address, then yes, it probably won't work.

This is documented in Documentation/arch/arm/booting.rst:

 The zImage may also be placed in system RAM and called there.  The
 kernel should be placed in the first 128MiB of RAM.  It is recommended
 that it is loaded above 32MiB in order to avoid the need to relocate
 prior to decompression, which will make the boot process slightly
 faster.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

