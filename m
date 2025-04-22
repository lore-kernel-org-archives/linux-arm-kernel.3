Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E376C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1RYcAwK62pxzv0Z5KAfbRBynX7f46AF+reG3nOjEWY=; b=YzuiidfCVhNYdbN9MLE78omV7K
	a/IUKBcVOpQqsfWHUMUhpPE7QEjcRKqtppKZWOq73eWNyklcLS+w63mTZsEg/sJRQ5J40e88i1gXV
	2wYW3sWDBCBDOeLEu1wvynRTwxLBSiCliROaSFEWaVuPai+WORKggkB/MNIQHwq0q4iwNiQUWm0zI
	7y44SYwcETWnoPKMP9kp+ww1ufYZk/LHylofdc2HParbJmG8cm8OdFyn/LPjxpNL3Hy/ojbOKvIHz
	VUyLf328o7I0l8l0zSTrzzPbxJFDXr9BLOx4/F6Yfci/LiJT9dFT4L5ap3Fx4eZe4ioafxkmlz1tc
	dQj/6Svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G6E-00000007pLh-3w4t;
	Tue, 22 Apr 2025 16:03:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DnT-00000007KHh-27dB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F6435C5BD2;
	Tue, 22 Apr 2025 13:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884D6C4CEE9;
	Tue, 22 Apr 2025 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745328981;
	bh=cU7HPtncX36Rn1Avtb4Vg3B3sBjlxUdnwJZpkguYTjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUp5UMsLAzaQvc/wsa1G3HSZV/CrF8W22sd6vkQF2Ru08XDz7XLhkOTkrAVOUupgh
	 r5C52KdqMsvQa9Al++xGDanllpJnOdmARSdvwcet70BKiMYbDEaoybbzdSf4NHqqCO
	 qjp6oFuUj9A7ZP0KYN27oy7aWCslgI2jq/aIM0GY+hc/I1o6GPS/7ZeWfuc9kpV4Jr
	 CFS7j7v6XG3CGyJQZFXxiEPpJdnCAQqyu8YFh0k4lXD6VlSfioNg6uPY5N5GyCRBvQ
	 lTqrjGQyJ4stWzHT9Rh282RVB/Y5HxoeUUCHyq2bx6LQqiW7P3LgCdEyVR9nhFA0UD
	 FMVxfiyZGEjiw==
Date: Tue, 22 Apr 2025 08:36:19 -0500
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
Message-ID: <20250422133619.GA1095169-robh@kernel.org>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_063623_627224_E2E6BA58 
X-CRM114-Status: GOOD (  17.72  )
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

On Thu, Apr 17, 2025 at 10:14:49PM +0200, Sasha Finkelstein wrote:
> Add bindings for exposing SPMI registers as NVMEM cells
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d16b27128f97b5d38fb6ddb5109c70cda5e2ee15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic SPMI NVMEM

What makes this generic?

A generic driver is great, but "generic" or "simple" bindings are 
generally a mistake.

> +
> +description: Exports a series of SPMI registers as NVMEM cells
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,maverick-pmic
> +          - apple,sera-pmic
> +          - apple,stowe-pmic
> +      - const: spmi-nvmem

What happens when there's some other feature of the PMIC exposed that's 
not nvmem?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    pmic@f {
> +        compatible = "apple,maverick-pmic", "spmi-nvmem";
> +        reg = <0xf SPMI_USID>;
> +
> +        nvmem-layout {
> +            compatible = "fixed-layout";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            boot_stage: boot-stage@6001 {
> +                reg = <0x6001 0x1>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
>  F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
>  F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>  F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
> 
> -- 
> 2.49.0
> 

