Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8541FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpufnlLHEouBmGvVkHqVS1A5je2GxlJp/f3DJZtA+wE=; b=Sk5bqho7A9IsiIjAfIDuTw41Yf
	zZ1U8m9gMdiF3g86wH5zBGWFkYLinPbB8FCZaWUNu/Nnjx4MFENSKnq6vvbs9izpArZSg6xkLFDwC
	+IrQ3PY38lY55tSkDJ3bOJGWGn8rTAnaqqamioMqAcCL6arTnfjyyfWeFNkhsO2brSSu7mtXeW1wR
	qAAcIWTWOjMwezfaTXrBMXg05jZ9TZKG5cNqWDVtrsxhWJ+wRFhoGHperjgfLM6+1aosrKxNFMNjy
	MfFdykOxpWRP4wY+Zo1DJMfotrKJOXiircip5ghzCEXMsHmUL9t2CUvbQVLAZdZEEppFG076meTyg
	s2umvvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLO8x-0000000FD92-0O9y;
	Wed, 11 Dec 2024 14:56:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLO7s-0000000FD0P-2itD;
	Wed, 11 Dec 2024 14:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 639A4A41836;
	Wed, 11 Dec 2024 14:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D48C4CED2;
	Wed, 11 Dec 2024 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733928943;
	bh=xbrvzOnKmd+0otzRNpHPJb3BuEKlAKM+LRet5dI/QFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peUBRvN0IEISX29AB3ZNPIQivo4QMCveLHjUqU1w5qLySytfCtKgrGM87dp28gCp9
	 tJCkZDyJWE4g13yXcR0GATm0SsAqbV4dzTL7k4pOcMitPgoPzdfnRsvHa/CeJ931g+
	 qU5eTJ0wJXWNPZINRFip93r99B1fMjz3iYOf4MNXd9ajRtlzkVOP7n/koJblirgz3V
	 tZkvQl2jkwYAJ1MWUKqafamJSZFc8QecZEFjN2kYVaI5ppQL9S9cpHoAqg6SW2XcnD
	 TOpsszRq3AjAbFmhujMfhqjwGHtuiDIwzdlLxATMWOTsFZ+hBgeYaFmN97HE6INXDF
	 zCBUgK+TCJf/g==
Date: Wed, 11 Dec 2024 08:55:41 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v6 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Message-ID: <20241211145541.GA2837320-robh@kernel.org>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
 <20241209033923.3009629-2-victor.liu@nxp.com>
 <20241210221508.GA550635-robh@kernel.org>
 <30924a9e-7d01-46f6-9e47-405c08acdde3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30924a9e-7d01-46f6-9e47-405c08acdde3@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_065544_835055_155A170D 
X-CRM114-Status: GOOD (  24.11  )
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

On Wed, Dec 11, 2024 at 11:05:52AM +0800, Liu Ying wrote:
> On 12/11/2024, Rob Herring wrote:
> > On Mon, Dec 09, 2024 at 11:39:05AM +0800, Liu Ying wrote:
> >> Freescale i.MX8qxp Display Controller is implemented as construction set of
> >> building blocks with unified concept and standardized interfaces.  Document
> >> all existing processing units.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Document aliases for processing units which have multiple instances in
> >>   the Display Controller.  Drop Rob's previous R-b tag. (Maxime)
> >>
> >> v4:
> >> * Collect Rob's R-b tag.
> >>
> >> v3:
> >> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
> >>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
> >>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
> >> * Document all processing units. (Rob)
> >>
> >> v2:
> >> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> >> * Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
> >> * Fix register range sizes in examples.
> >>
> >>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
> >>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
> >>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
> >>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
> >>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
> >>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
> >>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
> >>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
> >>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
> >>  .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
> >>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
> >>  17 files changed, 1042 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> >> new file mode 100644
> >> index 000000000000..7f800e72c3f3
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> >> @@ -0,0 +1,46 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8qxp Display Controller Blit Blend Unit
> >> +
> >> +description: |
> >> +  Combines two input frames to a single output frame, all frames having the
> >> +  same dimension.
> >> +
> >> +  Each Blit Blend Unit device should have an alias in the aliases node, in the
> >> +  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
> >> +  Controller instance and <y> is an integer specifying the Blit Blend Unit
> >> +  device instance.
> > 
> > That's really an abuse of aliases. If you need to describe connections 
> > between components, use the graph binding like everyone else does for 
> > display path components.
> 
> I need to describe components' instance numbers which imply the connections
> between components but not vice versa. If I use the graph binding, I cannot
> get the instance numbers(0 or 1) of the two display engines(documented by
> fsl,imx8qxp-dc-display-engine.yaml). If you have no objections, I may add the
> instance numbers to compatible strings, like brcm,bcm2835-pixelvalve0.yaml.
> What do you think?

You could have dc<x> and blitblend<y> aliases and use the graph to 
define the connections. But I'm not really a fan of adding custom 
aliases either. Why are the instance numbers important?

Are the programming models or features of the instances different? If 
so, then a different compatible or property describing the feature may 
be appropriate.

Rob

