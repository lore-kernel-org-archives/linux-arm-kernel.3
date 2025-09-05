Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297FBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abhKN24lRsG0vt5E1k8vOtwF19qkTEeH7/I+6RqoKc8=; b=2t7/6pBtXqKjGR4n1r0frxnzJZ
	d6DyGqDj9llrZQzcBNDkr1TSPAKkqSWGIHDaPjAO6MBxDQSeaObPpEMeP1nip6Ej6lxYqNdX5HJLA
	PV7OqBIAoPcfWb9+N3Sp8gu8WLr1IyZmZ1zZj7FVaxhxZHWPRZFhYr92zgNzzhsydZQLFtfxojii3
	9xAGWrLVAsXBC6Ct1THL8kAM6C+CUuNyzqG7MM+/U1qI5yxJYPwrS0ubWf/wQdyGx9V9chs3+Ytsa
	ndOA2AQzqJT6hHQTqrayfvOguvRrdJDUOX4nPiFJ2yw6nRKbWSayL9h16c32ExIT+ivJejbDa/NBT
	tBhTiUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSUY-00000000dpJ-38lP;
	Fri, 05 Sep 2025 09:12:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRF8-000000009mw-3Lcr;
	Fri, 05 Sep 2025 07:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88E9540542;
	Fri,  5 Sep 2025 07:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED12C4CEF1;
	Fri,  5 Sep 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757058742;
	bh=Wf9m/dqTEtlJyt6WAhKzaW88Y/FSRjgusk/yxfNl3ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PokDf1fI8lHcYnnnNnkfnD9eoHOYMme+d8PieowgfYCm9lyo9OhHIWdNyJE/kG3iS
	 jBVU3qgdWWjJrfWp6A/rBLe/N7EtGRlFbCdnK/qWMgu/rRDnOY19eXHccJr3i5kzLF
	 lImkVOyL9X26QNefgqUwFufn2m0NDqi3keOdQJHQRKzJ3328h4c7lXSvSFpfPxNjX1
	 VFDJ4o0kaeVF6vk6ZD3voU2kPzrle/4E167LSxC4+gCH+xqIMKP3aOPkIc1XKkrwkH
	 5JaDBIpSE2dS23NmcHzh1b0Heyb/86/ljIE2DHlsab2SRsq0O75Lqt5aq80KPT0l6d
	 yZHerR9GLaj3Q==
Date: Fri, 5 Sep 2025 09:52:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aswath Govindraju <a-govindraju@ti.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/9] dt-bindings: phy: ti,tcan104x-can: Document NXP
 TJA105X/1048
Message-ID: <20250905-elite-enthusiastic-zebu-fec55c@kuoka>
References: <20250904-can-v5-0-23d8129b5e5d@nxp.com>
 <20250904-can-v5-1-23d8129b5e5d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-can-v5-1-23d8129b5e5d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_005222_872724_1CE7B2C5 
X-CRM114-Status: GOOD (  18.09  )
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

On Thu, Sep 04, 2025 at 04:36:44PM +0800, Peng Fan wrote:
> The TJA1048 is a dual high-speed CAN transceiver with sleep mode supported
> and no EN pin.
> 
> The TJA1051 is a high-speed CAN transceiver with slient mode supported,
> but only TJA1051T/E has EN pin. To make it simple, make enable-gpios as
> optional for TJA1051.
> 
> The TJA1057 is a high-speed CAN transceiver with slient mode supported
> and no EN pin.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml   | 69 +++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 4a8c3829d85d3c4a4963750d03567c1c345beb91..124493f360516eb203e8711cb96789258dd01119 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -22,16 +22,26 @@ properties:
>        - enum:
>            - ti,tcan1042
>            - ti,tcan1043
> +          - nxp,tja1048
> +          - nxp,tja1051
> +          - nxp,tja1057
>            - nxp,tjr1443
>  
>    '#phy-cells':
> -    const: 0
> +    enum: [0, 1]
>  
> -  standby-gpios:
> +  silent-gpios:
>      description:
> -      gpio node to toggle standby signal on transceiver
> +      gpio node to toggle silent signal on transceiver
>      maxItems: 1
>  
> +  standby-gpios:
> +    description:
> +      gpio node to toggle standby signal on transceiver. For two Items, item 1
> +      is for stbn1, item 2 is for stbn2.
> +    minItems: 1
> +    maxItems: 2
> +
>    enable-gpios:
>      description:
>        gpio node to toggle enable signal on transceiver
> @@ -53,6 +63,59 @@ required:
>    - compatible
>    - '#phy-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1048
> +    then:
> +      properties:
> +        '#phy-cells':
> +          const: 1
> +        enable-gpios: false
> +        silent-gpios: false
> +        standby-gpios:
> +          minItems: 2
> +    else:
> +      properties:
> +        '#phy-cells':
> +          const: 0
> +        standby-gpios:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - nxp,tja1051
> +            - nxp,tja1057
> +    then:
> +      properties:
> +        silent-gpios: true
> +    else:
> +      properties:
> +        silent-gpios: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1051

This is here and in if earlier. Just keep in only one place. Also
earlier else also touches standby-gpios, so you basically have it in
multiple places.

Just define if:then:, without any else:, for each variant.

> +    then:
> +      properties:
> +        standby-gpios: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,tja1057

This as well.

> +    then:
> +      properties:
> +        enable-gpios: false
> +        standby-gpios: false
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.37.1
> 

