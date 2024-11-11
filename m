Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02934D2E9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FShuix54axbZRCuV+wkGfWcwUa07qEkSrjd6MCZNk1I=; b=KLzvkJrnIlDKXJNdXqDxaQPIMF
	ymP65aCkJ2wW9J7ccmlCgFemkcwcrl1AKtGQeaV8pdNEUwgEe0nU3xAf7DEgcmSJFVZ2eut4XaeXN
	THT/arybl1NhIeBp4QcAokonSjZZxYJJNJgbnwGNJZ95gLdInzaepj1lwHUplzrkhFm5SHKTnJXOc
	+9LGLFdFFcaABsoQxL22cloIE811+5TDFCIYj5J1GaHF1ku7qKpVql1bcl8r5CidlM/+MEo7FPyTG
	26brlSPGGyr2KRkft5NRB9LhQYTnw+qXo+kPMQhZXHd+2dxQGgJYK5QrgQeWnNJfvt8LJUaLJweLi
	TXLSxQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV9r-00000000HI6-1gQY;
	Mon, 11 Nov 2024 14:12:47 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV66-00000000GO5-3c5G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 14:08:56 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7999E1A117E;
	Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CDCC1A1174;
	Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2C4EF2037A;
	Mon, 11 Nov 2024 15:08:52 +0100 (CET)
Date: Mon, 11 Nov 2024 15:08:52 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <ZzIP9OrIi+X/akgg@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
 <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c902dc2a-9b2a-44a0-be1d-88fb150f4f17@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_060855_196068_3D20150D 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2024 at 01:15:52PM +0100, Andrew Lunn wrote:
> > +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> > +#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
> > +#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */
> 
> With the swap to the new helper, i think 25M and 2M5 are no longer
> needed.
> 

Sure, I will fix it in v5.

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
> > +
> > +	ret = clk_prepare_enable(gmac->rx_clk);
> > +	if (ret)
> > +		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
> > +	else
> > +		gmac->rx_clk_enabled = true;
> 
> Why would this fail? And if it does fail, why is it not fatal? Maybe a
> comment here.
> 
> > +static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct s32_priv_data *gmac = priv;
> > +	long tx_clk_rate;
> > +	int ret;
> > +
> > +	if (!gmac->rx_clk_enabled) {
> > +		ret = clk_prepare_enable(gmac->rx_clk);
> > +		if (ret) {
> > +			dev_err(gmac->dev, "Can't set rx clock\n");
> 
> dev_err(), so is failing now fatal, but since this is a void function,
> you cannot report the error up the call stack?
> 

I did a homework and checked the issue which was fixed by that 'lazy' rx
clock enable procedure and got conslusion it is not needed anymore, as I
was not able to reproduce the issue on the same board but with newer
kernel version (6.6.32 versus 5.15.73).

So I will simplify rx clock management in v5.

BR.
/Jan

