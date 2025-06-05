Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65A3C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy2pccGzUhIgcD/UNo48l/ttg+ASkC+LyrAMqWUjx+I=; b=aSDHRS5g5cPd/z6NhhmQaDcvkq
	cKuRJdZv0EM+92ig6oMQKnZlItYngGr7YT4Up89nL7dYRVS01KXNtmOSVojTt19lbwdhDXaIRJjeb
	AqVsMlp7k578dR/p/u3Xmk3mrZaPPhpEmom1rxarY8wJfJbLmUGKtWM1P31ayLIw38txGfXyU2IDo
	aazvc7dBLU/034AxIZsPgK0G7jsd+EmGET8283BZvEawOKuJtJJ5xQlWPhFt3H0E1EMKAEDvB1dek
	OcQmTl0QmQAU2/hPwG/HeTpA6kPXugoqMyzdtGHYIlVDvwRAzEvPpV2/1fAR2gluJPtIFxf69GMIp
	TyvUalqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFMH-0000000GFXy-0j6x;
	Thu, 05 Jun 2025 18:30:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFJV-0000000GFD7-2zjC;
	Thu, 05 Jun 2025 18:27:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05901629D1;
	Thu,  5 Jun 2025 18:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83269C4CEE7;
	Thu,  5 Jun 2025 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749148060;
	bh=LrHf+kL0S4F64MAYya3xzRVnHNkRHGI5W4EOABOWHXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bS5w7tKC4ZHtosuXqgcOD8vuu3xDAr8tH1Kct+EUSeEtFzs1ul27YTsTfwMi2BBky
	 oPfwt0xjFnvbuIEz+8wd9+nZpMTFAremPqjsm/6kB+/lWDD3CNJ76sa4yw+Uo/bIpF
	 89UL9o7EJRFfGXkCo8PQYFhnM92tqNXyjXydDQNN+eGcvdYDGTHA4kpmPjPLYwcjDs
	 560DTWQnPPNkWndioNb9k4+mkzX8FLcZOpenht3/J44lUV9JyiFSnpYczSrXqLo39X
	 9vDUMwYMcTbtVpRVxOD5qzDiAH3Wc2zZoIzp6a76dFcAL3dxGa0vUnF93iiKhk33t/
	 jRCvGbnMQmsnw==
Date: Thu, 5 Jun 2025 13:27:37 -0500
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	nicolas.dufresne@collabora.com, wenst@chromium.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Longfei Wang <longfei.wang@mediatek.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add
 encoder dt-bindings for MT8196
Message-ID: <20250605182737.GB2983549-robh@kernel.org>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
 <20250528063633.14054-6-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528063633.14054-6-irui.wang@mediatek.com>
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

On Wed, May 28, 2025 at 02:36:31PM +0800, Irui Wang wrote:
> Add MT8196 encoder compatible string, which will reference VCP device.

Also work on your subject. No need to say dt-bindings and encoder twice:

media: dt-bindings: mediatek,vcodec-encoder: Add MT8196

> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index ebc615584f92..7675391d7eb0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -24,6 +24,7 @@ properties:
>                - mediatek,mt8188-vcodec-enc
>                - mediatek,mt8192-vcodec-enc
>                - mediatek,mt8195-vcodec-enc
> +              - mediatek,mt8196-vcodec-enc
>        - items:
>            - const: mediatek,mt8186-vcodec-enc
>            - const: mediatek,mt8183-vcodec-enc
> @@ -76,6 +77,17 @@ required:
>    - iommus
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8196-vcodec-enc
> +
> +    then:
> +      required:
> +        - mediatek,vcp
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.45.2
> 

