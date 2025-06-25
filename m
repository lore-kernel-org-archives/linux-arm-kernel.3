Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E563DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPn04egDh8JdSsKJRGQRomC51XY7RSpYvfFy/tePET0=; b=HMHYq0M62eeJiWnz9JVy3My2sU
	VPsOHmP5B7/3AY+dFMx7CBrxKxEZMmGeV9mZpxFTlfN058hd/TPV9HZEsSzRGImTfoQ0WgkuC8lP7
	iuZjBYsOWQXA9qkgDCeXYz4RcyHn0fksouI98WZOCp6oSbdMniLa5+6Z948kCC9RoPxa7cM01DOJD
	xyfm4qTyueuhB27xjKM0e25CS/6bPa1N0f4R13ZUDYb86yQZCRW6h6bmuuF7AJZKmvAQVjmy6wdjy
	z9dd+CnfcYUSvRc3bVNzrOz0PbMUGXTdNXgsAn/VxZcTSF0J57X8exO2lgMMmRtdl4ff+zr+inwxi
	O2I3SS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXve-00000009zUD-1QHT;
	Wed, 25 Jun 2025 21:45:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVmM-00000009kPO-38NY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 114BC60010;
	Wed, 25 Jun 2025 19:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960A4C4CEEA;
	Wed, 25 Jun 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879649;
	bh=3+KxWYSRYr+i2rrsePfYRIGA1+vuieUTUyp4a4VljZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLMMs/1H+ZNmKkXWFEstI/NVo87FvFXK4/w7DwKqunRn63z0YvdKyox2jG/7ESXU7
	 HXWYHGS3wLcWBjhG/hOAKbRMKSPv+a6HPksQI48LIug3pYpwSlApoiB1zn6lUv+7Zu
	 Q+SlhSRK7gLrv0sEx6JJg70mJxRZHaOy6zHUVPJHlNucMh7f+kRz7zrseBvsna6gCB
	 rmkEyDq3gqFPlNyAeE9PLPLPFswKIc9pIwcAIAwbQpPIY8BTCkfW5KusOCe0bJ4XAf
	 V1zC+zEt9FaBLGnZamKQoD86+yuKoH3S8zmmKDnIpjtBOkvQfyOyRUkPODp3jlJust
	 Vu7Rv/017I3vQ==
Date: Wed, 25 Jun 2025 14:27:28 -0500
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
	Frank Li <Frank.li@nxp.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Purism Kernel Team <kernel@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <20250625192728.GA2072001-robh@kernel.org>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
 <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
 <20250610081829.GC11428@pendragon.ideasonboard.com>
 <20250619210237.GA21935@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619210237.GA21935@pendragon.ideasonboard.com>
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

On Fri, Jun 20, 2025 at 12:02:37AM +0300, Laurent Pinchart wrote:
> On Tue, Jun 10, 2025 at 11:18:29AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 09, 2025 at 03:08:39PM -0400, Frank Li wrote:
> > > On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > > > > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > > > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > > > > This is an integration-specific property, specify the number of
> > > > > > > instantiated channels through a new fsl,num-channels property. The
> > > > > > > property is optional, and defaults to 1 as only one channel is currently
> > > > > > > supported by drivers.
> > > > > > >
> > > > > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > > > > binding examples do not cover that SoC, don't update them.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > > > > >  1 file changed, 7 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > @@ -68,6 +68,13 @@ properties:
> > > > > > >      default: 166000000
> > > > > > >      deprecated: true
> > > > > > >
> > > > > > > +  fsl,num-channels:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +    description: Number of output channels
> > > > > > > +    minimum: 1
> > > > > > > +    maximum: 4
> > > > > > > +    default: 1
> > > > > > > +
> > > > > >
> > > > > > Look like it is fixed value for each compabiable string, So it is not
> > > > > > suitable for adding new property. It should be in driver data of each
> > > > > > compatible strings.
> > > > > >
> > > > > > I met similar case before. DT team generally don't agree on add such
> > > > > > property, unless there are two instances in the same chip, which have
> > > > > > difference channel number.
> > > > >
> > > > > If the DT changes are rejected, can the number of channels be added to
> > > > > the data structure inside mipi_csis_of_match?  We have compatibles for
> > > > > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > > > > to the number of channels.
> > > >
> > > > I thought about it, and decided to add a new property because the number
> > > > of channels is really a synthesis time configuration parameter, and
> > > > could differ between different CSIS instances in the same SoC.
> > > 
> > > Need add such information at binding doc's commit message,
> > 
> > I'll update the commit message.
> 
> The commit message in v2 will state
> 
>     dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
> 
>     The CSI-2 receiver can be instantiated with up to four output channels.
>     This is an integration-specific property, specify the number of
>     instantiated channels through a new fsl,num-channels property. The
>     property is optional, and defaults to 1 as only one channel is currently
>     supported by drivers.
> 
>     Using the compatible string to infer the number of channels has been
>     considered, but multiple instances of the same CSIS in the same SoC
>     could conceptually be synthesized with a different number of channels.
>     An explicit property is therefore more appropriate.
> 
>     The only known SoC to have more than one channel is the i.MX8MP. As the
>     binding examples do not cover that SoC, don't update them.

So how many channels does i.MX8MP have in a DT without this property? 
It's either 1 or the driver overrides it to 2.

> Rob, Krzysztof, Conor, are you fine with adding this property ?

Yes, but seems a little late.

Rob

