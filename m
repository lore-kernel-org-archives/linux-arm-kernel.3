Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE963C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=De7/+NUHWvAamSblD6DcQZaxU2QQKJ/kVmV+HUl0wc0=; b=PNSebLe3/96DRCp1Ekv3FrH1WN
	svujkl52f3KykbK1gCgk/R70rzKFk9Pur657C/loKFn22RVAIKJhmd8d6UjD/PvQdP2VPqAvpbnLx
	o4GqrXjbzclaQka3y8+VFyloIsyrVewbQRtNZLtvVfoSfdnnn693vdTH+CFTQPxsGmWTtlvo1GhdQ
	t7YqEzuNYm8/bY3ZiG3EB1c1550+nfDXuCKb662rrXkRKhHQIzBwYasdFT9aUBDHrM2woAFr3xaO2
	VOnbF1PSyduuQPbhAZri9VVyBAhO6YoQJWCUP81PYY0QzvI+vBJpC1HMmsYurM2w4jn8lSgTpT/x1
	eiXfFWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuosm-00000008Mdp-3RmO;
	Wed, 19 Mar 2025 08:34:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuopv-00000008M6c-2j5I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 08:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66E49A48B20;
	Wed, 19 Mar 2025 08:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0838AC4CEE9;
	Wed, 19 Mar 2025 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742373098;
	bh=aVPdxdnrKkfTw922ZCVfACXM/nXhIdDwBNRV6ecWg+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hb99jytf9vGVahGnJVnE4WW8B1NpKg8JgxpCnBqvF2z+z1evdvc1JH2wpIdZb/nKO
	 2qcTicUtKTCRkLGGIozc7OvFqJS+vtu8hQnFv13ZWAGW41eEVcUIEvVc2nQm7glaph
	 H9UbGSlpcv6aIOAw6p/Z6igCfZ5ocY5X5/ubDCS6PANySfsy7oc3TFWdowRXjMlXWE
	 6XhEFJC9HcnuOgLjZk3gsXIWSE2rWc1zTg+e/GoQe3KNjzjtkkcvnpp2f2rTohb3mO
	 c4o6HTh3IL+zGDLn4IWWlVnmWAF+HOheQx3E7ud+Is9v892joDk1BITLCJoZpFfSi6
	 uh250zswv821g==
Date: Wed, 19 Mar 2025 09:31:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Message-ID: <20250319-optimistic-positive-peacock-cc26b1@krzk-bin>
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318085444.3459380-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_013139_838435_A8BFECE6 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, Mar 18, 2025 at 10:54:42AM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce yaml schema for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml     | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..e61ef97e63af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

No blank line here. Use existing code as template. If you find such
code, share so we can fix it.

> +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC2305 SMBus compliant PWM fan controller
> +
> +maintainers:
> +  - Michael Shych <michaelsh@nvidia.com>
> +
> +description:
> +  Microchip EMC2301/2/3/5 pwm controller which supports
> +  up to five programmable fan control circuits.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - microchip,emc2305
> +      - items:
> +          - enum:
> +              - microchip,emc2303
> +              - microchip,emc2302
> +              - microchip,emc2301
> +          - const: microchip,emc2305
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#pwm-cells':
> +    const: 3
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - cell 0: The PWM frequency
> +      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
> +      - cell 2: The PWM output config:
> +           - 0 (Open-Drain)
> +           - 1 (Push-Pull)
> +
> +

Just one blank line

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


