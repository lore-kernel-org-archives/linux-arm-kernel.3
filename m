Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AEFCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+PxUXRPBCegn7nxIw8aU+giwhqnR+X96ofMNS1C+qA=; b=0MdpcxD6Yf7j1Xs/vuPQL6XrTx
	A0KhgC1d6J9hqRD6s3UHI5wRdTeFgKAiwR68Jr86QGj9yDGXr0kedqLNxRWd0xo7JngBSiWtmjfuP
	MeQfZPPc6mSIkpcdnz2wF5cMACWqzBqQLlKG9h37ag9igVQCokAFIXEK4xebvJIND7WTLwcrbicpn
	8KacRYJDX6EP92ryEpQfWrThNgGs0jYD6U5MyIXWq9OB57HO8SizfkyoVPJMzMJVsebTKjcqNXcOj
	4RHpDMX4iMxXxTERmQyli2qK2Ib1nIQ9J3tjvxNEFJpHumdOUwiga8Ggyps1angyZMPS/RTBJqDE6
	iwki+ZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu852-0000000BCiU-3q8L;
	Thu, 04 Sep 2025 11:24:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7B6-0000000AtAO-0I6U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r+PxUXRPBCegn7nxIw8aU+giwhqnR+X96ofMNS1C+qA=; b=Trk0VvDUUBQmIaaZkOwxKUs5VS
	bHr2Pr+4J8HGE+FsC2yCsBZDLX+r9WZpbXWs+78vPnDsuSed1DhzcYI2IDAuBC/3z2LE41Pc/SQA7
	rj2PyYhXRAlorckyYao+MnFL1x3CmS5iARyLuK9/N0cpMZ9cn46Ms9GZUx621z5gZz7JQzjGKQEr3
	RSc9Wbn/jBSIPNUOpnR6MDIueDXv926ba8t3ia+ES0+TROjpeMAPwVcKWLBy6PfQlSgX3ndnbGf9L
	GI9/0xvaLDAFYAgJC7e6gOdpmLkheX/ObZ0UNFEzJzt82MdP8SCU0lTARU6dZsrgDxtYZlCmupRz9
	C+Kt+qxQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48290)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uu7An-000000001oA-2KNv;
	Thu, 04 Sep 2025 11:26:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uu7Af-000000001Qj-0fPd;
	Thu, 04 Sep 2025 11:26:25 +0100
Date: Thu, 4 Sep 2025 11:26:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	boon.khai.ng@altera.com, 0x1207@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	emil.renner.berthing@canonical.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v5 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <aLlpUOr3IJzTuV1g@shell.armlinux.org.uk>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090125.2598-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904090125.2598-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_032652_107034_D90052BF 
X-CRM114-Status: GOOD (  17.92  )
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

On Thu, Sep 04, 2025 at 05:01:25PM +0800, weishangjuan@eswincomputing.com wrote:
> +struct eic7700_qos_priv {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct device *dev;
> +	struct regmap *hsp_regmap;
> +	u32 tx_delay_ps;
> +	u32 rx_delay_ps;
> +};
> +
> +/**
> + * eic7700_apply_delay - Apply TX or RX delay to a register value.
> + * @delay_ps: Delay in picoseconds, converted to 0.1ns units.
> + * @reg:      Pointer to register value to update in-place.
> + * @is_rx:    True for RX delay (bits 30:24), false for TX delay (bits 14:8).
> + *
> + * Converts delay from ps to 0.1ns units, capped by EIC7700_MAX_DELAY_UNIT.
> + * Updates only the RX or TX delay field (using FIELD_PREP), leaving all
> + * other bits in *@reg unchanged.
> + */
> +static void eic7700_apply_delay(u32 delay_ps, u32 *reg, bool is_rx)
> +{
> +	u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
> +
> +	if (is_rx) {
> +		*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
> +		*reg |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> +	} else {
> +		*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
> +		*reg |= FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> +	}
> +}

...

> +	/* Read rx-internal-delay-ps and update rx_clk delay */
> +	if (!of_property_read_u32(pdev->dev.of_node,
> +				  "rx-internal-delay-ps",
> +				  &dwc_priv->rx_delay_ps)) {
> +		eic7700_apply_delay(dwc_priv->rx_delay_ps,
> +				    &eth_dly_param, true);

I've been trying to figure out the reasoning behind the following:

1. the presence of dwc_priv->rx_delay_ps and dwc_priv->tx_delay_ps
   rather than just using a local variable ("delay" ?)
2. the presence of eic7700_apply_delay() when we have to do something
   different to get the delay value anyway

It seems to me that this should either be:

static void eic7700_parse_delay(u32 *reg, struct device *dev,
				const char *name, bool is_rx)
{
	u32 delay;

	if (of_property_read_u32(dev->of_node, name, &delay)) {
		dev_warn(dev, "can't get %s\n", name);
		return
	}

	if (is_rx) {
		*reg &= ~EIC7700_ETH_RX_ADJ_DELAY;
		*reg |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, delay);
	} else {
		*reg &= ~EIC7700_ETH_TX_ADJ_DELAY;
		*reg |= FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, delay);
	}
}

or just not bother with the function at all and just write it out
fully in the probe function.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

