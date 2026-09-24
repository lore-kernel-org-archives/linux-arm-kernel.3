Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC735C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSzKOZUy8NaRjE8fxyAW+EMiV46+2afh1kAtlwVP6oc=; b=afQbWTfz0DL/TtMJ7TXo0enb5S
	raL64u4u3Gu/llKPJvMWeIxzhGD+Iv7JcrEOgbxQAftNOKZTKPjmtd21QRxEjs8f7igrezxpBnjDs
	4d1lOAMf6CA+9id3+FhBWvU5GLZpzYUBwAnRGb9wpJ2LGit/p/Jm//Oe1U+AbNY2JHv39k9Roblha
	2lbfbkmh1e2cMh05Y+szgKRecCSakiFI7EItJvNk0UGE2ze4qR6Fkaaecn8RLoYgUA4C7IFJA62jk
	0ofM50iOInDea+cWQWsVOr9ICmXWvCI0w9dsHXZ99g6gX1K4UjMRqEmslYgcCIY0zZzOG/EJ4yVQ1
	YX8vBiAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rWT-0000000CGGI-0qso;
	Thu, 24 Sep 2026 22:02:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rWR-0000000CGGA-237n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:02:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A615F600D4;
	Thu, 24 Sep 2026 22:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F10E1F000FF;
	Thu, 24 Sep 2026 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790287350;
	bh=bSzKOZUy8NaRjE8fxyAW+EMiV46+2afh1kAtlwVP6oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N2PXSnK94vokQlGTISS32DQpbhFuKRTsJ9hFv22AeukwR4JVqjV/owNwuRPG7oZoq
	 9drLo5LgzoM2rfzeGe+gLz+3lrfIA3JBl1PhCKX7XXmiz0/ex7sBy1zyxw8MiY8GHE
	 v0N/RMxlx+yqBjX4lbf6VzkJpcmtmVIjgr/NhXF0d/RWmfirLYJLzRkmWFE1f3rSVt
	 BqKPhkitWyzhTmvjJW9sRn00txkCJI0X0ONUFCTSlTgFTXSHMRV05M4DYQRzKyOp8r
	 3e91QJYKcam0XM03HO3/EgOf5yNNEJ+uLG4MGR1lFtOJuUkVrJ3XtjDYUvF4t8x5Hy
	 jd8i0HrbwkV/g==
Date: Thu, 24 Sep 2026 17:02:28 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/6] dt-bindings: rtc: Add pinctrl for S35390A
Message-ID: <20260924220228.GA1895971-robh@kernel.org>
References: <20260916-rtc_s35390a_int1-v9-0-b2567a3e4959@posteo.de>
 <20260916-rtc_s35390a_int1-v9-1-b2567a3e4959@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-rtc_s35390a_int1-v9-1-b2567a3e4959@posteo.de>
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

On Wed, Sep 16, 2026 at 04:00:36PM +0000, Markus Probst wrote:
> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
> 
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 121 +++++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       |   3 -
>  2 files changed, 121 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> new file mode 100644
> index 000000000000..f3bf5900fb3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: S-35390A 2-WIRE REAL-TIME CLOCK

Drop the all caps.

> +
> +maintainers:
> +  - Markus Probst <markus.probst@posteo.de>
> +
> +description:
> +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> +  very low current consumption in the wide range of operation voltage.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: sii,s35390a
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description: Supports up to 2 interrupt lines via the INT1 and INT2 pins.
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - int1
> +        - int2
> +
> +  wakeup-parent: true
> +
> +  wakeup-source: true
> +
> +  "#clock-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^pins":
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "-pins$":
> +        type: object
> +        additionalProperties: false
> +
> +        allOf:

Don't need allOf.

> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +        properties:
> +          pins:
> +            minItems: 1
> +            items:
> +              enum:
> +                - int1
> +                - int2
> +
> +          function:
> +            description: |
> +              Pin function:
> +              - ignore:  Preserve the previous state.
> +              - disable: Disable pin output.
> +              - wakeup:  Output wakes up the system.
> +              - clock:   Output clock pulse.
> +              - pmin1:   Minute periodical output with 50% duty.
> +              - pmin2:   Minute periodical output L for 7.81 ms.
> +                         Can only be used with pin int1.
> +            enum:
> +              - ignore
> +              - disable
> +              - wakeup
> +              - clock
> +              - pmin1
> +              - pmin2
> +
> +        required:
> +          - pins
> +          - function
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@30 {
> +            compatible = "sii,s35390a";
> +            reg = <0x30>;
> +            pinctrl-0 = <&rtc_pins_default>;
> +            pinctrl-names = "default";
> +
> +            interrupt-names = "int1";
> +            interrupts = <23>;
> +
> +            rtc_pins_default: pins {
> +              int1-pins {
> +                pins = "int1";
> +                function = "wakeup";
> +              };
> +              int2-pins {
> +                pins = "int2";
> +                function = "disable";
> +              };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index f4d0eed98a08..7b3f682ef4d5 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -81,8 +81,6 @@ properties:
>        - ricoh,rv5c386
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>        - ricoh,rv5c387a
> -      # 2-wire CMOS real-time clock
> -      - sii,s35390a
>        # ST SPEAr Real-time Clock
>        - st,spear600-rtc
>        # VIA/Wondermedia VT8500 Real-time Clock
> @@ -105,5 +103,4 @@ required:
>    - reg
>  
>  additionalProperties: false
> -

Unrelated change. Drop.

Rob

