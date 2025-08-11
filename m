Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34677C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR3jsDjBiJPisIEFxl6J+JABFNJUt8tB4tG8U9oTuKY=; b=ipYvsUq8+udb1TST4AG+JiLSH/
	lJOebN2vPOm+YrHEuCk6nUJiTggwj4LIxjT1YI1VMLLJPnMxII+FzA9EK3AgF6thnUUnzHvjeaHZd
	bL3+miB0oU/ms1usrn6LAOJmn9vHUQiIeUdNS45C/1N4bqoiIpH9nzw71aBHJXSVVq+enb6W+PkXX
	PITK5R6A4DTobMuBG0nNu+k6Zj8q3aKQNrQHi3Qdc+gAYB4pNPc4+rd5E77pDSWtJhAjh81VdALwO
	qu2PA6AiTMPC3vBH5d2NGbBHbBKdlPR8h0cKI0dHlOi40BB0Z0Kn4M4uWp+HnmSkpo+GemfKdV0Si
	fTBxzgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulO4W-00000006sJR-42LS;
	Mon, 11 Aug 2025 08:40:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNZ5-00000006o0e-1PM8;
	Mon, 11 Aug 2025 08:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0282345795;
	Mon, 11 Aug 2025 08:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2B2C4CEED;
	Mon, 11 Aug 2025 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899650;
	bh=GuqQ/atb5C/6Edb5aI6yWEOFTf0z/YnBtztRgrCVmAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mp6fa7jDERrN/G7YvQ/8rhkiSLwHePAdcl0+RkXHp+qqiYYwYpl954Pv71jwNrYep
	 lK8ExOH0pn9/3KtUUaKbYyye+myHKQqp/xmV9ZGzq8Kgq4mTVEYxjnnRPxk6Ph5410
	 P8Ny/pN68yok512QV5RWaKHeK77mzPBFUMP+8iapRJ6mb8YjBDmVlOx7FlEAqlk1NW
	 5zBd+euPCNI6w1hd2ZDX9a6E1n5G+nOPplzRytvT+3UOpSXTtS8bCdT+tf3LNVGUXv
	 IBuTP+MZBeQ9828qrM84amxGzkFGVYHTPI0TipP0l/YPp+WP3Fdw/GhdUTqvSJyAc+
	 X5cqNytrdycFw==
Date: Mon, 11 Aug 2025 10:07:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Message-ID: <20250811-archetypal-olive-doberman-ff0a31@kuoka>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
 <20250811032616.1385-2-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811032616.1385-2-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010731_406203_9170598D 
X-CRM114-Status: GOOD (  15.65  )
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

On Mon, Aug 11, 2025 at 11:26:08AM +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. At the same time, the decoder supports the vp9
> decoding protocol for the first time in single IC.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 74e1d88d3056..1bb5a2485e4c 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -77,6 +77,7 @@ properties:
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
>        - mediatek,mt8196-vcodec-dec
> +      - mediatek,mt8189-vcodec-dec

Misplaced.

Best regards,
Krzysztof


