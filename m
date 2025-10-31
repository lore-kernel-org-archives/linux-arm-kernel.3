Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502D8CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od4tl//dkTjTTGruGKmAJY8x9vKseCkLwaepLH9PMTU=; b=y4SE+OtCr4aAgQbb026uMLgSoG
	qunpUWoZYwKY5mqWkfTIms8eTef5GbfoCok5mZXX2qwYc+Clf7D9pKH8TPDFMFq0QzRihMu28LLSp
	mxjXSCyvI0uqFyC1JORFt7EMHGqcc8/UT+UqSRbkmUnLUQTikYYoxlFI86iIc4Hsg6xxnPVm3ojYw
	elnWK3TsieOPnEdeP3mh2cE+XLjC4xo4PILIv3iqeSSnodYph+/5jg42iOekwsp4JLkMhnJHzukz5
	iWibbLD5hWpJazSDEQWyGwid4liHU6kn8+u7Qh+j/Wl+dfnmKAn7jw95zHE/FknYmoq4c6Ap36d+y
	40EpHZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnhJ-000000062UA-0KmD;
	Fri, 31 Oct 2025 11:53:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnhE-000000062Sh-2ceJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:53:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E855B1A17AE;
	Fri, 31 Oct 2025 11:53:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA19160704;
	Fri, 31 Oct 2025 11:53:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F171D118120AD;
	Fri, 31 Oct 2025 12:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761911607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=od4tl//dkTjTTGruGKmAJY8x9vKseCkLwaepLH9PMTU=;
	b=gqKwR/CoH45ZjL/r6y039td1WrA3k224uIqW+R73xxUh2pc8PGQjGi4BPbx8t8QYiDup2j
	Dg5E6vslqvFHFBlm9PfNtuEYxQhPL8DkwBrr7GHb1+mlTg8V24sWgrgdoEoJFVUwbJLF6z
	f8R44rk8WH//zLPrjZJeCxuQwX6I/8HOUmgT3XtrmGCHfF9VOYHk37enoPP4B1WonpSIlZ
	YAujIsDnmsXY2FB5846Al9F/YIZN5AOBb6vJkys8fVvs0f0c9LNaYQ4f6PwVoF4SzFikVm
	mER8Ymg7LwFJT3XtuuG3PK+CkQU2ZBU6H/Uh7SPTYivUyYI+CmTtzN/Cdxh9Fw==
Message-ID: <baa56d1d-02f2-4c87-a3da-a7c1cba5a34a@bootlin.com>
Date: Fri, 31 Oct 2025 12:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: imx: use phylink's interface mode
 for set_clk_tx_rate()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_045333_169796_7D33073D 
X-CRM114-Status: GOOD (  12.25  )
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

Hi Russell,

On 31/10/2025 12:10, Russell King (Oracle) wrote:
> imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
> which will be the same as plat_dat->phy_interface. Use the passed-in
> interface mode rather than plat_dat->phy_interface.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested on imx8mp w/ rgmii-id PHY (ksz9131)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 4268b9987237..147fa08d5b6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -195,9 +195,6 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
>  static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>  				     phy_interface_t interface, int speed)
>  {
> -	struct imx_priv_data *dwmac = bsp_priv;
> -
> -	interface = dwmac->plat_dat->phy_interface;
>  	if (interface == PHY_INTERFACE_MODE_RMII ||
>  	    interface == PHY_INTERFACE_MODE_MII)
>  		return 0;


