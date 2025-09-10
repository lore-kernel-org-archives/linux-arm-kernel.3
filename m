Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25945CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWWwQYpODYicaY1+XUN4AHLfCQvSj3EP87vUB520U+0=; b=vsS9RznRa+KfQolkoOQ4MGTBa/
	6wSbsQf+Zc1Sm4yAFaa0+uKnBHdsEYL5ewFK55MjcjkRpoKCw+Wt/H/Kg9Y5PfmnN/CAP8lMSvJYE
	0Ih2XB1gE2erkEVJbg6tRtuA4PSKJKGz+C6cgldmBU6wTlmHDZiIPOxCHywdtKRUr4ZwYBHuf3fjH
	4UIkc+Zzv+RIXxQkofPglWIeSAcuiZeGxoPJT/uFkrZs2y1rKMidplmIxCmzGHZfVySiLEldUxs+R
	b5fjtV5E93b69aOIRKlNugOQJ4jL6KAwSIyTerF0r1M/7w8dUz6bDRojgEVkNUhFofwcNFP+l4bj9
	fDaL+Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9bO-0000000BOHi-3mbu;
	Wed, 10 Sep 2025 01:26:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9bM-0000000BOGn-2cft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 373E044108;
	Wed, 10 Sep 2025 01:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AF4C4CEF4;
	Wed, 10 Sep 2025 01:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757467584;
	bh=6H+vJE7E8FrtvtrJctIMl1VGEDdD9t6pgrkERpF0vq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUqnq8E+dk9tqpuR5mAgbwlKZ/mvSHNMFElLfT0SXYVGch4c4zmcRfDsRkmBirOUk
	 goBT8mIpBx3qGZ/Nn38NH2HFnTtwGMCS92bgXO0hNsBTMJuI0DHbjtzd7/WSdYeWfp
	 XsS/HGVN/TG63x5XGBKoY3TVc5uNnhNasFqnlIUGC7ruNP1buMwA6I5WkpuU7uF1RM
	 QNp8aaaA3MqpwfrcXCzlmP5YnpIH4+aAQC4jQSC6wB1aIninSeWDLpnjRv8K1lfPxx
	 BtXvaP1qNu0CIySiuijCRGk2iudWcAr4LKWjkfLdQrhA8kIPfFeMYz2mzW4Ve7GYY2
	 X9zRlIuRzIxcg==
Date: Tue, 9 Sep 2025 20:26:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: spi: Document sam9x7 QSPI
Message-ID: <175746758262.3564926.3476770597508307840.robh@kernel.org>
References: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
 <20250908-microchip-qspi-v2-1-8f3d69fdd5c9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-microchip-qspi-v2-1-8f3d69fdd5c9@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_182624_686201_86CBBCEF 
X-CRM114-Status: GOOD (  10.04  )
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


On Mon, 08 Sep 2025 09:44:16 +0530, Dharma Balasubiramani wrote:
> Document the sam9x7 quad spi that supports interface to serial memories
> operating in
> 
> - Single-bit SPI, Dual SPI, Quad SPI and Octal SPI
> - Single Data Rate or Double Data Rate modes
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


