Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09091E6C60B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN8hekXjNJEm7ZvIZdcfuyMUdrsEwrlGDmj8Wg0YMpY=; b=vHk6pRbEJ5o2BdAOOrJq31Nn1S
	GqArOzBWYwI+aIejdxrq6XYc4Buc3UuWIFT+/9X5BepbRapkwNoN342FGSDbEsmMASygpUcYmuzvI
	WMdrxlKaq+181uZ6WRC++c4RQLviRqaWIG19/AkTtc+a2xvOMhYeUWUJz2Vn98bkTFBGvl7AWpRKZ
	5f6O298vuQNCUjx1Cq7N1bwHWM+RrPNt0ugHifZvGeh1HrRlN/aSWUuAOhQ8b7nYdcAKx5tkz+STu
	xiHCyP3fxN07dOzXNzthZ134oLXA1dJLdOaI6jn71Eo187sspMzfcFWouL5n095IKw6habzUMp4qA
	9b6qwORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMUE-00000008QFD-3X9p;
	Tue, 03 Dec 2024 06:34:18 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMTE-00000008Q7j-3P9l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 06:33:17 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 099B91A05B3;
	Tue,  3 Dec 2024 07:33:15 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F00441A05A5;
	Tue,  3 Dec 2024 07:33:14 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 48117202A7;
	Tue,  3 Dec 2024 07:33:14 +0100 (CET)
Date: Tue, 3 Dec 2024 07:33:14 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v7 14/15] net: stmmac: dwmac-s32: add basic NXP
 S32G/S32R glue driver
Message-ID: <Z06mKpcvBO23RSx+@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-14-bc3e1f9f656e@oss.nxp.com>
 <b9ad385b-7702-4c71-b14f-64f2714a35a4@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9ad385b-7702-4c71-b14f-64f2714a35a4@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_223316_981506_7AEE37C6 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, 0x1207@gmail.com, netdev@vger.kernel.org, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 03, 2024 at 12:43:58AM +0100, Andrew Lunn wrote:
> > +static int s32_gmac_init(struct platform_device *pdev, void *priv)
> > +{
> > +	struct s32_priv_data *gmac = priv;
> > +	int ret;
> > +
> > +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> > +	if (!ret)
> > +		ret = clk_prepare_enable(gmac->tx_clk);
> > +
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Can't set tx clock\n");
> > +		return ret;
> > +	}
> 
> The ordering is a bit odd here. Normally you would test each operation
> individually for errors. So:
> 
> 	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> 	if (ret) {
> 		dev_err(&pdev->dev, "Can't set tx clock\n");
> 		return ret;
> 	}
> 	ret = clk_prepare_enable(gmac->tx_clk);
> 	if (ret) {
> 		dev_err(&pdev->dev, "Can't enable tx clock\n");
> 		return ret;
> 	}
> 

Thanks for it. The ordering is incorrect, agree. I will fix it in v8.

> 
> > +
> > +	ret = clk_prepare_enable(gmac->rx_clk);
> > +	if (ret) {
> > +		clk_disable_unprepare(gmac->tx_clk);
> > +		dev_err(&pdev->dev, "Can't set rx clock\n");
> > +		return ret;
> > +	}
> 
> Is there no need to set the TX clock rate?
> 

Do you mean RX clock, right? Yes, I'll add it in v8 too.

BR.
/Jan

