Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B825CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF0Cgq4yt5lwtrS2G4dRj4c6ZmzlGwLXaM4AN3MLC1U=; b=uUVjfbzAXy6BJ06fDGnB3JLjT1
	8Fm1U6OxxRbih6uWGY+BcNrkzVCzyYBDMvKNJyKaagbKOL0B+vJ+nRX06FR1fSDVtHZzs5FN9lcYl
	J6v603cBH5hoaJfoCTs91D6d4s+a1a8tJUHgsN5gVn9fL/cv3bZi0UgIHk2E/fjWqcSwDasajcDTb
	JWUuToQoxtSnSyjY4hC+IxUVOvNN1b9YJLitZ1uaYyyAoFVIbg4S7wdiuBzJpohGDUg72e3iKEvyB
	Pew4mrAVN9b5ohPmHo798iO5BWHTvnUfXdA1IjAgyNfV9eowN03E09ngWJbEy8D4GYT9bMl7rv/u9
	bKcEbDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Lhe-00000003W5b-3AhL;
	Mon, 29 Sep 2025 21:46:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Lha-00000003W53-0w3s;
	Mon, 29 Sep 2025 21:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759182388;
	bh=NUu0AP/Y/b6sxBMQX5+HIS4HgANg/O7SvbtfXPGtNco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DK3Y9bNeZ23oe2VZsJdSI3/n95X1tBhAkQcK8G+pHt1hKrvx6XWlnd0wF+5/RAKK0
	 LTEXQDLyq70YCp6TKoShYyrlxhrxiBn5KzRnx7Utdb3BXUlFzMKtepHA7Sr94tH3HE
	 9VFpGor6m07Qyfd8Do6RxOHuAgmotUAA8D68SycDCanfaXW/Gm8aoAofg9GaIBbQhX
	 ZMDLX4Nr8No65uabM3Zq8EDxhcpUYUz+sVw5n0E6/sQUI/J+XMV+dL45sosEll1Lpd
	 Kn0oFkue5jY4p77mqW64iky393/oOaDpZ+DgRHNMDrCCM3ur7HuGHqWZaO3aEGq+C5
	 86dMZlZO+XsVw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96E2F17E12BB;
	Mon, 29 Sep 2025 23:46:27 +0200 (CEST)
Message-ID: <1f1dd0a4-c6e7-4863-a99d-c0615e2746c4@collabora.com>
Date: Mon, 29 Sep 2025 23:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/17] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
To: Rob Herring <robh@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>
 <20250922171126.GA480461-robh@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20250922171126.GA480461-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_144635_115661_684577E3 
X-CRM114-Status: GOOD (  18.53  )
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

Hi Rob,

Thanks for your review.

On 9/22/25 19:11, Rob Herring wrote:
> On Wed, Sep 17, 2025 at 05:38:45PM +0200, Michael Riesch wrote:
>> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 +++++++++++++++++++++
>>  MAINTAINERS                                        |   6 +
>>  2 files changed, 150 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> new file mode 100644
>> index 000000000000..8cbab93b4b85
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> @@ -0,0 +1,144 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip RK3568 MIPI CSI-2 Receiver
>> +
>> +maintainers:
>> +  - Michael Riesch <michael.riesch@collabora.com>
>> +
>> +description:
>> +  The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one input port
>> +  and one output port. It receives the data with the help of an external
>> +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
>> +  (VICAP) block.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - rockchip,rk3588-mipi-csi
>> +          - const: rockchip,rk3568-mipi-csi
>> +      - const: rockchip,rk3568-mipi-csi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Interrupt that signals changes in CSI2HOST_ERR1.
>> +      - description: Interrupt that signals changes in CSI2HOST_ERR2.
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: irq1
>> +      - const: irq2
> 
> Names that are just the index are not useful. Drop. With that,

I would be OK with that, but in the discussion of my recent CSI DPHY
series I was asked to give names to two resets in order to be future
proof (right now all these resets are (de)asserted in unison and this
would be perfectly possible without reset names). Going back to the
issue raised here, I would say that the names need to be there as well
(simply for reasons of consistency).

Maybe we can fix the naming here. One IRQ fires when the ERR1 status
register changes, so maybe irq_err1 ? Other suggestions welcome.

Best regards,
Michael

> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    maxItems: 1
>> +    description: MIPI C-PHY or D-PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-type:
>> +                enum: [1, 4]
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - bus-type
>> +              - data-lanes
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output port connected to a RK3568 VICAP port.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - phys
>> +  - ports
>> +  - power-domains
>> +  - resets
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3568-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +    #include <dt-bindings/power/rk3568-power.h>
>> +
>> +    soc {
>> +        interrupt-parent = <&gic>;
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        csi: csi@fdfb0000 {
>> +            compatible = "rockchip,rk3568-mipi-csi";
>> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
>> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "irq1", "irq2";
>> +            clocks = <&cru PCLK_CSI2HOST1>;
>> +            phys = <&csi_dphy>;
>> +            power-domains = <&power RK3568_PD_VI>;
>> +            resets = <&cru SRST_P_CSI2HOST1>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                csi_in: port@0 {
>> +                    reg = <0>;
>> +
>> +                    csi_input: endpoint {
>> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +                        data-lanes = <1 2 3 4>;
>> +                        remote-endpoint = <&imx415_output>;
>> +                    };
>> +                };
>> +
>> +                csi_out: port@1 {
>> +                    reg = <1>;
>> +
>> +                    csi_output: endpoint {
>> +                        remote-endpoint = <&vicap_mipi_input>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4c39b9fd80bb..2ac4b7a5b255 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21797,6 +21797,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>>  F:	drivers/media/platform/rockchip/rkisp1
>>  F:	include/uapi/linux/rkisp1-config.h
>>  
>> +ROCKCHIP MIPI CSI-2 RECEIVER DRIVER
>> +M:	Michael Riesch <michael.riesch@collabora.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
>> +
>>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>>  M:	Daniel Golle <daniel@makrotopia.org>
>>  M:	Aurelien Jarno <aurelien@aurel32.net>
>>
>> -- 
>> 2.39.5
>>


