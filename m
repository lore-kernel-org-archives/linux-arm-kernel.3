Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC979C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lErpeanYkiiyTk05YncZPzVNpVCY4t4tvDm7+iexYY=; b=UODnA6x02JgDM2wkIH/QdnxPHQ
	XILwn44Mqpd+mhH3iMX7DO8gF/gBJaFxp24b4tl59ERF09HfxLMMmv/p9ntnw1aQFZOmr6uwbkfry
	2+uJ6wM1FbdWBs2wqxKq1etkEhjXMBOZFrJuS6o8oDt9WQUEDJpwDYNUadTD3f6aSJzYLTKvdbkhK
	Pj3vGPBQsomzyk+M4D7JnbHgGiEu/eCWC2/MK9wvl591xB/wauD/cYVBpeyuuz/QmTPnh6Ulya7lV
	N/jX0feFMeOJ4N4KFSVvv0giQbhsSQF09UHWedFUbTplN7ZnVfRUw5hsjzjRI6PxHZTvukANym6E7
	72S9J+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SVI-0000000DcbF-0Zhj;
	Fri, 18 Sep 2026 06:55:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SVF-0000000Dcac-2OR5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:55:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2BA442E3D;
	Fri, 18 Sep 2026 06:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F741F000FF;
	Fri, 18 Sep 2026 06:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789714520;
	bh=1lErpeanYkiiyTk05YncZPzVNpVCY4t4tvDm7+iexYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmdIBBpwqSdfeAt3llCnP2Gft/imLtZNd5VBAsvuI/TeFuXVzttJqitdUdqmkfuh5
	 cpyZBko5C7o1jdTZTbfAhpAejknzy+BBi1TpK4E+IANQtUGvqga4aWTJGY/cHGcgIm
	 ulyq3m9dMUC8vBEr7svYQmVMlAMO/luOuBVPSg1hE4ARhKgxTzczynANnfTwYp+eM/
	 ev3iVLSUkez/xOVeOsXhIs6EVbN5QDTdyqjCqev7VfX1dDIPUElVGjONImEGV2mYSQ
	 4r80nLyVT04dm8t3CdwR6qk6VmBieEIFJpu1zK8b5ZnZoIz8s2Ffk7BIqxEnXc0+uU
	 +EvHTpY+wHuWg==
Date: Fri, 18 Sep 2026 08:55:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Message-ID: <20260918-exotic-illustrious-cricket-3cbbef@quoll>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914210115.28151-3-andre.przywara@arm.com>
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

On Mon, Sep 14, 2026 at 11:01:14PM +0200, Andre Przywara wrote:
> Teclast produces some entry-level tablets with Allwinner SoCs, typically
> featuring a new SoC early in the market.
> 
> Add the names for the Teclast P80 tablet, with an Allwinner A133 SoC,
> but also the Teclast P85T, using an Allwinner A523 chip.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

As discussed, Sashiko's comment is not really applicable, because we do
not add fallbacks to match driver behavior or to achieve some desired
driver feature.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


