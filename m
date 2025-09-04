Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9487CCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+dGMtdtbtPkJn14dHatEx4CiUjsN+rJYDHVha04vms=; b=5DhBCo8RuQ+XfhesbAcOQEER6i
	wm3yeE/z5eEXoNfymRivjfY2nZVwqtVUu1DigDmqCGOL9Kks9o1D4eHH0pfcbD1X1YTOFJ7IVEa+5
	Yd7/XUJFOUDe02yI7cd9rEdVuG0RJe0EIj4nATD47yJLJPpB/oJ2YDD7aj3V0M+hjX52Boljw5uGA
	4q9m+gJso0J16y3aO5cmtTo+Nu1Bw+NVJ44R+vw3hnrjhBxFBPus21Jp9B/r/GDYbuAWior093F82
	K8iDh+As+r4ePDNAeF4Mj3nX/Akcy5BTqIq52HIHN7Bhk8CyxykTAUjlFWVYh1UWPcLY3NW5yT/PV
	/+dn4ybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8q2-0000000BU7J-2S8W;
	Thu, 04 Sep 2025 12:13:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7fX-0000000B3Os-2FYo;
	Thu, 04 Sep 2025 10:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0+dGMtdtbtPkJn14dHatEx4CiUjsN+rJYDHVha04vms=; b=Hceoe2W9SjDvm+/UrrvyknUWpK
	4OF4nbG9zdLI7FmDlGd4t+cGFfcNs4Cb8m8ZMZN5iNhs7TbMrSp1O+UEOs7eA8XtUpg2yyV58e8GO
	ty2qX1Aqn19LOsV34Jjou2Xa1/fCJIv199mdEXYheDlPIa3WJzmRRg+I80XTOf5K64kX0tXQqb1y2
	YcmwP26pbT0FzdCxUylGypZw8MXNbEi8scU3mmHiw1kQnlK+IRXmCjIyuiXgXQqrtI2gpe0xjLb0F
	yJx9lmSLgBdwv/wouAniGZcCnEH9x4OiFPa0ZYqUqtVeIq7C6w77gA3OX8EuCUmVUUCyiptzkgim6
	HL889VZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55126)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uu7fN-000000001r8-1SFK;
	Thu, 04 Sep 2025 11:58:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uu7fM-000000001S6-0098;
	Thu, 04 Sep 2025 11:58:08 +0100
Date: Thu, 4 Sep 2025 11:58:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yao Zi <ziyao@disroot.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't
 contain invalid address
Message-ID: <aLlwv3v8ACha8b-3@shell.armlinux.org.uk>
References: <20250904031222.40953-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904031222.40953-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_035819_576146_D0789D70 
X-CRM114-Status: GOOD (  18.25  )
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

On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
>  	if (plat->phy_node) {
>  		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>  		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> -		/* If it is not integrated_phy, clk_phy is optional */
> +		/*
> +		 * If it is not integrated_phy, clk_phy is optional. But we must
> +		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
> +		 * the error code could be wrongly taken as an invalid pointer.
> +		 */

I'm concerned by this. This code is getting the first clock from the DT
description of the PHY. We don't know what type of PHY it is, or what
the DT description of that PHY might suggest that the first clock would
be.

However, we're geting it and setting it to 50MHz. What if the clock is
not what we think it is?

I'm not sure we should be delving in to some other device's DT
properties to then get resources that it _uses_ to then effectively
take control those resources.

I think we need way more detail on what's going on. Commit da114122b83
merely stated:

    For external phy, clk_phy should be optional, and some external phy
    need the clock input from clk_phy. This patch adds support for setting
    clk_phy for external phy.

If the external PHY requires a clock supplied to it, shouldn't the PHY
driver itself be getting that clock and setting it appropriately?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

