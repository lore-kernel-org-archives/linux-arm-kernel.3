Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFDC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVhE/3bSP0nu8eOGdThr/A1vzlHjp7gQD4f53axd5xA=; b=EkTXk5NXPqb1MQK/2CN8qo60+g
	XMwWnE0IexPkGwr/f5l20Y3EyoESANh3wxOOc9ekN+Tj0ubQVJBdKqfz1fM95/LWWAdPO4ELcdOjf
	dZHS8354SeeqHFwnfNSFQob0hH/oHqVIHqIf+5gFFwjYrtj3Q0GMy03pdpV6Xv/EskbbDyjLM/Rqp
	p0/a7NpBMqsitF6FrP4VvoNv38R3Hw9Tq0so1bSyYFNTcPh4d1HnB6NNGGwE7NPl+KFarC2oakdmw
	Ie8PRZ1u9ZSWC1AAc9jNVoZkL1Z1B4jqRH2q0QwDUloMIuDEGQrdgXiu+1eaOwlznJzU3R8mQvnga
	+z/CSwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tea1V-0000000DnZ3-0gFx;
	Sun, 02 Feb 2025 13:28:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tea0B-0000000DnM3-000I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 13:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2B3C5C5F97;
	Sun,  2 Feb 2025 13:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24D3C4CED1;
	Sun,  2 Feb 2025 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738502824;
	bh=Ly0MQ/oiG1mhwVya1AbIGxMfk/tm0PN6xmf0WV5EHdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8fobs7rkc1Aec+I/MI6q9ErflShzJJGvYx1vQB3edX61C06Ix2Jcm6EP+KhdiJLt
	 3pFYd5xjDLdvA1tf4luHeNU7ybFcVxGTQHxVndXy/lTSbS0sjSUrx0qwusCMJaO+fE
	 8eYUK0RMl0Fur7ZGqzVVs7JS2ThBGCLpXyfc/RcBXNCTmN4bR8lyR9vd3V7Jcs7c28
	 vkwNoIEl2EY+kredgYRes7fgJDAHltr1ngWov4lUgN3b6n7K0JhL2ik5Yq54LWWunA
	 wNRpEqo7bDBODv0IQ5LZYv5Vk/S9abVUzxPQ49go1/bTLExE0/m/CBFA9sIooFlJPD
	 A2dpWxhwyfPjg==
Date: Sun, 2 Feb 2025 14:27:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stanislav Jakubek <stano.jakubek@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Message-ID: <20250202-mindful-seahorse-of-action-ba6ee7@krzk-bin>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_052707_132008_260D0124 
X-CRM114-Status: GOOD (  15.48  )
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

On Fri, Jan 31, 2025 at 07:13:49PM +0100, Artur Weber wrote:
> +$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM590xx Power Management IC
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm59056
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: Container node for regulators.
> +    $ref: ../regulator/brcm,bcm59056.yaml

Does this device have any other function? RTC? Charger? If not, maybe
just put everything in one binding in regulator dir.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: bcm59056@8 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "brcm,bcm59056";
> +            reg = <0x08>;
> +            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            regulators {
> +                rfldo_reg: rfldo {
> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <3300000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59056 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.
> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59056 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
> +#   vbus

patternProperties should define this. No need to repeat schema in
freeform text.

Best regards,
Krzysztof


