Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17BDCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9Fv1CFWejVTuwBM0m+tguAlpn0RMdhZxXxOHMZWh6w=; b=VSbPf7Sf8TYl7Eg8bCpZDz8qNx
	L58ZUrDJVI+vNsCVyFvAhdcTs2hE9ZdnmgIpET5dbfXyrDskfhc7JowZV63X38KqsFOwBlZVQGr8X
	Oi+673koHOjcJpnCBvdgyLqtG+3HCjKtkb+jMCOcZCO69fI5xLvMxDw7PnmzNnVMsDfANqlfT3+fQ
	Fg5dJ5CBzck+TAwZFqcrg0Dwt3TGV2TRBw7W6ee/++z8Ug3zlFpzQLri5si90Ung0MzPSx9+HtNez
	XtP1eSD9x3rT22CYVhN/hzNCzIEBP/T25Z7FnAYJBqQ3V5XSw3gbdGDTkkYkNFVE/h7Ua2qBC7XkT
	SAeFlkAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMB3X-0000000BbDk-1gJl;
	Sun, 10 May 2026 20:47:19 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMB3V-0000000BbCW-0vsR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 20:47:18 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 73F5140E01A1;
	Sun, 10 May 2026 20:47:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fu6Js4NtpqY3; Sun, 10 May 2026 20:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778446013; bh=M9Fv1CFWejVTuwBM0m+tguAlpn0RMdhZxXxOHMZWh6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AV4cLAKB7Cqs1oX72PUMsCw18BiDdaJwPJDi6p3TKoXmrSCd50LxRz/yIMZpF9Iq2
	 p+MGc81dtpzA76Q2C1Q+NrDCow2MsA3bjqXzHyoST/u4c5qcdiUogJazjp2fmgXQFo
	 /8uVaKxm41Odk4S1iw6pIud1ae790Eox3Kl15k3zP8AmO/l0m3fXoZhXGraZ4RFDM5
	 EW8+PRG4EgNfn+GgG6MufM5v3t7tvTq8YM7aiFtO/FzxhphfVg9KP7tM4+yLobPuQE
	 KjDh0jhla7rZRTifRChj5NjaNOoG+6He+27YhFGwyvHm30lVLBwEhhmGmN5SjFr3XE
	 D0uxXwbaO0W78rquzb+Gf7H2GFQQMiosrDlbw0ashkfgcIS+Ud2S2HGyj3p0cbv1gY
	 Y63z6fV8o8uOoBgmfeTQm8zBSl2B+LdJXpgRk2xoFzCZdniuYDxR8H3jD7rt6dR2K5
	 rvXSLYfpUOVHqDQucEx80hE/x2QYHoyMcKBvyyrh074Z8OSUweXQVfhrz133uoO+pl
	 oHlvosA2NSNsuhlDUu9CdD6SHIAC0dlXNxjIyboshmlGMc0tZSaRFjgnuziB8H92eL
	 TzMb6muR3+9ASKPMNG1SpM7dfN1ftE6YTIVOburjjqspV2i4qZUTG+vvQ9zDx6bpYW
	 yDj5fy+wHN1PYaaSSPZco/98=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9896240E019B;
	Sun, 10 May 2026 20:46:47 +0000 (UTC)
Date: Sun, 10 May 2026 22:46:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Message-ID: <20260510204640.GBagDusDXW0dhTTZen@fat_crate.local>
References: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <59ce1037-b6fb-4af7-a213-d605ba5c9a3d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <59ce1037-b6fb-4af7-a213-d605ba5c9a3d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_134717_420159_846E8716 
X-CRM114-Status: GOOD (  12.18  )
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

On Sun, May 10, 2026 at 03:31:56PM -0500, Dinh Nguyen wrote:
> 
> 
> On 5/9/26 09:38, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> > From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> > 
> > The OCRAM ECC is always enabled either by the BootROM or by the
> > Secure Device Manager (SDM) during a power-on reset on SoCFPGA.
> > 
> > However, during a warm reset, the OCRAM content is retained to
> > preserve data, while the control and status registers are reset to
> > their default values. As a result, ECC must be explicitly re-enabled
> > after a warm reset.
> > 
> > Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
> > Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

And fix your SOB chain:

https://kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

From the above, I have no clue what Niravkumar has done.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

