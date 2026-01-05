Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C627C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxpdO0xpWYZr7zB9MVuZ7HLTobH136C3wl/FyW9od7w=; b=DkE5RLo42uHwPpuFMur+5sEDcI
	IQWUplKgc0VAlmGMXTBOEE1zLfEny5Gj6pTXhkLQA89JUE8MIqDjHI/1J9j5I6i+FS7meHOHSsxVt
	1l30tKGxXfBLuXEtHKbwhk1v5Fm4tth3OnIP06tmaBKoxIDtcvTC7/Kw2ZI2jUgbXziQImsZGYzny
	ardr6PN4EDVCm5gNYsdLn96+NV84fPFYe3dTpATCOErSdGyHB5i8rVrUXIWH1mEGCOhpVHPDKeWy7
	9yAYGqxKkHdntH+KaRZlhNYfYeljmYiPolwqLI4EJO8MCdhh39NdHNvcA8n/JMW5cEvWm86KS2NH7
	dhYZ81wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjcw-0000000BGx2-0sRt;
	Mon, 05 Jan 2026 12:24:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjcs-0000000BGwg-3kRx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:24:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BAD0C1E485;
	Mon,  5 Jan 2026 12:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 577A160726;
	Mon,  5 Jan 2026 12:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A20D6103C84B1;
	Mon,  5 Jan 2026 13:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767615833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FxpdO0xpWYZr7zB9MVuZ7HLTobH136C3wl/FyW9od7w=;
	b=FIz/icMez1d+ePM8dPLynyFAZ0VZUgZUVwQmgrS5dlyfwgWOzS5LVCQpryCHkxR0zI11IM
	yOG/CSoXOXKkF13aNNmD35yHbAVkVzgpZAXPp8tGpUnG/49mZ1FYUPgzWVpkqbuKnTHYL9
	V4GaBgOT2jjloT6fuRpCF33j8pot7Uz8+EuOiwbo5tE/U5Fxpsa4aCvUdOdYflSqrwi5U4
	7booT3XccwZhIOmukcC05CxR7nlIFVhZ2a+VLMp+dd5xmvmEibXEHJ4N6BuKygHAwpwHbI
	O1ll3n3AKmmK/ipDokyyxgBlU8Nw81oM6nLE5zIt3iTIJxHQqgEt/3mdDocuIg==
Message-ID: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
Date: Mon, 5 Jan 2026 13:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 francesco.dolcini@toradex.com, robh@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20260105100245.19317-1-eichest@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260105100245.19317-1-eichest@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_042359_080034_1E05C9F4 
X-CRM114-Status: GOOD (  16.58  )
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

On 05/01/2026 11:02, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a fixup to the stmmac driver to keep the preamble before the SFD
> (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> used on an NXP i.MX8MP SoC.
> 
> This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> states:
> ENET_QOS: MAC incorrectly discards the received packets when Preamble
> Byte does not precede SFD or SMD.
> 
> The bit which disables this feature is not documented in the datasheet
> from Micrel, but has been found by NXP and Micrel following this
> discussion:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> 10MBit. Without bit 2 being set in the remote loopback register, no
> packets are received. With the bit set, reception works fine.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

I've also faced this issue, however I'm wondering wether this is the
correct approach to fix this. It seems that all Micrel / Microchip PHYs
have this behaviour of discaring the preamble at 10Mbps.

Some of these phys have accessible control registers to re-enable it,
however this register/bit changes depending on the PHY model. For
example, on KSZ8041, this is register 0x14 bit 6.

We may end-up with many many more fixups for this, basically for every
micrel/microchip PHY.

Wouldn't it be safer to just always enable preamble at 10M for these
PHYs, regardless of the MAC that's connected to it ? Is there any risk
always having the preamble there ?

Maxime


