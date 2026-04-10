Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64E8F364DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Es0EDVrbynRdDh6kMz/Grwan9hV+rYGxPF4BfhKRglM=; b=LALyrUYXt9XlTUBe9yDd4GV2Ws
	DpF1JQf42mVeew56NyhBxPxTCgSG3XKTIbKWMJ+5UcHmGEqruQ1CnvDJJtuHRAr/Z9mEHVC6B5ld1
	S2Ba09yIfyZ2LWi55wjCDG/fledjfCn4RPkCH2QpL9rTXuDqPFvrIdoIWvT+RPeoBXfp+qqqCxQv7
	fkomvETr+YD8jdKhJAj3XMYgjqyWWWbAJLLpp/vLyEXmF2EErM+Qu5mTLP5WIZY3D8pzkULqRuOry
	RnSpS1ys7yg8IRQPtUWesqJmvUO2Rr9VHML6qHeQ1mdt1M8T0Fo3UZdCtvMufeGDQNk3lPDbRc8ma
	UjrIdBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9X7-0000000C2qM-2tp0;
	Fri, 10 Apr 2026 10:56:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9X6-0000000C2qB-1J8K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E60560154;
	Fri, 10 Apr 2026 10:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848A5C19421;
	Fri, 10 Apr 2026 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818575;
	bh=WYqHQ/KSVCOpW5gEvy3s00YQa3VfVpDZrOgWzcd0JrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hhv8rmIU+x5ieL3Y8PJPafaV+eMDeHmJGdnarcpWzJrM42OQnOO2yWwoQgEgW31De
	 aeatVgKRMXOzGeSFMDGjC7nacMGm4SzJMoOywSBuUOeVjtrywZwIjKioUKTYExbrwJ
	 PKJe4C1W5Pp7bAMLevQVMGQvjmYBrr7WFr407hPy3prGIzPF/LdctOBykzgfy8jYbq
	 LA7HpGzIlsHfRM5kge/b3iIGV6S1z6Qm81o9xc2q3dA1gddi90Q8k6B87lF59rEy70
	 rzxRD509NjPXIYxNkPJcZVEebQgsu6c0OAqvakWp1UAIphMhZJfGI8+HU97dZcmEF5
	 6w630GMPaJdSA==
Date: Fri, 10 Apr 2026 12:56:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: fsl: Add verdin imx8m[mp] and
 imx95 zinnia board
Message-ID: <20260410-great-woodlouse-of-judgment-99bd78@quoll>
References: <20260409095855.61252-1-francesco@dolcini.it>
 <20260409095855.61252-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409095855.61252-2-francesco@dolcini.it>
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

On Thu, Apr 09, 2026 at 11:58:47AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Toradex Verdin Zinnia carrier board mated with Verdin
> iMX8M Plus, Verdin iMX8M Mini and Verdin iMX95.
> 
> Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


