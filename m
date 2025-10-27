Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A6DCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEVZQ7umfQ/e8KFlENApvsOj36JwyAfdhPSR2FTrVk0=; b=4PTxcTroqeWAidwlv3CiuBXvD/
	63ubhQFCkuB2LrIkJyq7Xl4TTMW00Xq4pl7IWv1RhuvYslN/2hXJcEhQ1SoRmCb1v72c6/+FmO6ZS
	w3uhR6f5rQPkK5CW3Wc93N9Qwoeco1tZNIRur/Jl0ozzkoTTcVX8FLvqMqfzPJmoWv0ZNLsGPRxZB
	IZFNvb/YZuI+jc649K9/w8GLbSXJtzWYxn+8oLLqEvQCMy9ZB4wz1B9HYXR965bfxTqu0eiar9YDB
	DTyU0MpN0YO9uenAafmYUahkUerN253aCF9lylyuNFkEKXzSWzGbaDmb7p7y9E4DvSieP2u4O1ULa
	dijvF0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTGw-0000000Eh3i-1Xq1;
	Mon, 27 Oct 2025 19:52:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTGu-0000000Eh3B-1T5U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 19:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TEVZQ7umfQ/e8KFlENApvsOj36JwyAfdhPSR2FTrVk0=; b=Hmvr1wH8kgdIYIEL18y3IH+31c
	hBa/CfiSGqy8VWgsi9/0Y1DeYon5eQFbOf5f9D0zno9gGUUa0PW/xmu4+kO31q3meia0nYmUj0h1W
	DFImuXA7GA7nXo4aKsV0yNsgFiSIzKr21IPCLMEJPcE9x2ZymNCxeEiM6e0EKXTjFxxE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDTGp-00CEGj-AO; Mon, 27 Oct 2025 20:52:47 +0100
Date: Mon, 27 Oct 2025 20:52:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <1b25edfc-5f8c-4530-8b0f-a0f247c0b2ba@lunn.ch>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_125252_389639_47E6044D 
X-CRM114-Status: UNSURE (   9.71  )
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

> If we decide that EEE should be enabled by default, then we'll need
> to revert this change. However, given Oleksij's recent input, I'm
> wondering whether EEE should default to disabled given the issues
> with Tq. The suggestion there is that many PHYs get it wrong and thus
> are incompatible with each other when EEE is enabled.

I would probably default to leaving the hardware alone, take over its
configuration. If the reset default or strapping has EEE enabled, its
probably been reasonable well tested. If the reset default or
strapping is EEE is disabled, it probably is not so well tested, so
maybe dangerous to enable by default.

      Andrew

