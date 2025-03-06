Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE91C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLg3duqCK2hWUeRlR2AWlamGy6Hsm8C3eYidl98LRSk=; b=jVMbLFlbMHVo9EW4Vu50g0SJth
	xO3Fg5V4zoP/50wHFe77BdA/IXsFMbMWu9epVve2PC15bt7Dr2gKrRehoe0QyqU3YFKQmdr+rGXzU
	CCDePw3uaRG1OepbqZi6oow/aCUBNonArYefjlQCPdmBXw29Qyi/tP7TwofBbkw6WDq+axdSiDw8T
	TypfNih8WnNp91qZGpcDmf3B12QZcmBSF15o9QvRoamT6N/ypuiebzHyMlWC6QEYAvFCvbW4r8K/h
	ub1ZJjK4GRZ/Bsp4Ot41VeqMuS+JvEjkG+rlD/nGV83j7kP7mQn+9wM7HBa9kAw7C+piE932TvlpP
	V09FNPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqK10-0000000CPR7-2VBU;
	Thu, 06 Mar 2025 22:48:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJzO-0000000CPHh-2fSX;
	Thu, 06 Mar 2025 22:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WLg3duqCK2hWUeRlR2AWlamGy6Hsm8C3eYidl98LRSk=; b=OfEm/pu2toLz8/Xyzv0lALa3nZ
	g91nhITzmWSogS26PvhjV1wX0ump/l/NHKrlqbzEY2xKc+YEjrmnQupJVoK+OgpAxOKn/KAEL9Dat
	expL+6hVxhKMlG2xEZEeQGibmPe8TSrIsV4XTXiZ3n4Jhw6ix5MPIvBYzJOhLQfcQPas=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqJzD-002wTu-Hw; Thu, 06 Mar 2025 23:46:39 +0100
Date: Thu, 6 Mar 2025 23:46:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add GMAC nodes for RK3528
Message-ID: <a827e7e9-882a-40c6-9f2c-03d8181dff88@lunn.ch>
References: <20250306221402.1704196-1-jonas@kwiboo.se>
 <20250306221402.1704196-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306221402.1704196-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_144650_674233_83424BCB 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu, Mar 06, 2025 at 10:13:56PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
> Ethernet QoS IP.
> 
> Add device tree nodes for the two Ethernet controllers in RK3528.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> gmac0 is missing the integrated-phy and has not been tested bacause I do
> not have any board that use this Ethernet controller.

What do you know about the integrated PHY? Does it use one of the
standard phy-modes? RMII? Does the datasheet indicate what address it
uses on the MDIO bus? If you know these two bits of information, you
can probably add it.

    Andrew

