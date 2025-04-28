Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4B6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+1ZWvQlWBkxJXr2/MrV9A5ZxzOaPtQ2ebX+6nLmPTA=; b=RTh8H0ZLCmk7G5LoopIHoSyl5r
	U+gTa8DTrIl1/qkyeIYErwjJBsX0izh4bV8QCl8CvzDXHctG7w1UgJS2ItWAeF6vTVU/h0B+9pbSj
	YPl0W9zwpcV/mosOIAUuWy5KxTszlnY2aspxW1PWMO+2Cx4uoARZbmX6re5YG1xZceMvQ6FJeWtHA
	St49wow66i7P024Rw/uL2ZmZgxKCulvW26mY2TlBAQs2CG4AtNxI3Y+FjMV9btWf5xXJXAZFLaCNY
	dXMKc+Gj4aBlPTPx16yTUaLBbKv1UF/Y/8KhH9Aon8AqzOXY4guBOofctZAqZXYwZjoLpd9ZjAgVh
	thhkFSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KyE-00000005gCx-0foj;
	Mon, 28 Apr 2025 09:40:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KhJ-00000005aBf-1ika;
	Mon, 28 Apr 2025 09:22:47 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22ADC475;
	Mon, 28 Apr 2025 11:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745832153;
	bh=NY/33MR9wfSNfzTcGXyyEDpLjwV3dc9w3keIJgd0PrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuZykKApfPKPCcLx822+/Vfr0vTuqQO0py4EQJ3h3F6veI9WAG61Z5QHrIYYDZHXn
	 MPCOIyQ7524Hsv8DRnD2dWjg8+Hp42PmxKWQ7cT0E2fqGOPJXfCp5YHUy2huerdEZX
	 6xt048WplYGxYMMcLth80hfar/aSE88EG6NjSdL4=
Date: Mon, 28 Apr 2025 12:22:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <20250428092232.GC3371@pendragon.ideasonboard.com>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
 <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
 <Z8rBGHK9Tjx7D1D2@kekkonen.localdomain>
 <4a1e5834-df52-43d2-ab19-e3117840a001@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a1e5834-df52-43d2-ab19-e3117840a001@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_022245_769098_8D8C104B 
X-CRM114-Status: GOOD (  34.09  )
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

On Mon, Apr 28, 2025 at 10:11:51AM +0200, Michael Riesch wrote:
> Hi Krzysztof, Sakari,
> 
> Thanks for your feedback! Also, sorry for the delayed response, but as
> the e-mail address indicates, there has been a job change in between
> that kept me busy :-)
> 
> On 3/7/25 10:49, Sakari Ailus wrote:
> > Hi Krzysztof, Michael,
> > 
> > On Fri, Mar 07, 2025 at 08:51:54AM +0100, Krzysztof Kozlowski wrote:
> >> On Thu, Mar 06, 2025 at 05:56:04PM +0100, Michael Riesch wrote:
> >>> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> >>>
> >>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >>
> >> subject: only one media prefix, the first
> >>
> >> A nit, subject: drop second/last, redundant "bindings". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> >> See also:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> Ack. Plain "media: dt-bindings: add rockchip rk3568 vicap" it is, then.
> 
> >>
> >>> ---
> >>>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
> >>>  MAINTAINERS                                        |   1 +
> >>>  2 files changed, 170 insertions(+)
> >>>
> >>
> >> ...
> >>
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: ACLK
> >>> +      - description: HCLK
> >>> +      - description: DCLK
> >>> +      - description: ICLK
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: aclk
> >>> +      - const: hclk
> >>> +      - const: dclk
> >>> +      - const: iclk
> >>> +
> >>> +  rockchip,cif-clk-delaynum:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    minimum: 0
> >>> +    maximum: 127
> >>> +    description:
> >>> +      Delay the DVP path clock input to align the sampling phase, only valid
> >>> +      in dual edge sampling mode. Delay is zero by default and can be adjusted
> >>> +      optionally.
> >>
> >> default: 0
> 
> Ack.
> 
> > 
> > And this is technically specific to the DVP port (0). Should (or could?) it
> > be located there?
> 
> "Should"? Yes, makes sense to me.
> "Could"? I guess, as we are referencing port-base here it should be
> feasible. Not an expert opinion, mind you.
> 
> > 
> >>
> >>> +
> >>> +  iommus:
> >>> +    maxItems: 1
> >>> +
> >>> +  resets:
> >>> +    items:
> >>> +      - description: ARST
> >>> +      - description: HRST
> >>> +      - description: DRST
> >>> +      - description: PRST
> >>> +      - description: IRST
> >>> +
> >>> +  reset-names:
> >>> +    items:
> >>> +      - const: arst
> >>> +      - const: hrst
> >>> +      - const: drst
> >>> +      - const: prst
> >>> +      - const: irst
> >>> +
> >>> +  rockchip,grf:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: Phandle to general register file used for video input block control.
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +
> >>> +  ports:
> >>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>> +
> >>> +    properties:
> >>> +      port@0:
> >>> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >>> +        unevaluatedProperties: false
> >>> +        description: The digital video port (DVP, a parallel video interface).
> >>> +
> >>> +        properties:
> >>> +          endpoint:
> >>> +            $ref: video-interfaces.yaml#
> >>> +            unevaluatedProperties: false
> >>> +
> >>> +            properties:
> >>> +              bus-type:
> >>> +                enum: [5, 6]
> >>> +
> >>> +            required:
> >>> +              - bus-type
> >>> +
> >>> +      port@1:
> >>> +        $ref: /schemas/graph.yaml#/properties/port
> >>> +        description: Internal port connected to a MIPI CSI-2 host.
> >>> +
> >>> +        properties:
> >>> +          endpoint:
> >>> +            $ref: video-interfaces.yaml#
> >>> +            unevaluatedProperties: false
> >>
> >> Hm, does it actually work? graph/port does not allow any other
> >> properties. You should use graph/port-base and probably still narrow
> >> lanes for both of port@0 and port@1.
> > 
> > I'd list the relevant properties for both DVP and CSI-2, either as
> > mandatory or with defaults (could be reasonable for DVP signal polarities
> > but not e.g. on number of CSI-2 lanes).
> 
> Not sure whether we are on the same page here. As pointed out in the
> last round of feedback
> (https://lore.kernel.org/all/0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net/),
> port@1 is not MIPI CSI, but some internal interface.
> 
> I tried to clarify this by changing the description of this port to
> "Internal port connected to a MIPI CSI-2 host." The host (see
> rockchip,rk3568-mipi-csi.yaml) has a port that is actually MIPI CSI and
> one port that is the other end of port@1 here.

I'd write "Port connected to the MIPI CSI-2 receiver output". We use
"receiver" instead of "host".

> As to port@1 here, I am not aware of any properties that can be set. Not
> even very peculiar ones similar to rockchip,cif-clk-delaynum. Should I
> have overlooked something, I think we can relax the constraints, but we
> should start strict, right?
> 
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +  - clocks
> >>> +  - ports
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/rk3568-cru.h>
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +    #include <dt-bindings/power/rk3568-power.h>
> >>> +    #include <dt-bindings/media/video-interfaces.h>
> >>> +
> >>> +    parent {
> >>
> >> soc {
> 
> Ack.
> 
> >>> +        #address-cells = <2>;
> >>> +        #size-cells = <2>;

-- 
Regards,

Laurent Pinchart

