Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6F7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMdYmwmLPyDuVRsbkv93AlEBzIO1Opr34EVAtN7rIzg=; b=HMwEQcUqUdoiqvbxnAjFrFe27j
	r4/8vl6oDag6xZppHshQMu/St2q0HI+aTUpOusecpGw0CbmaKwvgj9Mwj7p+z3k3JqxiSMID4yu/Y
	hH2IQ3+Dy+5DhySdiaN20Okf5X8Y6X0l0/oAOpjS1ihO5KY/yaF7z6keXWrBhbU05FKWZi6uZ82Bv
	mrhpRDKqr6POLp/Wm8axTKRVivjsxZ/fSKjEgjZvuJB7eQ1Us5G5hdak6Rf2+PlrVSnu1pJlFquR/
	wZwKdciHpnHaRstCQ6FWYWkO+MF8PE+A4wPHC5wHqCjcoGX/lW/DlGOhySQ1oZkf1d2hbOmDi/c2f
	O5bYu1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taF84-000000083Pf-1Cws;
	Tue, 21 Jan 2025 14:21:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taF6W-0000000834z-4AIB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jMdYmwmLPyDuVRsbkv93AlEBzIO1Opr34EVAtN7rIzg=; b=kRfQF0VPZ2zh5eyHFHt9OFbw7i
	F70eXR9dI+FP4iMiLNDozLfDCKz6XXFTtoV/GCmoYoej6vZfFQb3iXQMz1LeqsefvRTz9vuV8Vfkr
	+u/b8Jl+YEoJAcuEO1IyAvBnKKh6A85m81xpx3A6S9pNOGxl+niZYUVK2XehbdCYthGMgjnxMhobY
	+8Cu2GGJmcQFv0E58PvCMeYrfsokoiBK9Dgw2NRT733jii2C7dWnuYdUyFBMH6J76Xdd6/KutdmGj
	gfTPyc9OtXK1QspBhrY4OO7NZkEBJulU3Nr7UyK/7tyHf77ssJSoyPBObP1VlpDQOgdqPZHwpDplx
	GikDbNCQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43796)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taF6P-0007KN-1u;
	Tue, 21 Jan 2025 14:19:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taF6L-0003xt-29;
	Tue, 21 Jan 2025 14:19:33 +0000
Date: Tue, 21 Jan 2025 14:19:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
Message-ID: <Z4-s9UHBJZx9APeE@shell.armlinux.org.uk>
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
 <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVLvCNZtc2qYrsnMz5L0Hyr70x-Hj5NA8izYBH2tf=yFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_061945_027484_E1E992FD 
X-CRM114-Status: GOOD (  18.79  )
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

On Tue, Jan 21, 2025 at 03:12:13PM +0100, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> Thanks for your patch!
> 
> On Wed, Jan 15, 2025 at 12:11 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > Fix C&P error left unnoticed during the reviews. The FORMAT field spans
> > over bits 29-31, not 24-27 of the CTR register.
> 
> Please add
> 
>     This causes a warning on e.g. Cortex-A8 and Cortex-A9:
> 
>         WARNING: CPU: 0 PID: 0 at arch/arm/kernel/cacheinfo.c:43
> cache_line_size+0x84/0x94
> 
> so people find this patch when looking up the warning.
> 
> > Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This fixes the warning on Cortex-A8/A9, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Note that this changes HWalign on Cortex-A9 (various Renesas SoCs,
> with 1, 2, or 4 CPU cores):
> 
>     -SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=<N>, Nodes=1
>     +SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=<N>, Nodes=1
> 
> On Cortex-A8 (BeagleBone Black, i.e. AM335x), it changes HWalign,
> and causes a warning message:
> 
>     -SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>     +SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>      ...
>     +cacheinfo: Unable to detect cache hierarchy for CPU 0
> 

Also, has this been tested on CPUs that don't implement the cache type
register?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

