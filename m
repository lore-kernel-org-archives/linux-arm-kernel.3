Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAFBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 01:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZeaYSvjn6JUg4GMyZmlR25k/eELyipTcGo/9lSTmGA=; b=Osf+9wxq+sOWSLMYBuA50TxQG7
	z+m6KXDJZMXCkRr7YGUo8/PArBJRxHI3vXqKMQzTdvLejS6/R/ZDd3DjxV7L9nV3RTjr5mbW7mHJB
	HGGjAQW/OFx8pNiTO6KnBo9WOd351TJI2utGq+Gm1yMhxf+7JD/M4a+6WWharA40CiuCTBSiHGMVC
	JjhJdiVSXjsgZLIDDR+VGA8UbaaCZooCrV8x1VIFxvuLC0LEaexl974CkgyqzVarXgA+hPVD5voHb
	ppz9VD4mqZJgO+mnuI6z124XCFRmIDTHOZrWWSgIx0S/6UY0+88S82j13WkHO2/HRW2xY/UH+t70V
	zaOAITyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTWSu-00000001QCk-38YH;
	Mon, 23 Jun 2025 01:59:20 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTWQZ-00000001Q3S-24uW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 01:56:57 +0000
Message-ID: <5dc786e1-0e2e-468c-b2d5-b8e93e6d8265@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750643809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZeaYSvjn6JUg4GMyZmlR25k/eELyipTcGo/9lSTmGA=;
	b=pUsOTE+fGNzyYUdlj32n3mwL/6desRujdrVDvH0OPo3T5FiBJykop9UNruC7nGCrPCFG0n
	/8DcTeqKO8Pq7OuZXWNQ+qXHMYbOisFRZV1Nlk8JE0qwddwGbndo9PnJ752loZD72P0IRw
	BgdrdXjKSAOxdNM25QDDhwKZPlgzb1I=
Date: Mon, 23 Jun 2025 09:56:39 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: lpc18xx: use
 plat_dat->phy_interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Vladimir Zapolskiy <vz@mleia.com>
References: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_185655_962835_F0BD051E 
X-CRM114-Status: GOOD (  21.19  )
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

在 6/19/25 5:47 PM, Russell King (Oracle) 写道:
> lpc18xx uses plat_dat->mac_interface, despite wanting to validate the
> PHY interface. Checking the DT files (arch/arm/boot/dts/nxp/lpc/), none
> of them specify mac-mode which means mac_interface and phy_interface
> will be identical.
> 
> mac_interface is only used when there is some kind of MII converter
> between the DesignWare MAC and PHY, and describes the interface mode
> that the DW MAC needs to use, whereas phy_interface describes the
> interface mode that the PHY uses.
> 
> Noting that lpc18xx only supports MII and RMII interface modes, switch
> this glue driver to use plat_dat->phy_interface, and to mark that the
> mac_interface is not used, explicitly set it to PHY_INTERFACE_MODE_NA.
> The latter is safe as the only user of mac_interface for this platform
> would be in stmmac_check_pcs_mode(), which only checks for RGMII or
> SGMII.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>

Thanks,
Yanteng
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
> index 22653ffd2a04..c0c44916f849 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
> @@ -41,6 +41,7 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
>   	if (IS_ERR(plat_dat))
>   		return PTR_ERR(plat_dat);
>   
> +	plat_dat->mac_interface = PHY_INTERFACE_MODE_NA;
>   	plat_dat->has_gmac = true;
>   
>   	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
> @@ -49,9 +50,9 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
>   		return PTR_ERR(reg);
>   	}
>   
> -	if (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII) {
> +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII) {
>   		ethmode = LPC18XX_CREG_CREG6_ETHMODE_MII;
> -	} else if (plat_dat->mac_interface == PHY_INTERFACE_MODE_RMII) {
> +	} else if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
>   		ethmode = LPC18XX_CREG_CREG6_ETHMODE_RMII;
>   	} else {
>   		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");


