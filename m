Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB6CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELtPug0i9sYUL+KNurYXq5o8o8QrKvtedx3uFu2ZYk4=; b=oojnjr8RUf7/jQqv/Oj4cv3VNf
	G8asUFME377vKE158W7nVcfzu7yeIiUXBUidJzhfGFnvFkRHW4PhArFQTe/U1/llgvUn4BRVnt27e
	PFGOEadX1qFWvbHmqeNw9+4BB34f8+dVXVkHywwB3EiIV15sZwYu2YemOCkThiQFknJL1R81C4U6f
	prrxv/KKr5+PLXXiXeAB+st69vaFF+LBlEO4W3jaWz9/Wu2QhzpKOlZPSyoM1JEq/ZEUvVGO1HN7b
	YzcZ6qNxcvpmIen/Ek9SpwalOnR5hYg0UagLpnC9VpR8T3gOPtqw5B9aBPYH0/Y/yv3/4+gOYluEC
	KK0bvnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQLx-00000009C7X-3i0q;
	Wed, 12 Mar 2025 17:58:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQKI-00000009BhC-0eTh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ELtPug0i9sYUL+KNurYXq5o8o8QrKvtedx3uFu2ZYk4=; b=q8FeuJsN7tk0jIYeKrRIbI3M4L
	qdS+KCCiGpBGH6aXAxkRQ0VbZl3VYoBD40R3DRTmbZgmSlol7/PO3rJHy8+lyGQHlmTb+Ty9psR4V
	XlvtlC3f5rPcm8rtkOuSdgZFs7G3VZHgOvgCQbN95hhP2f3NNk31G0o/xvVPc+AcfSX9ax0hpWEZA
	vVa8FZBWONTVb7WoNPki6EaeWQI3EyJRU6ogVKIMhY2m+dRgjOAxkIEDO2W3dwJMoVhFavh/4gLf/
	Hw1PerJFMIqxaxlcwkYjQFMFyLgOXUbpPmutNNpVM4pCkR5kpcE1Q00uBd371DejM7cndyLZiWE6z
	8x8SIfPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56474)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsQJz-0005yq-08;
	Wed, 12 Mar 2025 17:56:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsQJt-0004kK-3A;
	Wed, 12 Mar 2025 17:56:42 +0000
Date: Wed, 12 Mar 2025 17:56:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v8 2/2] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <Z9HK2de5Ba_Vbeo7@shell.armlinux.org.uk>
References: <20250305091246.106626-1-swathi.ks@samsung.com>
 <CGME20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd@epcas5p4.samsung.com>
 <20250305091246.106626-3-swathi.ks@samsung.com>
 <Z8hjKI1ZqU19nrTP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KgFmUEDr5J23NjRy"
Content-Disposition: inline
In-Reply-To: <Z8hjKI1ZqU19nrTP@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_105706_199862_2BDB75E5 
X-CRM114-Status: GOOD (  14.87  )
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


--KgFmUEDr5J23NjRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 05, 2025 at 02:43:52PM +0000, Russell King (Oracle) wrote:
> On Wed, Mar 05, 2025 at 02:42:46PM +0530, Swathi K S wrote:
> > The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
> > The binding that it uses is slightly different from existing ones because
> > of the integration (clocks, resets).
> > 
> > Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> 
> This looks much better!
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!

Hi Swathi,

Please can you test with my TX clock gating series applied
( https://lore.kernel.org/r/Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk )
with STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP set as per the attached diff.
Please let me know whether this passes your testing, so I know whether
this platform supports it - please check that this results in a
message in the kernel log indicating "tx_clk_stop = 1". Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--KgFmUEDr5J23NjRy
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="stmmac-dwc-qos-eth-tx-clk-stop.diff"

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index a94088b32c11..64867a65e875 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -363,6 +363,7 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
 						data->stmmac_clk_name);
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 
 	if (data->probe)
 		ret = data->probe(pdev, plat_dat, &stmmac_res);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6f29804148b6..b015240e4121 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1109,6 +1109,8 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	if (priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP)
 		priv->tx_lpi_clk_stop = tx_clk_stop;
 
+	netdev_info(priv->dev, "tx_clk_stop = %u\n", priv->tx_lpi_clk_stop);
+
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
 

--KgFmUEDr5J23NjRy--

