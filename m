Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81870C47BF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0mFOIzqJWVr4Utavbyz8pQhfUfYac20Ul28+0KRsFs=; b=GutwSHbezIUMzRFQyLWjWYj1l/
	GJ6xh9qBG2XTH0okodyAEVcon6Wvpg7uu93P+XNIDGRzEvv6KvFmPnjNyeon2IPSw2YMQA7Nf79E4
	+h4rGTghQ6JaPul/7TOxHibvTQu95B8IXaNiA37TUsCeJuV1/fyRHYoM+5ZYZYG+gLyjFfhIFXvqP
	/7dleR2z/w4Cqu9yCdaJQSeUUHh9RqGSF3OUKoVEvZN9ma+1mWNvHE5LzSGLFK6CVyrHRxTCINAJR
	Ezn7B3vsfjhnbDERFv1Az+BjYhxk/IylNcmOgBmVUkakYYG89SvnH2vDsizpo9kdDi75r7gadQq9V
	V9aSY0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7pD-0000000DGFI-2xS3;
	Tue, 06 Jan 2026 14:14:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7pB-0000000DGEs-0VBr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:14:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vd7or-0004tZ-MH; Tue, 06 Jan 2026 15:13:57 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vd7or-009ML8-0u;
	Tue, 06 Jan 2026 15:13:57 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vd7or-00EKca-0X;
	Tue, 06 Jan 2026 15:13:57 +0100
Date: Tue, 6 Jan 2026 15:13:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <20260106141357.a7jsmligapumcfau@pengutronix.de>
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
 <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
 <aVzhhH4BRFC7XlAL@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVzhhH4BRFC7XlAL@shlinux89>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_061417_161883_49DE1DC7 
X-CRM114-Status: GOOD (  24.87  )
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

Hi Peng,

On 26-01-06, Peng Fan wrote:
> Hi Marco,
> 
> On Mon, Jan 05, 2026 at 12:14:48PM +0100, Marco Felsch wrote:
> >Hi Frank,
> >
> >On 25-12-29, Frank Li wrote:
> >> Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
> >>   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
> >> 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
> >> 
> >> The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
> >> description to set SPI mode" force use two pinctrl-name 'default' and
> >> 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
> >> setting for both.
> >
> >please see:
> >- https://lore.kernel.org/all/20251112084717.ea7fchu7jcz6dzsi@pengutronix.de/
> >
> >I stumbled over the same warning, but came to the conclusion, that the
> >dt-bindings should be fixed instead of workaround broken bindings within
> >the dtb.
> 
> If reset is optional, the dt-bindings should include "minItems:1" per my
> understanding.

Not sure, since the pinctrl-names is just an enum list. That beeing
said, I don't see it as required since the strapping may not be required
for systems which do already has correct ext. strapping options.
Therefore the binding should be always optional and the driver should be
adapted.

> But..
> 
> >
> >> -		pinctrl-names = "default";
> >> -		pinctrl-0 = <&pinctrl_switch>;
> >> +		pinctrl-names = "default", "reset";
> >> +		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;
> 
> Per checking
> https://elixir.bootlin.com/linux/v6.18.3/source/drivers/net/dsa/microchip/ksz_common.c#L5372
> 
> seems "reset" is required in driver.

For the ksz8463 but not for the ksz9893 which is used by the
imx8mp-skov-reva.dtsi (here).

Regards,
  Marco




> 
> Regards
> Peng
> 
> >>  		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
> >>  		reg = <0x5f>;
> >>  
> >> -- 
> >> 2.34.1
> >> 
> >> 
> >> 
> >
> >-- 
> >#gernperDu 
> >#CallMeByMyFirstName
> >
> >Pengutronix e.K.                           |                             |
> >Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> >31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

