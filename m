Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747F5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE7IWzX9N9XG849xtFGuenm/AMqbNw2PFGwFboy/who=; b=cnDuKyOigB5hdY6OewuwX2ERor
	XvK0f8IYBTn8Aq7aNq+JcbwHyCQnq0jVyKAOugGsZU4Vs8Kq3t/Hry/kgD94KcZbO+3s2+iBO5fKc
	mfdIVq5AIZ/Vaq7tOhZoh7yB/ScxACFpmu+rsyVB5nDxac7CvNqSJHjZStt1dktuEFXWaV2W/h3ai
	Gt8vw6yzQwKvn5EPRDYq+w8s+UtQZDIAjL+KgQjGh6oKSm2EVra0vTX8Ad2W86E0do/3kWStny8B2
	4kgCUB3hjyrrwz/kyO021jBITgVM6VcdP1L9wZVdeXABz85hgc/ZXSHjZDY62WiVYM5azrm4Oq4e+
	+fIkzw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkH8E-0000000GiEy-02sC;
	Thu, 16 Jul 2026 08:07:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkH8C-0000000GiEk-3Wnz;
	Thu, 16 Jul 2026 08:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B44641494;
	Thu, 16 Jul 2026 08:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647DD1F000E9;
	Thu, 16 Jul 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189264;
	bh=RE7IWzX9N9XG849xtFGuenm/AMqbNw2PFGwFboy/who=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7edHqjNIaaihFmeEURYSbenTdZjHSttCpaHwBUcBw8832PMLr728bS6irLidzQ/t
	 hIg5EmUCKhngv3g/rDSHuh8LAZ3xGNWfxfJy/5eVrqBYz6VSHVKUgfxbqMon6o6xiJ
	 SqhqtSxSb2rndbvWfdvEGuz3njES8XWz1bteqOk0/NOdL0DUSt/noBFKyYF8zkmLOo
	 VXjc5ZLBA8M703xW4RQ6TfVCHE57msVrCj94+eUpxjhs+u+oiO71NBqAZFolvah55t
	 hMO2NgQIxasPMi2wqPGKS4UnOErYosRNV6JBJFMvOgrM5oR1k2o0DDPKvwM00UUUag
	 2JBQStEL5TM3Q==
Date: Thu, 16 Jul 2026 10:07:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Flora Fu <flora.fu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
Message-ID: <20260716-elite-alchemical-locust-c510ef@quoll>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
 <20260715-6572-pwrap-v2-1-bea1d801c81b@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-6572-pwrap-v2-1-bea1d801c81b@protonmail.com>
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

On Wed, Jul 15, 2026 at 03:26:38PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


