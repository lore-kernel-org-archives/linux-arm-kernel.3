Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9897BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 23:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA6ax6CR2z9U1hfoBRrklKptAlG45BuhEqfIH3/rorY=; b=vgF1Jab3pM/Wl/SXxY/H5j5fPm
	aGoCevUEVr/KsFTrmeItEU6KYmABmUaDvpzRcFV1Al54HU7o+TJKMZJH/5J2h9WgYvWZHk/Rqo33f
	wIFSGE5vJ734o2kVtQMxeThx/ivTybUgRLOWpp+FWG+OEWewfJli6Kyrdr18WF9bDZt1J5taVTsq9
	h5feFFWal7IPP4yICtGsl61AcDRTzHQ7GRC7liJTASEYJ9YDxM/fKsWV/vNYU5HQtRfifrAZVg0by
	Qol3QYmXfhkSDeH+rUtJHq7Am2OTg6tHLzmXYV0Xs1q8tSFV2pcXFvzClVeHiLbviXW03SVd0/1Ls
	vY4bzhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrYR-0000000EEEm-2y24;
	Fri, 03 Jan 2025 23:58:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTrWf-0000000EE2u-0JHi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 23:56:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A419A1480;
	Fri,  3 Jan 2025 15:56:48 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 809163F59E;
	Fri,  3 Jan 2025 15:56:18 -0800 (PST)
Date: Fri, 3 Jan 2025 23:55:15 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: sunxi: Add NetCube Systems
 Kumquat board
Message-ID: <20250103235515.6b2540fb@minigeek.lan>
In-Reply-To: <20250103204523.3779-3-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-3-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_155621_183339_917D7D4B 
X-CRM114-Status: GOOD (  13.09  )
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

On Fri,  3 Jan 2025 20:45:18 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Same double Signed-off-by: here as is patch 1/4.

Also would be nice to have some prose here, maybe mention that it's for
industrial(?) embedded applications (as opposed to some hobbyist SBC).

Cheers,
Andre


> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 046536d02706..f536cdd2c1a6 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -589,6 +589,11 @@ properties:
>            - const: emlid,neutis-n5h3
>            - const: allwinner,sun8i-h3
>  
> +      - description: NetCube Systems Kumquat
> +        items:
> +          - const: netcube,kumquat
> +          - const: allwinner,sun8i-v3s
> +
>        - description: NextThing Co. CHIP
>          items:
>            - const: nextthing,chip


