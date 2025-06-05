Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D4C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Skwge1vYRV57RB5TaJnfZdYNFhS+U37omdushNDEf7k=; b=2w9u4nZ8VOzwoo6X/FLSySaV2a
	CVtRiSazlViQ4F/NMZeyj5SjgasvuKu5xtSDVvM9swlA15QxpSgekON3X1+zF2dDdy6PZjxMeaKUN
	38kL/SL6rduy5ek5tqxSn75bmbJ5ZxmD1VKjf+WbOMZV8ycByGdNRUlj1ps1U5UK5m8JqXN6Ozt8w
	LsJJSmZI9+idfNSCNmgqjehCcWJlBRSvYjkBfcdHCQJzf5BEuA3p2Axjoka1oEFGC9+QoBajqZoWN
	gWkYPqTLjjZsOgqvyvmVm9HnSGdIfH4R4WSGU9e/qCimfgMTqE28Hr1EKlLuVw503A80N1sfjji8W
	iKcc3jWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBLY-0000000Fk8F-3Urj;
	Thu, 05 Jun 2025 14:13:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAzs-0000000Fhfe-0goD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99B5C5C66E3;
	Thu,  5 Jun 2025 13:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE6EC4CEE7;
	Thu,  5 Jun 2025 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749131467;
	bh=CUuDv5BSBC048vwcKZzVjZ0CdBHLj4lB/45Mq40wZ9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spmW2oJYhmHVT6vzAJCUPszJlMtNr3RDNNOowltKcsHqmeZKjNhKkYyzJ5s21VFFz
	 uDsXKDJiw+gb8D3iHTdH312J70c4XKw329BUljiMDcEml+8P6xSp2/u0EDhBvCO0YD
	 bBesROG/7UCwVinKib+h4/dbJ2LaMELnZBtpOVy6ksw+n9/nRM0WtNKj68+lX0cHdw
	 g2dRbvyNtlKcH3IXDToknqmkMTGXc9t97E2T08b4kz1OYv+aHeYZ3yarjkhfzon4JD
	 e58ldComiU278MN2luD2aiLyFaTdJf1yGVgI3u003wK7AuMU1goATRHqCXYj4vW47+
	 DvsOPzCO+NxLQ==
Date: Thu, 5 Jun 2025 08:51:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simon Horman <horms@kernel.org>, davem@davemloft.net,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	netdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next v12 1/7] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <174913146314.2458620.483188376722386147.robh@kernel.org>
References: <20250522075455.1723560-1-lukma@denx.de>
 <20250522075455.1723560-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522075455.1723560-2-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_065108_292118_C605ADCF 
X-CRM114-Status: GOOD (  16.46  )
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


On Thu, 22 May 2025 09:54:49 +0200, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> 
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>   (nxp,imx287-mtip-switch)
> 
> Changes for v3:
> - Remove '-' from const:'nxp,imx287-mtip-switch'
> - Use '^port@[12]+$' for port patternProperties
> - Drop status = "okay";
> - Provide proper indentation for 'example' binding (replace 8
>   spaces with 4 spaces)
> - Remove smsc,disable-energy-detect; property
> - Remove interrupt-parent and interrupts properties as not required
> - Remove #address-cells and #size-cells from required properties check
> - remove description from reg:
> - Add $ref: ethernet-switch.yaml#
> 
> Changes for v4:
> - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove already
>   referenced properties
> - Rename file to nxp,imx28-mtip-switch.yaml
> 
> Changes for v5:
> - Provide proper description for 'ethernet-port' node
> 
> Changes for v6:
> - Proper usage of
>   $ref: ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties
>   when specifying the 'ethernet-ports' property
> - Add description and check for interrupt-names property
> 
> Changes for v7:
> - Change switch interrupt name from 'mtipl2sw' to 'enet_switch'
> 
> Changes for v8:
> - None
> 
> Changes for v9:
> - Add GPIO_ACTIVE_LOW to reset-gpios mdio phandle
> 
> Changes for v10:
> - None
> 
> Changes for v11:
> - None
> 
> Changes for v12:
> - Remove 'label' from required properties
> - Move the reference to $ref: ethernet-switch.yaml#/$defs/ethernet-ports
>   the proper place (under 'allOf:')
> ---
>  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


