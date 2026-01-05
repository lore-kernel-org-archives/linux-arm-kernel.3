Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A1CC79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CSjw3+tO5UT7RYpNya959zfRm786bkbaztZUpjRhiE=; b=VaWyi5T8Ln+Uv77uQ9WtmZ9dZ2
	tVwwRytRRRQpKiGHOzBkhfi2tEDXb1D9sMZ8RKeWFO1uoIUfkvFzYHDb17avr7uJ5lrZLmFdE3upA
	5xTKp22e6mZ9XAx5C6Bj3lGWOoVt88otYqIJECt5Oz0z0MXf5gvZr09HbiDGnpyS9D3VrVF/KKFlF
	Faebnlm7rIs2owkME6ZCoLb9QmhF0peq9FoPysx3+SELhBkJQ3eP6eu2gQ7rnH0T2TdQWAb2dlHL7
	CNNdwKBsCI/UlVoVvVQTjDJivm0W0GmEKETohdGhTTOFpAdjuWBDPRPD67vDKJLbx/dFmJryQ1H7p
	JR5Mn6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcooG-0000000BsuZ-0dXZ;
	Mon, 05 Jan 2026 17:56:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcooB-0000000Bsu0-1mzs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:56:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vcony-0006UG-VA; Mon, 05 Jan 2026 18:55:46 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vcony-009DOu-28;
	Mon, 05 Jan 2026 18:55:46 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vcony-00CYZL-1f;
	Mon, 05 Jan 2026 18:55:46 +0100
Date: Mon, 5 Jan 2026 18:55:46 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-skov: add pinctrl-name 'reset' to
 fix CHECK_DTB warning
Message-ID: <20260105175546.i2d6bfhqt72xbpfb@pengutronix.de>
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
 <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
 <aVvzKQKjaZUVs5oi@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVvzKQKjaZUVs5oi@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_095600_149708_AC4E1FBB 
X-CRM114-Status: GOOD (  29.04  )
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

On 26-01-05, Frank Li wrote:
> On Mon, Jan 05, 2026 at 12:14:48PM +0100, Marco Felsch wrote:
> > Hi Frank,
> >
> > On 25-12-29, Frank Li wrote:
> > > Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
> > >   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
> > > 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
> > >
> > > The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
> > > description to set SPI mode" force use two pinctrl-name 'default' and
> > > 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
> > > setting for both.
> >
> > please see:
> > - https://lore.kernel.org/all/20251112084717.ea7fchu7jcz6dzsi@pengutronix.de/
> >
> > I stumbled over the same warning, but came to the conclusion, that the
> > dt-bindings should be fixed instead of workaround broken bindings within
> > the dtb.
> 
> I have not seen "the conclusion" at above thread. I think patch 'reset' may
> be reasonable for SPI pin, which used for stub at reset. And there are not
> good method to distinguish under SPI or I2C.

The linked-linked dt-patch from Bastien adapts the pinctrl-names
unconditionally for all KSZ switches, while he writes within the commit
message, that only KSZ8463 should be affected. Therefore the
straps-rxd-gpios was added only for the microchip,ksz8463.

Furthermore the pinctrl-names should be either:
 - default
or
 - default
 - reset

since the 'reset' pinctrl is optional if no strapping pins are
connected.

So IMHO the correct fix should be a dt-bindings fix.

Regards,
  Marco


> 
> Frank
> 
> >
> > Regards,
> >   Marco
> >
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> > > index 020f20c8ce667..7d2fc5fdd3bd1 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> > > @@ -373,8 +373,8 @@ &i2c4 {
> > >
> > >  	switch: switch@5f {
> > >  		compatible = "microchip,ksz9893";
> > > -		pinctrl-names = "default";
> > > -		pinctrl-0 = <&pinctrl_switch>;
> > > +		pinctrl-names = "default", "reset";
> > > +		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;
> > >  		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
> > >  		reg = <0x5f>;
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> >
> > --
> > #gernperDu
> > #CallMeByMyFirstName
> >
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

