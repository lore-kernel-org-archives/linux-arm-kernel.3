Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C68CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgJz5TnrCtR748fFNh6XNd3fIrw3D/z7MN7Ewu/uh84=; b=kDw0tEMN1vmiNpha6m3PUGjhVt
	QoclMPeVCOx2PXZw2gIl5hD+JrEgIjj4gqdNjiaGNEGlx9X1dpeWp8zoGH14/qDdbzXZlYEbdbzbm
	wVuI10x9T+3PMXB6qB5G4hX/xXU2QADbu40BiE6zDoU1xpRMqxZiBNyVdok5eozf2Hvsk78EYAefM
	KfMeRP58NaUe6SGyP1L7fkin8CvFGELt/VG9SHAom2baQHm+iawlZCe6b4TxG9799kYAXqEHGndkm
	0fOX940GoRGlSO+qahsfX4NBvNfAfubxY1vrgRU8WEKkNf06oZNthxW1fMdBmGf5j4ckAChVvL+CZ
	nf7P6srA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvk3A-0000000GNfP-1Z5B;
	Fri, 21 Mar 2025 21:37:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvk1U-0000000GNTe-33bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 21:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B33A61144;
	Fri, 21 Mar 2025 21:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76820C4CEE3;
	Fri, 21 Mar 2025 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742592923;
	bh=99MMakXTIkezKY2wg7hUxSRWmsbUh/X4l9UQUYmUuS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNUtJeZuriHtWQ9t2GLqbjr0xJOJG2+mrVK386fmuLXewV19OtcT8OtsctdN8owKu
	 hIRO7rcym5RA6gYhwegr0cF9s8z+ImYBbd04nApIb5ChUaWBBP1iB6L9GK0g0rxipy
	 flfS0wnWGHiYxt5nZwBcAVBmMzDaPhUirL2LHGa2l8gVvBzxgQYuY1fYA+GU//Ehuf
	 jNEWUNAbLKd7dDT9CjTDpoQfeBkuKEatBplFRqwvXAeOr9auS9TNsnNIPSQYs8HP5i
	 dJAUwERdELEyIZZpTa2h5PCGR5EbFTyfsAFZFEvlfOtqAM71FqbFD5GGGM3OjVjid5
	 sl73VySMGqbuw==
Date: Fri, 21 Mar 2025 16:35:22 -0500
From: Rob Herring <robh@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Message-ID: <20250321213522.GA4149883-robh@kernel.org>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-2-florin.leotescu@oss.nxp.com>
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

On Fri, Mar 21, 2025 at 04:33:06PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce yaml schema for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/hwmon/microchip,emc2305.yaml     | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> new file mode 100644
> index 000000000000..79081c116274
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
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

Fix wrapping to wrap at 80.

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
> +patternProperties:
> +  '^fan@[0-4]$':
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        description:
> +          The fan number used to determine the associated PWM channel.

           maxItems: 1

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

