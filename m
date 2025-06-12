Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA2EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0hNxuJIbaqlKsT1U+1QricthMo8Tdb4B3Qk8HRm91U=; b=hXsOs8fWAjpycwKMyb3uNk6NGm
	SQNoXwEMWJAIrSREUTNzMKFPKyHDKMJM3pNtzAwbUGglpQtc8LQpy4zHWjk1eclnFzPfQ0B5Dm5oB
	xpEllcNIvTwx/MDJLthzWP4eF59kv8+fVSmWeQNYx/uRNdK78M4KAbE8TC/rz6912TnndV0he8hqv
	o7pmke7MKXpjO65/NhXIEIKFz32v6d+wm+u9FX/oQSLvb5yLt8P8sI0YgH6M5+5h/5ZnWKsECtCC/
	vfQCCz8arPt6qpGSs4VPlISgxZxz4qG0ExXsTzgmRCciOslOIf/aRRnLbrYuPOxmvyutiiw4v1Jr6
	euuXO5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcrw-0000000CXYh-0oYc;
	Thu, 12 Jun 2025 08:01:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcRe-0000000CSaA-0nde
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB57B5C13FA;
	Thu, 12 Jun 2025 07:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE00C4CEEA;
	Thu, 12 Jun 2025 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749713633;
	bh=EbHKzoPyQisbGeHdM80h8YEnwMflGlq+HV1pHMAF6V4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXGKpdpnT2hyJ+J7CIpd2//Fa60D0zBcaRMYr2eTGJLt0Nxu3ed/Zp7FWySnVvvu9
	 +bfopb8q134a/Sq10yvpF4nr7e9iGVIxpJYijDVhiPd/5qkxAU+7tGE4NNrvooQY26
	 ol5PgVzhsjhAkr6Bl1os57YFVEmYLy9+zmRP3PQq8Vlrj6PblqCD8r2g9REy/SpNJY
	 KwrN9CMvuyUdrY01iKho6DMlJ35c+Xc4ddPjSM7Wo8PonWtUmEJg9BMtc1ryownH2p
	 kSr5BUv2gJhXV/mz++pvahkc1u84ceOP5/3MspX+AGL+7UF41wbhaiWh1+hYOnCB81
	 FU4pnb3f67jvA==
Date: Thu, 12 Jun 2025 09:33:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, olivia@selenic.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: crypto: add sama7d65 in Atmel SHA
Message-ID: <20250612-translucent-space-mussel-054ce7@kuoka>
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
 <a62591306df47ba006470a00e6c25d9df419a4fb.1749666053.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a62591306df47ba006470a00e6c25d9df419a4fb.1749666053.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_003354_268647_5E100092 
X-CRM114-Status: GOOD (  11.32  )
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

On Wed, Jun 11, 2025 at 12:47:26PM GMT, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC Atmel SHA.
> 
> The SAMA7D65 similar to the SAM9x75 SoC supports SHA1/224/256/384/512
> and supports HMAC for the same hashes. They both also support automatic
> padding as well as double buffering.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


