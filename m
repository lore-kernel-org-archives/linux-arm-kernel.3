Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F320C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tg7WHOAZGiU5dJu6jDHMgp0FljLb6BYbmKgb+ORJsg=; b=ozcg5JGpa8H+ARFwS/SxCZYcV8
	tpc5+e5k4IUL4CjRHF/liedrklanWL+lVWi1RBn/mtq51vJ/BGCT45hNZQ3K2ZHRYdNHchBJZxv1g
	UptBY8YoXAihcSOX+R1Bdqo/hfbRqDkY5INciSAReSd6CZnJekCTwFq9Y/6ifETBP2O1dGFGZ7nw/
	3VZb2+W6AxysXMxsHq8JbV7tHeYD3T+57XHDApLmfYeWGL/6JKI/7xgQdGNmsmQB77dEa+WRssOum
	j+DsVzRgX5257aH8PMGfxHt1SqkghNluqiCtOT3k5OMh72DN9X9klIuKLDjz9d7PgoGlgyXxEn7Rt
	LRMJtzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkm0G-0000000DYKy-0sIm;
	Wed, 19 Feb 2025 15:28:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkly9-0000000DXdP-0roX;
	Wed, 19 Feb 2025 15:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0tg7WHOAZGiU5dJu6jDHMgp0FljLb6BYbmKgb+ORJsg=; b=MKY0dy4yM0vRqFTRntwTI3wX9s
	x/r69/ZjF48MEiTf6C/lTzqAc/69t2IfSnlL3yVQtK4DPOXzSLPUcVkUBTswuSC7+JTFehklbKeel
	eBjMZ1L7viwJbJbvQnaZwZcjly4JRFyWtQzBdfXSGC/uaxqt4jZFU/+4Vow8Zuv9ZO9qSlfyAUxLs
	3ASBCPgdiGwoz4fUSyjV8VhV1ueO8AGANcmVTzJddXP/PYHHPhfR/8v/pFn9gM+ckZd1+8TGPaOpd
	uy8cyu4vPV+zdg/TMXh71jZMrLe4IL7IPjPaUgJg1UFkMAzdZiHXs8BST5S/5Si1MIE+1Me11VJfC
	zriy/o4g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkly6-00000002FPp-2J6y;
	Wed, 19 Feb 2025 15:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0tg7WHOAZGiU5dJu6jDHMgp0FljLb6BYbmKgb+ORJsg=; b=HKtUq0ZO7pExPTjALnTNPXAK9R
	8Lk2t3+G1MDU+xg5LRpPzK16CZXpvFqL7utNDW0VzyBDS1s+SKkaS2oI2CABREUp4oq36eIuSKOze
	xU1d/7W08c5tQRPW3amux848+o0e7wHsUhiNC4x+8gek6Bl0ImGgXIRoYudCgoCt92uw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tklxt-00FfQp-IQ; Wed, 19 Feb 2025 16:26:21 +0100
Date: Wed, 19 Feb 2025 16:26:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 1/3] net: phy: mediatek: Add 2.5Gphy firmware
 dt-bindings and dts node
Message-ID: <a15cfd5d-7c1a-45b2-af14-aa4e8761111f@lunn.ch>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219083910.2255981-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_152634_728601_33E65043 
X-CRM114-Status: GOOD (  12.13  )
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

> +description: |
> +  MediaTek Built-in 2.5G Ethernet PHY needs to load firmware so it can
> +  run correctly.
> +
> +properties:
> +  compatible:
> +    const: "mediatek,2p5gphy-fw"
> +
> +  reg:
> +    items:
> +      - description: pmb firmware load address
> +      - description: firmware trigger register
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phyfw: phy-firmware@f000000 {
> +      compatible = "mediatek,2p5gphy-fw";
> +      reg = <0 0x0f100000 0 0x20000>,
> +            <0 0x0f0f0018 0 0x20>;
> +    };

This is not a device in itself is it? There is no driver for this.

It seems like these should be properties in the PHY node, since it is
the PHY driver which make use of them. This cannot be the first SoC
device which is both on some sort of serial bus, but also has memory
mapped registers. Please look around and find the correct way to do
this.

	Andrew

