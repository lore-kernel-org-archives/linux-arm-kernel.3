Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BD9CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDOypIDr3p9oMdYmE32U2j3gSP9BN1MTfFMsapf4oZ8=; b=qvCiIWplWTmgHwIciD8Uph6X6F
	CTyiErv4dLE/CqxAG6Rb/IkHa2LrRdwYo+9tKLfvtlWyF1YfhDYlFEtK3AxvGcPq7PqJJmPmWLb3y
	hA5ufXqiXxX4smZQkVwgj/Yhka7YX5LK1KmKMvzkBOZoEV1SJvSZCs5djJmuLRJQQLo5cO8DpGlSS
	tW+9gpk++FV01WApsxq20PWN8bsTVnXFUvFBN3Cs2Or9yFvLAeUpqOJlttrMC56XvHWA9q4sxP0HE
	IvPOJn/P6eTmfar7h6CSaMhz76ey9wgqW10hwTujgOy8g/Q1Yxg5JP7EaIdmLpbCruD3a/qkQ757i
	a79quEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9l6-000000079xs-29Bg;
	Sat, 30 Aug 2025 00:47:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us29r-00000006Qqe-1Xv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBA29401F6;
	Fri, 29 Aug 2025 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8881DC4CEF0;
	Fri, 29 Aug 2025 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485658;
	bh=RQx3k9ICtqz81FINdTuayS6/7Dq2k0lIJ6C2JyMWlIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4xOVhIDRV5duZ1GpPtBu0+6fshz/3NrsQrkdmFaUSY8AOpusTD94aeN2gst44zpd
	 ZhwDpjky2b0/wq9sWQzJkeeVDbSFOsdHfp2C3Y4KVopYG3x5cI4191potu3DGLy7lP
	 Gm7LhA0RQWOborD5EVfMODfkVxs8N35QzduH/DmnookgDoTj+Dtob1Ml2b67igB4Dt
	 6BvhQX7LI5LLUnTdr1paCJMFi2ZdLFFJ2+d5RnXfqmK+KYVnZ8Xr1+ODKCPYkIGmtr
	 stuklWrxlbDep/kyZ4A9Gp5yavNZj6kje2Rr1BxFE9tub+RnlqqLQhw9oNa8vr1FVd
	 k33l4jW/UYRcg==
Date: Fri, 29 Aug 2025 11:40:57 -0500
From: Rob Herring <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <20250829164057.GA976361-robh@kernel.org>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-2-ce5e99d54c28@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_094059_448742_6B21B5CB 
X-CRM114-Status: GOOD (  28.66  )
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

On Wed, Aug 27, 2025 at 09:22:36PM +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          |  36 +++++++
>  MAINTAINERS                              |   1 +
>  3 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..08cc4f55f3a41ca8b3b428088f96240266fa42e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC Hardware Monitoring
> +
> +description:
> +  Apple's System Management Controller (SMC) exposes a vast array of
> +  hardware monitoring sensors, including temperature probes, current and
> +  voltage sense, power meters, and fan speeds. It also provides endpoints
> +  to manually control the speed of each fan individually. Each Apple
> +  Silicon device exposes a different set of endpoints via SMC keys. This
> +  is true even when two machines share an SoC. The CPU core temperature
> +  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
> +  Pro, for example.
> +
> +maintainers:
> +  - James Calligeros <jcalligeros99@gmail.com>
> +
> +definitions:

$defs

definitions was convention. $defs is in json-schema spec now.

> +  apple,key-id:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    pattern: "^[A-Za-z0-9]{4}$"
> +    description: The SMC FourCC key of the desired sensor.
> +      Must match the node's suffix.
> +
> +  label:
> +    description: Human-readable name for the sensor
> +
> +properties:
> +  compatible:
> +    const: apple,smc-hwmon
> +
> +patternProperties:
> +  "^current-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label

This should be something like this:

"^current-[A-Za-z0-9]{4}$":
  $ref: "#/$defs/sensor"
  unevaluatedProperties: false

With the $defs/sensor being:

$defs:
  sensor:
    type: object
    
    properties:
      apple,key-id:
        $ref: /schemas/types.yaml#/definitions/string
        pattern: "^[A-Za-z0-9]{4}$"
        description: 
          The SMC FourCC key of the desired sensor. Must match the 
          node's suffix.

      label:
        description: Human-readable name for the sensor

    required:
      - apple,key-id
      - label

Though in general, 'label' should never be required being just for human 
convenience.

> +
> +  "^fan-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false

And this one the same as above, but with the additional fan properties 
listed here.

> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      apple,fan-minimum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's minimum speed
> +
> +      apple,fan-maximum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's maximum speed
> +
> +      apple,fan-target:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable endpoint for setting desired fan speed
> +
> +      apple,fan-mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable key to enable/disable manual fan control
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +  "^power-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +  "^temperature-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +  "^voltage-[A-Za-z0-9]{4}$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      apple,key-id:
> +        $ref: "#/definitions/apple,key-id"
> +
> +      label:
> +        $ref: "#/definitions/label"
> +
> +    required:
> +      - apple,key-id
> +      - label
> +
> +additionalProperties: false

