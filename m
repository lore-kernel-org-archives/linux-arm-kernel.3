Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25B8C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wezTXlpBdA+wJTIARYjMTiZlMLPhFPe4lv1SIcKvFyc=; b=TUtb2IatN7BI3p7hRkuN1lN/e8
	a7y+XaO1CeEN8iUBFu7ju0S7sl+EEd5Whf476MjBkIs4Esgegd7av3kMvszjXRho1LZQ+TIvkPRrK
	sr+fOOW9CTQBQcV0eIeEpkj6MRHHaeOalANfgHJ1RvvIkQ98hbFSkQGwZWyp4Xm3x6OqA1Z47RRCI
	Ke9liffTjmxXUnQOU1XsjfTCxnRSUbt/x9yFZ8Zsm61KGmZlleZZfJgek6tuj4/+krNG7zbuvatz7
	igvXO+qhESRkr5l08Y5LxTAaZp08gMReS90m3HGsXb0wiVGuFfbi01m5dfWhszGPLz2gDJ8amJSl2
	xroEcc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7e89-0000000FP2J-0Asp;
	Fri, 18 Sep 2026 19:20:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7e87-0000000FP2D-2ofR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:20:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B80F36053B;
	Fri, 18 Sep 2026 19:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6FE1F000FF;
	Fri, 18 Sep 2026 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789759214;
	bh=wezTXlpBdA+wJTIARYjMTiZlMLPhFPe4lv1SIcKvFyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsvMH284ig4xcLTpLnDPeuONsoGN8ikE7Y6mcvsLLUCNRU//VybNhurSHlfHEnHH8
	 DbTW8k4vbYk+DYC4j9Jo83a2BkvscXK9vmbpPc7vaHbps3XLlaKvWe1I1kLY38dW2Y
	 /IHekHTPRxs/mqzLUlOdkb5ShSegJFkTTYTvsrJZavjuXhZGUUbZDeb3L49ehvvxLf
	 eNzCHTCpej02+tESCaC2l4wDNmUz2UcO4gt8PJ1EKEfO1yMxiuKjOBsfoZenVn/GfV
	 fttRUsUugQTlMgSbJR+bZzN8HVlbidzbOvwdtwROzOfZk36OCDNy0EzqoJ2qDcvpIL
	 wJQ5njr+5I4nw==
Date: Fri, 18 Sep 2026 14:20:12 -0500
From: Rob Herring <robh@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <20260918192012.GA1465432-robh@kernel.org>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
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

On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> Hi Frank,
> 
> Thanks for reviewing this so quickly.
> 
> On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > >
> > > Toradex boards route the sideband signals of their 24-pin camera
> > > connectors to different GPIO controllers. Camera overlays which name
> > > those controllers directly must therefore be duplicated for each host
> > > board.
> > >
> > > Describe reset, power-down, detection and power-control as
> > > connector-local GPIO functions. This lets an accessory overlay remain
> > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > remain described separately because the GPIO nexus does not abstract
> > > them.
> > >
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > ---
> > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> > >  1 file changed, 86 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > new file mode 100644
> > > index 000000000000..06e6836e1aa6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > @@ -0,0 +1,86 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > +
> > > +title: Toradex camera connector GPIO nexus
> > > +
> > > +maintainers:
> > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > +
> > > +description: |
> > > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > > +  signals as a GPIO nexus. The other connector resources remain described by
> > > +  the surrounding board device tree.
> > > +
> > > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > > +  A board may omit functions which it does not wire.
> > > +
> > > +  The function numbers are:
> > > +    - 0: Camera reset, connector pin 11
> > > +    - 1: Camera power-down, connector pin 22
> > > +    - 2: Camera identification, connector pin 23
> > > +    - 3: Camera power control, connector pin 24
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: toradex,camera-connector
> > 
> > Name is too generally, suggest use board name, we got similar comments at
> > 
> > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/
> 
> I saw that and it made me reconsider this name.
> 
> However, I believe that in our case it is specific enough. It is really
> the same on all our carrier boards, and Toradex specific. It's also only
> for cameras, which is more defined than just "io". Curious to see if
> others agree or if we should come up with a name for this.
>  
> > > +
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  gpio-map:
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +
> > > +  gpio-map-mask:
> > > +    items:
> > > +      - const: 0xffffffff
> > 
> > are you sure need full 32bit, only 4 pin, maybe 0xf should enough?
> > 

0x3 is enough for 4 pins...

> 
> Indeed we could reduce the size of the mask, but I don't really see the
> value in it. Isn't it good that a user can pass through the full GPIO?

This is what you are matching against. You don't want 0x12345671 to 
match the 0x1 entry. So yes, all 1s is correct.

> 
> > > +      - const: 0
> > > +
> > > +  gpio-map-pass-thru:
> > > +    items:
> > > +      - const: 0
> > > +      - const: 0xffffffff
> > > +
> > 
> > missed
> > 	gpio-controller: true
> > 
> 
> This is one thing I didn't fully understand about the GPIO nexus
> concept, why would we need this gpio-controller flag? Isn't the gpio
> controller behind the nexus? The nexus just maps onto it. The actual
> controller would be on the SoC or an expander.

Correct. You don't want 'gpio-controller' here. That and 'gpio-map' are 
mutually exclusive just like interrupts. There is an exception for 
interrupts for when a PCI host controller is the interrupt controller 
for PCI interrupts.

Rob

