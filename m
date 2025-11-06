Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A095CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhHvTNreRheNZnwkv+jEyS0ZIZrro/GQVLO5u3qCIyA=; b=HBKtreusZaCnTppq2qODsIzvx/
	ZiZ57+N9NyQXOm1Q9z9Elf8QR6hpcwJx3zSuzsUs2rzDP8g2TeBB6EYjdpdzWBIdOEDSt+lvTzrlw
	NF/yMKr6C55EH1FR0XSIyuwZkSKbqIsyimqszDOhfBQaGcgoSm59SUKLHmd4Qh5LWTcmLZaM3HKV+
	zjWtsTk0PXUW5a2GyrKCIFcK/jBvpf8pLY4yUD/V7Af9Q5NEICKHlV0iM9DbDH9rX6Sp8EJeFmzV4
	c2RRVO0K4CIGq4se2sqHUNxwiPbVHLofGe4t2qtS62W4K7gHx0v5j3cnLHDy0pN6yFNJm8mNgBpjs
	xjwPa15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4Z9-0000000G5QO-2LGD;
	Thu, 06 Nov 2025 18:18:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4Z6-0000000G5Pk-0YI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 18:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vhHvTNreRheNZnwkv+jEyS0ZIZrro/GQVLO5u3qCIyA=; b=N4PJSDn9Y+nGaK5rdqlVuMzsHx
	4+Gc6CED93EJtPPFcXUmokKkE5BRTQuANAJ9oUuVqfXDS+mODt2Wkr/DVeqaIJr3qHiZuTFnSBN3U
	xeZlGKKOa9DI3e4sgzYk9XC3wuKuM4s2KLed1Lnpn+VssMwW7M960FFXI2b7PwtYc2+Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH4Yr-00D982-3s; Thu, 06 Nov 2025 19:18:17 +0100
Date: Thu, 6 Nov 2025 19:18:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <e2cc2645-9eb4-485b-9c18-650a1ba70e62@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-2-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-2-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_101832_168177_DD07DD94 
X-CRM114-Status: GOOD (  20.15  )
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

On Tue, Nov 04, 2025 at 02:33:11PM -0600, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> Each subnode within "rpmsg" represents an individual RPMSG channel. The
> name of each subnode corresponds to the channel name as defined by the
> remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..897a16c4f7db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,92 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Present a group of RPMSG channel devices.
> +
> +    properties:
> +      rpmsg-io-channel:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "gpio@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-gpio

The compatible should be generic. Or at least, you need a generic
fallback, since the one driver should be able to handle all
implementation.

> +
> +              reg:
> +                maxItems: 1
> +
> +              "#gpio-cells":
> +                const: 2
> +
> +              gpio-controller: true
> +
> +              interrupt-controller: true
> +
> +              "#interrupt-cells":
> +                const: 2
> +
> +            required:
> +              - compatible
> +              - reg
> +              - "#gpio-cells"
> +              - "#interrupt-cells"
> +
> +            allOf:
> +              - $ref: /schemas/gpio/gpio.yaml#
> +              - $ref: /schemas/interrupt-controller.yaml#

The gpio part should really be pulled out into a separate .yaml file,
because it should be identical for all implementation. You just need
to reference it here.

	Andrew

