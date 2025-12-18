Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CD8D6E2AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5MqwZJqRk8YQwy0Ja58KfR5cn5zu1oyhzTuFI4Y998=; b=oTCdaPDhk8gfbkVmPDTHQyStlR
	IfpqoGY+kRcB1Rmq50WSUclU90Z9B2xAWQ0QE58QknSwPmIvWLfYhy3JppvyoZWVa2jmyj8A34rIt
	O8VLdW1GbwuAx8hhzhlPfo9XIpnG6vnJH0DetiQY/+LY3dFrKPNOAzIHezkRjiQY4NprTt+Xh2jUH
	tsw4l35ed+sI7d3NBW+mTtWr3yHvqbKWaeHvHpYjQ+CgJ2cMhqW4876F8PETffQ4lE9flqq2vdXIk
	yRJ8FSd+x0j2Niohs6cGvglOwVcTb6yozTC4cfnVm3BQoxODNK1kXxWe3iCKi/d05TVWxraZqWJL+
	uBr08gpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGkL-00000008nx5-0S6F;
	Thu, 18 Dec 2025 16:20:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGkI-00000008nwN-0eZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:20:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWGjK-0007oT-B8; Thu, 18 Dec 2025 17:19:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWGjJ-006JcI-0d;
	Thu, 18 Dec 2025 17:19:53 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWGjJ-00EcBP-0A;
	Thu, 18 Dec 2025 17:19:53 +0100
Date: Thu, 18 Dec 2025 17:19:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrej Picej <andrej.picej@norik.com>,
	Christian Hemp <C.Hemp@phytec.de>,
	Stefan =?utf-8?Q?M=C3=BCller-Klieser?= <S.Mueller-Klieser@phytec.de>,
	Norbert Wesp <N.Wesp@phytec.de>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-ID: <20251218161953.wjiruxqmib7lchol@pengutronix.de>
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
 <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-2-9c14be6c7478@pengutronix.de>
 <15bb2331-713a-4b6a-ae9a-4870066e84dc@norik.com>
 <20251215170750.j2l6gnbocmhdloe6@pengutronix.de>
 <09a773bb51331940e76fbeb5e8128c183bf6d621.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09a773bb51331940e76fbeb5e8128c183bf6d621.camel@phytec.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_082054_192825_153279F9 
X-CRM114-Status: GOOD (  17.79  )
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

On 25-12-16, Christoph Stoidner wrote:
> Hi Marco,
> 
> On Mo, 2025-12-15 at 18:07 +0100, Marco Felsch wrote:
> > Hi Primoz,
> > 
> > On 25-12-03, Primoz Fiser wrote:

...

> > > > +	touchscreen@38 {
> > > > +		compatible = "edt,edt-ft5406";
> > > > +		reg = <0x38>;
> > > > +		pinctrl-names = "default";
> > > > +		pinctrl-0 = <&pinctrl_touchscreen>;
> > > > +		interrupt-parent = <&gpio4>;
> > > > +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> > > > +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> > > > +		touchscreen-size-x = <1792>;
> > > > +		touchscreen-size-y = <1024>;
> > > 
> > > Please add "wakeup-source" property here like in the downstream
> > > commit.
> > > 
> > > With this in place, panel touch can be used to wake up the board
> > > from sleep.
> > 
> > Is this a required feature? Touchscreens with no certain
> > low-power mode handlig (e.g. reduced scanning time) can draw much
> > power
> > in suspend.
> > 
> > I can add it if Phytec is aware of this fact and still wants to have
> > thsi feature.
> 
> Yes, please add this "wakeup-source" property again. This feature 
> shall work on our platform by default. And one who wants to avoid
> touchscreen as wakeup-source can modify the device-tree or disable 
> it for wakeup via policy/sysfs.

Okay, I added the property for the v2.

Regards,
  Marco

