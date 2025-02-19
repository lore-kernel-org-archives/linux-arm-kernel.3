Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21553C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkjpYtmHEMJVkN0oLDE05h3FywyV7jEHdIyDI8MDfsY=; b=IQiWANHJwn4PuZ1dHwuf4S/Y0n
	6dfEgz8rkRtXNINW//bU7DZb7b/nTtdhy4SRzAnhr1Ovn3iO2t2fyrx12H7Q8om5cbKnyTpu0+6vE
	DP0WYFyvT592gS9clJXtLjLs6baQzm827+eCZ8hThTVXQMygPJkOXFcY6k1w+JbV3RdVfAqu96oWa
	BI3Z9eXBc1y1Dw5kjGRSc8xiaucwCLj2N3a0rCAzzXOi4aJiT9ieOFFOSRT9Y3uXvxQQkCwbZQIj5
	182/MHWQaBhrNRmh0rfFrJIxAdDHcUDfO7EyQiLU37RA0jhjSmvbZsN8jcuJQs6uVl2gvnAuRbrhU
	dDB1qDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkm3a-0000000DZAj-183H;
	Wed, 19 Feb 2025 15:32:14 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkm26-0000000DYqK-2W2p;
	Wed, 19 Feb 2025 15:30:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tkm1p-000000000at-2efA;
	Wed, 19 Feb 2025 15:30:25 +0000
Date: Wed, 19 Feb 2025 15:30:22 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 1/3] net: phy: mediatek: Add 2.5Gphy firmware
 dt-bindings and dts node
Message-ID: <Z7X5Dta3oUgmhnmk@makrotopia.org>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-2-SkyLake.Huang@mediatek.com>
 <a15cfd5d-7c1a-45b2-af14-aa4e8761111f@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a15cfd5d-7c1a-45b2-af14-aa4e8761111f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_073042_635221_0A0665AA 
X-CRM114-Status: GOOD (  16.57  )
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

On Wed, Feb 19, 2025 at 04:26:21PM +0100, Andrew Lunn wrote:
> > +description: |
> > +  MediaTek Built-in 2.5G Ethernet PHY needs to load firmware so it can
> > +  run correctly.
> > +
> > +properties:
> > +  compatible:
> > +    const: "mediatek,2p5gphy-fw"
> > +
> > +  reg:
> > +    items:
> > +      - description: pmb firmware load address
> > +      - description: firmware trigger register
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    phyfw: phy-firmware@f000000 {
> > +      compatible = "mediatek,2p5gphy-fw";
> > +      reg = <0 0x0f100000 0 0x20000>,
> > +            <0 0x0f0f0018 0 0x20>;
> > +    };
> 
> This is not a device in itself is it? There is no driver for this.
> 
> It seems like these should be properties in the PHY node, since it is
> the PHY driver which make use of them. This cannot be the first SoC
> device which is both on some sort of serial bus, but also has memory
> mapped registers.

I'm afraid it is...

> Please look around and find the correct way to do this.

Would using a 'reserved-memory' region be an option maybe?

