Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA7CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhrGsI8Q4owrYCVA3v8GdIGj89rVr4bO8emUkVmZBcM=; b=dHJmyDac0d4e0BD3h5+2yffUlW
	icGKhIB0lDUiAL6cG6ao6kwb8jVWz55UCfZQdHoqQ6HPdnab4hpMHBJuiCvtuSf2DIBWIiB9muoCH
	GxPyughAINbrVxdksYzGdQrTgQe78lgpPQGG9mKVmzHSHcYdiDhNK7RSCHwC/xl3NWOrxwvQ3mw30
	g7P3XxfL+2zKVMNtak9WXROVEu07YDUgLH1C/PjB2OoBkD6oBNz/lRYJlGfRuXa6xIEtDifr7nPVh
	URFoaDZc+JjHXi5GPQFZnlX75wMtG70zTqxtPBylTD0ZvHq0vHoOBch37vQQdziWSgbncfESqMqLY
	ANV0TiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1z-0000000BksG-0cwx;
	Tue, 19 Aug 2025 22:42:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSk6-0000000BWD9-3U3p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 20:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 494DC5C5490;
	Tue, 19 Aug 2025 20:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C672DC4CEF1;
	Tue, 19 Aug 2025 20:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755634537;
	bh=nna83j1mZxwOy8dBPS8X0Nj5HOE+xKBlJdVfF3sqAq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwZFus6KTJbRfXuqSsC1c30b1t7uyfSYH6BAuk/1p2gIUKnpJkbBEljlZjFVOz7x9
	 HKiT6+Ii/b98fBlAZblp/aZXI+ha8XicMKdAPlqmoYZWcGjYE9qawxbdil4aCtlYuF
	 /Gd1/9Tlec8kQ9/GfOs+uSAvp5ECxeEoSyri4EMV3SkDsRo+PKEfpS50T243t0FCwu
	 tOk3+jx9XLZoENG0srqXT35rMgeCmRF0U7cBMnaSoeChBF7ygnKU7aQHlIFWKXPv/R
	 yHC6OgPBCrKQGc5kpwD4+pohBhLZlZHLz5/ucjSmeGTjEDMeQDHjZsb51McrNMr9XS
	 VufWGvxv5yWhw==
Date: Tue, 19 Aug 2025 15:15:37 -0500
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
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
Message-ID: <20250819201537.GA1223169-robh@kernel.org>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_131538_951816_5A18C42B 
X-CRM114-Status: GOOD (  36.72  )
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

On Tue, Aug 19, 2025 at 09:47:54PM +1000, James Calligeros wrote:
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

I'm confused because you say this, but then the .dtsi files are common.

> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 148 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          |  45 ++++++++
>  2 files changed, 193 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3ebc0463be4e1ce54005418feaa87ec7254dab6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> @@ -0,0 +1,148 @@
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
> +properties:
> +  compatible:
> +    const: apple,smc-hwmon
> +
> +  current:

I don't see any need to group these and I would remove the intermediate 
node. We have an iterator to iterate over a matching node name prefix if 
that was the reasoning.

> +    description: SMC current sense endpoints
> +    type: object
> +    additionalProperties: false

blank line

> +    patternProperties:
> +      "^current-[A-Za-z0-9]{4}":

Missing a '$' anchor on the end.

> +        type: object
> +        additionalProperties: false

blank line.

> +        required:
> +          - apple,key-id

'required' goes after 'properties'. blank lines in between.

> +        properties:
> +          apple,key-id:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            pattern: "^[A-Za-z0-9]{4}"
> +            description: The SMC FourCC key of the desired current sensor.
> +              Should match the node's suffix, but doesn't have to.

blank line

> +          label:
> +            $ref: /schemas/types.yaml#/definitions/string

Already has a type, don't need to re-define it.

> +            description: Human-readable name for the sensor

Instead of duplicating these properties, You can do it once under a 
'$defs' key and then reference it here.

> +
> +  fan:
> +    description: SMC fan control endpoints. A fan is made up of five
> +      SMC keys - the fan's current speed, its minimum speed, its maximum
> +      speed, a writeable target speed, and a writeable mode. The SMC will
> +      automatically manage system fans unless a 1 is written to the fan's
> +      mode key.
> +    type: object
> +    additionalProperties: false

blank line. And so on...

> +    patternProperties:
> +      "^fan-[A-Za-z0-9]{4}":
> +        type: object
> +        additionalProperties: false
> +        required:
> +          - apple,key-id
> +        properties:
> +          apple,key-id:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            pattern: "^[A-Za-z0-9]{4}"
> +            description: The SMC FourCC key of the desired fan. This is the
> +              main key, which reports the fan's current speed. Sould match

typo

> +              the node's suffix, but doesn't have to.

Why can't we require that they match? (Other than we can't express that 
in schema?)

> +          apple,fan-minimum:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            pattern: "^[A-Za-z0-9]{4}"
> +            description: The minimum speed the current fan can run at

This is not the speed, but the identifier key to retrieve the min speed, 
right? That's not clear. It's a bit odd that everything is a key id, but 
one property has that in the name and the others don't. I don't have any 
better suggestion though...

> +          apple,fan-maximum:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            pattern: "^[A-Za-z0-9]{4}"
> +            description: The maximum speed the current fan can run at
> +          apple,fan-target:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            pattern: "^[A-Za-z0-9]{4}"
> +            description: Writeable endpoint for setting desired fan speed
> +          apple,fan-mode:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            pattern: "^[A-Za-z0-9]{4}"
> +            description: Writeable endpoint to enable/disable manual fan
> +              control
> +          label:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description: Human-readable name for the sensor

Surely more than apple,key-id is required? How would it be useful with 
only that? You can know how many fans you have, but have no info or 
control over them?

Rob

