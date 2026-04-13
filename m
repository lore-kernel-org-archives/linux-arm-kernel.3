Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF0EBFD0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNSkRS98vTD1N1yDX5+Ln00CNvWjycit9ZpJUKlOBuI=; b=x3/kk+zlBwSIEBy7PLOPWcNrUa
	6PizhFlDCT7UCxChbmlVQzJDs4oKskKY2LRIQapWagXuPnZkFWBOygI9vHGfCPYI24HTsOYXOF9kG
	SlL/+6XYdVyNN2ROmbzuIndu6A3AxPgLat65ZzSVXeC+xNmEWxnJa4In85HEIJAKb5HQP8/ZCzvOu
	MLe8/URIrGK2iq7XLcpyKX89knNIySJlD86qIrdHkdGZSZdu/mbyMZTZlzzN2gaO7I2cgzGH0x7ii
	hxO1xHKl2tFKf5c+YjxU8ZtXZrgK3jWlEz+VSZbnGPiT5Hic4NHOWKVF5XRQWdnXuXs3LbfhZoMOd
	iAI5sg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgm-0000000F8eD-3dZ9;
	Mon, 13 Apr 2026 07:26:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgj-0000000F8bB-35UX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wNSkRS98vTD1N1yDX5+Ln00CNvWjycit9ZpJUKlOBuI=; b=FAQAssc1W37ws8pk6Y4/QdsArK
	nUuZ7joUamnaBOr7XODkiDkzMdJUFxpZ0z4OH1Iw+9TCfCA1DP+STwRIltuFlgQqEhd5OZjueLfok
	yRa8pW+UXRMPNLpuMJafSW1OhMqV2Jb3ydaUMuC0CPuI/OsYZWqhdeIIwVoRII2yE8Lu+mI3EbPg0
	diLpDv07ewmLpt7S4dmSqE1I2wRfl10TrciIXS0hJCZr0d1xEEGbXuBNQehKLJq1aXWTNcmKOOxDg
	un/4KU0hj/Fsp3SWHxAW4VA/QSUyE722425Yz3zHIUtceXlolhCG+quInRt+kn+L77+nMG+KfeTDP
	7ikeqJoA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44652)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wCBgY-000000007vx-2fju;
	Mon, 13 Apr 2026 08:26:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wCBgV-000000008Rl-3tl4;
	Mon, 13 Apr 2026 08:26:15 +0100
Date: Mon, 13 Apr 2026 08:26:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	ovidiu.panait.rb@renesas.com, vladimir.oltean@nxp.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	yoong.siang.song@intel.com, hong.aun.looi@intel.com,
	khai.wen.tan@intel.com
Subject: Re: [PATCH net,v2 1/1] net: stmmac: Update default_an_inband before
 passing value to phylink_config
Message-ID: <adyal1InVw6UFmTY@shell.armlinux.org.uk>
References: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002629_812121_52E0D2CA 
X-CRM114-Status: GOOD (  10.30  )
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

On Mon, Apr 13, 2026 at 10:03:39AM +0800, KhaiWenTan wrote:
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register. As
> get_interfaces() will be called after default_an_inband had already been
> read, dwmac-intel regressed as a result with incorrect default_an_inband
> value in phylink_config.
> 
> Therefore, we moved the priv->plat->get_interfaces() to be executed first
> before assigning mdio_bus_data->default_an_inband to
> config->default_an_inband to ensure default_an_inband is in correct value.
> 
> Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

I'll note that this will cause a conflict with net-next when that is
eventually merged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

