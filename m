Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B96E73156
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCVznDeS25AfgjsThOmStc34cAZGXMW8Y+oEwb6RMLM=; b=QNY8cSA7IFP2EOWr+n17h/HPWn
	nEGNcQOO2l6xEZnOU4wxAOlr+4D+OYW5KChGLaZck9n9aJo3UOCFCqLR1LLk/nuWb4w2IjPx02Dq4
	CemtGxenmLm7XWT+R5z5ibSBWUc6KVgid4+AK0qJcvEAqHqFKsSubj0fNjkoTAfOFI1ZLrpK1XOyx
	y+o1zooXelpUwT+NpDE0lgCyshvpLeeK/wFEkPUeM1eOZFJswBfnt84IgidmUDfp0/thgwZMbGs4n
	zJKX8vVPMNnCEwtN+pQ21+X6sr3ezIscmISJgnJGlLjG3fX+6qwEVw/l8t3Z1+t7XFmclGrIp/NAK
	qDJifnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrdX-00000004rfc-0dwa;
	Mon, 02 Feb 2026 10:58:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrdU-00000004rfG-1E4t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MCVznDeS25AfgjsThOmStc34cAZGXMW8Y+oEwb6RMLM=; b=UsBW7jjl480XiP18s0YwCNMYjN
	RqbnkBkmnEJmmAnrbZmCaqJHVgFjUHP22/qjH/ZCNXUrXgMeRtrn/X1MT5A9CeGeNFS03xuccXaie
	DTLn14EhkGOA5USN+H5QQS1fK/NpPNrVy/IRvJ+YSJ1uyqg+LF0oRNarPV6obcjshKgCIo446fSSa
	hEJ+6YCPbCFnOBStycvQban8hB3bmZUoLZlUQ0/P+tccI5E/YZIVyGZ0zNgh0Yj+bfFhvs6blL0S3
	V0gWWDRilFkJcgG14ReNuR/HNA057+NharLK73Omz7Gz/CqK+sEe0Rwr8olWszBrQ62FI41tWHJ+S
	XfV45vyg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59154)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vmrdA-000000003t1-0H2i;
	Mon, 02 Feb 2026 10:58:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vmrd5-000000003Kv-06sA;
	Mon, 02 Feb 2026 10:58:03 +0000
Date: Mon, 2 Feb 2026 10:58:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
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
Message-ID: <aYCDOio-YdUJAf2v@shell.armlinux.org.uk>
References: <20240121203009.9257-1-ansuelsmth@gmail.com>
 <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com>
 <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk>
 <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_025828_333384_476ADDA8 
X-CRM114-Status: GOOD (  20.00  )
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

On Mon, Feb 02, 2026 at 11:26:49AM +0100, Geert Uytterhoeven wrote:
> FTR, I did provide my Tested-by for the first patch in [1].
> I still have this series in my local tree, which I test regularly on
> a variety of Renesas ARM32 platforms and on BeagleBone Black.
> 
> In fact, I had completely forgotten about this series, to the point
> that I bisected a failure in booting mainline on one of my boards
> using my current .config to the absence of the first patch ;-)
> Apparently during the past years, I had modified my .config to make it
> more generic, and make better use of the DTB (incl. chosen/bootargs),
> which has a dependency on the first patch...

What I would like to know is why anyone is using appended DTBs in this
day and age, when surely by now, Arm based boot loaders have realised
that Arm moved to use device trees ages ago, and the kernel requires
a DTB in addition to the kernel image itself.

Appended DTB support was only there as a stop-gap for those boot
loaders that were around before DTB support was added, and have no
capability of dealing with a separate DTB.

Come on. It's 2026. DTB has been supported on 32-bit ARM for fifteen
years. Surely everyone's now got modern boot loaders.

If not, it's time to say this: fix the boot loader.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

