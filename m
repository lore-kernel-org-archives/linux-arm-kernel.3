Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlCjvPHvodAEIO7Qq11OoW5pCSYMcES8bN9cdN5O/+Q=; b=Aos+KfiY+008zWjd+IEFaT+Dn/
	p5tnd/lQpYJL8ywwRtsUMY7ZgHXzsrItmzxMAxtMSTv/wP6YVuVd8iC6Nm74aWxTqaFcBjkMO7wxX
	s2RBTxBxLrcqQdqLE8+jsMcFt0WRapMikYgxjT2R/KCfs60jNXdopKqLNVFwH8HNEFmzZNoIvcUNs
	hwe9YoXHsINpSiava81OW3UcSqLZthGByX8/bBXYYNbrfKbX+ZCuOXbaiFAjAdMZEE7Be+YfI6Wer
	bKKYYMmCtzl8XN+d3Tl/nSqxvHMP4xskL0ack8SFXGoioLlvu4cxCVQYMbIoJ94Le2ZWBTKCCacKh
	f4DcEy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt09M-0000000DPXj-4Aeu;
	Fri, 14 Mar 2025 08:12:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt05J-0000000DObO-0oSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFAD15C5A5E;
	Fri, 14 Mar 2025 08:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAADC4CEEC;
	Fri, 14 Mar 2025 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741939680;
	bh=oYH/kGhK7YTdEQ7KFvtJxvjiQApYFDp63+DH/kdptis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6LlxMuwdTaK9kpaCnkV8YbN2DMfAYsdpkdvGy78D9YUpd7Zv548uPiQAn8/F/eEu
	 YuYLjJ0BRNvKvXTnL34pYJfvTZISlFknAcGLxnJExGUd9h5SlsS0PnvjG8ecJ0FAYC
	 kYftjoHqQR4QQ3rwPA1P4h8o3UtRiiQI3HmqhXaA/xHNhMF0nnFVwIx4L9FzOyGcm+
	 HHjmoki6ogkoVBc01Hi4REcuTMNbUf0J/RtIrlI4XslH2CMaK1eIDcX3k/h9tXD8fi
	 +GBJVJFU2YGUrbaPPui2HhGONh7gofaYkwZFVFGPhreNRu+p3qt0zrrEsXAy9bVAD2
	 FntX+BFI2Cggg==
Date: Fri, 14 Mar 2025 09:07:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Message-ID: <20250314-encouraging-fabulous-ant-e1f7b0@krzk-bin>
References: <20250313125746.2901904-1-florin.leotescu@oss.nxp.com>
 <20250313125746.2901904-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313125746.2901904-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_010801_277044_C84A971A 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 13, 2025 at 02:57:44PM +0200, florin.leotescu@oss.nxp.com wrote:
> +  '#size-cells':
> +    const: 0
> +
> +  '#pwm-cells':
> +    const: 2
> +
> +patternProperties:
> +  "^fan@[0-4]$":

Keep consistent quotes, either ' or "

> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          The fan number.
> +
> +    required:
> +      - reg
> +      - pwms
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        fan_controller: fan-controller@2f {
> +            compatible = "microchip,emc2305";
> +            reg = <0x2f>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #pwm-cells = <2>;
> +
> +            fan@0 {
> +                #cooling-cells = <2>;
> +                reg = <0x0>;

Please follow DTS coding style, so reg is here the first property.

> +                pwms = <&fan_controller 1 1>;

It's the same PWM for all fans? So isn't it basically one fan? How do
you exactly control them independently, if the same PWM channel is used?

> +            };
> +
> +            fan@1 {
> +                #cooling-cells = <2>;
> +                reg = <0x1>;
> +                pwms = <&fan_controller 1 1>;


Best regards,
Krzysztof


