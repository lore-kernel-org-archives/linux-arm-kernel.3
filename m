Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95028C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unNekQNoLCcCD/h99sa2j6JXjgyktEAUOqS27hg6rJI=; b=EjuMjgRUKSj0RnvpHbQ4JR6KIY
	wrOXtIxCfPKo+8JtRdIOs4d6q3dPOM/iRxQsrbixsTRHXiduyZunkaesRk6KlC8k9Bgs9h+asoTyE
	uYoQXTE3nFRnuwUbbCo0WdfsI7WAbsykfNR//qnr+aCfEJyDN3oQVyMxLo/z6p+bBeUopKMKFmST9
	N2U1VqP3sKGp7hNxRrqKsONebDLh9GmUqilTONtlCIHvDQjlh/hClZ0NP/2xbTs+3rNNFKGCVM+s+
	JcTA+oFd4hDVL6V2wGuYssmEJFX7W0IevGeXkJCV9de0WksP8DnHejznJl9hRjhjhdqpP3lWY/m3x
	fx8+jy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFKC-0000000GFGd-0nsc;
	Thu, 05 Jun 2025 18:28:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFI4-0000000GF8i-3Nzw;
	Thu, 05 Jun 2025 18:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE2CC614B8;
	Thu,  5 Jun 2025 18:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5502EC4CEE7;
	Thu,  5 Jun 2025 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749147970;
	bh=38lVXRE3Mp1KY0IrURvIDl45/b1nVSn7zSo6GGgz/1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0V+21dwPHis0WH2aMCEh1W7DDxlEcptzjIiUkHqYfEYyGIkrHVsLdF48zbsAGCEk
	 Nq1VTfUV8Gtx920aHzIDCf686hAgK6jrJsUeZy9UzG9jZ/Q+DVIRT7lN63W3a+y0Dy
	 oTia446jU9dpKbcU6ou4y0SlAsa5WXpzlyZWFLYgKyPEeqOs+8H80CrEnJ8qOL5yzd
	 UwT4qcBbsPnXsu8EK1RrAnC6pKrQx9nOzqXaGH+cleNgAHW61khnhdcZdA1BwT7sa6
	 2oZBg0lXuAU+EE7IpPUQtmLRVhSLoCU0rg2isdFhxyaR+h3QI903eqVJsOXDg5QDHx
	 0wRFdiCqggauw==
Date: Thu, 5 Jun 2025 13:26:07 -0500
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
Message-ID: <20250605182607.GA2983549-robh@kernel.org>
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

Where is this property defined?

> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.45.2
> 

