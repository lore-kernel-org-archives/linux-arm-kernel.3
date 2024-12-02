Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB67E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmxNh0nYEKdGUUoXGrSxrCnt6J/Rj48T7e6HKqO1/uM=; b=NcEylp3FNM8HOqPSgJEwSAnR8B
	ewM7qVm+2202kwLvH8JFs+8wrvg9YW+43YCwld/lZ+Tc7/fDUwfsMdYGQh5Zv8g20Ngi5EnC/+vca
	DcMXRWKT3WR5KYM2HjjLaxGiNFuP9WQ1xxPTteqSPFk7qJoPxJzcW1urH1qKq2UUA7s7AlWX/+toX
	A2DT6VLfRCoze7WQPKvXnTuq20wfWHmN7MfnLeTJbSLO2q+LxgjiG7TZP70G70rXikwst3H3frRNB
	pneTgSq/d4egoFGjJ3Ktgpc2bjGp/Ppij/FwjTfhgg6CQiFf3OXouIVhlTIp/5blMA5o4eroSVBXx
	Ncsm8PVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIG6e-00000007kFd-3T57;
	Mon, 02 Dec 2024 23:45:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIG5e-00000007k9T-0lmP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 23:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QmxNh0nYEKdGUUoXGrSxrCnt6J/Rj48T7e6HKqO1/uM=; b=MRhaAcqQWSGy9UX2FETDtrsPq9
	7OJZyofuu9PD/clwQqMZGu4+A5v4UqUxO9SZLglD5plscdV7pVDyZKDJwRQRg4Itq70Yku//oJ7gp
	ToRNsw394Vo35QCqfihuvOz2kBGXTNofti4X4ZU30ZyS1cgoYCk1UbDekIiFIhoQMWNk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIG58-00F0fw-MU; Tue, 03 Dec 2024 00:43:58 +0100
Date: Tue, 3 Dec 2024 00:43:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH net-next v7 14/15] net: stmmac: dwmac-s32: add basic NXP
 S32G/S32R glue driver
Message-ID: <b9ad385b-7702-4c71-b14f-64f2714a35a4@lunn.ch>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
 <20241202-upstream_s32cc_gmac-v7-14-bc3e1f9f656e@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-14-bc3e1f9f656e@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_154430_223763_87C2023D 
X-CRM114-Status: GOOD (  10.37  )
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

> +static int s32_gmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct s32_priv_data *gmac = priv;
> +	int ret;
> +
> +	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
> +	if (!ret)
> +		ret = clk_prepare_enable(gmac->tx_clk);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't set tx clock\n");
> +		return ret;
> +	}

The ordering is a bit odd here. Normally you would test each operation
individually for errors. So:

	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
	if (ret) {
		dev_err(&pdev->dev, "Can't set tx clock\n");
		return ret;
	}
	ret = clk_prepare_enable(gmac->tx_clk);
	if (ret) {
		dev_err(&pdev->dev, "Can't enable tx clock\n");
		return ret;
	}


> +
> +	ret = clk_prepare_enable(gmac->rx_clk);
> +	if (ret) {
> +		clk_disable_unprepare(gmac->tx_clk);
> +		dev_err(&pdev->dev, "Can't set rx clock\n");
> +		return ret;
> +	}

Is there no need to set the TX clock rate?

	Andrew

