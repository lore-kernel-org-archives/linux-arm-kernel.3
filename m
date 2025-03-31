Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E5CC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dp6/ZhxCBVGkVXKOH8cc/tdyF4DuQ/89efi02sHN7io=; b=U1R/t7n8arquR+BaBpI+7QWhfQ
	fTqZDGG7LAJt/zpJhqSVFkDSBVVaIbG4dJ0VFky0bFCep0jRFaScXymii40h0sS0rRryBveNA+x/L
	2qdh3cU6bgquLPt/HuSarM8K3BobqNlrQf7rOzBUk0UoZ6a++4ZB/b+GFhlpgt7TSD4b0opU9O3Mn
	KahX95Iu2Wx9axHBAh18JkZkp5sZBYch+fq+yuRSXzI5l5KYLwe5C7OMivlTwxGf2PAPE64y8mEcL
	QNzWQNu1k9NNHER5XsbfyKPNLgIw5GTWeRW2G9AbfGWqo8LiQ/FHGDa1Lz8foEzdUsJ1QDauYjpFM
	BS1O8vHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEhh-00000000PEl-1tyi;
	Mon, 31 Mar 2025 12:57:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEfz-00000000P5s-2Xjj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 12:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dp6/ZhxCBVGkVXKOH8cc/tdyF4DuQ/89efi02sHN7io=; b=jGw3wIGTchIihlce0544VoMdve
	2QcylGK9Zh7Q/cMQeeS+r+XdkJZWbF2aRN3LqePd/gnDa/LSuuEub6Vs5mOtam8cSYAq+gI/qdPJH
	ijc1moomOwdi2D8Cu+uZONlzlDGsSVLXfK5bOMTd/dpiNdMz/wtmYbn6kbDMtcwJyIuLZiM1Eq0as
	Dxlmn47QbeYH9Fqu+TsMS2IycK3P5dptJbx2zOEI2Wk86vdvgxPpndB1NdOB+hoaeXuntbi6DcXLA
	DptihaCqogaRsQAAWvSQgTLhBLrdT/r7UnwrJU7RGZFfQXDSzpUK/PavpWrAS6/uGGgv4V4y0fTe3
	wEpT3O3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40534)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzEfp-00040G-29;
	Mon, 31 Mar 2025 13:55:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzEfj-0001gX-2Y;
	Mon, 31 Mar 2025 13:55:23 +0100
Date: Mon, 31 Mar 2025 13:55:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>
Cc: ardb@kernel.org, bjorn.andersson@sonyericsson.com, dave@vasilevsky.ca,
	ebiggers@google.com, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com,
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk>
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
 <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_055539_649603_3E4FE87C 
X-CRM114-Status: GOOD (  14.66  )
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

On Mon, Mar 31, 2025 at 08:29:21AM +0000, 谢致邦 (XIE Zhibang) wrote:
> > Later arguments override earlier arguments. Any compiled-in command line
> > needs to be overridable by user supplied input from the boot loader. The
> > current behaviour is correct.
> 
> CMDLINE_EXTEND is for the built-in command line to "Extend bootloader kernel
> arguments", not for the bootloader command line to extend/override built-in
> command line.
> 
> Don't forget that the default empty CMDLINE already gives the bootloader the
> ability to override everything. Not to mention that even if CMDLINE is not
> empty, the default CMDLINE_FROM_BOOTLOADER continues to give the bootloader the
> ability to override all.

The help text:

+         The command-line arguments provided by the boot loader will be
+         appended to the default kernel command string.

so, you end up with default kernel command string _followed by_ the
boot loader arguments. This allows the boot loader arguments to
override anything that is in the default kernel command string.
That's why it is a _default_ - it can be overrided.

If the boot loader command string is extended by the default kernel
command string, then that doesn't happen.

CMDLINE_EXTEND is default _followed by_ boot loader.

You're wanting it to be the other way around. That's broken.

No.

Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

