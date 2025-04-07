Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D44C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQZF3bHFrRzkhV+LKvF3d5dfM2bWmbi8UIfdjStHGX4=; b=gGgDQvEXJdnm3G/YNyJEy2cPaI
	1U+drLl/26EiRgy31F4JFcZ9t644p4Lb1NioLCvSDFOt80am+V1P1iovqjs+8eLlI7YRIoNo10SQM
	USxqSujumNf96v4mYCUPTEVv5KCTiZbLUF9BHTEdXMSSOyX1v+gKau+ymEzKyRtBdxy7MZLeP+M5u
	8A2u5+rqvNIQW2AA2LUfiMR2enqm2vwhw3Ro+zLoBJSXhjNb+WbehUZtDF2DOccWgW4XktJctjka0
	nWhrhSHcA6HQ1kCyZyVwG1CTBSoQrR3Cpht28GVpoyVYKcD+BAYvNepbBHhaZEy42osyfpPeZG/Nx
	FFepreXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZt-00000001fj7-49Sp;
	Mon, 07 Apr 2025 18:52:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qjj-00000001S6b-1mIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FQZF3bHFrRzkhV+LKvF3d5dfM2bWmbi8UIfdjStHGX4=; b=WlGmVHMVJCxY5iiYt0wYPPv9S/
	K+r0x/7QswlLVAvAjukNFL5ndYGtlZ1/u8epQ0A4/lD0fy1PuATaJtDAUOKSTPMVB3m9d8mqIKVjQ
	jKN2HY2tLwGol6pm30f/jJ8D2W2NJXhjUoaM+zpHzzGpGA+RYhI+qVYQCTb85DINqdSiXuOlDyhut
	RWlHSwmJVAo/P+ipwBWUGibW6T4f1tJuG6S02ymjq8HT9Hasq+o7ilZgM8ppJa52emVHbWU7Cp5f2
	uutqqPomR9ipCpMvz5CIlO1TzpnSQ9Wb7PWqVOuqjvJIt5Y+T66c8eqehUGEvO+OrHR6oApwIZXip
	cYrIt12Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u1qjN-0005nL-0u;
	Mon, 07 Apr 2025 18:57:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u1qjG-0000aL-28;
	Mon, 07 Apr 2025 18:57:50 +0100
Date: Mon, 7 Apr 2025 18:57:50 +0100
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
Message-ID: <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_105819_463996_26CBF012 
X-CRM114-Status: GOOD (  14.30  )
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
> +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data *plat_dat,
> +					  const char *name)
> +{
> +	for (unsigned int i = 0; i < plat_dat->num_clks; i++)
> +		if (!strcmp(plat_dat->clks[i].id, name))
> +			return plat_dat->clks[i].clk;
> +
> +	return NULL;
> +}

In addition to Jakub's request, I'll ask that you hold off for a week
because I have the following that I'd like to submit:

bbc73b8b6dfd net: stmmac: provide stmmac_pltfr_find_clk()

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b8..43c869f64c39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 #endif /* CONFIG_OF */
 EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);

+struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
+                                 const char *name)
+{
+       for (int i = 0; i < plat_dat->num_clks; i++)
+               if (strcmp(plat_dat->clks[i].id, name) == 0)
+                       return plat_dat->clks[i].clk;
+
+       return NULL;
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
+
...

which will avoid glue drivers duplicating this functionality. This will
be part of the first sets of patches I'm going to be submitting.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

