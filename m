Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCAACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxIyUlKSKXJoG4rEldMW1ZZ6D8Yj3aLmd7MlIU2eDgc=; b=ZYfJxDjZdft+21bqz9b4CsNeQE
	GhllnFTTLvJ2Hroc7bsoYtQddmHrglavL3ot5j/mt7mET5FPMkGv2e9PS5JMeX+Ax5YC4UUYFkRMe
	H75NiALi9CHo+P11q/lImhE+1hv9BhgZqT4tW/V7qkaEiZoJt0BfmyUNlz0e5wzaqkg7u2sunStLd
	muEhastSb7aJ7HC8FBM2NXE29g3wH4xBjpSNJ/In4Y9a+2nrUnbh5g6cH0ewZW2xpZ10PCus5otam
	CAhuzO+llxVvoEPjE6cwbHIJrUdo1R8oZSZO9h4A1n/DU/jk2LbKrDErIQQpLekTFxGvb+jyM1xVM
	5HwzU3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFG7-0000000EYG7-3t2Y;
	Tue, 02 Sep 2025 00:52:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utArF-0000000DkOk-0yf1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53ADF600AC;
	Mon,  1 Sep 2025 20:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B48C4CEF0;
	Mon,  1 Sep 2025 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757428;
	bh=KC7znHm/JWj2lUNyyD/hNxr00ZjOsviTmeJPi/mJ7yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GLuG8zB+B/JpFd0k2fxHxl18Gg90ZA+2ntUJL9eFr5YjtbCq8wdWC0inzQ+8ca5KF
	 9ZI59H5/yUaNhjuFBLYkyk+vk4NrwIqUTUd6DTaUD0tE9gDbF7fzo01Pjtv39d/Dfh
	 cXHfwy4XloOyMWZ+DBRSLQZE5/eJLZkKMOsu7N5dHLk4WsUAxaqVHGtuX0V5IWhBVv
	 EDsdR2ZH8pAh2+jpIPipwhdZyNIc4lZYgscilkw/2vtY2erX5+oifY9SxBknzdDAl4
	 wxHNoKbbtfFSd3MIyoob3vP0JZbVBhPNVRVuBHtsCv7tgL6rMoBShtqBUgLcF+U8PB
	 FAahBotHFN7AQ==
Date: Mon, 1 Sep 2025 15:10:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Message-ID: <175675742654.261403.14863029084501002736.robh@kernel.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
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


On Sat, 30 Aug 2025 12:18:57 +0200, Krzysztof Kozlowski wrote:
> Properties should be always constrained in top-level part of the
> bindings, so move the samsung,cluster-index constrain from if: block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


