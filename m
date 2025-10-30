Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B0BCCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OmzrOMSFDIHt90ET3ZkdRLGAdOyNAqOFwhfGMiqaV0=; b=BAEkoazpcGWPY3HbUINWBEoPDP
	JQOO6feulFDrsL+ThUbCcM+aMdeoe/moXyZP01xIzuy3JHXLJGHCtAs2PrDI49l0KEbeRArpOmIUv
	E91MzS0pNQk1OQGfM7B2Vvv6Y7WBz6soOSXLTXUAmohyoEWL6FUb1ORF2igZmgvWpJ5RZ8JLmYD9I
	ZlNFPFJYLx4LXBg9EEuYGJhB35LdLS3XbTvvpS6RVLGSCjZhtuYF09hybxuV8ju6seciWERGDrJox
	A0K3dDHAvUscqkXvco/q4pk7gOiNhNEsYlJSh3EDwrUWqrbTsDarojvsnfn/x/AdfzbwZkrY7t0UN
	eV02u7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETHT-00000004H3x-0rdF;
	Thu, 30 Oct 2025 14:05:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETHQ-00000004H3L-17Zk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2OmzrOMSFDIHt90ET3ZkdRLGAdOyNAqOFwhfGMiqaV0=; b=Ptv1sTB1FvN4w3/AmTE+DHKcdJ
	9qbzUW9AZpfAEjAhGR4B7Mxo9VbsMsZZeU/g+Xopioag7LPZJW6zswEvZT7LL5b0M3HyeRwWOd2Kx
	VeT1LS1G6e9VtdAPVcxMn7UkX2ieaKKDvpyLYpEaB12LbmzqzX3fbD2Xo8BON616ymRPlZOnEwbux
	11G8K7GphKFonIV/DkS3TTKurtbfQtheo02WpqSVL5PIuAMDk7DyWsG0icfUk7qh/a8LxNzuo4FNs
	XIF//3ZZp5K5koXa+KtQTmd3nwuylHZ8Gn0K2yDwC/iSgQz8s8rtpHKaX33627Br6a50akKi03bsE
	nqwjJVcg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55264)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vETHH-000000005mZ-3F8U;
	Thu, 30 Oct 2025 14:05:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vETHE-000000008Vm-0rdp;
	Thu, 30 Oct 2025 14:05:20 +0000
Date: Thu, 30 Oct 2025 14:05:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
 <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_070532_584098_F7448277 
X-CRM114-Status: GOOD (  21.51  )
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

On Thu, Oct 30, 2025 at 02:08:41PM +0100, Konrad Dybcio wrote:
> On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
> > Konrad, Ayaan,
> > 
> > Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
> > and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
> > 
> > Specifically:
> > - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
> >   speeds, but never be cleared for any other speed?
> 
> BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"

I guess that means that changing this bit is not relevant for the SGMII
path, and thus can be removed:

        switch (speed) {
        case SPEED_2500:
-               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_IO_MACRO_CONFIG2);
                ethqos_set_serdes_speed(ethqos, SPEED_2500);
                ethqos_pcs_set_inband(priv, false);
                break;
        case SPEED_1000:
-               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-                             RGMII_IO_MACRO_CONFIG2);
                ethqos_set_serdes_speed(ethqos, SPEED_1000);
                ethqos_pcs_set_inband(priv, true);

> > - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
> >   for 10M, but never set to any other value for other speeds?
> 
> [18:10] - In short, it configures a divider. The expected value is 0x13
> for 10 Mbps / RMII mode

This gets confusing. Is the "/" meaning "10Mbps in RMII mode" or "10Mbps
or RMII mode".

> which seems to have been problematic given:
> 
> https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/
> 
> But it didn't say what hardware had this issue.. whether it concerns a
> specific SoC or all of them..
> 
> A programming guide mentions the new 0x31 value for 10 Mbps in a
> SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
> could arise if you switch back to a faster mode?

Could the 0x13 be a typo? Its suspicious that the two values are 0x13
vs 0x31. 0x13 = 19 vs 0x31 = 49. 0x31 makes more sense than 19.

The platform glue is required to supply clk_rx_i to the dwmac's MAC
receive path, deriving it from the 125MHz SGMII rx link clock divided
by 1, 5 or 50. Normally, this would be done by hardware signals output
from the dwmac.

This suggests that the value programmed is one less than the actual
divisor.

There's two possibilities why this value needs to be programmed:

1. the hardware doesn't divide the SGMII rx link clock according to
the hardware signals output from the dwmac, and needs the divisor to
be manually programmed. This would require the divisor to also be
programmed to 4 for 100M (but the driver doesn't do this.)

2. the hardware selects the clk_rx_i depending on the hardware
signals, and while 1G and 100M use a fixed divisor of 1 and 5, the
10M divisor needs to be manually programmed.

Any ideas what's really going on here?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

