Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B66C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJG30Xb143TOyiSzGmpUNwSwfd+MHOuNJ1Pp91/NnNs=; b=fRyuT51oOdGcbbrJQwgR6cZqUL
	571w92epdjWpzxLck83HTrLpFv5lmtPS6lBD8BeQQ22eTsTSl6PtyoK39LUjiceS+JvCHIJEl76gz
	SL68IcEnW96z0KvgO5OWaE22+76Pm9GGlOxD/uS+6xMwAtKaV7tVedhWbiVdojovTsxyH5ScGPbJP
	F9jCmmnWpJcUdT0+leHalLXoSP9l5zdi6PGP2vhuJuqvF98eI41YThpWlAaNZFl9hwYykNw19OjOr
	TQqzHsrh6oKyKgxwEKGWhEnkbmtZkcSi9bHOLmI5ZYA3jEjW42PC/d7+C31ZSSJUyxGCD4eSaDzar
	qV0JGFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7nd-0000000CixO-0sF5;
	Fri, 28 Feb 2025 21:21:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to7jv-0000000CiAK-1UMk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 302276127F;
	Fri, 28 Feb 2025 21:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4396EC4CEE2;
	Fri, 28 Feb 2025 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740777466;
	bh=IkOzcwzD6g/Xe/Qr+wg9oscXEq2A/Wh3cy8CHPJBqN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhiOd0lax+NjVz/abbtzMM1eU2nq1Oma4KGTGpNIQT6pq6zCLYH27hKVoJV3YgvMn
	 Zp/A8qRN74k5g6Ycebg//15KT6UaMnaQUrMjXq7SZg4gK5/5flt5Syfp7XPdGEb023
	 85F0CSvVnaiSGoEnnN5OO6K50WZQ5ViKICYsoVG1U8gcsPg5CPnLUFFKU+3bf93CL3
	 8GMlxFjvBX2UiZwmZgDJ6NmZFZWoTix849Wt1rhZR8gTbbPdY/0HloYHZQ7r2ZXlv7
	 LkIXxJlTIYyyNhv8qCSkKiXryR1OXiRbY5gBA6S0xjqwZWztavQhj057n1FyVCRxD7
	 Ic9yHC2CusVVw==
Date: Fri, 28 Feb 2025 15:17:44 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Parant <c.parant@phytec.fr>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	upstream@lists.phytec.de
Subject: Re: [PATCH 03/11] dt-bindings: arm: stm32: Rename STM32MP15x Phytec
 board and SoM
Message-ID: <20250228211744.GA3730587-robh@kernel.org>
References: <20250227154012.259566-1-c.parant@phytec.fr>
 <20250227154012.259566-4-c.parant@phytec.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227154012.259566-4-c.parant@phytec.fr>
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

On Thu, Feb 27, 2025 at 04:40:04PM +0100, Christophe Parant wrote:
> Modifications following new PHYTEC stm32mp15x SoM and board device tree
> naming.

Why?

It's an ABI, so you are stuck with the names. It's just a unique 
identifier, so it's really not important what the string is.

> 
> Signed-off-by: Christophe Parant <c.parant@phytec.fr>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index b6c56d4ce6b9..11b3f59ac550 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -169,10 +169,11 @@ properties:
>            - const: seeed,stm32mp157c-odyssey-som
>            - const: st,stm32mp157
>  
> -      - description: Phytec STM32MP1 SoM based Boards
> +      - description: Phytec STM32MP15x SoM based Boards
>          items:
> -          - const: phytec,phycore-stm32mp1-3
> -          - const: phytec,phycore-stm32mp157c-som
> +          - enum:
> +              - phytec,stm32mp157c-phyboard-sargas-rdk
> +          - const: phytec,stm32mp157c-phycore-som
>            - const: st,stm32mp157
>  
>        - description: ST STM32MP257 based Boards
> -- 
> 2.34.1
> 

