Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4ABCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=; b=xAYbx+/TNmQHQU2ySxA8sz4i2I
	XRYkffdln6cwCVsfQEKYg2erqrtjYsn4KyYKTelVUMW3Pojswu5upaKNlJX+NoTkFgb/iR63uUW1q
	Lo8K4JK66tj32x0nkPrgzQu6AKkAmXiNBlWw/L7m8rN5bzi2m+RCcLasPu7tM40wIQ69gyv5tdG2f
	m2kkQp4Miu9pytm0sj0fX8QNcfBl2CbgPF20P4cRdYQFCCR3IVBfr/hRPrvsidV5OzOCrIdw8W9dN
	+q+3xyHng9CYZMejjK4heLis1gZYeJq4uvHSDLiQ0bVQDJmyZvnvA6GKIRH5u6wh6FwBK1E/05szk
	U/D5KCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt6k-00000006Ykh-2XP7;
	Fri, 31 Oct 2025 17:40:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt6i-00000006Yjp-1z20
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:40:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so344057966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761932410; x=1762537210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
        b=kEwo+6YVGNtNNCe45XPNaTN91+PlV6oC1ZaCoVx7lJn7iGExObnVglaoWDb6RvPupD
         ifyH/ra/RlMf/eqr1at0LOCcH0CZYKNhM4tQon552D4DSZqsA8C7m9piLTMNKYxwLYTL
         tv7HVA7PB+Xm6HWJ5QeQK2dXJI0XenghNWHgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932410; x=1762537210;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
        b=o4n0gfBYNG1K7B79iDXGC4EdVDj9y9BTbgTGtrR10m5eJpL3P8V/ARShSE8qEa15w6
         fJGLnSTXWLj0yeGvQbWN7bLec3QoU+Lkho6p6ovggqQtrGWz8wfcYezLo/9yCL7Xgf4/
         x+EpApBqk6DK9YeISg0Yz0DTpTmfv8B+K/2iEPudcRw5iHHnDakpFCYOUg38au/eePan
         vH0tDO+aBWGAdgH6s+Vx564nwbA4ICkIOXGQ4oF3WCmgJPnCD8vvo2SHMRVTiDBAXIww
         yxhPGmaR0ZBLnQxbGqnGG+iBsHU7dcpHknxV7mhKZQDiDINyse2ZdD6zGy/N/sTUyIE9
         CCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6FaT29DxsFI1jNkhgPMxIFc20LmgaU6L2BvIWIDGBsmOuAIU3dkEfe5RItn/ihy+9ZW2rly0IBIm94UTHsi25@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0KLx+FP5Gbu5TKu4/Z4IMnfCDriMWf4VJmGHoI+cmsKcQzu1Y
	w0vr78ODcCI101lJaRhHMuDUo7J8McD1uFC//vR1d67tFZibJkPfrpO3S2OxBG+QOaw=
X-Gm-Gg: ASbGncuviuUWGLkAsFbrOHfspeyjREs+GrY1AeXTJ1I2iRVr9V77sgklglXgMgRAmMf
	xEfNl4aLJELEoysyyeYFpVfN7uScIqpQu5l9bXVHynffPHFpsQrOg6s35yVLYn/TmLQpc7fhKWb
	usrYlB+i8iOthBMvgV9fX3Fp2g6oQikcTy1cGkf10A+1oiOmrBt6E0YQuM2RaVxtrf+mV09L2eB
	Kykry8G+oEFnSx1sEZIDaR+xO0bBubmDBe+pG1kp47sKgvS9CelJL0FrEGwUIKjKTsSnqWbjfjR
	MZk2sS6JiXSRax9CbZramsVC5eLjH8p009jhPy/xJSTMwZ3kWCBvwN6hyY/3V6Q/SLl8LpyC+kK
	qEW1Y5QTUSnASuwAYqJr0GGC+6daQGhpFbHjRaq916tEISAt964HiUsIWe3yz+09g3zZ6WMIye/
	7hK8tLZVFze9gntDJu6wUVDg==
X-Google-Smtp-Source: AGHT+IFbOBwf98bBMLnyAAZrOMm+hJ35dRhtFe2UhgAlTZPlhjoRrNX+iSO04sWdZ50B8Ps8qRcs4g==
X-Received: by 2002:a17:907:7e8d:b0:b6f:198e:c348 with SMTP id a640c23a62f3a-b7070630cfcmr467732066b.46.1761932409693;
        Fri, 31 Oct 2025 10:40:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c82ef6sm227660766b.52.2025.10.31.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:40:08 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:40:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <aQT0dlZ88jDVptLF@phenom.ffwll.local>
Mail-Followup-To: Liu Ying <victor.liu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
 <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
 <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_104012_914732_62027EA3 
X-CRM114-Status: GOOD (  29.07  )
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

On Tue, Oct 21, 2025 at 04:51:40PM +0800, Liu Ying wrote:
> Hi Sima,
> 
> On 10/21/2025, Simona Vetter wrote:
> > On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> >> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >>
> >> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> >> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> >> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> >>
> >> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> >> Controller compose the HDMI audio pipeline.
> >>
> >> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> >>
> >> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > dt patches need an ack from dt maintainers before you push them, please
> > make sure you follow that for the next changes.
> 
> Just want to make sure I may follow that correctly in the future.
> As Krzysztof is one of DT binding maintainers and this patch has
> Krzysztof's R-b tag, need more ack from DT maintainers?

Sorry for the late reply, caught a cold :-/

No, that's enough, I wasn't entirely awake when I processed the PR
containing these patches. I only noticed because of a a new check in dim
for maintainer actions like merging a PR, which misfired on these two
patches - the r-b should have been counted as an ack (even though strictly
it's better to record both).

Apologies for the noise.
-Sima

> 
> > -Sima
> > 
> >> ---
> >>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >>  2 files changed, 81 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> index 05442d437755..6211ab8bbb0e 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> @@ -49,6 +49,10 @@ properties:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: HDMI output port
> >>  
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Parallel audio input port
> >> +
> >>      required:
> >>        - port@0
> >>        - port@1
> >> @@ -98,5 +102,13 @@ examples:
> >>                      remote-endpoint = <&hdmi0_con>;
> >>                  };
> >>              };
> >> +
> >> +            port@2 {
> >> +                reg = <2>;
> >> +
> >> +                endpoint {
> >> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> >> +                };
> >> +            };
> >>          };
> >>      };
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> new file mode 100644
> >> index 000000000000..4f99682a308d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> @@ -0,0 +1,69 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> >> +
> >> +maintainers:
> >> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> >> +
> >> +description:
> >> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> >> +  Audio Subsystem to the HDMI TX Controller.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx8mp-hdmi-pai
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    const: apb
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description: Output to the HDMI TX controller.
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - power-domains
> >> +  - port
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8mp-clock.h>
> >> +    #include <dt-bindings/power/imx8mp-power.h>
> >> +
> >> +    audio-bridge@32fc4800 {
> >> +        compatible = "fsl,imx8mp-hdmi-pai";
> >> +        reg = <0x32fc4800 0x800>;
> >> +        interrupt-parent = <&irqsteer_hdmi>;
> >> +        interrupts = <14>;
> >> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> >> +        clock-names = "apb";
> >> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> >> +
> >> +        port {
> >> +            pai_to_hdmi_tx: endpoint {
> >> +                remote-endpoint = <&hdmi_tx_from_pai>;
> >> +            };
> >> +        };
> >> +    };
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

