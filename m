Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1B0C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syZ95D91wOsCOSrYW+PzJiWVkO1QY79MwtIainHMHVo=; b=zNMdIZWKkCTm1aIMr4qD4pmGMP
	op3mISLaLaEGeycMoUhhtfNORWjhoahUHUNEl2mJ4uoKB5dPOcb/ANHx8skz38xuAtuR69sgo6u4D
	FJz2t8KWr1EcHYosUNBueOhCtoegPb1/OsOgHG1Yi5q146j65gkEaR0w6jCjw8yxJaipuGOI6Zg1w
	ftV/zD+SkH2uo26cLUrVuFUsH0/PfG6sKPGdiqMJ681z8z8PVK6h44UgIz7StiCh/E+5F79vAzEYy
	Epuv+RBxJ8boBARPCrgTZJbS79w/t6KMFjrqe81GICFN9WdBgf1jrz8zFygUf8TGl+5NGYf0Gw0WE
	C0yDcZiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulO77-00000006swL-0gfa;
	Mon, 11 Aug 2025 08:42:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNZa-00000006o53-1QHp;
	Mon, 11 Aug 2025 08:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87231A56A34;
	Mon, 11 Aug 2025 08:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68ADC4CEED;
	Mon, 11 Aug 2025 08:08:00 +0000 (UTC)
Date: Mon, 11 Aug 2025 10:07:58 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Subject: Re: [PATCH v2 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Message-ID: <20250811-determined-truthful-terrier-5ca5eb@kuoka>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
 <20250811032616.1385-8-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811032616.1385-8-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010802_440626_64B1F711 
X-CRM114-Status: GOOD (  15.43  )
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

On Mon, Aug 11, 2025 at 11:26:14AM +0800, Kyrie Wu wrote:
> Add MT8189 encoder compatible string to distinguish former ICs
> MTK's. Compared with MT8196, the maximum resolution of MT8189
> encoder is only 4K, and the fps is only 30, which cannot reach
> the highest parameter of MT8196: level6.2, 8K@60fps.
> Compared with MT8188, the level can only support 5.1, which is less
> than 5.2 of MT8188. But the maximum bitrate is 100Mbps, which is twice
> that of MT8188. And MT8189 could support NBM mode.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index 7675391d7eb0..faee838d684e 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -25,6 +25,7 @@ properties:
>                - mediatek,mt8192-vcodec-enc
>                - mediatek,mt8195-vcodec-enc
>                - mediatek,mt8196-vcodec-enc
> +              - mediatek,mt8189-vcodec-enc

Same issue... you got these comments on your v1 of your other patchset,
didn't you?

Best regards,
Krzysztof


