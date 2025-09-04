Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7148CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgQkSL1KPd31q0yGx1YBfBg/BNXTL/hwsPCMI8L4USk=; b=gLN4cN+PMI/3MuXNKpU7LhnXai
	3afYvGzdD9GSFF9FatuWtV/YyOeDhwxh8ifhZRsVu67Nspy0UW+8ko40/6bnixZHbbHmaCfURlJxF
	IBKgi1+IrHDDhyfad8ljfeq7MLqW4hf/wvq+tQiTY13+pQjHy0dP73WBrVTWy6ceIYrItkOl6PcK/
	0p6g7cxe6q5WysPBIse3cyGLFjeqzyYYE3qrhDXL67m4ejkbW8Kx1l9zAreDrAji7e5EvwlckORqh
	aRwMuftOg49z/SpPQnKtO5y6bW2J2uTRArf7DmUGDmsdgba2P7N6hot3sDbpitq4bLZ+WVgLeYyhc
	acKgr+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM39-0000000G1p0-1IJf;
	Fri, 05 Sep 2025 02:19:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGu6-0000000ENq8-0KNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MgQkSL1KPd31q0yGx1YBfBg/BNXTL/hwsPCMI8L4USk=; b=cafd0cQl9t9SZ6QiVZLpIxJfk1
	nSGxl+L3uTgjh2c26Pg8GivhTLKLI9rB5WC2JhFEvZ7VO5rU3HCGFQ3pXcyRAsXbYnLDPllgZoYYg
	LtpX1A890+XJGATjLiJUfNfqo7RM9SxLuDg7hLT1XWKLURmspGmuSxCpnPdCz0odRK8XbWovJdMDx
	yDLtxick2P47burx74WmW4HcMGAQpWah/L4XyGHN7QVmhVZ6rexPUR0bIwvPXGsGTVfJ4HTAa+5Wt
	XIMg0VOvEWPuugPUjlQHfafL0bRsgUj7xEhA+K61CnKQHtq6OuXyyNsZo+GRwZRf6cTzhFubCO29n
	XeiF82Kg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57380)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uuGtn-000000002X1-2IMh;
	Thu, 04 Sep 2025 21:49:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uuGth-000000001qx-3mKy;
	Thu, 04 Sep 2025 21:49:33 +0100
Date: Thu, 4 Sep 2025 21:49:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF
 data for configuration
Message-ID: <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_134958_118710_3E6F7CE0 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
>  	plat_dat->init = renesas_gbeth_init;
>  	plat_dat->exit = renesas_gbeth_exit;
> -	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> -			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> -			   STMMAC_FLAG_SPH_DISABLE;
> +	plat_dat->flags |= gbeth->of_data->stmmac_flags;

You include the first two flags in your new device. I would like to see
at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
changing existing behaviour and causing regressions. New stuff should
always set this.

If there is a reason not to have this set (e.g., PCS doesn't support
it) then we need to make that a PCS property and extend phylink's EEE
support. If there's something wrong in the setup that stmmac does for
EEE, then I'd like to hear about it as well.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

