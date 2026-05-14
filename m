Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C324CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fxq6l9VUQGPZLegIIwcQeJ+UALVjx2R9wUR1JGgGgbs=; b=tqhqLDt40X9quzqZ5VH30X2YJP
	92AopadCg8/cV9/x606XnJSpdtPEnUlPFN6cTZSpRTCLoIQSlwFmAdVZdB94BDcVnhSbMDZcspQph
	SC+fmuYMTqUYsahJyzIX0dWNc3bvcIAirHjpY1CZOj5YZQAQbEH//nquL6ald2V8NHldya96+sTq2
	0KJHyL4HFXGowA3ept8QRMfvFTUbKo4OVyLVnlsOp+kHs/WnNNwpuAxQseVuOYuQmq+MA2GjfdbRh
	1/wSBrXI/IvGM6vd0vm2ahJ8dt5cryFaBB4SjfuBgqyEriuw9uf2JdgkT3NBooI45pQqcYlMDP9P2
	hbmsjz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVCd-00000005SUT-21AH;
	Thu, 14 May 2026 12:30:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVCc-00000005STp-013f;
	Thu, 14 May 2026 12:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C5726012B;
	Thu, 14 May 2026 12:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3C8C2BCB3;
	Thu, 14 May 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761808;
	bh=bUh+fpgrDiqNF35orWAhT8L0f4AXwoeZqv6kc4rEVU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5BUHYe3ZNzL2CGqEFckQzrOa1MKywKGhu62LRN9TnGvw6OuznC4nD2zXLAqRaxfR
	 d8GdZoc+8s49uFy2BhmA41PE6d72IVcuMsroX2Y0KejLpc8HJZi0PCjv03UBoUn2qM
	 6ZvPnlIikDs9REcOwCCqDaGZGQ9efShL3T5zm+D5OAfB8KeiKNM3jJjafyffHkMgil
	 TXnDqextjkZ3JZXecYSahsKVnhlH/4H0apemKNb6WpBw6V1OUg/iOlUpTOeHguv062
	 1Lfdxvb3GHojAsMaJ7Ui6qchEXPknHRcEhtRis04MS21EPvvp0OFRq8CQAGfUb82ON
	 6ReMjwToEjdhw==
Date: Thu, 14 May 2026 14:30:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260514-poised-green-beagle-79cb9c@quoll>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260514114533.174008-1-arnab.layek@mediatek.com>
 <20260514114533.174008-2-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514114533.174008-2-arnab.layek@mediatek.com>
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

On Thu, May 14, 2026 at 07:45:33PM +0800, Arnab Layek wrote:
> The MT8188 SCP requires support for 1-2 reserved memory regions, while
> other MediaTek SoCs use only a single memory region.
> 
> The schema uses a permissive base with restrictive conditionals:
> 1) Base schema allows all devices minItems: 1, maxItems: 2
> 2) Non-MT8188 devices (mt8183, mt8186, mt8192, mt8195, mt8195-dual) are
>    restricted to maxItems: 1, overriding the base
> 3) MT8188 devices (mt8188, mt8188-dual) set minItems: 1 with item
>    descriptions, inheriting maxItems: 2 from base, making the second
>    L1TCM region optional
> 
> This follows the same pattern as other MediaTek dt-bindings such as
> mediatek,jpeg-encoder.yaml which uses conditional schemas to support
> different numbers of iommus per device variant.
> 

So I just reviewed v2, because it appeared in patchwork thread...
because you just threaded v3 there.

No, really, this was repeated also to Mediatek so many times.

Implement v2 review.

Best regards,
Krzysztof


