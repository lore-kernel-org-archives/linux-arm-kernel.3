Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5362DCD4849
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijl2d5txxx1muG7LOy+sOf2K0f9ZIGcMU1J5ip5lOhg=; b=RmJpvWneXqdJTC9WYbSvpopBeG
	AS37y48/nGssPTkp0v5slHdsQT/Ul7uz5tOOQPwP2z6DW+9bSCu3gajeREt8a2BRC1l6lWBIJ1EDa
	gj6Rb+oPUwMwvGISG88J7zvaAqLr4cvuLMPFma+LnDN4cfB99VU77FVWjGNitFZ6VHtgaDWWanmWq
	+NylLujzyy30PaNtt/NAf7P2xo2OaETLSCjQP2MpMSNFzm+SiP4K5oWzziOhCR7w4civ/xzzvJRtU
	iw78PSWpiUPSUm+JAkb2B+p4zCDTYzoypJSkK4sKyW6m+U/gC+KIdnR1HiY+WDReDC+RbUiPIvdTR
	gi7ImaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJITd-00000009XTm-1BVx;
	Wed, 12 Nov 2025 21:34:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJITa-00000009XTA-2HXb;
	Wed, 12 Nov 2025 21:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Ijl2d5txxx1muG7LOy+sOf2K0f9ZIGcMU1J5ip5lOhg=; b=X7uT0URitTKZFJr1kumOjmk6eQ
	ClK5aHNgEMNkJljPp3g5keM78actOLbUFP57etFiiy+kWf8HULuXIqXCbT4hQHj0vp5EgR5qCBqA4
	H59Wnbl8t9wccQxXU9tlD5+Oy4+fur1+4udmhevjUdUYCxolGmQ6T+rZHVkEpWnVtY6gAn7fGf+M1
	zZbxlTY+4QAokn1/rMIlXRDSBV17AhYkweyrmz9JD+fKOCUVuxxALOJXQ5LKkz1Nh9CGr/KgkYdI3
	h7ggGLlPnWcoKxk6VwVPogUGULuqqBy4FdonjWq0t1meZ8SRAiVZGVNbbQEgxn6CnNAXwoL5/57y4
	/AQUj9tQ==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJITK-0003p1-29; Wed, 12 Nov 2025 22:33:46 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "ukleinek@debian.org" <ukleinek@debian.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Fix the 1Ghz ethernet on Qnap TS433
Date: Wed, 12 Nov 2025 22:33:44 +0100
Message-ID: <3380318.aeNJFYEL58@diego>
In-Reply-To: <e4d3127b-c879-4931-9ea0-de7449bc508c@lunn.ch>
References: <20250925092923.2184187-1-heiko@sntech.de>
 <da752790-da17-4d26-b9b2-8240b38b3276@kwiboo.se>
 <e4d3127b-c879-4931-9ea0-de7449bc508c@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_133402_604411_CB7D4983 
X-CRM114-Status: GOOD (  39.56  )
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

Am Donnerstag, 25. September 2025, 19:11:29 Mitteleurop=C3=A4ische Normalze=
it schrieb Andrew Lunn:
> On Thu, Sep 25, 2025 at 06:58:06PM +0200, Jonas Karlman wrote:
> > Hi Heiko,
> >=20
> > On 9/25/2025 11:29 AM, Heiko Stuebner wrote:
> > > While I want to remember that the dwmac on the TS433 was working at s=
ome
> > > point, it seems I had my network always connected to the 2.5G nic aft=
er
> > > that "point". And testing now revealed that the gmac does not actually
> > > manages to transfer data.
> > >=20
> > > Currently the gmac is set to rgmii-id with no rx-/tx-delay values set
> > > which makes the driver use default values. Setting the delays to 0
> > > also does not provide a working interface.
> > >=20
> > > The vendor kernel is running with phy-mode set to rgmii and delays of
> > >     tx_delay =3D 0x3c, rx_delay =3D 0x2f
> > >=20
> > > As Andrew points out often, those delay values "are magic" and rgmii-=
id
> > > should definitly be used "with small values" for delays, if really ne=
eded.
> > >=20
> > > The Rockchip vendor-kernel actually contains additional code in the d=
wmac
> > > driver to use the loopback function of a phy to find a window of usab=
le
> > > delay values. Code can be found for example on [0] and the process is
> > > described in a document called "Rockchip GMAC RGMII Delayline Guide"
> > > which has made its way onto the internet in a lot of places [1].
> > >=20
> > > So I used this process, with the interface set to rgmii-id to get val=
ues
> > > for this mode, which are in face lower than the ones for rgmii with
> > >     tx_delay =3D 0x21, rx_delay =3D 0x15
> > > and results in a working interface on the dwmac.
> > >=20
> > > [0] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr6.1/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-rk-tool.c
> > > [1] https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Commo=
n/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> > >=20
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arc=
h/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> > > index 5656554ca284..e8af92a011d6 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
> > > @@ -257,6 +257,8 @@ &gmac0_tx_bus2
> > >  		     &gmac0_rx_bus2
> > >  		     &gmac0_rgmii_clk
> > >  		     &gmac0_rgmii_bus>;
> > > +	rx_delay =3D <0x15>;
> > > +	tx_delay =3D <0x21>;
> >=20
> > I do not understand why defining rx/tx_delay would change anything.
>=20
> I was also wondering why these two properties are added but no change
> to phy-mode.
>=20
> >=20
> > Setting these should currently not have any effect on the driver code
> > when phy-mode=3Drgmii-id is used, see below (next-20250924, dwmac-rk.c):
> >=20
> >=20
> > 	switch (bsp_priv->phy_iface) {
> > 	case PHY_INTERFACE_MODE_RGMII:
> > 		dev_info(dev, "init for RGMII\n");
> > 		bsp_priv->ops->set_to_rgmii(bsp_priv, bsp_priv->tx_delay,
> > 					    bsp_priv->rx_delay);
> > 		break;
> > 	case PHY_INTERFACE_MODE_RGMII_ID:
> > 		dev_info(dev, "init for RGMII_ID\n");
> > 		bsp_priv->ops->set_to_rgmii(bsp_priv, 0, 0);
> > 		break;
>=20
> And this explains it, thanks.
>=20
> > I have played around with a few patches that changes this and apply the
> > rx/tx_delay for rgmii-id modes (both Linux and U-Boot), see top of [2]
> > for Linux patches. Will try to get them on ML in a few days.
>=20
> We should not really be expanding the use of rx_delay and
> tx_delay. The standardized properties {tx|rx}-internal-delay-ps should
> be used.

as Jonas wrote the delays do nothing for rgmii-id. So the whole thing
must have been me doing something wonky, because on re-testing
everything, it is as expected - no delays necessary and ethernet just
works.

So I'll drop this patch altogether and adapt the TS233 one.

Heiko

Heiko



