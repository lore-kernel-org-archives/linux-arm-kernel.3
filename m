Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F136D3408E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sFzt8QJiY/XCvYBOB1ozow7uNq+IcHiTAmlpL9f5z0=; b=S72AB5/nFrWjClwnpvfiv8tlF2
	yLAvrYQsBAgI+w/2BfJrUPp5zPrwFqFz8CnedR4iwbpDoGXhMSDJJGke9zKT2cPsW4oAPxMHd+u3C
	/4612HJS95zT28xyuvqvbzG1ca1zofENznS9k1IzgZHQvxU+iZvBxuDPVKufgh8zxJfPtWQvjnDtd
	LAhaLrTSKdepcEZyGmCHFA4jZ1YOKthJiFdWpLwwH8Fg1VIG52rmovr6acbzXsYJtQDh9xDhTtWae
	DXSmHVrYgGBPV5ATjsP7PxXIIXMGsDH+glibOm4exwAhwktiOJDkxnlod9gErFU/Xm8rpkJYTCRBZ
	rEyuT6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklDm-0000000EZQ2-0RL5;
	Tue, 27 Jan 2026 15:43:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklDi-0000000EZPQ-2jDY;
	Tue, 27 Jan 2026 15:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5sFzt8QJiY/XCvYBOB1ozow7uNq+IcHiTAmlpL9f5z0=; b=T0YUbKdrqnbux0i8waouuZ1ydu
	LTpnVvKwVpsnOKvFipfpOyovNK/PZtp6aUKo+IxAOz3VHuFaF+Vmi46hkHWNmmKlU/i3Ebk0UBh6L
	fzI7QUPCtt+Q5UEgTquPTgzy5HrcVJrJvtqfXBLGaRdjqt9/fBPhhGqQcthXM1J5cduAm2Om4jtrm
	GBMJsIOo0o0M0/vX6D6UoLBqMzsgwM/mvDSsU6i+NAz3rXcuLkjRXb832kbElodVwAkADcEE6p+g1
	rspLK2Twqcpf7QmFPkdBQ3aIAIIBa+esKkldOPC9btppqWjOJLA7xFIdpsuUOynmzerpjBsGk+kFq
	hWh8TX4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44086)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vklDZ-000000006M6-3XKB;
	Tue, 27 Jan 2026 15:43:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vklDV-0000000061l-47xP;
	Tue, 27 Jan 2026 15:42:58 +0000
Date: Tue, 27 Jan 2026 15:42:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
 <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_074310_693080_8C66BAF3 
X-CRM114-Status: GOOD (  21.49  )
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

On Tue, Jan 27, 2026 at 08:27:50PM +0530, Mohd Ayaan Anwar wrote:
> It is using the same SerDes PHY (qcom_dwmac_sgmii_phy_driver).
> 
> I added additional debug prints, and I think the crash is due to
> BMSR_ESTATEN not being set in GMAC_AN_STATUS.

I'm going to submit a patch which fixes the phylink crash - it should
be able to cope with pcs being NULL at the oops site.

> During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
> [    7.985913] [DBG] GMAC_AN_STATUS = 8

Hmm. This means that your hardware doesn't support TBI or RTBI modes
(which is what the dwmac core uses for BASE-X) and what it's actually
offering is an up-clocked Cisco SGMII implementation.

With AN disabled, this is compatible with 2500BASE-X implementations
that do not require AN.

> Therefore, this check:
> 	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
> 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> 			  spcs->pcs.supported_interfaces);
> 
> 		/* Only allow 2500Base-X if the SerDes has support. */
> 		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
> 		if (ret == 0)
> 			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> 				  spcs->pcs.supported_interfaces);
> 	}
> fails, and PHY_INTERFACE_MODE_2500BASEX never gets set in
> pcs.supported_interfaces. Pardon my naivete, but does the
> BMSR_ESTATEN bit not being set break some standard?

BMSR_ESTATEN means that the PHY supports register 15, MII_ESTATUS.
This register indicates, for 1G speeds, which medium (BASE-T or BASE-X)
and duplexes are supported by the PHY.

Given that SGMII isn't an 802.3 standard, but an extension to BASE-X,
technically it should still, but given that these are not actually a
PHY, it's not a big problem.

However, what it does mean is that we could handle this differently.
We could remove the check here, and set 1000BASE-X and, if the SerDes
supports it, 2500BASE-X, but we would need
dwmac_integrated_pcs_inband_caps() to indicate that inband is not
supported in these unless ESTATEN is set.

> I also tried enabling comma detect during dwmac_integrated_pcs_config,
> but I am still seeing the Tx timeouts. I remember that when I had
> tested the patches in October (without the SerDes driver changes),
> the link state used to flap, but the data path became functional
> after the link stabilized.

I wonder whether the SerDes needs to be calibrated after the link has
come up and the clocks configured. phy_calibdate() will re-invoke the
programming of the SerDes, so you could try adding that at the bottom
of ethqos_configure_sgmii():

	return phy_calibrate(priv->plat->serdes);

which will do the calibration after the clocks have been set, and see
whether that stabilises the link.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

