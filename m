Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A44C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moOS9a2ue4aymrStDqxoSwzWledK2otC+8+Di3jTIDs=; b=SZJsgj5pYpE/XXxkZqSXMkaWDH
	rtIk0lGFIABcr/YCasvKtdvgFf3hR+kOQXyWtYUi8sPT5t4i5/s5XR9+ZYDf+DYTqFxQe8eQ2dJMb
	nfQifGlW0O0ROFa/tfStBBfDtjphV6A5aFYusI0p+xl96Xac26IWzPJCTBNesKwvBsj8btvbT8Bo/
	Z2DGJyxqLZ+ceC3UAOPMimw9/tSzqb+PiDPT8iG10/S6m6KoPR2x6bl7sXwakzFO001hBsagPXqVJ
	Twcpqi/5ZIzDaohg4qyyg/wc5F6rHUgY50BNXmYDGBJqXin0nZVGfWLvfbD5Jq+idJZCYT2vxP9l2
	Ds1P0Dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Iz-0000000AsMV-0onY;
	Thu, 17 Sep 2026 08:17:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Iy-0000000AsMG-27Q6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:17:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45FAF41821;
	Thu, 17 Sep 2026 08:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1FE1F000FF;
	Thu, 17 Sep 2026 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789633036;
	bh=moOS9a2ue4aymrStDqxoSwzWledK2otC+8+Di3jTIDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kntv2M+0iYjxx/+YnvUU1DgzEhSpw9aiJk0DyojkM1md/LdGZuZVpSfqV7tpZhuzM
	 Xp5SOdj/11rE5vzqkTMLZrtnS3fi5aB42253woJrUApuoGLrzu9GpattKs1Ug1qNhY
	 x/tCSwVBKwa/4Ty0Y3Iu4+QGL9SvALXVLjp5+Syeaz6JyTW1ZhQdmRo81dN009e7Pf
	 wgpXqfqdyxTHjViKkNgfUhAtlUWgLupmnj/wR1fviNaThv+pow4uf7IhNyj2961l60
	 i20128IK2d8/OH2ZYWmT4XqcHPOg7Hq4CcvMzKmeWsvE4aoeqjq5+E90YJXVnIN4iO
	 zlR8WutGpTuQw==
Date: Thu, 17 Sep 2026 10:17:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 05/20] dt-bindings: display: ste,mcde: Allow power
 domains
Message-ID: <20260917-gifted-astute-asp-dfef8d@quoll>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-5-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-5-9d0c17e1f816@kernel.org>
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

On Mon, Sep 14, 2026 at 01:54:33PM +0200, Linus Walleij wrote:
> Document the MCDE power domain.
> 
> Keep the legacy EPOD regulator binding unchanged for now.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/ste,mcde.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


