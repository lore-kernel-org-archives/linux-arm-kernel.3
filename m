Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC7108E1EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+ZmKAtL2vNDqMHgfKrSPjoKgWsbPLWNzvOE/c/drNc=; b=kZe0hTw/ykHcl3eJn0JNsue7sa
	2id6jDQRef9QMePuWWg7+IbYtacnHlEcqXjdpnh+kYKu9KC6W02JGJqB/3lNsR1KZEdboBh/Sak+h
	vD8R47fHLZprGyfZV/G45b+ipx1isIGEhUlIBoImfCnXCg0Sm9mzDqplQncRXNP3IxANkWllc6/KA
	XV+x4pE5ecLhmIpRahjkFv5feRxkbH8JF1U5ZmBzF6QRCjLvNxN7Ck+CfcU7MOUamRAYxVQF8DNdM
	geIIMjXzzMYiGYh73SIOYOejxJ5+4ejAECX+oXU5PVOXsEo8nTGAUKkY7/u5G99Kc8h4b0oWBKwd9
	rOMD9qLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BVF-0000000AWYG-0ra3;
	Thu, 19 Mar 2026 11:25:25 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BVC-0000000AWVu-2HxN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=N+ZmKAtL2vNDqMHgfKrSPjoKgWsbPLWNzvOE/c/drNc=; b=kxGhfK6Nk6P+Z9QrDivEQE5w/v
	LhHqdWrVYlsxQ7nbHpZCYc3WTKs+GBGGJIiPenyckKh4/AULwWTEEavfMsIOWWMjCMaAK61Hm+lY4
	cjfqfDbXd01+sD1hox8dzddgsGx2VGOFkj4Y8ItOllUKFdPJAwXBsPu+A3EwoDRr5fkV2K//DKvqp
	lCs+UW+/hVQjREPgZ1qw7gYEnNYWyM8z0kA4Dz9sdm0KEHdHNpcr7xRqv4oIARd7efjXkA2JpcJsK
	K1PdxYDYn2VuatF0lFZT5d9z+1GgEknZ175Rc7NuE+uGa9978f5S08FjFhswIoDCZpqmmBJM6+NwC
	8tPXQGiw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3BV2-000Jek-36;
	Thu, 19 Mar 2026 12:25:13 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w3BV2-000Kr0-0N;
	Thu, 19 Mar 2026 12:25:12 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Martin Schmiedel <Martin.Schmiedel@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Date: Thu, 19 Mar 2026 12:25:11 +0100
Message-ID: <2259293.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <d67fafc1-4261-4818-8b58-7f3a874613e4@lunn.ch>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
 <d67fafc1-4261-4818-8b58-7f3a874613e4@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_042522_594881_45BA57F3 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Hi Andrew,

Am Mittwoch, 18. M=E4rz 2026, 15:49:38 CET schrieb Andrew Lunn:
> On Tue, Mar 17, 2026 at 12:17:01PM +0100, Alexander Stein wrote:
> > +	mdio {
> > +		compatible =3D "snps,dwmac-mdio";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		ethphy_eqos: ethernet-phy@0 {
> > +			compatible =3D "ethernet-phy-ieee802.3-c22";
> > +			reg =3D <0>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&pinctrl_eqos_phy>;
> > +			interrupt-parent =3D <&gpio3>;
> > +			interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
>=20
> Hi Alexander
>=20
> Haven't we been here before? EDGE interrupts are generally wrong for
> PHYs.

Whoops. Sorry, this slipped in from the downstream kernel. Will fix that.

> > +			reset-gpios =3D <&expander0 0 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us =3D <500000>;
> > +			reset-deassert-us =3D <50000>;
> > +			enet-phy-lane-no-swap;
> > +			ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> > +			ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_25_NS>;
> > +			ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +			ti,dp83867-rxctrl-strap-quirk;
> > +			ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +		};
> > +	};
> > +};
> > +
> > +&fec {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_fec>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&ethphy_fec>;
> > +	fsl,magic-packet;
>=20
> Has WoL been tested?

Yes, it works for both interfaces. &eqos doesn't need that property though.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



