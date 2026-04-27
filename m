Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33158FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1gq2kSLPRi8BDsMgY4czhQqlGkV5UyJsHxlDfVChz0=; b=FpaEiX792ziw8xKD0+YpMk4LqV
	5Eq+XQYvuzga/8jWD3WIaLEI8xlaUo0yDZUX4a8iVS323nzo7sab7D6ZF2CATqdtpmeqJFsbDbjND
	KHjjchI7ePUJ17ulxKO/Supy8nY6Mva38x/FPy4s5We2Ogf06GVp6DB2Z5CmCxyc5AJiChvRNfnuy
	yz5LRNiSk0DOrxp5eUs3q6KKCYzcoT+uCLovjrSrx2HzulSYrkrxx4Uxv08Tra4Pqxg4UOLetaXhp
	0cN1JDaZy0pzH7j4H3Zb/aZ6OMU87Tsr7gm8dATREnIj65fp+hJ7t8A6mbR6VUuldDTdn8UHenkcr
	9yLysVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZC-0000000Gwkl-32ND;
	Mon, 27 Apr 2026 13:00:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZ9-0000000Gwie-2Tgq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E36D5C5CD48;
	Mon, 27 Apr 2026 13:00:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B81ED600D1;
	Mon, 27 Apr 2026 12:59:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E5EF1072804C;
	Mon, 27 Apr 2026 14:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777294793; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w1gq2kSLPRi8BDsMgY4czhQqlGkV5UyJsHxlDfVChz0=;
	b=KM19ZW6ABhnHYA6hBe+i6d5oGTfsERPMy9ZBlb6TXMxvbpEfHorIfO/ocCrZPQMj83+MMn
	WrD4/vTbGY6rM5cwa1G5nhIKmyZwF7QFL8+o25zNnOvvG/jh/xdbabGQtgw08qLzLadkNA
	chUGjND3ttfvUWbS6h1JpmC4LBiJh5KLijGlI/o8xH1uaR5QlibWlwsYuBtsx2A4z4qCtG
	hmpocuBB1sgz7UJbCtJkJ4N9n542wvcyqzOoR8Zc7rLbxjqeH2e+p95mVteN2TdGXD3UG3
	cBQ7dp0YU54eialMN0ggw/T08DMOtO5qeg98RjTD0ZpS500TnopeLBbZtcZwTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 14:59:47 +0200
Message-Id: <DI3YF5Y2B3GZ.25AP4NKQAXH36@bootlin.com>
Subject: Re: [PATCH v22 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux@ew.tq-group.com>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>, "Ying Liu" <victor.liu@nxp.com>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260424-dcss-hdmi-upstreaming-v22-0-30a28f89298d@oss.nxp.com>
 <20260424-dcss-hdmi-upstreaming-v22-5-30a28f89298d@oss.nxp.com>
In-Reply-To: <20260424-dcss-hdmi-upstreaming-v22-5-30a28f89298d@oss.nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_055959_778535_98F52D92 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri Apr 24, 2026 at 1:07 PM CEST, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
>
> Add bindings for Freescale iMX8MQ DP and HDMI PHY.
>
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/phy/fsl,imx8mq-hdptx-phy.yaml         | 80 ++++++++++++++++=
++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.y=
aml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> new file mode 100644
> index 0000000000000..a24435139b8b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> +
> +maintainers:
> +  - Sandor Yu <sandor.yu@nxp.com>

Based on what you said in the cover, I guess this line will have to be
changed. Are you willing to maintain this binding?

> +description:
> +  The Cadence HDP-TX DP/HDMI PHY is a child node of the MHDP8501 bridge,
> +  sharing the same MMIO region as the parent bridge node.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mq-hdptx-phy
> +
> +  clocks:
> +    items:
> +      - description: PHY reference clock.
> +      - description: APB clock.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: apb
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display-bridge@32c00000 {
> +        compatible =3D "fsl,imx8mq-mhdp8501";
> +        reg =3D <0x32c00000 0x100000>;
> +        interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "plug_in", "plug_out";
> +        clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        phys =3D <&dp_phy>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;

The ports are not mentioned in the properties. I'm not a DT maintainer, but
I think they should, e.g. to mention which port is the input and which is
the output.

> +
> +            port@0 {
> +                reg =3D <0>;
> +                endpoint {
> +                    remote-endpoint =3D <&dcss_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +                endpoint {
> +                    data-lanes =3D <2 1 0 3>;

Having a remote-endpoint property would be nice here, to make the example
more complete.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

