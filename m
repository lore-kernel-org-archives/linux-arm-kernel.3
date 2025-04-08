Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19508C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6Zahi0sarElgNiROhFmUN7IZ3Qj0JsjaKqp3OqQl2s=; b=hq1VE0iPznjzTy1Szx4vqd24Bp
	FQkyQHpCPRlN56Q4OIqRxp/8V1JkcgeIBNHTfySsF7xeutSNenIn4OgkkOl+EDxQRy9mhEMuIC+jW
	gW4ZYeji+CeLLlOVmwTpR2AtOsE7ppNZPDP7Y95JzYBQNV43xD4jdsJRvDvRqUStueFS/etWodgh6
	wmtLWZmoKyWI015I9ejaAcyVWubtJmI6QPQsp0WhC0FiIdFFBgWF5LJEe0VMYBvF4vyPaVxowsehV
	bbREHSU2KSq85APHhDgUHQ8AP+nB7cg6pTGzzpY8UO45yxHIMX2MkYh5PkKxceyMgF9UqGdUlSbJr
	TKmw925A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CmL-00000004z2n-2wRa;
	Tue, 08 Apr 2025 17:30:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CQo-00000004vF8-1hDH;
	Tue, 08 Apr 2025 17:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m6Zahi0sarElgNiROhFmUN7IZ3Qj0JsjaKqp3OqQl2s=; b=WN85ll5GnP8jm4E5CPBNiYzgcw
	Nv//yxrxKFc0F5lxcSLQv23LrGyGOuzPv5ortcl1X5SXrJtaoEfCjwvmA5DWY81euYVe2P5nvI/Ph
	Frgbh6motOShBQOA+igX6ZZT+N3HCHRS6g4pOeTuLjHYsbBka1YP1pNeP3D27uZ+Hymo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2CQb-008QXY-97; Tue, 08 Apr 2025 19:08:01 +0200
Date: Tue, 8 Apr 2025 19:08:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: Re: [net-next PATCH 2/2] net: phy: mediatek: add Airoha PHY ID to
 SoC driver
Message-ID: <7e60d851-1b70-4084-a63f-c8ff7bf81425@lunn.ch>
References: <20250408155321.613868-1-ansuelsmth@gmail.com>
 <20250408155321.613868-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408155321.613868-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_100814_438312_EEF5E231 
X-CRM114-Status: GOOD (  10.32  )
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

On Tue, Apr 08, 2025 at 05:53:14PM +0200, Christian Marangi wrote:
> Airoha AN7581 SoC ship with a Switch based on the MT753x Switch embedded
> in other SoC like the MT7581 and the MT7988. Similar to these they
> require configuring some pin to enable LED PHYs.
> 
> Add support for the PHY ID for the Airoha embedded Switch and define a
> simple probe function to toggle these pins. Also fill the LED functions
> and add dedicated function to define LED polarity.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

