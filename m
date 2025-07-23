Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A029BC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ/SCdTlJvaQ9yyGjpO4FEI2X7X9oI29c69X+enZ5B4=; b=rptW8NM74CuwB3Yra5p/Xi/LqL
	XtHaHIDP7YFNEdJRl/3BWmrIxJKupGoas1tjCvmenNnvTqbcKQ/Jh+41Tc+WxPUOBhPeJu6Ix4r+V
	MpL2db6BA+yAxiOGoV74OEwOhQQq7kkIffZsmJ1qwQK5NS7XuaRLtaZKZHq2/3Pl0VTydRPD43ASw
	jRirR0mPCVHR4sooMIi/NoFPmzQbOzKSlz2Uxbq9TWEWonuZMytmqmDpRJ8IbnsMvi4GUtRzwjGXy
	384d6Fe9tuyqR5xS6h1OXMVkzlZcZRnrMxVqlXt3aNpWPBeXHIbCU1WEbiU+kCdFc5L9rxrKP7Xsf
	SFLZ9ojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUqc-00000004NNV-3Dw3;
	Wed, 23 Jul 2025 08:29:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUXX-00000004Kvs-1jrh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC78FA4EDA2;
	Wed, 23 Jul 2025 08:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1794C4CEE7;
	Wed, 23 Jul 2025 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753258166;
	bh=Ps8lFEsqvSDPfqjyEHkRolWkzi8nZTybWl72cOLzPno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uix81rvMcekf6fNVD3Zug9kTiegXw5q8COm+Q2Hcyy4UeQhVdjCrP/hOaIgOClCAS
	 JhhJHqXEixVcXREM2p5F6zdM2gRTfk0LXN1r8Sw1s+mMjfDBrkLMYELPASET63nY70
	 lWYoTpPCOD8mT5GzvtBhYKDeixTqPMi+cefGUi70p32DPGXdSlxSI8JWc4/29Un0c/
	 C5TEWXY2Y729ClPk39JbJ+olD4TNKCCfOJ8epIaiik6Gazm8RpBXmvZAZwpjzxFjJI
	 EDqZ9qpxrZ19TIYHkpB0PqZs52ocKCQkLtNkTNDS3zcLhorm02SHKnyd0MqMpmHRYK
	 SeE8p1HNJntZw==
Date: Wed, 23 Jul 2025 10:09:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: serial: samsung: add
 samsung,exynos2200-uart compatible
Message-ID: <20250723-adventurous-chameleon-of-intensity-8d97bd@kuoka>
References: <20250722120859.443283-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722120859.443283-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_010927_517975_8E90D2BE 
X-CRM114-Status: GOOD (  11.70  )
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

On Tue, Jul 22, 2025 at 03:08:59PM +0300, Ivaylo Ivanov wrote:
> Add dedicated samsung,exynos2200-uart compatible to the dt-schema for
> representing uart of the exynos2200.
> 
> Like GS101, it has a required DT property samsung,uart-fifosize and
> exhibits the 32 bit register access limit, so reuse support for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


