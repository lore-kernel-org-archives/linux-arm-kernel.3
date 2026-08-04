Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6F4C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHqOtFViWLom0UOkJ7evWITdjcrMvUN59L7Fwdq263g=; b=JWd0u2zMzWbKWPUt+XWmECiicn
	N7PyXi3R7HisyrrgNltMB2j+zaxY8TseenpJdEpShN7e7ME84P4/h8M7l2wfM8Av66u+AdyHNAthH
	3SKZsWVulCgcp3/2t0fwC+pGF04VK+4od7pJE/RKTs0La1Hx5dwZKWqoj1ZfHx52A7y1qVCtmqEfO
	ZxkGJIqgl94JoR7dh0j0GTqi+7FV4wPI8I9ENCZmr8+Zwe56kYzYvJ/CII1GEOP2IqHHcCW0VvPJT
	tomQpRrNxdgujZFmKUCW8v0TExwND3Uvyvcfxv8bEaQMEu21a2xtgSUKIUEfpPf8r46sv4/G/1Shy
	EQgeXLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrElg-00000001s3K-3KM4;
	Tue, 04 Aug 2026 13:01:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrElf-00000001s2M-0yUc;
	Tue, 04 Aug 2026 13:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RHqOtFViWLom0UOkJ7evWITdjcrMvUN59L7Fwdq263g=; b=zkhk2nuENDPn5x95KTAqfD262P
	hntbLHyspiSQ9VCoSovjkU+mVq0X72P+V7u5HjQ8wB34FT1ewu442YEUzA2Izx/OhByY3RaZWw9zT
	j8zJMhLn8cO8WW+Ih6hPSbeST+xBOGwWAISWeb39CbRdxtRoR/WmchrZ638yLXC0mbUM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrElL-00FzOx-6C; Tue, 04 Aug 2026 15:00:55 +0200
Date: Tue, 4 Aug 2026 15:00:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: mediatek: add EcoNet EN7528 PHY
 support
Message-ID: <f176e285-bd19-4a17-8b79-d19c76ba9f81@lunn.ch>
References: <20260804103321.3331802-1-naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804103321.3331802-1-naseefkm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_060115_287566_2138D3FF 
X-CRM114-Status: GOOD (  14.79  )
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

On Tue, Aug 04, 2026 at 02:33:21PM +0400, Ahmed Naseef wrote:
> The EcoNet EN7528 MIPS SoC embeds four Gigabit Ethernet PHYs (PHY ID
> 0x03a29491) behind its built-in MT7530 switch. They use the same LED
> register layout as the other SoC PHYs handled by this driver, but their
> LED controller powers up with its external control disabled, so the LED
> pins stay dark regardless of what is programmed into the LED control
> registers.
> 
> Add a phy_driver entry for it, modelled on the Airoha AN7583 one. Its
> config_init callback enables the LED controller through the LED basic
> control register, which this driver does not program for its other
> PHYs, but which the air_en8811h driver already handles as
> AIR_PHY_LED_BCR. LED behaviour is then controlled through the phylib
> LED operations shared with the other PHYs of this driver.
> 
> The LED block is shared by the four PHYs of the EN7528: the LED
> configuration programmed through any one of them applies to all four,
> while each PHY still drives its own LED pin from its own link state.
> 
> The EN7528 PHYs need no efuse calibration data, so relax the
> MEDIATEK_GE_SOC_PHY dependencies to allow building the driver on the
> ECONET platform.
> 
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

