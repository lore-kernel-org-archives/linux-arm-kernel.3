Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EFBE95360
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9cK/S9VEg5Sj6NGREX0/AmF5Y2Mv59DI4D5BpBMKuI=; b=x7GgVX4+mSyiSuJAtiZDmUMgz6
	0z4MKDxm+JmRZIjXElt0kJok8RX000aXrRyr79tSwja5/dRaAH79vRea9yXQOLrjw5PTbNeP62vHd
	zewhVycwleaCq9apn2QayeNxGClrJ0orB8WYVf9R/NNJc6/4l2J2v4TSPZIeJOd4RXYNqWrhsyXGH
	IUlevmkdpjm4HCDnbcP0PWcGHX6qu2d0MpA3M+frxwDrVGGafminy9SxVkZiJC8RZhyz9NZczP/cb
	RfsIsdzvKNNqJ/jBX9IRs5grk29M7fx6lxOMTclxRzak1ogcqGCrhgFXEDqtuMOza/aVjsTbcOOAx
	8NfIW9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZQd-00000008EsD-1505;
	Wed, 04 Feb 2026 09:44:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZQa-00000008EqL-0SQ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:44:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A0C501A2BE9;
	Wed,  4 Feb 2026 09:44:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AEAC60745;
	Wed,  4 Feb 2026 09:44:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7198D119A865B;
	Wed,  4 Feb 2026 10:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770198241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=w9cK/S9VEg5Sj6NGREX0/AmF5Y2Mv59DI4D5BpBMKuI=;
	b=cDoWAubzmtE494ajM22ZR5dtQKaregG2Oz6hx9eWKztWaIPgbqhnYeBOwwuscFqHhvw/dh
	36uj6EFKs4tuJFqlGS6/Pn16v3oKVAb8THaVRY0Nfty8zgxe8nkv5QwaDZhiqtxHBOa5Yb
	ZMLAdc1/6kvqS8b+l2dhyeeyBAPUhHZbPhAds3k0ZNBEQ26HPKucYKDNVi57o585r9KNwv
	/E3G8wS33Iq7VhXOei4h2ZAoCsYCynKF0UR6deJHot1QRtW773kvjs8jo7rctauMUJAmG9
	IKaInstq8V0+ra+sx3Pp/ysxnvJTBtGVCjLd3zjoKuKwME+HWydQolwpmpGK4A==
Message-ID: <bc094312-8671-432a-ac16-1b1a4d052efd@bootlin.com>
Date: Wed, 4 Feb 2026 10:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/6] net: stmmac: rk: rk3528: gmac0 only supports
 RMII
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYy1-00000007hp3-0hKm@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vnYy1-00000007hp3-0hKm@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_014404_284450_C0F900D3 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
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



On 04/02/2026 10:14, Russell King (Oracle) wrote:
> RK3528 gmac0 dtsi contains:
> 
>                 gmac0: ethernet@ffbd0000 {
>                         phy-handle = <&rmii0_phy>;
>                         phy-mode = "rmii";
> 
>                         mdio0: mdio {
>                                 rmii0_phy: ethernet-phy@2 {
>                                         phy-is-integrated;
>                                 };
>                         };
>                 };
> 
> This follows the same pattern as rk3328, where this gmac instance
> only supports RMII. Disable RGMII in phylink's supported_interfaces
> mask for this gmac instance.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



