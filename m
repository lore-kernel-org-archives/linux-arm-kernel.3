Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0C60A3835
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VJDDuZL7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AOpHduCW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PF9hqOY7SlmHr6Mu13sbIIqaN/HmWKK+iSj3xcxtqik=; b=VJDDuZL7FKx9F1biOZEDntol4m
	e/T4PNa4szEaATzFVm9XityidStAe5uf1akqYSWzrCb1mNm7DTIy7RKhCOxK3E5I8dXqeCc6+hVDB
	T64lT9cruT5Mty+RPj4MGQv1L9c6c2Z3LfvshEP3jCAOlDeBWmOggaETNC05oXryZLmcFprJoVvjZ
	mtGhm2vPxMHzllkVypCuy13/eMr3ozdUzu8wfxAqFNppSAwIUWzUGw1/hCC8fugm9XaVfXvtIak+c
	G899MVQyW/Od/nvlyuYdLlGsGocBz8fo5u3g/gkfU2vNJzN6A97AiiSy0aW3W1I3cRnunvJBm+3PM
	5CUyOvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM37l-00000006yzt-1pJk;
	Wed, 28 Oct 2026 12:51:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM37h-00000006yym-350e;
	Wed, 28 Oct 2026 12:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E59741B38;
	Wed, 28 Oct 2026 12:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000A51F01825;
	Wed, 28 Oct 2026 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191881;
	bh=PF9hqOY7SlmHr6Mu13sbIIqaN/HmWKK+iSj3xcxtqik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOpHduCWZ0pL+wQdwiF5zWiQ38s36anq3OoP27DBHDx50y1QhIMeNOezKqpwqi+ur
	 IXsIwrFPDu0Ejmq42RHm2jpkX1yW1I6OZ+exlAFmKx6tPRrSJy57ymtNZgWJPVfqlh
	 Bu1kghbNdHXOuk8bz85smbLnZU8bFaY3QH7ey4Je1ID2+YOmMYybNInq29/+j1uwc8
	 bsp0YbWCAbCaWSHu6UJUQ6j0ZvMj+24Y6cIIji+h8lq9X9RgIvsBHydUrAprq26Kr1
	 +rPLMJHaiwinKOyAxG/+6PHtL7UN8OcwiCbEnerqaloZic8ly09FrQe0HvdDQDvsA8
	 HL/goimzwSY8A==
Date: Wed, 28 Oct 2026 13:51:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
Message-ID: <20261028-academic-blue-earwig-72d3d1@quoll>
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:40:00PM +0100, Christian Marangi wrote:
> Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> The MMC controller is based on the MT7988 with the difference that it does
> have a single clock controlling it.
> 
> Add the dedicated compatible to describe the 2 register requirement and
> permit to define only 2 clock (the main one and a fixed clock for HS)
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Also add compatible to restrict clock-names for source and hclk
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Your driver part suggests it's fully compatible with other variant. Why
not expressing it with fallback?

Best regards,
Krzysztof


