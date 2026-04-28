Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A690BFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkhJI2u81cWQQKkbpyLd60L537rqdrvEOTTOduSP8fc=; b=DErqzimmDY7ywOdax/Rd4QNwat
	VpmrRFt1n9UjB1yJTxogHD+YSWdhKfv08khdM+bkD77bjmdovjcH5/tJTr78IKH8s2MS5sWL0l4Rh
	u2/dj2chlsBYtWw8VA45MyWJDz3ntaLnryMldVu1OmjH7eSVg2f+7ZmgDizjAMKoeTSz9/wkAsYxw
	xVYnHSkvMa80Sx4In4F0gbd5TV8kGzdlsukQ+0av7XA8myJ9cmqLbEoBqvcy+OOmlmGhgvDz93nIr
	A+iWINB94uyL6KMz090tMX4AsQH4Lb6ohFabMnh1MzhTObCh5g6p8ynfiEaz/KLFiVnUDhwIrNQUD
	x81jLfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhRj-00000001QNl-1xEd;
	Tue, 28 Apr 2026 12:21:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhRg-00000001QMN-2xJn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:21:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 753DC1A3471;
	Tue, 28 Apr 2026 12:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E459601D0;
	Tue, 28 Apr 2026 12:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF52010728AA4;
	Tue, 28 Apr 2026 14:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777378900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FkhJI2u81cWQQKkbpyLd60L537rqdrvEOTTOduSP8fc=;
	b=lDEouwh70SunD0CIWASRbWeFowTrGybIpcklgMde26dHzbTlVQO4tNpqeNvxp/DTQsoqLf
	MVjtKrPOCWqpHgHajsl9TS3Z3HbhRIpfUc1ER+yeSnCjIO3sw4GAhoSvOm0qOqbvwlTHrB
	x+gO9MKBp4xsCHTPNEnL2nYoU4H0Uz7b3WQc5J0o29raPzA+01q4oo01SleqCbz0BDqus+
	+SOujwJmPYbFV9TLnY1ejbitcPWUig77tZIqCoYyaNv88N+8BWkg4GxKRwHhpKohvAc+Wg
	QN2E2KsPjss+wNTEiCqCvUKMlcm3LPj/suEerpCepkldM2ueNI7yNcP+xUABCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 14:21:35 +0200
Message-Id: <DI4S8GN9WTCI.75C07G767ZOV@bootlin.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux@ew.tq-group.com>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "Ying Liu" <victor.liu@nxp.com>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v22 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
X-Mailer: aerc 0.20.1
References: <20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d@oss.nxp.com>
 <20260424-dcss-hdmi-upstreaming-v22-5-30a28f89298d@oss.nxp.com>
 <DI3YF5Y2B3GZ.25AP4NKQAXH36@bootlin.com>
 <f6rf5d6nhglkwendf5yvaklfn2ovlwkqstsz7vvl5zefibtiun@wic7bchohmwv>
In-Reply-To: <f6rf5d6nhglkwendf5yvaklfn2ovlwkqstsz7vvl5zefibtiun@wic7bchohmwv>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_052144_869368_548DD332 
X-CRM114-Status: GOOD (  24.59  )
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

Hello Laurentiu,

On Mon Apr 27, 2026 at 4:35 PM CEST, Laurentiu Palcu wrote:
> Hi Luca,
>
> On Mon, Apr 27, 2026 at 02:59:47PM +0200, Luca Ceresoli wrote:
>> Hello Laurentiu,
>>
>> On Fri Apr 24, 2026 at 1:07 PM CEST, Laurentiu Palcu wrote:
>> > From: Sandor Yu <Sandor.yu@nxp.com>
>> >
>> > Add bindings for Freescale iMX8MQ DP and HDMI PHY.
>> >
>> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
>> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>> > ---
>> >  .../bindings/phy/fsl,imx8mq-hdptx-phy.yaml         | 80 +++++++++++++=
+++++++++
>> >  1 file changed, 80 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-ph=
y.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
>> > new file mode 100644
>> > index 0000000000000..a24435139b8b3
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
>> > @@ -0,0 +1,80 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
>> > +
>> > +maintainers:
>> > +  - Sandor Yu <sandor.yu@nxp.com>
>>
>> Based on what you said in the cover, I guess this line will have to be
>> changed. Are you willing to maintain this binding?
>
> Yes, I'll update it in the next iteration.
>
>>
>> > +description:
>> > +  The Cadence HDP-TX DP/HDMI PHY is a child node of the MHDP8501 brid=
ge,
>> > +  sharing the same MMIO region as the parent bridge node.
>> > +
>> > +properties:
>> > +  compatible:
>> > +    const: fsl,imx8mq-hdptx-phy
>> > +
>> > +  clocks:
>> > +    items:
>> > +      - description: PHY reference clock.
>> > +      - description: APB clock.
>> > +
>> > +  clock-names:
>> > +    items:
>> > +      - const: ref
>> > +      - const: apb
>> > +
>> > +  "#phy-cells":
>> > +    const: 0
>> > +
>> > +required:
>> > +  - compatible
>> > +  - clocks
>> > +  - clock-names
>> > +  - "#phy-cells"
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    #include <dt-bindings/clock/imx8mq-clock.h>
>> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> > +
>> > +    display-bridge@32c00000 {
>> > +        compatible =3D "fsl,imx8mq-mhdp8501";
>> > +        reg =3D <0x32c00000 0x100000>;
>> > +        interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
>> > +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>> > +        interrupt-names =3D "plug_in", "plug_out";
>> > +        clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
>> > +        phys =3D <&dp_phy>;
>> > +
>> > +        ports {
>> > +            #address-cells =3D <1>;
>> > +            #size-cells =3D <0>;
>>
>> The ports are not mentioned in the properties. I'm not a DT maintainer, =
but
>> I think they should, e.g. to mention which port is the input and which i=
s
>> the output.
>>
>> > +
>> > +            port@0 {
>> > +                reg =3D <0>;
>> > +                endpoint {
>> > +                    remote-endpoint =3D <&dcss_out>;
>> > +                };
>> > +            };
>> > +
>> > +            port@1 {
>> > +                reg =3D <1>;
>> > +                endpoint {
>> > +                    data-lanes =3D <2 1 0 3>;
>>
>> Having a remote-endpoint property would be nice here, to make the exampl=
e
>> more complete.
>
> The ports and the remote endpoints are documented in the bridge binding..=
.

Ah, my bad, I reviewed too quickly and mixed the phy and bridge bindings in
my mind, sorry.

>
> However, I believe I screwed this example up by adding the entire bridge =
node,
> instead of just a simple:
>
> mhdp {
>     phy {
>         compatible =3D "fsl,imx8mq-hdptx-phy";
>         #phy-cells =3D <0>;
>         clocks =3D <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
>         clock-names =3D "ref", "apb";
>     };
> };
>
> I'll simplify the example in the next iteration.

Yes, I think it would make sense to do it.

Thanks,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

