Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GrrzAVKwbhM2pwwU4cPrm0agxpTJFh+xbdqY2wuQCU=; b=LrDBtgj9LOcAPGJIWDfOvbEdo8
	B2KdHcYjnrCBwnCKhZhGj0Su++aLgIvEnHaKkk1IexY6cVZ1Byn/0+CLiRtTlnF4vFUWf5Ytj0nJX
	Edyyqr0oOr6A+vQu9fSkdbapC9froQpjh4jLKLeeXb9KJMyHd5CgE+U8j79AbnPruY3le2JBF7TY8
	JxLbko+2ZLRRLR+hkez5rkHlFiAzxDFzKgtykDBrY7KvpQJvYf+8cuXRi6hdM31L5GWDn4sjzaIma
	wlEVnMPSnZEVq8muMNz5ydmtZB3WVvbxYuYMxbYblJnR/vIoACeAYHLgOuasTuz+gVIDB6FLa9TEv
	sCHHydjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCaL-0000000BRfb-3s2Q;
	Tue, 04 Nov 2025 08:40:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCaI-0000000BRZy-0p2T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:40:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B051C0E605;
	Tue,  4 Nov 2025 08:39:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A1DE606EF;
	Tue,  4 Nov 2025 08:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9391010B50942;
	Tue,  4 Nov 2025 09:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762245606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1GrrzAVKwbhM2pwwU4cPrm0agxpTJFh+xbdqY2wuQCU=;
	b=yNQSfwGHj87xTdQw0a8qYLTgJA7hD2zEh0mAs9K//sl1zoCY3GSiYzaUG/7P9jloJlmpnr
	a2heFhhbOjTKI+KDbIampUvBPGWiDOjCKiLCn4DjqMjQcwjo/31JgOwhV5o94iproYdqRN
	GpOpLGeImB1tCfi0d45GqkqLHMS31lrp7XiBm6qENt0zoNjYt1BUqkpE+0VWogmqozp0W5
	b7CZvN5izyBVZ2AJBl6P5152ONvNgX7ZDeRdrbnEd/buKSUBtVnSloZAGeEbydfk+5CQCk
	TLR3hNmXQl+2wiM0aIHvzl93bI+Z1pcie7e7BHSjJoN0kKADb3RhzNKunfbNcA==
Message-ID: <dcd43a79-9858-46ad-9331-44b222ca26dc@bootlin.com>
Date: Tue, 4 Nov 2025 09:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] net: stmmac: s32: move PHY_INTF_SEL_x
 definitions out of the way
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_004010_388148_0EA88D78 
X-CRM114-Status: UNSURE (   6.03  )
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



On 03/11/2025 12:50, Russell King (Oracle) wrote:
> S32's PHY_INTF_SEL_x definitions conflict with those for the dwmac
> cores as they use a different bitmapping. Add a S32 prefix so that
> they are unique.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

