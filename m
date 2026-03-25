Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276AE109C057
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LYOU/TLhQLEYy/E7Cpnl7qWbK1lzoWToXQcIDhc9hU=; b=JIC5oICROFNHk9+TeZu5CIwCXZ
	RpcNpT2243b/io6lpLacXLWPszI38/6tR/WAggjT8Tc6cEbP7MSH2Yr0dIyNW8J38wRDguKaIqRzm
	Y3V5PaI8l/pTia6Vqps5Z/pQ0HxwmW6d8+f0LxCQXyl4AivJNSOaQIkx4HzARo4h3BDVltYHgC/wQ
	EO25Gp/FMXh0wuhMSwKiFQGMVGELZ5g4+VxKbsYf6wTRZ2hxjA452j0x4l57fGyHT8m6xxCXFRsRb
	HhDhWXfBNU0Un0iI2W2xWMm2ZxeDTtC00Ct60uacHbY6Lz6rZrR4NzWsqzu1s8cKRx6Y6keON8Bwt
	J5J486qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5UBN-00000004AwU-2lEc;
	Wed, 25 Mar 2026 19:46:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5UBL-00000004Aw3-0uMQ;
	Wed, 25 Mar 2026 19:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7LYOU/TLhQLEYy/E7Cpnl7qWbK1lzoWToXQcIDhc9hU=; b=0X/v1cF5lfqypgKdvgWcxL3F1E
	WNiHNjrWD0/SmejAkVNBaFX2ZuNNM04cylxPRGXzxsJhshZjfd/Xx2s0eBtWZett7oYiM8229zId9
	Jm8WCuaVgwxARfFNLd65aMwzFHKDWl8bBCUniK96alDmsGNfCL4EtdARV96JZvLv4Xr0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5UAw-00DLrq-Pm; Wed, 25 Mar 2026 20:45:58 +0100
Date: Wed, 25 Mar 2026 20:45:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R Gigabit
 Ethernet PHY driver
Message-ID: <75c10c97-8355-457d-9458-0d88d598445e@lunn.ch>
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
 <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
 <3fbfabf7-b3af-405b-ade4-4f62db2c1c45@lunn.ch>
 <199e674cfdbccad104db761964611b1d6352f9f3.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <199e674cfdbccad104db761964611b1d6352f9f3.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_124623_272518_C656447A 
X-CRM114-Status: GOOD (  15.93  )
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

> > You configure the PHY to support downshift. If it has performed a
> > downshift, does it report the actual speed in the usual registers
> > read
> > by genphy_read_status(), or is it necessary to read a vendor
> > register?
> >From the tests I've done, I got the actual speed read correctly by
> genphy_read_status function.
> I did a test by adding in this function the vendor register reading at
> the same time and comparing it and did not get a discrepancy too when
> switching with ethtool between different speed configurations.
> 
> Would it be more reliable to use the vendor register instead?

It is unusual to report the actually speed in BMSR etc, which is why i
asked. But if it works, this is fine.

       Andrew

