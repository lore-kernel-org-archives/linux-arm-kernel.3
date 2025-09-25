Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311F2CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2KQXK0QxwhIywdI52yxYsSm5g6v5vjP57GLurR9+TM=; b=iRnBoJ/4buQVXjKBcqtnXN8CkV
	yxzuxnuEaaq0Ygz5rr6NNUGbpRme6mppzf7cEhXp6osKpK6MFt08iU/3z/0jyAD2ugiGcjhNJ/ot7
	KPcZeLn7y8bUXXJ8VeOaUUttMAQ+keCQTk0uiyRmDUWno76KAgvgJJnob98ykxdmO4AdZbnoIuZT4
	/Qoqbm0iGyv7NL9UHGqXOAaBb6MkssqPxYJkTJCCDV1zPx6Y/0C5/0/jRUUOvAdnffWR03gx3id2m
	yEKXMvTLrkxWgeWBcJgi+YKRE1Fs3U35Spq8AL2GZLutHh6WVFtgXHMSfar/8jODC4LFj5QKMwwJz
	IONLW2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pVQ-0000000BPwQ-2w1K;
	Thu, 25 Sep 2025 17:11:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pVN-0000000BPvE-2PSm;
	Thu, 25 Sep 2025 17:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=l2KQXK0QxwhIywdI52yxYsSm5g6v5vjP57GLurR9+TM=; b=4ah210tlcMTfmpCOwPnIBcnn11
	xM/z+chDbvSpKyoMvOO7U+Z6/kJjuGIC8fMr8KD0WNt2Xed/v3PrTcngYIyb+UrYinR1eVDl5oogZ
	t29Jek3QJh5s5Ia79aOpBKyu8xesBe1OPjV60IrTSAgJcWu7NgTY8UVgwgCSSc1ey8IA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v1pVB-009US2-6Q; Thu, 25 Sep 2025 19:11:29 +0200
Date: Thu, 25 Sep 2025 19:11:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"ukleinek@debian.org" <ukleinek@debian.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Fix the 1Ghz ethernet on Qnap
 TS433
Message-ID: <e4d3127b-c879-4931-9ea0-de7449bc508c@lunn.ch>
References: <20250925092923.2184187-1-heiko@sntech.de>
 <20250925092923.2184187-3-heiko@sntech.de>
 <da752790-da17-4d26-b9b2-8240b38b3276@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da752790-da17-4d26-b9b2-8240b38b3276@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_101141_701495_087ED3C7 
X-CRM114-Status: GOOD (  34.34  )
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

On Thu, Sep 25, 2025 at 06:58:06PM +0200, Jonas Karlman wrote:
> Hi Heiko,
> 
> On 9/25/2025 11:29 AM, Heiko Stuebner wrote:
> > While I want to remember that the dwmac on the TS433 was working at some
> > point, it seems I had my network always connected to the 2.5G nic after
> > that "point". And testing now revealed that the gmac does not actually
> > manages to transfer data.
> > 
> > Currently the gmac is set to rgmii-id with no rx-/tx-delay values set
> > which makes the driver use default values. Setting the delays to 0
> > also does not provide a working interface.
> > 
> > The vendor kernel is running with phy-mode set to rgmii and delays of
> >     tx_delay = 0x3c, rx_delay = 0x2f
> > 
> > As Andrew points out often, those delay values "are magic" and rgmii-id
> > should definitly be used "with small values" for delays, if really needed.
> > 
> > The Rockchip vendor-kernel actually contains additional code in the dwmac
> > driver to use the loopback function of a phy to find a window of usable
> > delay values. Code can be found for example on [0] and the process is
> > described in a document called "Rockchip GMAC RGMII Delayline Guide"
> > which has made its way onto the internet in a lot of places [1].
> > 
> > So I used this process, with the interface set to rgmii-id to get values
> > for this mode, which are in face lower than the ones for rgmii with
> >     tx_delay = 0x21, rx_delay = 0x15
> > and results in a working interface on the dwmac.
> > 
> > [0] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr6.1/drivers/net/ethernet/stmicro/stmmac/dwmac-rk-tool.c
> > [1] https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> > 
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> > index 5656554ca284..e8af92a011d6 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> > @@ -257,6 +257,8 @@ &gmac0_tx_bus2
> >  		     &gmac0_rx_bus2
> >  		     &gmac0_rgmii_clk
> >  		     &gmac0_rgmii_bus>;
> > +	rx_delay = <0x15>;
> > +	tx_delay = <0x21>;
> 
> I do not understand why defining rx/tx_delay would change anything.

I was also wondering why these two properties are added but no change
to phy-mode.

> 
> Setting these should currently not have any effect on the driver code
> when phy-mode=rgmii-id is used, see below (next-20250924, dwmac-rk.c):
> 
> 
> 	switch (bsp_priv->phy_iface) {
> 	case PHY_INTERFACE_MODE_RGMII:
> 		dev_info(dev, "init for RGMII\n");
> 		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
> 					    bsp_priv->rx_delay);
> 		break;
> 	case PHY_INTERFACE_MODE_RGMII_ID:
> 		dev_info(dev, "init for RGMII_ID\n");
> 		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
> 		break;

And this explains it, thanks.

> I have played around with a few patches that changes this and apply the
> rx/tx_delay for rgmii-id modes (both Linux and U-Boot), see top of [2]
> for Linux patches. Will try to get them on ML in a few days.

We should not really be expanding the use of rx_delay and
tx_delay. The standardized properties {tx|rx}-internal-delay-ps should
be used.

	Andrew


