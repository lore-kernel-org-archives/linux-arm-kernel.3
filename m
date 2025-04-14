Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3586CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZVRVFitHVYKh8lUFpDXz29jMQ4TVL55S2+Fg6L3zdM=; b=TDaZ/ZROS+RwZhbMaS4tvPnn0r
	/8DtAAZAHGEp19sibP1gqMiT4ALEgR1MldK1PXStnfRmjsBsk+XwKg4s7Ok7dkulG7IydQwOdgU7I
	hc9rBz/eg/Noc8drPa08NkTDVcXMb7WO8tfrdQMSR2GJsmukoQbMzMjQfCmz4gYFy71hBKfDZ0fei
	khaNt3y3v3AlL6X5clMI0bs+Zf55HLCqThXZaebejmeNu63TBNIv6Pw3k6PHJMtDQd5utavs9wUnv
	C2BzTon+oAfuZNvyBuaX/raU5bhmuU7u+7qg4IyZsqkOCjIzITGiz7ZZQGjzQ1F1r9OHLqGsJJ4m1
	m7ZmiOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4NCW-00000002sHX-43Hb;
	Mon, 14 Apr 2025 17:02:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4N8M-00000002rUW-3hVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 16:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yZVRVFitHVYKh8lUFpDXz29jMQ4TVL55S2+Fg6L3zdM=; b=OjIeHuD93l2eyXtskX24h8WOtk
	L0lAdRcCp2gO9pW7MVq+3mm1HqBIp0Qpome2851bjAZ/uO0U4rITvM2C13uYfxaq5jcMJlLhx46gb
	CFyTcWeFOjvOWJuTu23KNEiGhH/TJiPjV2yV9bOq86Zto0+sQ5ACQ3wFcc0BXltuA+S6veUoXhKOZ
	9givV4yMZuESfUKFgiHLB6mudZhFAdWPUxka2yklXXBHXCWKHWA1An3lhBuu1ogx0NNNbjgn0d+se
	KNKSCbD+JBnwkWd7Lfk9p/Qv8HiRzUoOjhd8wKNXJCvd/DVerSJ2YlJT6Lz/j4YmfUNVhRMBuisF8
	wlBiGAnw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35404)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4N83-0006rx-0D;
	Mon, 14 Apr 2025 17:57:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4N7w-0007v6-0o;
	Mon, 14 Apr 2025 17:57:44 +0100
Date: Mon, 14 Apr 2025 17:57:44 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_095810_919476_2633C463 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> +	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(gbeth->rstc))
> +		return PTR_ERR(gbeth->rstc);
> +
> +	gbeth->dev = dev;
> +	gbeth->regs = stmmac_res.addr;
> +	gbeth->plat_dat = plat_dat;
> +	plat_dat->bsp_priv = gbeth;
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->clks_config = renesas_gbeth_clks_config;
> +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> +			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> +			   STMMAC_FLAG_SPH_DISABLE;
> +
> +	err = renesas_gbeth_clks_config(gbeth, true);
> +	if (err)
> +		return err;
> +
> +	err = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> +	if (err)
> +		renesas_gbeth_clks_config(gbeth, false);
> +
> +	return err;
> +}
> +
> +static void renesas_gbeth_remove(struct platform_device *pdev)
> +{
> +	stmmac_dvr_remove(&pdev->dev);
> +
> +	renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), false);
> +}

Would calling renesas_gbeth_clks_config() in the suspend/resume paths
cause problems?

If not, please consider using plat_dat->init() and plat_dat->exit()
to control these clocks, and then use devm_stmmac_pltfr_probe()
which will call the ->init and ->exit functions around the probe
as necessary and at removal time (and you won't need the remove
method.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

