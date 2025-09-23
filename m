Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3574CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DukHAljRLEAyr8m6U7o38VUfR/uV1WnyVeEUjrVjW8=; b=EA+3A+7u2rbirn73Fi504lYmmc
	YNMgBvrov3OWkQUebYpYcPsHkWtsZtU3JZl/NHLJF4M5wLBtXRFWy2qfgsaLIkEQ5yG/iBrWBSyw8
	dmMfoPiFmEBgxsA3a0rIhOs8JOdZNJNLqkb6QW07ouPvV4xV225i0SM+Zf8H9/2BEhLhzexKkaQCP
	+MxOk7fKFg55ARpamVEyMtIw172sSj/0b2rwOdMyl3SnVfA017pP4G20wysFNZZS7i1DBqQes/SXK
	uNxMLLw6h8TOKIwwSya70G+n+IFD7KvAJKA3o7HU2lOTJ5useTyux0YhzIGIfKNg2PdlG1TMq3amF
	N1+oC+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13ih-0000000DfDZ-1wpo;
	Tue, 23 Sep 2025 14:10:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13ie-0000000DfD6-242V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:10:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09A05C01FB4;
	Tue, 23 Sep 2025 14:09:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0686760690;
	Tue, 23 Sep 2025 14:10:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABCC4102F190F;
	Tue, 23 Sep 2025 16:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758636606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4DukHAljRLEAyr8m6U7o38VUfR/uV1WnyVeEUjrVjW8=;
	b=mmfI7w5e/fwO1dbJfiJiKTFlDB6GlSMiPyPvV6nfqszIXotRRsr+okXrUUyjKmjPkhKC3+
	RoVtHl9f9Ak9LRf/4iRwBY+ykJZRkgXIBLbXwYejGDdHv1/5HE/zBD2hDPv22jW9Gcmtxx
	wWM9/GxDOqyi5cb9s3Y31468ZB1Z5T5zy1mFKKWkOTd7gyq0IeHTY5I/eenH02wd91XYIS
	xGnaTwuBKX0PwhLAQA8tTdQ9Ouv63mePARKs6grtbizYG7z9xB/cvvIm0DRtAn4/FE4GIQ
	6KlL35wkYLyM8d9AU72fjBOwxEy5/4fPxLjJwEbiZVVEjxBNxGawI1O2g1LIIg==
Message-ID: <bf7f7637-dfcf-41fd-aff3-82a0ecac4db9@bootlin.com>
Date: Tue, 23 Sep 2025 19:39:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/6] net: stmmac: yet more cleanups
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_071012_726182_CA97228A 
X-CRM114-Status: GOOD (  10.10  )
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

Hi Russell,

On 23/09/2025 16:55, Russell King (Oracle) wrote:
> Building on the previous cleanup series, this cleans up yet more stmmac
> code.
> 
> - Move stmmac_bus_clks_config() into stmmac_platform() which is where
>    its onlny user is.
> 
> - Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
>    simpler code in __stmmac_open().
> 
> - Move "can't attach PHY" error message into stmmac_init_phy().
> 
> We then start moving stuff out of __stmac_open() into stmmac_open()
> (and correspondingly __stmmac_release() into stmmac_release()) which
> is not necessary when re-initialising the interface on e.g. MTU change.
> 
> - Move initialisation of tx_lpi_timer
> - Move PHY attachment/detachment
> - Move PHY error message into stmmac_init_phy()
> 
> Finally, simplfy the paths in stmmac_init_phy().
> 
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 -
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 111 ++++++++-------------
>   .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  32 ++++++
>   3 files changed, 73 insertions(+), 71 deletions(-)
> 

For the series,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks for the cleanup,

Maxime

