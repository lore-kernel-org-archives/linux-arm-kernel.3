Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65194CA0FEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVgYUvPT1vPM01I1nr9R+3H7BRFArSAfjzLQN6iJKvQ=; b=D0ZE1pfMuUT1Pcdh8X8qFON7JR
	TkKKOrw92ArYaN0ZkMqKQwURuunMJSvCw1a0St85RtD++gUGEw5NIKijjSQ3b/p1b83hM8SidRREP
	G6WhWbsLGang8ZG9kGks6ca8YVGmZt1M//8bMLF/meKm54XNBdHvJ0fW3WEADVF72BxnbOaPjNt0j
	g1eOffCD1a+JYXeHRlpXHGcccgEByKyq2PhOooUHX3UeOXqlglScs25Y0nX5LIuA0B/McNXcX/Pa5
	W0fribp/xL1Cj1j1sbSp8X/2PWi7s5mt+MMVuY4yseImxCLFFOtp6c808InGi2KZPohXkais5KMgB
	IAcV5G8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgp-00000008No8-43Wa;
	Mon, 25 Aug 2025 15:00:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXOd-000000086Zb-1i6y;
	Mon, 25 Aug 2025 13:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PVgYUvPT1vPM01I1nr9R+3H7BRFArSAfjzLQN6iJKvQ=; b=SCimNEDupFMkyQhB1L09lOvN6L
	2R2NcLUFXj3aX6q1C9zMzhUzbva/YBhfegk7MxjDN9oyQchc03Y+e3j+lu0irp5X2jaAcQNfcLzkw
	57qcs0A5jOaIq5wT7QANf9CQw6k4yxggPLKlR2yYU9Hywo3l9qD2g0f/WNHW+WeGYkILoDqzSx59i
	64jBpaJd1/A5X2fUoTAm8taxCXd+syedJ0xfiDBwokuWNqMVpiwgI0EQCCMmjCy8MeQ3DEWfab/9z
	P/l3yoCWe6alpUfHXrf9VaRE17B1xFYZ0brzJFjmu3wKvk3yrOAqMNfujbdN1WPD7tVxWtSF8RFUT
	iH3woFiQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53562)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uqXOF-000000006XF-25Id;
	Mon, 25 Aug 2025 14:37:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uqXO9-0000000089m-0a0b;
	Mon, 25 Aug 2025 14:37:33 +0100
Date: Mon, 25 Aug 2025 14:37:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Chaoyi Chen <kernel@airkyi.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next v3] net: ethernet: stmmac: dwmac-rk: Make the
 clk_phy could be used for external phy
Message-ID: <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
References: <20250815023515.114-1-kernel@airkyi.com>
 <CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
 <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
 <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
 <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_063803_446555_F9AA29FE 
X-CRM114-Status: GOOD (  26.30  )
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

On Mon, Aug 25, 2025 at 12:53:37PM +0200, Marek Szyprowski wrote:
> On 25.08.2025 11:57, Chaoyi Chen wrote:
> > On 8/25/2025 3:23 PM, Marek Szyprowski wrote:
> >> On 15.08.2025 04:35, Chaoyi Chen wrote:
> >>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>>
> >>> For external phy, clk_phy should be optional, and some external phy
> >>> need the clock input from clk_phy. This patch adds support for setting
> >>> clk_phy for external phy.
> >>>
> >>> Signed-off-by: David Wu <david.wu@rock-chips.com>
> >>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>> ---
> >>>
> >>> Changes in v3:
> >>> - Link to V2: 
> >>> https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
> >>> - Rebase to net-next/main
> >>>
> >>> Changes in v2:
> >>> - Link to V1: 
> >>> https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
> >>> - Remove get clock frequency from DT prop
> >>>
> >>>    drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
> >>>    1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c 
> >>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> >>> index ac8288301994..5d921e62c2f5 100644
> >>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> >>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> >>> @@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct 
> >>> plat_stmmacenet_data *plat)
> >>>            clk_set_rate(plat->stmmac_clk, 50000000);
> >>>        }
> >>>    -    if (plat->phy_node && bsp_priv->integrated_phy) {
> >>> +    if (plat->phy_node) {
> >>>            bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
> >>>            ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> >>> -        if (ret)
> >>> -            return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> >>> -        clk_set_rate(bsp_priv->clk_phy, 50000000);
> >>> +        /* If it is not integrated_phy, clk_phy is optional */
> >>> +        if (bsp_priv->integrated_phy) {
> >>> +            if (ret)
> >>> +                return dev_err_probe(dev, ret, "Cannot get PHY 
> >>> clock\n");
> >>> +            clk_set_rate(bsp_priv->clk_phy, 50000000);
> >>> +        }
> >
> > I think  we should set bsp_priv->clk_phy to NULL here if we failed to 
> > get the clock.
> >
> > Could you try this on your board? Thank you.
> 
> Right, the following change also fixes this issue:
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 9fc41207cc45..2d19d48be01f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1415,6 +1415,8 @@ static int rk_gmac_clk_init(struct 
> plat_stmmacenet_data *plat)
>          if (plat->phy_node) {
>                  bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>                  ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> +               if (ret)
> +                       bsp_priv->clk_phy = NULL;

Or just:

		clk = of_clk_get(plat->phy_node, 0);
		if (clk == ERR_PTR(-EPROBE_DEFER))
			...
		else if (!IS_ERR)
			bsp_priv->clk_phy = clk;

I don't have a free terminal to work out what "..." should be.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

