Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261F1C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy1Wl0a02dtKqoPAdsnYPm6lkMH+/UnovXEG/AvYxwk=; b=p1HEZ/dJnz91cFZjebuNCkZjJJ
	bAs/hdOyQXIlrr0LFElH6+p4m89nXpRBwi7+jrEnXKPZkE0y7gymovDoA7MzuTeTYyR6svCkZfDo4
	oj7XYDYXmz/hZFj2478OV/nqOyjsHGZdanXm99utViWj3Qv7qI6LaJt+2XZ6ahgfbrDr5I6HOHax/
	SJwRp/6UexDZrhFShCPvd0gg4VCSWUmFhj2xI1bshAduovE7m8KudIy2+yHCVVhjJZi9lVmFdNmU0
	ILU79QBHsr+EImjdMcBYO4KGPyAEDWYPcXok7lFN2Bc9cSEf1kbMUKAhQTlXc1TVVM0duYVnO122R
	5RePk0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eCY-0000000FPJv-3HIV;
	Fri, 18 Sep 2026 19:24:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eCY-0000000FPJo-1he6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:24:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C753D42A72;
	Fri, 18 Sep 2026 19:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714661F000FF;
	Fri, 18 Sep 2026 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789759489;
	bh=gy1Wl0a02dtKqoPAdsnYPm6lkMH+/UnovXEG/AvYxwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CHDAEFAYp99cG7ALHJHxabBHBvYu4ZolmiftDgQyss+yGWBLqV6LMkFJYjcXxQzJu
	 MOZ8u7D0fBuJpAaAZB8myh0eXutu1FOIHkKj3typrQKAe1acMIwHU47CTNmHq67Q+1
	 gW+ij/xXY4rICSZ9pYarlfCD0dugav+2Rq9O4EeDvWT0zbOXQt8wM4StWno1dcs8Rg
	 yVsRcV7Ezj1zRAZe7Io36sir3IWZtMcOOcLoTOBIUltZbo/psJU9fdcowX90YiFmQk
	 gQExKNijGvWdFM8oWzfHTPKlRfVjw3FHrIMT9VfLCAiKkiUBkC8BYd8nfCWau8g75j
	 LjOCQffvcSW4Q==
Date: Fri, 18 Sep 2026 14:24:47 -0500
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <20260918192447.GB1465432-robh@kernel.org>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLk5UAv-j39Jxd3@francesco-nb>
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

On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > Hi Frank,
> > >
> > > Thanks for reviewing this so quickly.
> > >
> > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > >
> > > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > > connectors to different GPIO controllers. Camera overlays which name
> > > > > those controllers directly must therefore be duplicated for each host
> > > > > board.
> > > > >
> > > > > Describe reset, power-down, detection and power-control as
> > > > > connector-local GPIO functions. This lets an accessory overlay remain
> > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > > > > remain described separately because the GPIO nexus does not abstract
> > > > > them.
> > > > >
> > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > ---
> > > > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> > > > >  1 file changed, 86 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..06e6836e1aa6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > > > > @@ -0,0 +1,86 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > > +
> > > > > +title: Toradex camera connector GPIO nexus
> > > > > +
> > > > > +maintainers:
> > > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > > +
> > > > > +description: |
> > > > > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > > > > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > > > > +  signals as a GPIO nexus. The other connector resources remain described by
> > > > > +  the surrounding board device tree.
> > > > > +
> > > > > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > > > > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > > > > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > > > > +  A board may omit functions which it does not wire.
> > > > > +
> > > > > +  The function numbers are:
> > > > > +    - 0: Camera reset, connector pin 11
> > > > > +    - 1: Camera power-down, connector pin 22
> > > > > +    - 2: Camera identification, connector pin 23
> > > > > +    - 3: Camera power control, connector pin 24
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: toradex,camera-connector
> > > >
> > > > Name is too generally, suggest use board name, we got similar comments at
> > > >
> > > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/
> > >
> > > I saw that and it made me reconsider this name.
> > >
> > > However, I believe that in our case it is specific enough. It is really
> > > the same on all our carrier boards, and Toradex specific. It's also only
> > > for cameras, which is more defined than just "io". Curious to see if
> > > others agree or if we should come up with a name for this.
> > 
> > If some days later, you update hardware connector to 30pin from 24pins.
> 
> That connector is there since years, not days.
> 
> We have multiple cameras, designed to mate with it.
> 
> If tomorrow we will define a new camera connector (that is absolutely
> possible), the new connector will get its name, maybe
> toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> whatever that connector would be named, not just in the DT, but also as
> a product and on the actual HW.

I for one hate 'v2' naming.

I agree the name seems a bit generic, but if you really can't come up 
with something better, then fine. The next connector name just has to be 
something different.

Rob

