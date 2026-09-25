Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E1BC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 05:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgch/mbwhJBjvGWR38g64Y3Z0HQP0UunvP8KfpIpt18=; b=dt9z5BKnnCnj8ssk6tdb0uG+Bm
	MUhKZbLK6OQY2ralxCoXJ3c284VKRsLzoz7bIl8vzA6z26rqXEY6kZ45jDEr1SNgMqVLY+glp4Dzt
	FQYWj3BT1e48TquQcc+tDkzqcyOWrv17sdRLzO9x3E9F56IbpIEp3qzSzD9r/cH/l1A1PRkjhjPNq
	CwL54TrQeM1jtYyq9tp56D2OvAy4Vb6zI+NZwWBqh02fkZb3cCoi5AShw076swvvD3p0sJpXLGEJA
	xUnhCSXkuQfd624uTBGwkDVXUJH+0maDT5zE4ly/Ht8flwIQU8+q685ajgg5lJM7U0l40cIcFtWaK
	6k72sbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ykp-0000000CiSA-4BUY;
	Fri, 25 Sep 2026 05:45:52 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ykn-0000000CiRG-3Mqk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 05:45:51 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 00B1140E02C3;
	Fri, 25 Sep 2026 05:45:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MtBkMgRwCoAC; Fri, 25 Sep 2026 05:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790315140; bh=vgch/mbwhJBjvGWR38g64Y3Z0HQP0UunvP8KfpIpt18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL1H7N+Zj4lP4SDfpoB6NBKQF88iSUUp4ryL0gqAMzBzp0p/rDknZdNrGYUxlCcVT
	 f2vpq+6jLfZPxxTIV8bJ2KKEc9avRGnKYZOVu+YhTdwgC7qMDH+t6zvCxITZT5/pZd
	 PVCnpupA62ge9yrkmv2QRfU8K75Uqh+eV7ZsfAjoGbDhGJ5bLkPHYfRfyk2oMT9f1j
	 e94M2OVZjPsMu4YsY9nsXWkp9RzgpkQy9ryMWZD3WWNGb6rdfWQRr8lpnWYlMhIMlh
	 9M9kaNW5G69YDDk5Zs60B8aFCfpJtoWinCzUMnMW1FHefgBcE+cgIhz6RtNcEUWcLj
	 9Za1VN8qmmrsVucvQo6IxGp0Q5vsKAxZQu76WOcTUbuN7huIk1QX+h9AIfIG9StdDE
	 9LqNqGW7HzxEbdpuybNAFS6eUn9f9JsecKba0DUMO4qMpECW/9DuqmMEDWY1LbHBzZ
	 IuituXGP2ffb0gqu4D39QlIBdjwzcvHG7aazB3CwHQYDvMW/NUhiZZ7zQbHdxfbPx3
	 Q87p9kFU7XcYDjP5wabNolDeS83Ajl7oZzZRs5T60ThXKYofp37XQaQ5QXmwtA5Mun
	 iKbgIZ40nEEgHEOiCz8am0dCSnOxkF0sxM0x8K5hSYdPqSXOl1fpoAyAXjGi1hw8Wr
	 YVEB+3HOkAZBoLxkmOQR+BjU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E254F40E015D;
	Fri, 25 Sep 2026 05:45:24 +0000 (UTC)
Date: Thu, 24 Sep 2026 22:45:22 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/9] EDAC/aspeed: Set the DIMM grain
Message-ID: <20260925054522.GDarYKcvFR4mLdAhSe@fat_crate.local>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
 <20260916-edac-v3-2-23e9ed2fbdf9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-edac-v3-2-23e9ed2fbdf9@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_224549_999323_D10CBD3B 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, Sep 16, 2026 at 01:30:39PM +0800, Ryan Chen wrote:
> The driver never sets dimm->grain, leaving it zero. Since commit
> 3724ace582d9 ("EDAC/mc: Fix grain_bits calculation")
> edac_raw_mc_handle_error() runs WARN_ON_ONCE(!e->grain) and forces the
> grain to 1, so the first ECC error reported on any Aspeed BMC SoC emits a
> warning splat, e.g. on the AST2600:
> 
>   WARNING: CPU: 0 PID: 0 at drivers/edac/edac_mc.c:924 edac_raw_mc_handle_error+0x4b4/0x604
>   ...
>   edac_raw_mc_handle_error from edac_mc_handle_error+0x364/0x4a8
>   edac_mc_handle_error from count_rec+0xdc/0x124
>   count_rec from mcr_isr+0x110/0x1e8

All of that is fine and dandy but you should talk about why the grain is
chosen to be 16 here. The warning is just to make you choose a proper grain
for your hw and doesn't need that much 'splainin'.

> Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: stable@vger.kernel.org

Is this really stable material and if so, why?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

