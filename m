Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66F2C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwOtQh7ufR/hgfV1LX9/r3rjIFbD4mmiETvvgQjMe4c=; b=XqU0IFUNMs1U2breCw365u/e+z
	CAjMKGFKJyDelaTVe+KV24u4C++ZkA0f2li9B5XeA+li+aBS9RgySmN1RYeY4peaaGDQlVnqJ8kdo
	5CQc1bEsuaVbi3476iZfzUsn9sVH8AbGVd7VY5A+B2+M0k0GJSt4ovZfi7ft5gJDb3FeCTAhA/jr7
	EAeEQaTa4fzgT7bB4jPpXnXEIUSkITlpuzXM1TDQvhj8o32OFGKEwTJTw2rMtGaQ63Ii22DI9UYyh
	SbcwzOxu9QLfDwzjcnDXvb2nQYopshBG6xArUgwpfTBFEHYtilyY9Nh8uPmn7h6p0XsusUY4dsr4m
	wvzPGJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkd-00000007RvB-3Pfv;
	Mon, 05 May 2025 13:20:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv65-00000007Mbb-1vHX;
	Mon, 05 May 2025 12:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=RwOtQh7ufR/hgfV1LX9/r3rjIFbD4mmiETvvgQjMe4c=; b=Yv
	crgvGlIVixwh/LrlvMhrAYsLr/rdCOz4ng2/BJue0oPhnhDWRQH+VrnLCIAoTcqlgcyJCsto/uv3K
	hfPFb+i6WplLWzzI+Hfi7y1tIk/xALtYFtckt4QrUDrIJl4+ftI498t6kj+kBEVzD4iN5lYTSKwdY
	sTalGZhALN54M9c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uBv5v-00BauR-71; Mon, 05 May 2025 14:38:51 +0200
Date: Mon, 5 May 2025 14:38:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
	conor+dt@kernel.org, detlev.casanova@collabora.com,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
Message-ID: <bf734f63-d849-433b-abcb-37af8fd704e9@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
 <1a403393-e317-4a1b-a151-fa668c6278f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a403393-e317-4a1b-a151-fa668c6278f9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053901_513184_191C873E 
X-CRM114-Status: GOOD (  17.31  )
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

> Hi Andrew,
> Thank you for your valuable feedback and for pointing me toward
> investigating the PHY configuration further. After digging deeper into the
> MAE0621A-Q3C PHY (PHY ID 0x7b744412), I now understand why it performs
> reliably: the generic PHY driver relies on the GMAC to set RGMII delays
> (tx_delay=0x20, rx_delay=0x10), enabling a stable 1Gbps link for gmac0 in
> rgmii-rxid mode, while rgmii-id failed in my tests due to the driver’s lack
> of internal delay configuration. Given the critical role of networking for
> development, I’d like to retain the GMAC nodes in v3 using this setup, but
> I’d greatly appreciate your approval on whether the generic PHY driver is
> suitable in rgmii-rxid mode for now.

Device Tree describes the hardware. The hardware does not appear to
have the 2ns delay added by extra long clock lines, so your DT
description of the hardware using 'rgmii-rxid' is wrong.

If we where to accept this broken description now, it really will
break when the MAE0621A driver is merged and it correctly sets the
RGMII delays.

So sorry, no we cannot accept it.

For you own development work, you can merge the driver i pointed to
into your tree. It needs work, but it is not terrible. So it should
work for you.

> I’m eager to explore a Maxio-specific
> driver for mainline compatibility and would be grateful for any guidance on
> existing upstreaming efforts for this PHY.

This is the first time i've heard of this device, so i have no idea if
anybody else is working on it. I would suggest you reach out to the
author of that patch.

	Andrew

