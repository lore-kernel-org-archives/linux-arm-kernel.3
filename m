Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79215C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t9VxqweThY4xUvWj8Dg8repSHk1CzBnP19Q/qEQ7rE=; b=wRBA+DlFKCYfFWT143iTyyBWCS
	kdoN6vVs5iZAJa8VbEVVsX1IZq2bQHqRBAbn9tYhaVZJTSi6AXsbrIO6N4LjbA7d0+G/Xne54ChGS
	2ihXcBLK85K8GUU+TtaE6MfESClN4MvhKRjh9S8lWkEq/NmFcwwYty1qah0UqkZ6BQLJMiFiuSthL
	vEWGmBJHEgIlcrptrMMd3cW5oG1ZNW2TZlfEnM93URAqYb78E8HzUfdZvq6Z4VBPHKsMe/gKx0x67
	LUwYtOjSYpuTCHiypU9/RhGMnJUwjzjXZMXrJv6MWgxnmW30FVhtvZ9LdEeWBXUD1ZhvzAW4wWmyd
	cNakXb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcu1-0000000CXtW-44Vx;
	Thu, 12 Jun 2025 08:03:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcSC-0000000CSfe-3GT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3284662A05;
	Thu, 12 Jun 2025 07:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA23C4CEEA;
	Thu, 12 Jun 2025 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749713667;
	bh=5tUhyhCzLi7X2fjwezCeRgGy4c5FGMVY8jjpVGZDy1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMRKpDL9xlzOV+NXaRbfM3FimpTlF3nmvGTw5+Z+CTvbgLuTlVkMAHQfigpZn3Op6
	 +US/3edDLTIpz8dKqMS88V/Bjota/q8RgKOhNR/etsOU0I/v2jUvKr4YpUSJZtSWxm
	 bSqK2552dfvydKPmGDc8o1YcSA8PuH9zJiz/vp9MyJlVsDA2qfwgbHPXbwxj5eOER5
	 BqqGlMmvPAAzv+3JvQTzrZ08dSOHAEyUWGWWk8kgPngHinTpowY1HUZ7kk1NYJESlY
	 FW4aIBGSBtar4Y6/KQr0uVX04HpTIxyMDaT6pCCHgFi5dDImqtfK/3bLulV1JH0XPU
	 +pcRO7H7ikPRg==
Date: Thu, 12 Jun 2025 09:34:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, olivia@selenic.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: crypto: add sama7d65 in Atmel TDES
Message-ID: <20250612-vigilant-chestnut-mamba-400bb2@kuoka>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
 <1fa63c0ff667c61c924f1571d9c2f03cd1fcf7b2.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1fa63c0ff667c61c924f1571d9c2f03cd1fcf7b2.1749666053.git.Ryan.Wanner@microchip.com>
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

On Wed, Jun 11, 2025 at 12:47:27PM GMT, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC Atmel TDES.
> 
> The SAMA7D65 SoC has the same capability as the SAM9x75 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml    | 4 +++-

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


