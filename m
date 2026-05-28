Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD6CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjMCyOJicGcnsOK1p3JsmbDECVIS3LwVFxzgQoZgP/8=; b=uuJwV/VEBf0kKFjEUQ5j/1OnCH
	yjmGXhZaUgnW54JxxbQcH92is3f3kx/0CPjYe0klLH0MxiDFZ6Zmeka7lwfZRNK08CISwOC0vBw2/
	IWdCspyjPIEL5/xRnhCZFfRlYtvMNAUgIqm7222KEgPz/P/dfwsmeFZ1wZNrirxaIIYUQG07LoL3N
	R7o3QD455j8cSuCV/YFCcYHBQlSMTRfOTGJ1AngKat7Oj57ozHktJQIkUGCoo5RSTyuA4EmmX5UoK
	jehHYaehYJ2SLK3lTRXaMCoqiZl+C8XAxUiV/Wn3fIXG3bpW7DUCGhAs0TKvKqqOmvW+E9WS/zzCl
	7YGbuN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVIt-00000005H1w-1IbB;
	Thu, 28 May 2026 07:37:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVIs-00000005H1l-2Yec;
	Thu, 28 May 2026 07:37:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCB83605D5;
	Thu, 28 May 2026 07:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720781F000E9;
	Thu, 28 May 2026 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779953837;
	bh=sjMCyOJicGcnsOK1p3JsmbDECVIS3LwVFxzgQoZgP/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqZlZ0jZUWdyRo9TVikWIWSsxSzUCcde9CJs9ADiitZiyWPh+Myh3azKEFD7esWp3
	 ZKOsVF6bKCuoUZSY+u+1/Bj4Lm9AG1WA5aRFhk4z3SKMTg/xjUB9lXC8pOQ7EOmSiS
	 EYEszxyhtL0wcO/FOt1OTPDHdCwoPw0URBbak0gAsbFN3YqcOT/xLTx12Ch+kSAXLm
	 G1k8Am2o9o/oqwVB61n00/NeSAiCN04vPqnZAO8S26D1MAjX37DQAb5ADQ7ogvEWvP
	 h8IY3x4Ku1K5h4epJh5621y6jwHs+0GXRoLASvWi8VMek6/APjGK9gn9JcMY1htqai
	 2Hs+lm+otW/jw==
Date: Thu, 28 May 2026 09:37:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux@ew.tq-group.com, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v23 5/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <20260528-watchful-nippy-toucanet-8ecf39@quoll>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
 <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>
 <20260526-golden-bobcat-of-aurora-fd1fef@quoll>
 <2301c829-5203-47ea-bc26-09f9e3b459a4@kernel.org>
 <6oub7yyy22dtrevw7oayaqkcncz6tmmddy6fb75gsn3z6yfe3r@zr5lehbaohof>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6oub7yyy22dtrevw7oayaqkcncz6tmmddy6fb75gsn3z6yfe3r@zr5lehbaohof>
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

On Tue, May 26, 2026 at 09:44:53AM +0300, Laurentiu Palcu wrote:
> Hi Krzysztof,
> 
> On Tue, May 26, 2026 at 08:10:43AM +0200, Krzysztof Kozlowski wrote:
> > On 26/05/2026 08:08, Krzysztof Kozlowski wrote:
> > > On Tue, May 19, 2026 at 02:42:28PM +0000, Laurentiu Palcu wrote:
> > >> From: Sandor Yu <Sandor.yu@nxp.com>
> > >>
> > >> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> > >>
> > >> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > >> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > >> ---
> > >>  .../bindings/display/bridge/cdns,mhdp8501.yaml     | 136 +++++++++++++++++++++
> > >>  1 file changed, 136 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > >> new file mode 100644
> > >> index 0000000000000..57e7e95199777
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > 
> > Filename must match compatible.
> > 
> > >> @@ -0,0 +1,136 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: Cadence MHDP8501 DP/HDMI bridge
> > >> +
> > >> +maintainers:
> > >> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > >> +
> > >> +description:
> > >> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    enum:
> > >> +      - fsl,imx8mq-mhdp8501-hdmi
> > >> +      - fsl,imx8mq-mhdp8501-dp
> > > 
> > > We are at v23 and you will be getting the same questions till you
> > > finally fix that commit msg.
> > > 
> > > Why bus/connector is part of the compatible? Device is exactly the same.
> > > Please read writing bindings - it covers exactly this case.
> 
> The device is the same but, based on the FW, it can act as DP or HDMI
> controller. For 8MQ, the FW is loaded by the ROM. I did look at the writing
> bindings doc and I assume you're referring to this exact paragraph:
> 
>    - DON'T use bus suffixes to encode the type of interface device is using.
>      The parent bus node already implies that interface.  DON'T add the type of
>      device, if the device cannot be anything else.
> 
> I don't see how is this applicable in this particular case. The parent bus node
> does not imply the interface and, as I explained previously, the device can be
> either DP or HDMI.

True, not parent bus node, but in your case still other nodes could define
that this is HDMI via graph.

The problem is that device is the same thus you cannot have different
copmatible. If you look at your driver (although that's not ultimate
argument, just a hint), it clearly needs compatible only to tell if
connection is HDMI or DP. So again: device is the same with the same
programming interface.

Therefore same compatible.

> 
> > 
> > And this was BTW completely different in previous version.
> 
> It was indeed. However, the problem is that there's no way to detect
> from the controller's registers if we're in DP mode or HDMI. In v22 I
> added a DT traversal function to detect the connector type from the last
> node but it was suggested to me that having 2 compatibles would be a
> much cleaner solution and I agree.

Well, you cannot have two compatibles.

Discover the end connector. Optionally phy argument can tell, although
usually not that direction (the phy argument would tell the phy provider
how to configure it, not phy consumer).

Best regards,
Krzysztof


