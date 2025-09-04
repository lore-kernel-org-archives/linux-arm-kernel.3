Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DE3CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X43dhWbmJe9Xz++Pv2ayZuVgsAdoCm6ORyQ6/XM/ek=; b=ToF7ZhXccXFSfPyBs9KbucYl3E
	DYM7tXgBCLwFyYP8OzBi/P34MS9bh1vADeB7eERKMb6favRMUKLb7EUoVQLj/U7SmM8C6uKBxC/+G
	NsrQy3shTyUxf4yiSIlFVruETKP/SfmrG9TB/4MYQsiwvZTTUYFFmF+ypslmG2jJOZFFrL95pDLqh
	g4E7GK3TJKRVFQF8i8R28bJO2SYm56LgGBsOVEh7HbwCv4gtlJNauTg81RjCKZnWpaJ9PpDTzdtJN
	giFc2LrkmzWTbild2Tt6zGKc3ght46d9bJD/mPM5br/oOOpfh3uDmHtLEA9bdv84A9FKvpoXDbJeR
	KrAg/Rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5VB-0000000AIEL-0mRD;
	Thu, 04 Sep 2025 08:39:29 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4rw-0000000A36z-27Lp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:58:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3FAD1480743;
	Thu,  4 Sep 2025 09:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756972733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+X43dhWbmJe9Xz++Pv2ayZuVgsAdoCm6ORyQ6/XM/ek=;
	b=kBZsKGUTXh40axdPM+jwNAUPcrKpHtV+eLyOGobFw9fzq5Nw0GoG8Hom5cCSOzzfoCAScQ
	lBtuzBDJWEPaH6wszhHWWr5kpl5b0/ODwsgRKdY4yU+QR1MyncGvbzcNxSojV0JvcEvQyO
	upSNBPm85nflPkb7bnlvMw5iWWv3LBJxPyqkyi4yF+WqgEeeqrxJXah1WJyk7pFQbfh+XK
	S1nPs5MfHrvkX+ZsVT7eMDfjYu45Z3XGB6tIPFArPzFHKVXyo6O3Hp+MRfK/nB9Ewso1m0
	AbNTKhAQaHJBbu1c75R+cchVAJUg1tdzQuxYonbZ/5qxeMET28GC0Vf+g36UYw==
Date: Thu, 4 Sep 2025 09:58:50 +0200
From: Alexander Dahl <ada@thorsis.com>
To: nicolas.ferre@microchip.com
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] ARM: at91: fixes for 6.17
Message-ID: <20250904-comply-veal-99d4839588e9@thorsis.com>
Mail-Followup-To: nicolas.ferre@microchip.com,
	Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <20250903173403.113604-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903173403.113604-1-nicolas.ferre@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005857_002739_6405E046 
X-CRM114-Status: GOOD (  19.67  )
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

Hello Nicolas,

Am Wed, Sep 03, 2025 at 07:33:55PM +0200 schrieb nicolas.ferre@microchip.com:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Dear arm-soc maintainers,
> 
> Here are the fixes for 6.17. The addition of the Kconfig symbol is taken from a
> bigger series by Robert here:
> https://lore.kernel.org/linux-arm-kernel/20250813174720.540015-1-robert.marko@sartura.hr/
> It is needed because one patch of this series was taken before that symbols were
> defined properly (queued for 6.18). You can read the discussion here:
> https://lore.kernel.org/all/bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev/
> 
> Thanks, best regards,
>   Nicolas
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.17
> 
> for you to fetch changes up to 217efb440933bf97a78ef328b211d8a39f4ff171:
> 
>   ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode (2025-09-03 18:52:08 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 fixes for v6.17
> 
> This update includes:
> - adaptation to the SDHCI capabilities on sama7d65 curiosity board DT as
>   SDHCI quirks are not in place yet. SD/MMC don't work without these
> - addition of one Kconfig symbol that is already used in DMA tree for
>   6.17. XDMA cannot be selected if not present.
> 
> ----------------------------------------------------------------
> Robert Marko (1):
>       ARM: at91: select ARCH_MICROCHIP

Tested on SAMA5D2 and SAM9X60 based boards.  Works for me.  Thanks for
taking care of it. :-)

Greets
Alex

> 
> Ryan Wanner (1):
>       ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode
> 
>  arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 ++
>  arch/arm/mach-at91/Kconfig                              | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> -- 
> Nicolas Ferre

