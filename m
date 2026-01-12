Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC934D232D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luj4ofxc0azf1Dkh4BORHY0kZFq/wE64EsD4pcBF1iM=; b=YcFoqh/htASAjwITD5jH9tF9CD
	rcQ1zx87b4VNwD4PfwtxBopxzBpOMD4sfwkO2+JbONNlVome+juWnmEKgt4MJ/od1aF67a0pXJSYQ
	vHu2/gL+XFKJ7hQ+fhUE4G+LBV1F1+9D1HLy9BqV+ko+IDjUlQ2GAQEuiUAnWss7X9bWJ1EbiENtS
	NXye8v5RKXenqtw2KI5sCsdDgmbLbiegFdgJa9y0SwuRuJSQGYYScBMAITmWaWvbnLZWxElVWRkm1
	pUj+5hGvYJc7A3qBCegeWJjreH0CQrjmfZnkupSsqGIU3DS87EH7hXJyOKr/VizRUnXYybUKB0mmN
	E7b5GrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEH6-000000055by-3ed4;
	Mon, 12 Jan 2026 09:31:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEH4-000000055bi-3YMD;
	Mon, 12 Jan 2026 09:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0015260166;
	Mon, 12 Jan 2026 09:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53911C116D0;
	Mon, 12 Jan 2026 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768210305;
	bh=3GNmGGqyfWH8WsMt2SNho52VuOTTGt49kLqkKScSrxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ri8XfbKTHxf21UiqYPJV032PgIJBURKoC1lIlsevvixvH/MHtRuHHrZs4ZSUyIuM8
	 G6ZE4yrDBKR1vIT4f7s3dtjr77JjQfbWjQGGYCQWi12jPi7Bo7ZSNnefcib74IYwvL
	 NjE+OcZ2AWic1G19rwlF95dclvQWEHrv+2vRZBIhf0iA6luojkgZTiLHPMgiCT646U
	 cTvrbr4+4J9tKe+IClJr1twB0iH+n+vln/ezHe3EGbcePEpFFiJ907FUFSq6WXxO4M
	 eYiGTzkCvvpB89AMSM2E7+pmIlLN38izaFnPIoV9MvwAgD44bWaG+x3qvVbBVXeDnM
	 uaGxi0DIftn+A==
Date: Mon, 12 Jan 2026 10:31:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	adrian.larumbe@collabora.com, steven.price@arm.com, boris.brezillon@collabora.com, 
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 Amlogic Meson S4
Message-ID: <20260112-quixotic-daft-starfish-5fe914@quoll>
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
 <20260110200426.1461575-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110200426.1461575-2-martin.blumenstingl@googlemail.com>
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

On Sat, Jan 10, 2026 at 09:04:24PM +0100, Martin Blumenstingl wrote:
> Add a compatible string for the Mali-G31 GPU in the Amlogic Meson S4
> SoC. It has two clock inputs (GPU clock and a bus clock) as well as two
> resets (main GPU reset line and a GPU ABP reset line).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index db49b8ff8c74..85fae7753004 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -19,6 +19,7 @@ properties:
>            - enum:
>                - allwinner,sun50i-h616-mali
>                - amlogic,meson-g12a-mali
> +              - amlogic,meson-s4-mali
>                - mediatek,mt8183-mali
>                - mediatek,mt8183b-mali
>                - mediatek,mt8186-mali
> @@ -143,6 +144,25 @@ allOf:
>          power-domain-names: false
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,meson-s4-mali
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        power-domain-names: false
> +        clocks:
> +          minItems: 2

missing maxItems

Can't this be combined with existing meson entry, *after* fixing it to
include missing clocks?


Best regards,
Krzysztof


