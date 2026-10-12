Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45EECA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H3LKXnRsRjgTOnxDKBRlZJ3/mRIKDiFks9Hh8YiVWg=; b=QE6P+/q+p6g+bFLgZ2zFdOyaQ1
	UChvrjh/CRCKVpewD2Q6eYp49yeddpkhbauRUzrVu51MEETCcdOoMm7eqQ3o+2zZUxfFJdNb92VwP
	I/Qwn/DCjqOM+ZR4L6NjjLmYtcInsD1JNFeSeqgvHAr3hsSoMmFCA4aBu4LuLXJcNHpTDzZluBeyi
	1OBPMef8PEu4Cg2Pzx1RInmJzKlNhFSfpuq+WVXJuNRZeiU8HJqHFJzvgNjKU87umV7/x/aZ0y1zA
	3wwMhouvuRwVRMDSNIHKqEkXg8KQOu/F8DF6ugC2ZRc0d+Q1yxjQKhq+W/YeRlTDwJqCc75A5XMaV
	2dsEGX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCO0-0000000A4KE-3rIv;
	Mon, 12 Oct 2026 09:32:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCNz-0000000A4Jl-0vfZ;
	Mon, 12 Oct 2026 09:31:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FCE56021D;
	Mon, 12 Oct 2026 09:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4601F0089B;
	Mon, 12 Oct 2026 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797517;
	bh=9H3LKXnRsRjgTOnxDKBRlZJ3/mRIKDiFks9Hh8YiVWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmqAbzqcGelilGuTJJ6bjDCEq00JPGjCkgjHDvwpLU0uf6s9uW1SO/JXMG7yFF3u1
	 RkgTY1PpW9MgXdChn8b8XkoNTL019lOy9OJtHJQc0jWyLIQzZuoexjKVuri3ge1BQj
	 oz+hn4nT+HIfRHkvCtXm8i3zL4SJP6Jj6hsyc7UVopcHddJShX+cfaJDb+ZDRYrYZG
	 HIYsIwOf5OhmPGN5kHu5McqeuAyqVFY262E3xkO2ZER2l6SBco613s9IO3Ziu6+Zfi
	 CfaCcViWqhonjPe2y+izstLmnQoR2zGWoY4EXC4UwYDwVvX8O8sNBuRuMYDoHnskqX
	 e4IWc+YRzvKRQ==
Date: Mon, 12 Oct 2026 11:31:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil <hverkuil@kernel.org>, 
	irui wang <irui.wang@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v18 12/13] dt-bindings: mediatek: Add MT8196 JPEG SMMU
 bindings
Message-ID: <20261012-determined-magenta-camel-ff2ca8@quoll>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>
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

On Sat, Oct 10, 2026 at 04:07:16PM +0800, Kyrie Wu wrote:
> Document the decoder and encoder phandles and describe the dedicated
> JPEG SMMU configuration syscon for MT8196.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 16 ++++++++
>  .../media/mediatek,mt8195-jpegenc.yaml        | 16 ++++++++
>  .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  4 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index 28a9a9b..b1dccc3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -73,6 +73,22 @@ patternProperties:
>        power-domains:
>          maxItems: 1
>  
> +      mediatek,smmu-config:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          Phandle to the MT8196 JPEG SMMU configuration syscon used to
> +          program this decoder's GUSER_ID fields.
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: mediatek,mt8196-jpgdec-hw
> +        then:
> +          required:
> +            - mediatek,smmu-config

Why are you adding incomplete hardware in one patch and then immediately
fixing it later?

Please read writing bindings doc (and part about complete hardware
support).

Best regards,
Krzysztof


