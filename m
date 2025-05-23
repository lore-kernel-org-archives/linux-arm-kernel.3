Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1798BC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DPKAvfg5f4Y3SBIphoT53zbwhsUwwLhBf0NzO10Cgs=; b=EBzkXs6pKbW53vkLRRHYTFUQpu
	8wm3Tqdk6JvU2xZTtgoN8r1cTuiVzZti9YgGM6lKV1ZFCKjmHnHz6ZMN2QQRfxoEBu/OjnuFNg4be
	C+P1JnEYhnXk2g8wJCFGjx/9usaEMPsBJrvN01lcIrdpC/7OOiQcNoZ00LzxM4ixOdGUUz/pFrVzL
	PT2RPczXALGdgr8sGr8oLeTROmpI5JbyreZAR49APkJeiNybaYQfZyYY2aT+kjGh1Lgej8zGSAh86
	o/niGYJ4CO5DZdbuBP71BISHH53b53sf8pGcTWNf2pHUkzwO5Om/ITdmRVXwlnmy0UqJeXd+8mCtX
	0c8j4jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVmu-00000004Toe-0Arg;
	Fri, 23 May 2025 17:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUqg-00000004Ks1-1m19;
	Fri, 23 May 2025 16:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0DPKAvfg5f4Y3SBIphoT53zbwhsUwwLhBf0NzO10Cgs=; b=LAr+3yBu3Z+fwFA6rm4eODQWOO
	NmaD/apqNRD8YlnG2LTd6ZAkuMdp82qbgqGotxs2hntYYDQU8d1vYAadIRyaZCjzq+/U5S+3oLugg
	19QSkvdWO8FJ5eqOcLHiLvWPQw1eOw9thS6fi08hrXvjwibNhd2OsJcGZOZYrI94uNHukJi6vkqmh
	Hh1jLg+coTtXp/pOJhHyy72hnfro4VgJ65vNJJMbTrwoAWeBLUMNnrqAKtQXpJfp2MKk9UHmiIwa1
	UjKBDY0sjVlOJXsJQmeX9B3YiEM3531I8lS7ZuNvAWfQzKiBRQMWe8ipl4+i2oKwE1NAsRA7V7K92
	X9X+49iQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUqd-00000001LmX-2EC1;
	Fri, 23 May 2025 16:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0DPKAvfg5f4Y3SBIphoT53zbwhsUwwLhBf0NzO10Cgs=; b=OpQcs4dcB6OWU9mlLf31Gzrhvv
	tb+hAOfomI21FW70GV6ifTR+Zu4IGNBr6FuaOsUdcAh2lpJb3aG44dd2qd/xAFxyqLE88j1yp6wAA
	iYkunMJADxww4SJ57C3dd5q2s5gZEeki2AICqkKOMSGUz7VzXMwFrnzA9FxIE8UOGaDI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIUqQ-00DcxW-JK; Fri, 23 May 2025 18:02:02 +0200
Date: Fri, 23 May 2025 18:02:02 +0200
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
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] net: phy: mtk-2p5ge: Add LED support for
 MT7988
Message-ID: <afb80927-d921-44d7-8a32-f109e5ec5143@lunn.ch>
References: <20250523113601.3627781-1-SkyLake.Huang@mediatek.com>
 <20250523113601.3627781-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523113601.3627781-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_170215_718589_FD586737 
X-CRM114-Status: UNSURE (   8.74  )
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

On Fri, May 23, 2025 at 07:36:00PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Add LED support for MT7988's built-in 2.5Gphy. LED hardware has almost
> the same design with MT7981's/MT7988's built-in GbE. So hook the same
> helper function here.
> 
> Before mtk_phy_leds_state_init(), set correct default values of LED0
> and LED1.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

