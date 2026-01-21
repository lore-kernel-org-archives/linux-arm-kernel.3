Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A222CC44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQcfSLIQGBQsyjDnlCFvh7UQyWLEbwU5EueHUcH9sWA=; b=DUAgOu5pFvR3r0J5scAo75YgTS
	s/iDqPnqv9jIVt4QjQB8a0qpwyUeNIyC70l/F/365oO/gIx/o20YM1DUuPpWsTHJh0mld6nCMM+a9
	gcd8sJrxv9fO1hDBVef/xm3RdSofk9xR0/QLCbZ4LDlS93/xjA9GwVgTY7bM++YurhDawDVf4DmB1
	RWt7q6z/+HJGNyWgiKpLRZLfwx0MryEpmcTHS+LDn5WxZqvxCJLjfbdM3PHWAKuj7TdCmQTA/r81D
	gYd3DOLn3pMk7hYPPl8iVSkH85Ul6/1xAM1O+xhzuVX6FOWFAo9EMfHoSTsOv1NB6JH/4SH9CcNLU
	6baeGdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viV7p-00000005EyB-1LrW;
	Wed, 21 Jan 2026 10:07:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viV7l-00000005ExY-1XXf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:07:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A9B904E421CE;
	Wed, 21 Jan 2026 10:07:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72CB76070A;
	Wed, 21 Jan 2026 10:07:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D899119B1101;
	Wed, 21 Jan 2026 11:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768990055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sQcfSLIQGBQsyjDnlCFvh7UQyWLEbwU5EueHUcH9sWA=;
	b=cdHtpclFrIFKL047AiJevVG8jQQrWHfZbb4no2Bv6z5dPsRZsE0CEK23fh3AE5y0HPok3D
	D/eI4p59v38c6efDuSIJIRY8IKGbJB0YRZdH+EMy25iTseXVRLBhyC9wYKquKynO6ZpvQy
	/CatnEXVrfrObq8bfS7zOTHQgZyekyK0j0aSnC9zfauuoZM586L4eZZRU7nmkcUmldLhKT
	stHSWqARk03rZJcCQu1kYgNmQSXkikdNnuPOgYUaO/GA+80I1u24U+U0DIShI6/K0FBQ/U
	fXIFfREGMFDnYFLYfZTLV7ASMHW1b3L09vnwDrsUCpnhNTk7jy8BOfPLmrobfQ==
Message-ID: <af8c2609-59ca-4573-af4b-b08563a5a0bb@bootlin.com>
Date: Wed, 21 Jan 2026 11:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/3] net: stmmac: dwmac: enforce preamble
 before SFD for i.MX8MP
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260120203905.23805-1-eichest@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_020741_886319_089411D6 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Stefan,

On 20/01/2026 21:30, Stefan Eichenberger wrote:
> This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
> that allows a MAC driver to request to keep the preamble bytes before
> the start frame delimiter (SFD) when receiving frames from the PHY.
> 
> This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
> (ERR050694), which causes it to drop frames without a preamble.
> 
> The Micrel KSZ9131 PHY supports keeping the preamble before SFD by
> setting an undocumented flag, that was confirmed by NXP and Micrel. This
> new feature has been added to the Micrel PHY driver for the KSZ9131 PHY.
> 
> Changes since v2:
> - Instead of using phy_register_fixup add a new phy_device::dev_flags
>   flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD so that a MAC can request to keep
>   the preamble before SFD if needed (Russell)
> - Link to v2: https://lore.kernel.org/all/20260105100245.19317-1-eichest@gmail.com/
> 
> Changes since v1:
> - Use phy_register_fixup_for_uid() instead of adding a new device tree
>   property
> - I will send the conversion of the micrel.txt binding as a separate
>   patch series
> - Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/
> 
> Stefan Eichenberger (3):
>   net: phy: add a new phy_device flag to keep preamble before sfd
>   net: phy: micrel: add option to keep the preamble before sfd for
>     KSZ9131
>   net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
>  drivers/net/phy/micrel.c                          | 14 +++++++++++++-
>  include/linux/phy.h                               |  5 +++--
>  include/linux/stmmac.h                            |  1 +
>  5 files changed, 29 insertions(+), 5 deletions(-)
> 

Thank you for that. The code looks fine to me. I've tested in on a custom baord
I have that happens to have an iMX8MP and a KSZ9131, it fixes the issue for
10M links ! Thank you :)

For the series,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

