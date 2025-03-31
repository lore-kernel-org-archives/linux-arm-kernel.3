Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10711C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUwTEc22PFKqFiHSeWgc6tvMuCNpaZLBnUCqyHxHX2c=; b=oTT8Emc6sC/kLIlWaktMI5GHQx
	/v63PuywQIceGLaEiJkfFim8iA045/Ot2R3xjl69m2dPWUXTX8jxgozjcwydhYQJT90iGVMexXtYi
	Yl1CQLBRqJMTurBtrbkYn4Kcl6Z7mNPhMmp7fKit1/oMsp2J2rtpvmgpYLFUOg0Gb2oe6cOxZ/riN
	VCMmmSAVZHy4exQziqfhslpqycUX5jDP7EQn4SDUDB5UCrQrR2CJyZh1bel42sro8PHi0Piw4Zp75
	W2ZlHXd/to1Lr34988LzNvLEwfrEHzR79138k7zN2+O94rcNoXkMzuDHaPJJbLr/gAHfXl0sWrO6Z
	NGUUzhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFKx-00000000Swn-3hzD;
	Mon, 31 Mar 2025 13:37:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFIF-00000000Shx-0uL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aUwTEc22PFKqFiHSeWgc6tvMuCNpaZLBnUCqyHxHX2c=; b=GNs9aK5FHOR/9JE/oLDRkFCzxG
	Lxks0A8BUVWfiGxeypQcXbPbYO4WETCfMMr+VvZzEZPEpstgWcmX7IxS3nELgO2FBLDIbGEqwf1md
	y4GP0CYvKaOcShyneFnx6Objz1ITNl/gXbq/Q9YKXXyuwF4YJsrtkVv9qnj1YLkXD+NbJUZ5/yECw
	3nfkwtgZeDpj3mPSkLJWek5IqP2A9WHZqcXmSQJvbgFlpfQmTY5NZhlvyZ4E3OXAy5AMfFcDTscEX
	LWvpkCz/sqspbRvunvXAMV+QE4+QATCH5of+WWTiKn2RvMfsUgn6Ze5Tfg3wCQfMhuANl+EHJAGbS
	9uXdLZOA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51468)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzFI5-00044i-0N;
	Mon, 31 Mar 2025 14:35:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzFHz-0001hq-2J;
	Mon, 31 Mar 2025 14:34:55 +0100
Date: Mon, 31 Mar 2025 14:34:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>
Cc: ardb@kernel.org, bjorn.andersson@sonyericsson.com, dave@vasilevsky.ca,
	ebiggers@google.com, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com,
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com,
	Max Uvarov <muvarov@gmail.com>, Rob Herring <robh@kernel.org>
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
 <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
 <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_063511_252216_DC747F9F 
X-CRM114-Status: GOOD (  22.12  )
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

On Mon, Mar 31, 2025 at 01:55:23PM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 31, 2025 at 08:29:21AM +0000, 谢致邦 (XIE Zhibang) wrote:
> > > Later arguments override earlier arguments. Any compiled-in command line
> > > needs to be overridable by user supplied input from the boot loader. The
> > > current behaviour is correct.
> > 
> > CMDLINE_EXTEND is for the built-in command line to "Extend bootloader kernel
> > arguments", not for the bootloader command line to extend/override built-in
> > command line.
> > 
> > Don't forget that the default empty CMDLINE already gives the bootloader the
> > ability to override everything. Not to mention that even if CMDLINE is not
> > empty, the default CMDLINE_FROM_BOOTLOADER continues to give the bootloader the
> > ability to override all.
> 
> The help text:
> 
> +         The command-line arguments provided by the boot loader will be
> +         appended to the default kernel command string.
> 
> so, you end up with default kernel command string _followed by_ the
> boot loader arguments. This allows the boot loader arguments to
> override anything that is in the default kernel command string.
> That's why it is a _default_ - it can be overrided.
> 
> If the boot loader command string is extended by the default kernel
> command string, then that doesn't happen.
> 
> CMDLINE_EXTEND is default _followed by_ boot loader.
> 
> You're wanting it to be the other way around. That's broken.

To add further weight:

ARM gained support for CMDLINE_EXTEND in commit 4394c1244249 ("ARM:
6893/1: Allow for kernel command line concatenation") dated 4 May
2011. In this commit, CONFIG_CMDLINE _prefixes_ the boot loader
supplied arguments.

In commit 34b82026a507 ("fdt: fix extend of cmd line") dated 13
April 2016, which _post_ _dates_ the introduction on ARM, and the
commit even states that it's fixing the lack of appending compared
to ARM, this adds code to drivers/of to _append_ CONFIG_CMDLINE
to the FDT arguments which come from the boot loader.

It is DT that implemented this wrongly.

No, we are not going to change arch/arm to conform to something
that was implemented in a broken way. drivers/of needs fixing
to actually implement it as it was *originally* intended - and
there is five years of arch/arm doing this *before* DT started
to do it.

If drivers/of maintainers also don't want to change, then I'm
sorry, but you have to then put up with the fact that it got
wrongly implemented by drivers/of and thus has a different
behaviour there.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

