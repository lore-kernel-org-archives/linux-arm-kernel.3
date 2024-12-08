Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3A9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZ8VRmiKJwkt/GYZB70TA69WOCgOy6/6A6FCtWbmeu4=; b=aZNTX3OH0bIOFWc8i9t4Dm09c/
	QErxxLgnbHqSs7VV9p9Ta385Ouokfm1Db64tQLVo7eChkFItbKSyS5qrV+yos5hTVyk5L5VZ7qNnr
	fYswnvF7mB4jS+rUEGI0vsPSweJ60Cg1hbKIcexCmIFDdOdhKy8Gt/D7hDiqLh6UN/IOp6ScK3deO
	a8E0cvJ+l5Rv4EyYS4eDPx+qfiI2oIYvotxfXQBTPxNqcfTQhXPM1+ar5zIUOGlkiGHqSQToyA+1f
	l9g9BLiX5Tp0j0fA/zEKuYQCr0qFhygS8/Yj9yq8MYkAFWfEeibAvBImccndHNjHpdNAqNmcNnUSD
	s3x4PxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJlT-00000005WSq-05pR;
	Sun, 08 Dec 2024 16:04:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJkR-00000005WLp-0WVs;
	Sun, 08 Dec 2024 16:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VZ8VRmiKJwkt/GYZB70TA69WOCgOy6/6A6FCtWbmeu4=; b=btlmEvN7EvWs2yI3x1wGfGlvQk
	qNjp3GT9mYlIiZxcbrRufWO4s0XRmZRSM2zw+V+/0NGcA4ZJYh0ppcKvrXpEaXQ1Xl2Z/XX/2wocq
	OOQJU9f56/RQCF3DfYx8ckJIZ7qOEJpn/GTtd3ImEInmC0s2HwuNLkqf64T/pcbXR+hI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKJk8-00FZvL-Nc; Sun, 08 Dec 2024 17:02:48 +0100
Date: Sun, 8 Dec 2024 17:02:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v10 2/9] dt-bindings: net: Document support for
 Airoha AN8855 Switch Virtual MDIO
Message-ID: <656c4f9d-ff6b-4c98-84f4-d20b6e562c13@lunn.ch>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208002105.18074-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_080307_161303_FBC2CE11 
X-CRM114-Status: GOOD (  17.52  )
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

On Sun, Dec 08, 2024 at 01:20:37AM +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
> as AN8855 require special handling as the same address on the MDIO bus is
> shared for both Switch and PHY and special handling for the page
> configuration is needed to switch accessing to Switch address space
> or PHY.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/airoha,an8855-mdio.yaml      | 86 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> new file mode 100644
> index 000000000000..2211df3cc3b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 MDIO Passtrough
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855
> +  require special handling as the same address on the MDIO bus is
> +  shared for both Switch and PHY and special handling for the page
> +  configuration is needed to switch accessing to Switch address space
> +  or PHY.
> +
> +$ref: /schemas/net/mdio.yaml#
> +
> +properties:
> +  compatible:
> +    const: airoha,an8855-mdio
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mdio {
> +        compatible = "airoha,an8855-mdio";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        internal_phy1: phy@1 {
> +            reg = <1>;
> +
> +            nvmem-cells = <&shift_sel_port0_tx_a>,
> +                <&shift_sel_port0_tx_b>,
> +                <&shift_sel_port0_tx_c>,
> +                <&shift_sel_port0_tx_d>;
> +            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";


For this example nvmem is not relevant. Those are PHY properties, not
MDIO properties. So you could simplify this.

	Andrew

