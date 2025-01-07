Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B6E77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dW89n42NmkpEIRJUxQQno3eIDg8+CSGSrGgZHeTnpZo=; b=HPNWOsK5N8nyYj1Xh3iyDinS7u
	75RmZgoaWPGQRADFOdZGqID67KighWRJGlvMLeJD46PhWJn4Nu9/L+5jVd/v9E/TlgHuOofGoN5fs
	YrdlAbSxKaSS0F8Ls/Y9AJPJ+brpBLRii0eWCYJYeX2OUSZdyLs2hwvUKnVrxRiJpc/1H+b1ge5ot
	H/U+MaSfSMAzzInTw6dc5JCk+jFcSBt4SOM2sbnD2AQpoUDs54wwaLf4oCG/E6yxGHkKAfJjv7Son
	LBIiNip0dJCu0S+HNSvbxL5YLuAAbmiTGng/p5u+H3l6gkEsZdD+++qfjf4arjtcK+J7G9j2jJfgL
	83uG/wRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD1z-00000005l9r-0qhf;
	Tue, 07 Jan 2025 17:06:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCX9-00000005esx-2UAU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dW89n42NmkpEIRJUxQQno3eIDg8+CSGSrGgZHeTnpZo=; b=xdTmUK86AuLgBEOEBUTvAmAlUS
	4hvp7u8bGFejhTcWLPu+4flofsd5I/4UF7vfEmaZ+xN789xk38q6zobdEC/ZyycSIZ2GWN+fxzHWJ
	yRS2PNIjrS7uInj/vcMppd2eCmcX6p9xpExcZg9fPYkiIuh4x1FeLy1v+7Vr9BaGKJbyVY/pHVP/H
	4hUkduFB2Ik5nsbO5xvemxojrWYvRoHBi20zT0vNJcuf78Vczy3mN5tjq3F8Lzj+YupAh5WgIOxb0
	1DSSFsCyjEfvznhijkpj/9OxrwfRrS8lTiVZiTYWK9tXJtMebuyxtkOx50D0Dked4yj8gm0/t1Qm8
	97f2+Tog==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60026)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVCX3-0007qV-0K;
	Tue, 07 Jan 2025 16:34:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVCX0-0005R5-28;
	Tue, 07 Jan 2025 16:34:14 +0000
Date: Tue, 7 Jan 2025 16:34:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 03/17] net: stmmac: use correct type for
 tx_lpi_timer
Message-ID: <Z31XhoshqSd-a6pS@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <0cf7eacd-6834-47d8-b370-cac5a7395d44@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cf7eacd-6834-47d8-b370-cac5a7395d44@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_083423_627916_98B0FC2C 
X-CRM114-Status: GOOD (  13.98  )
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

On Mon, Jan 06, 2025 at 05:45:37PM +0100, Andrew Lunn wrote:
> On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > Use u32 to store this internally within stmmac rather than "int"
> > which could misinterpret large values.
> > 
> > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > should be unsigned to avoid a negative number being interpreted as a
> > very large positive number.
> > 
> > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > rather than int, which is derived from tx_lpi_timer, even though
> > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > value argument type for writel().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

FYI, because of splitting this patch, I've dropped your r-b when
posting v3.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

