Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513D9CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Um36Bmls59wwIHRJ0FX6eqoGiQdL5ajLwlxHe/J5vs=; b=2nqD1P0GdYB7ggTguWn+yHb2hS
	WF+ekHv5WYfBKFHuNTmF9yY1S/+CvrLBzmDgVmXzgcoSoFQBI5I/X6r+LB8JOlmhq2UeB6wpktgk9
	amuE62I9LE3six105J+PdZCJpD2dl8pFz44PtbhigBwupeSdNSwtE+VYRiTqYOavqa4PSzJAKYIAR
	dC7z+KdM8K57MtYg/txf0MFeB0/HPeXwIZieNda8iDT8S9WsZ0y0eDBZ/mlniYFa+A6O6Rt5s9JaA
	UlftIVGa1/1mr3NlyiNVQwEl2KJfjGFakMjeCkHCdtGnsvy4V0x1RaUhh8Dzy/e5WRD67yEWVnr3y
	queJTysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4LO-00000005eIx-2eTb;
	Fri, 09 Oct 2026 06:44:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4LN-00000005eIq-0Shf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:44:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F426403CE;
	Fri,  9 Oct 2026 06:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB011F000FF;
	Fri,  9 Oct 2026 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528276;
	bh=0Um36Bmls59wwIHRJ0FX6eqoGiQdL5ajLwlxHe/J5vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLJaRrYBsgbS3cgcpCHV2bSajDEmMCgWMFM4iI9mozcu8iPbXmiMakcLJba5VgxQN
	 5TAttX01Qd6DPF3sOPoOjRi0trTjaGmFnAZGxjSooJ2g7ljvM/5xZLb47E5XJXlf9Q
	 yC3mIqkKcTVXRW6ixQNB2CL3NN1mkmdi4psKBqflINO6+XrVfSZZ8UcghDK64ESfQY
	 G0dfXYSOPI8zH9pFvHfd9kYMSpVSkcLNN58aznF7g2nhgXWRgvgu2Dd3fEZrQkGGUF
	 wEXa2tGYoTpqZvJIprV/jIEPtfyzGb/HnD7HhHBTlmTly+Rx6T2MfPyGvBL5wRVkSe
	 RhxVXQG9TmwNw==
Date: Fri, 9 Oct 2026 08:44:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: SID: Add binding for R40 SID
 controller
Message-ID: <20261009-juicy-wolverine-of-atheism-3b0d8b@quoll>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-4-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003012534.418820-4-otavio@ossystems.com.br>
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

On Fri, Oct 02, 2026 at 10:25:35PM -0300, Otavio Salvador wrote:
> The Allwinner R40 SID exposes its 2Kbit eFuse at offset 0x200 of the
> controller, readable directly from MMIO like on the A64. Add the R40
> compatible with the A64 one as fallback, as done for the A100, H616 and
> A523.
> 
> On an A40i, all 64 eFuse words read through the MMIO window match the
> words read through the SID_PRCTL/SID_RDKEY registers, so the R40 does
> not need the register-based readout of the H3.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index f67470b8a2ed2..a4960b0ef8cbe 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -25,6 +25,7 @@ properties:
>        - const: allwinner,sun50i-a64-sid
>        - items:
>            - enum:
> +              - allwinner,sun8i-r40-sid

Assumming this enum is kept in natural sort order:

>                - allwinner,sun50i-a100-sid


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


