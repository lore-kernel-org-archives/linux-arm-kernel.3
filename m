Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2792E63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEAV/AUccsH9KXVZCfc4NOhS0kGQQ5Fs2+OImNnh9h8=; b=0j+n+3nI/UFXHIPnbdheEhh+fN
	peAZFiSpxyPQGuDMSBWtbo0CQDDeIM37UyAyD4rgRZdQl2tFWLZ8rGtHsMHFdhQTQV/9pJWYfuXAO
	m9Wpc78uHkXNAONslPwBArAvJviR1p3SQ8NSfLKgQ9IlQWQr7VEa4yiB0ByFOy+LSg7iWUS5LI7U6
	LXs6J36+NqJplliC55Zzq+5tLdftjZc1C++UOOAq5zt6RRDf4/FRZqd39EgIC+BLR27eOJbmJEXPY
	Tx/aR8AFy1bbVwnHWq73jKac+LM9EP4t4mG/1n+HGIJRn8IWkXGRm43JLR+ezOyPFe4PePFQ+2tr0
	TCxGBr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PX-0000000BZ6w-0BQa;
	Sun, 25 Jan 2026 22:16:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PO-0000000BYyx-394y;
	Sun, 25 Jan 2026 22:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FEC7600CB;
	Sun, 25 Jan 2026 22:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687AEC4CEF1;
	Sun, 25 Jan 2026 22:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379397;
	bh=LmmZJZI79asCLMPi5aZ4+J3qsvgagrp0jkKqM4T2DNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLVoODqIPzzzBNLL8gike2sj+iyIVEMzCg/NnT2zt/WerdLI80Z5bP90aJyizHYyx
	 rEAJkyOWCY3KeFBUG2Z93Z98RWr48dP6jKtvcYhbBCRPA9O22ifXvqKIsYzkRLSLiq
	 RJ+AYZCgpdFVBt46ROYYHCXN4u0aIAGOkRqPUbe6hxYi98x/Ce6fbOv/JSCRiViQ1P
	 nNfMayWDsH4Fopi55qmgAeLeYYbpEFARu9IFgOfhNq8B78+4KBW+qprj1aWnetZwCH
	 Fd+PbBbLbuBoHx80w5I3naIizZfFDNr71ddQH9/Unbt9D6jPTT1smsgVIuhEvnB2bM
	 s8KN+a8PWvejA==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	andrew@lunn.ch,
	davem@davemloft.net,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	heiko@sntech.de,
	andrew+netdev@lunn.ch,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,21/21] net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register
Date: Sun, 25 Jan 2026 14:16:36 -0800
Message-ID: <20260125221636.3396323-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvV-00000005ghc-0ZkO@rmk-PC.armlinux.org.uk>
References: <E1vjEvV-00000005ghc-0ZkO@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register

This commit moves the RMII mode bit configuration from the dedicated
set_to_rmii() functions to rk_gmac_powerup() using a new rmii_mode_mask
field in the clock register structure.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  			return ret;
>  	}

For context, prior to this hunk, ret is set by rk_get_phy_intf_sel() to
hold the PHY interface value (e.g., PHY_INTF_SEL_RMII = 4). Then in the
block above (not shown here), if gmac_phy_intf_sel_mask is set, there is:

    ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);

This overwrites ret with the regmap_write() return value (0 on success).

> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

For rk3588, gmac_phy_intf_sel_mask is set in rk3588_init(), so the
previous block executes and ret becomes 0. Then here, the comparison
ret == PHY_INTF_SEL_RMII evaluates to 0 == 4, which is always false.

This means the RMII mode bit will never be set for rk3588 in RMII mode.
Should this use bsp_priv->phy_iface == PHY_INTERFACE_MODE_RMII instead,
or should the PHY interface value be saved to a separate variable before
it gets overwritten?

> +
> +		ret = rk_write_clock_grf_reg(bsp_priv, val);
> +		if (ret < 0)
> +			return ret;
> +	}

[ ... ]

