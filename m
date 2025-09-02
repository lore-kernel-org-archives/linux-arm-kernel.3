Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9219CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bED5tF1OmMca6CVS+TCLsa9sopW1wAgbZtDN4ba4404=; b=PluffU0vIR1JgooWNW1okHTT7R
	UON+FC9bZ2rDUjoXlMKaQ55QhRfh9/Sl2qMvP3smve6Qt8Z952au8gIJxbZWXvNNQcqcTKomb2OPY
	ZlvSGBeGahwbLjphbaW+9GEwr0iqQQg+27HlpKHO1LZaBHrMaCLYLph814/+H1asFF3z1TafZKlE6
	PmJBz7zZ02YpizLKjA7GmMWf7Gz3ZdL/v0tmye0IOHWAIgjail8g9j4ac3l0yP7oMGFHtaMs9PR44
	PffpKJa64WosAYxbdl6u5IqR8Q1qI26GXjmrES2qXpVVuuMPv1Wnz+W5EIbM2Um036d1DB73nV0Fk
	M7qiQjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMsa-0000000GEAt-0fmU;
	Tue, 02 Sep 2025 09:00:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMV1-0000000G5j6-0rP5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:36:21 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ACD1BC75;
	Tue,  2 Sep 2025 10:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756802107;
	bh=9b9oj9NtnjkgCqLHI/easGtUlL/TclnyNvdB1pRPJ10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGOySrfRK7wpIrVW8pam0Ry99/B6YUY4pxhePRpqXmQ4bRXZFruERAo3LeGWgimon
	 o/2Wg5FRxVjaaLNOYl/+zymSodr6I2YJhJRDo+jpP6ffXxCw07kDAMnlXmAGxUC1O+
	 wIoZkgmSqEVDBzhib+eXd4wHBTQaA32pg7lKmLTk=
Date: Tue, 2 Sep 2025 10:35:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250902083554.GD13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_013619_703469_56021217 
X-CRM114-Status: GOOD (  27.81  )
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

On Mon, Sep 01, 2025 at 09:45:39PM -0400, Frank Li wrote:
> On Mon, Sep 01, 2025 at 05:46:10PM +0200, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 02:25:29PM +0800, Guoniu Zhou wrote:
> > > The CSI-2 receiver in the i.MX8ULP is almost identical to the version
> > > present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
> > > clock as the input clock for its APB interface of Control and Status
> > > register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
> > > increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
> > > same restriction for existed compatible.
> >
> > s/existed/existing/
> >
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 ++++++++++++++++++++--
> > >  1 file changed, 43 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > index 3389bab266a9adbda313c8ad795b998641df12f3..412cedddb0efee1a49d1b90b02baa7a625c797ec 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > > @@ -21,7 +21,9 @@ properties:
> > >            - fsl,imx8mq-mipi-csi2
> > >            - fsl,imx8qxp-mipi-csi2
> > >        - items:
> > > -          - const: fsl,imx8qm-mipi-csi2
> > > +          - enum:
> > > +              - fsl,imx8qm-mipi-csi2
> > > +              - fsl,imx8ulp-mipi-csi2
> > >            - const: fsl,imx8qxp-mipi-csi2
> >
> > According to this, the ULP version is compatible with the QXP version.
> >
> > >
> > >    reg:
> > > @@ -39,12 +41,16 @@ properties:
> > >                       clock that the RX DPHY receives.
> > >        - description: ui is the pixel clock (phy_ref up to 333Mhz).
> > >                       See the reference manual for details.
> > > +      - description: pclk is clock for csr APB interface.
> > > +    minItems: 3
> > >
> > >    clock-names:
> > >      items:
> > >        - const: core
> > >        - const: esc
> > >        - const: ui
> > > +      - const: pclk
> > > +    minItems: 3
> > >
> > >    power-domains:
> > >      maxItems: 1
> > > @@ -130,19 +136,53 @@ allOf:
> > >          compatible:
> > >            contains:
> > >              enum:
> > > -              - fsl,imx8qxp-mipi-csi2
> > > +              - fsl,imx8ulp-mipi-csi2
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          minItems: 2
> > > +        resets:
> > > +          minItems: 2
> > > +          maxItems: 2
> > > +        clocks:
> > > +          minItems: 4
> > > +        clock-names:
> > > +          minItems: 4
> >
> > But according to this, the ULP version requires more clocks than the QXP
> > version.
> 
> If only clock number difference, generally, it is still compatible and can
> be fallback, especialy driver use devm_bulk_clk_get_all().

That's a driver-specific implementation decision, so I don't think it
should be taken into account to decide on compatibility.

> If driver have not sperated drvdata for it, we can fallback to it. It is
> quite common.
> 
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx8qm-mipi-csi2
> >
> > QM is compatible with the QXP, so you don't need to list it here.
> >
> >           contains:
> >             const: fsl,imx8qxp-mipi-csi2
> >
> > is enough to cover both.
> >
> > > +            const: fsl,imx8qxp-mipi-csi2
> > >      then:
> > >        properties:
> > >          reg:
> > >            minItems: 2
> > >          resets:
> > >            maxItems: 1
> > > -    else:
> > > +        clocks:
> > > +          maxItems: 3
> > > +        clock-names:
> > > +          maxItems: 3
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx8mq-mipi-csi2
> > > +    then:
> > >        properties:
> > >          reg:
> > >            maxItems: 1
> > >          resets:
> > >            minItems: 3
> > > +        clocks:
> > > +          maxItems: 3
> > > +        clock-names:
> > > +          maxItems: 3
> > >        required:
> > >          - fsl,mipi-phy-gpr
> > >

-- 
Regards,

Laurent Pinchart

