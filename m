Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914CB606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zo/ZhdHD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bAZgREak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ibet2l01uL0sQicQdCocbPY75uZsHOIF+psw9/xynio=; b=Zo/ZhdHDDe8UvGwGT4kD1p5NG6
	EJx00LvkWbHAIip9FzaWbzJO1d5sZbSK4bC6sGXv5Qi6QqzvUqw+NJ6DJLWZIwToxfietl6Kv+W9+
	h+6cfjvpbZmlVEURFtV4IcgI1QVw8F8eR1NHoTbvhVqC9fYxsJOpxqDQWOlK1fwW6oPn6u3TxkySR
	To60YYwSM2UmYs0aNLNlmoQAbiqaNQpeMYXdhhlf72LtWokxs7Wk14PMsNs9qYLcbdZEzja8+e2dh
	9FQLWl1/rasLZPWa7E/2Mp1mdjXTGplMV7g6SAzxuJGA34ykejVigkWzEn8+DptweIpJ2GhD0hYAF
	JDRy35pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2hv-00000006x0p-0NOV;
	Wed, 28 Oct 2026 12:24:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2ht-00000006x0b-2kyN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 12:24:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00A224161E;
	Wed, 28 Oct 2026 12:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1542D1F01825;
	Wed, 28 Oct 2026 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190280;
	bh=Ibet2l01uL0sQicQdCocbPY75uZsHOIF+psw9/xynio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bAZgREakVNGDMGcWK3OmAo3sl1hOc83HbRKPh43NKg9qSIyiV4YxIrtEQGMuFbOBO
	 8M2zB/rURAySlyxcZm83t9OKx7skQD+7TUP5oF6jge6Fv1/J3rKCmLsrOwTBuuJ0eZ
	 snab6WFgeImiOR6PlhXM4oT7xitIkpI9B6Xal0zodVzKxuWUsU6UMEMkyQY11t5Wyt
	 rj7B+JdG2nuDkQIhFQO51D/M9uoTg3x7p+33iRhT5YEEex7nb63mGvS2RLMn1fhhQo
	 XZxjcZyuJwgwwDGWMqnGaU43bZwQic+jeV3XdmUIsMDBPAHBRy3HBq8iePO3WNEfTJ
	 4XpkKliuUUK1A==
Date: Wed, 28 Oct 2026 13:24:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moteen Shah <m-shah@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, nm@ti.com, 
	ssantosh@kernel.org, u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com, 
	afd@ti.com, a-limaye@ti.com, y-abhilashchandra@ti.com, johan@kernel.org, 
	kees@kernel.org, jm@ti.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf binding
Message-ID: <20261028-inventive-screeching-bettong-9f4240@quoll>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-2-m-shah@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027083700.1964371-2-m-shah@ti.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 02:06:58PM +0530, Moteen Shah wrote:
> TDA54's MCU domain exposes a shared scm_conf syscon region that other
> peripherals, including chipid, access into rather than owning a
> dedicated register window. Rather than a bare fallback entry in the
> generic syscon compatible list, give it a dedicated binding
> describing the region and the proxy/claim/lock arbitration scheme
> that gates write access to a subset of its registers.
> 

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> Some of the claimable registers are gate clock controls, so also
> document the required "#clock-cells" property that lets the node be
> referenced directly as a clock provider for those gates. The clock
> specifier selects the ePWM time-base gate by instance number.
> 
> Co-developed-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>  .../soc/ti/ti,tda54-mcu-scm-conf.yaml         | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> new file mode 100644
> index 0000000000000..111cbb739b5f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/ti/ti,tda54-mcu-scm-conf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TDA54 SoC MCU Domain System Control Module Configuration registers
> +
> +maintainers:
> +  - Aniket Limaye <a-limaye@ti.com>
> +  - Moteen Shah <m-shah@ti.com>
> +
> +description: |
> +  The TDA54 SoC's MCU domain exposes a System Control Module configuration
> +  register region (scm_conf) containing miscellaneous control and status
> +  registers for MCU domain peripherals, including the JTAGID/device
> +  identification registers, boot configuration and status registers, and
> +  device feature registers.
> +
> +  A subset of these registers is write-protected by a proxy/claim scheme:
> +  each register is mirrored across 8 proxy regions, and a host must unlock
> +  via LOCK_KICK. Any proxy other than proxy-0 must also claim a register
> +  through its CLAIM register before writing through that proxy. Proxy-0 is
> +  the default access proxy: its claim bits are tied low, so it needs no
> +  claim and can write any register that is not claimed by another proxy.
> +  For example: Proxy0's CLAIM0 register sits at offset 0x3100, while the
> +  same register mirrored at ProxyN sits at N * 0x4000 + 0x3100.
> +
> +  Each of the 8 proxy regions also has its own fault status and
> +  interrupt registers, but a fault can only be handled through proxy-0.
> +  Hence, interrupt/fault handling is not described by this binding.
> +
> +  Some of the claimable registers are gate clock controls (e.g. the
> +  ehrpwm_tbclk gates). This node is the clock provider for those gates;
> +  writes to them are still routed through the proxy claim scheme described
> +  above.
> +
> +properties:
> +  compatible:
> +    const: ti,tda54-mcu-scm-conf
> +
> +  reg:
> +    maxItems: 1
> +
> +  ti,proxy-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Proxy region (0-7) through which this node's clients access
> +      claimable registers and their fault status registers.

I don't get the need of this property. You have a one, specific device, so
why the proxy id would vary per board?

It also looks like re-implementing access controllers.

Best regards,
Krzysztof


