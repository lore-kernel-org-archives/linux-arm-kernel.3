Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F8C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8uikXhV15Q5egAKseXehuXCgd2/OVS4d4R+xSSyUB4=; b=yPe0NWYBzu6p+xwyIOomRUDUTt
	3k/LBHt+DeyYtvEix29PJeFak+xT4J/jo20C2t+gikxzPjpV9R5zvsgc1tWG1h2VPL3fZ7c14BQyK
	Iqxy1pq3Tyiu6Dk47vpU1npbepxlGZIvpb/O446BIXUcEF4Dmt3/nw9rUZHBL8Y80yNyOWE0S3qcK
	xhNhgs7iVRoGQMhvB/KSFmksO3UyneR3GVx4/NQByNnfkQHVslnN9gBqOu6RYmNBB6K5wGxOH0i6D
	h2YX1IhxDO5grFM0GPu/rWt1He+YO+wUKakDpxz4UEuvay4HjzmcKFXs6UFEQddsrLv6SlbUGcl6N
	61UJBUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBw5-00000004ubJ-0NeD;
	Mon, 16 Jun 2025 15:39:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAKX-00000004cTF-37Cb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I8uikXhV15Q5egAKseXehuXCgd2/OVS4d4R+xSSyUB4=; b=XRBiCJoj0m/h2GD0ooSqWOR7xg
	sOuaYETqGk62avj7jvQZG5LMoweoWI0EQvR7qFPa7B29bCbj24ONn8kLZsXDFg5stGHdTRUu5uRTw
	chi5aSY1WMQb1XzBqcZNtU2WxwhT0dkvNJArTPkvBWiLXVRUtPIIyw17+FzuXn6fQZok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRAKM-00G381-F0; Mon, 16 Jun 2025 15:56:46 +0200
Date: Mon, 16 Jun 2025 15:56:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: rk: fix code formmating issue
Message-ID: <48479e17-146a-4f82-a0a5-406a5949134e@lunn.ch>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
 <E1uR6sZ-004Ktt-9y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uR6sZ-004Ktt-9y@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_065657_778683_F3BC0288 
X-CRM114-Status: UNSURE (   6.30  )
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

On Mon, Jun 16, 2025 at 11:15:51AM +0100, Russell King (Oracle) wrote:
> Fix a code formatting issue introduced in the previous series, no
> space after , before "int".
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

