Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C02C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjO5wmNIYB3MiKXLW/cWSzETJHslleHLk6YFq6SY8w0=; b=h7I0qDUylpVvcs+F6XjWG2q7uT
	vDDvoonuK6bNSErs9q/uYtmdvQX4AmyYGc7QL8Z0EnYR5PTaFCmfFsgHKbMyyXcmhqW3EDK7ddBVi
	Z3Po79UFdcEf0xmwB9Z2P19kU4/eYy7j0L9vUfZLaH7+xOQidB/gYfnAAYuLvYcM68ocn98e8DSfR
	c5cMmb1ArJG+XI5J+sqdSqPQ62CD/VF2RjWNr+GJLCaSr3Nku2abYnRiR+qFImSqjuyAbIylSOJOC
	vrzaQfVbzcCSw5w/gVxovUz0y996m3qL8Awl5o3v7yi/hvPGUJWh73Ys+ELpYVqhmAmueXN324gJS
	uEr9CxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnia-0000000A1In-0piH;
	Tue, 27 May 2025 06:23:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJngS-0000000A119-2H8V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:21:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93EC261135;
	Tue, 27 May 2025 06:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF551C4CEEA;
	Tue, 27 May 2025 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748326867;
	bh=z62MIO2YE57jNih9u88PmAjAzV6PvjH+SCz4KoKZxVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4iBIAnbNg7XXb9oX4eAc93qYgmFMoNXrw3Np3x4BjzH48GyZ/ycs1kkXNTnChGfa
	 4BwmJd3s2TCHg8eyg6S38gac3MplcoyEpY8ZerDfS0hH5ERjSYr5f3t3QXd1tFCogP
	 0jODfA8F5RZsE9RS57DEzjFAF16yntUEXR5PigEUWkBMrOh5O+AY3Gpmk2Mtt2+2Kq
	 QqprwjCgVG0ylDMKgxrpO+iib7VUTqGWik0XxNJSzfo79xTMxGVYyZGwDa+ex+vLgA
	 VJkOIJRKUFrTIUFSEdzsNbX/EWJkuwYVUcmzA6WMkbAGTKImxzI5nxYtk8dz9oo8NW
	 X0MZBH933OwHQ==
Date: Tue, 27 May 2025 08:21:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1
 nvmem phy selection
Message-ID: <20250527-loutish-shaggy-starling-f558fb@kuoka>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526182939.2593553-3-james.hilliard1@gmail.com>
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

On Mon, May 26, 2025 at 12:29:36PM GMT, James Hilliard wrote:
> The Allwinner H616 EMAC1 can be connected to an on-die AC200 or AC300
> PHY depending upon the silicon variant.
> 
> Add a new allwinner,sun50i-h616-emac1 compatible and example, support
> for the allwinner,sun50i-h616-emac1 will be added later on.
> 
> Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
> based phy selection.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../net/allwinner,sun8i-a83t-emac.yaml        | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> index 7fe0352dff0f..b6bf1718dba1 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -18,6 +18,7 @@ properties:
>        - const: allwinner,sun8i-r40-gmac
>        - const: allwinner,sun8i-v3s-emac
>        - const: allwinner,sun50i-a64-emac
> +      - const: allwinner,sun50i-h616-emac1
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-emac
> @@ -28,6 +29,14 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  nvmem-cells:
> +    maxItems: 1
> +    description: NVMEM cell with the ac300 efuse.
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: ac300
> +
>    interrupts:
>      maxItems: 1
>  
> @@ -321,4 +330,37 @@ examples:
>          };
>      };
>  
> +  - |
> +    ethernet@5030000 {
> +        compatible = "allwinner,sun50i-h616-emac1";
> +        reg = <0x05030000 0x10000>;

No need for new example for every soc.

But if you ever decide to add new example, it must work. Please test
your patches prior to sending them.

Best regards,
Krzysztof


