Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0874CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23XHfjip0xavJrBGmNRM/VDGO8Z67OrHnHQ9YooOSIE=; b=m4wbRRgG5bn2oRoVqezZpgP4+0
	Z0pDJjGUdoFvwJ4afdNw9QfoZ9zE7Ag/Cc4nzg2C4aNheXEPpWmKoFmFOx2gQOKyzOWHhL7nBRFlC
	MvTM93CIQ598dd5iSRi5UZ6maz6Ej+/tCwNPD0gfdC4vz4LwU+seJ99oAFyRtdheMkRaByf7bZu2Z
	UgpDBv1/s4PC2183G+KZpuONLcX722Cy12cbj63QcAHjgLnO1QpZECQlY89Iia0YyYuLdOTxqqFxg
	oFGQ/B+GW72AyxxcG7z+OZdr63a01JOXLt6T4rP8WBvmJFiXTiXZutSDiI2hWZ19FQkVr1oRpcMFc
	EmCfRYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBXJ-00000008NAl-1VQH;
	Fri, 24 Oct 2025 06:44:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBXF-00000008N7j-2FxQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 06:44:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4653BC0C419;
	Fri, 24 Oct 2025 06:44:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E44660703;
	Fri, 24 Oct 2025 06:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 689A9102F244A;
	Fri, 24 Oct 2025 08:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761288259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=23XHfjip0xavJrBGmNRM/VDGO8Z67OrHnHQ9YooOSIE=;
	b=KYtGg25+hcycycAL+yfAnApj7zKCwrcjHD0C1XmCTEWz6G7WnS9cc30XTSyOgJ7icxC/Rk
	BqgI0luB56xoC4ypAxklxqw+6dS0yUfe7IIHk658RN8QGGhIaoGUoyCH36Ds/llVKwuL2G
	cyXkCiSkeGeITCYPhWpveysp++p/PCtKkPKbcYWiK1O9O1S2hTqj3/KiknDuIrbPbEwx8N
	9f89N0J4qw/LPTkrbdvkIapLZMRr96Mp0gc71NlRrw8JLnVAG48SlzxBF5BCoE0yj4PYzr
	Lm2PpayjuUmiKTH+iCuMujhGHnik45A6axwDm0WHsU+hp71f45Jyrhhu62cuqA==
Message-ID: <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
Date: Fri, 24 Oct 2025 08:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_234426_101315_D795DABE 
X-CRM114-Status: GOOD (  12.94  )
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

Hello Russell,

On 23/10/2025 11:36, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> - simplify stmmac_get_version().
> 
> - read the version register once, passing it to stmmac_get_id() and
>   stmmac_get_dev_id().
> 
> - move stmmac_get_id() and stmmac_get_dev_id() into
>   stmmac_get_version()
> 
> - define version register fields and use FIELD_GET() to decode
> 
> - start tackling the big loop in stmmac_hwif_init() - provide a
>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>   making a much smaller loop, which improves readability of this code.
> 
> - change the use of '^' to '!=' when comparing the dev_id, which is
>   what is really meant here.
> 
> - reorganise the test after calling stmmac_hwif_init() so that we
>   handle the error case in the indented code, and the success case
>   with no indent, which is the classical arrangement.
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
>  2 files changed, 98 insertions(+), 71 deletions(-)

I didn't have the bandwidth to do a full review, however I ran tests
with this series on dwmac-socfpga and dwmac-stm32, no regressions found.

For the series,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

