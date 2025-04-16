Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A0EC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdFc/8y5d5vOKqyyo5jGDb/PRQkifI+V15Wsi5kLYz0=; b=XDzOrtN82cQX+4dVhVkPFsPP4K
	7IlVz1U9ZzuJ93MUSG42mtGLVm7UQWB3HxleUkEGDgkbm8r9ttldScPR1XJyJQjrl3RfX5gddt9qW
	WL+MA58klPok8PFSkT0lDHrE/x4/AXe1KFVUI1dqK66TwVCgqzpGGmh0uiVOggweXat/sQWRZKQ1C
	+QIjdJe8pVnHzp13/QsWHPkkxxAvBXNEePzMadhNpQNc2dt6kogaq7cg+s8Uv7rH6TzDwhkwwQKwo
	NE+sFXfJOur/CmLmtnX157OZTXkLRFqgh/SgQI2sibk5DucRW9/S8CS8w7oNUiY2oUkxUKw3F2x/t
	zwsRJcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Hq-0000000ABbk-0Q3t;
	Wed, 16 Apr 2025 16:06:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54ep-0000000A4Nu-2SU2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:26:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u54ea-0001Dd-Cb; Wed, 16 Apr 2025 17:26:20 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u54eZ-000bl3-3C;
	Wed, 16 Apr 2025 17:26:20 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u54eZ-000CSL-2v;
	Wed, 16 Apr 2025 17:26:19 +0200
Message-ID: <14f2bfcd4604c5cf8b92a7d0dfc685e1f56b768b.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert imx.txt to yaml format
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, "open list:MEDIA INPUT
 INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
  "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 16 Apr 2025 17:26:19 +0200
In-Reply-To: <Z//KCLUWlTMdsyd3@lizhi-Precision-Tower-5810>
References: <20250414210720.3359301-1-Frank.Li@nxp.com>
	 <20250416124226.GA2498696-robh@kernel.org>
	 <Z//KCLUWlTMdsyd3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082635_621873_8E43BA83 
X-CRM114-Status: GOOD (  20.11  )
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

On Mi, 2025-04-16 at 11:17 -0400, Frank Li wrote:
> On Wed, Apr 16, 2025 at 07:42:26AM -0500, Rob Herring wrote:
> > On Mon, Apr 14, 2025 at 05:07:18PM -0400, Frank Li wrote:
> > > Convert binding doc imx.txt to yaml format. Create two yaml files:
> > > fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> > >=20
> > > Additional changes:
> > > - add example for fsl,imx6-mipi-csi2
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../media/fsl,imx-capture-subsystem.yaml      |  38 ++++++
> > >  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 126 ++++++++++++++++=
++
> > >  .../devicetree/bindings/media/imx.txt         |  53 --------
> > >  3 files changed, 164 insertions(+), 53 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-c=
apture-subsystem.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-=
mipi-csi2.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx-capture-=
subsystem.yaml b/Documentation/devicetree/bindings/media/fsl,imx-capture-su=
bsystem.yaml
> > > new file mode 100644
> > > index 0000000000000..77be3c1f37c5b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsyst=
em.yaml
> > > @@ -0,0 +1,38 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx-capture-subsystem.y=
aml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale i.MX Media Video Device
> > > +
> ...
> > > +        reg =3D <0x021dc000 0x4000>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +        clocks =3D <&clks IMX6QDL_CLK_HSI_TX>,
> > > +                 <&clks IMX6QDL_CLK_VIDEO_27M>,
> > > +                 <&clks IMX6QDL_CLK_EIM_PODF>;
> > > +        clock-names =3D "dphy", "ref", "pix";
> > > +
> > > +        port@0 {
> > > +            reg =3D <0>;
> > > +
> > > +            endpoint {
> > > +                remote-endpoint =3D <&ov5640_to_mipi_csi2>;
> > > +                clock-lanes =3D <0>;
> > > +                data-lanes =3D <1 2>;
> > > +            };
> > > +        };
> >=20
> > I would think at least 1 output port is required?
>=20
> I checked dts file, only input port. I think old csi2 only need get data
> from camera. csi's dma should save to memory.

There are no ports in imx6qdl.dtsi, but there's a &mipi_csi with four
output ports in imx6q.dtsi and imx6dl.dtsi each, because whether data
flows through a mux or directly into the IPU CSI ports differs between
the two platforms.

regards
Philipp


