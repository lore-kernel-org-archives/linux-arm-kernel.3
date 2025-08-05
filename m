Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E24C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2CLuoGEq7RJrZ39iWIBIBf2i1DU37g7DOnaRijoXzc=; b=Kbw1e1fdqpLer42tXjVQZykphW
	r28TTxzlv40w0V1VelYYCmJkViQxyLW438v0i+1rSm/KesDFNEPbZ+mWdV1+8AIBesIlRJTvWCL67
	dHm1pAvp36Ziz5H1JEoDD+SaM6EEgPGRi1rCM3g8dONEyX2ruLw+K3cpqWHR/KKIODiuCRfbYPDiA
	SpJMtrwp8cGiBcZMBmBNgNFJ6TRHSIi7tWhI9VqVLYfzNqA0QH8albtYxH8l/xXOwKTy5CB/IF24u
	Wabwp+3SFMfaspdiWG/615S+LndNq4XFcjUtGDtvvQrX0ul73VLBlrfDN+lGu+jlUSak3nUyI9gQg
	ZEXF8D7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBZu-0000000BxR7-1jRF;
	Tue, 05 Aug 2025 06:55:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBU8-0000000BwO1-0oeX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 949295C465D;
	Tue,  5 Aug 2025 06:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73871C4CEF4;
	Tue,  5 Aug 2025 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376559;
	bh=SbzqbxLaCPA0TZ/dsHQ//SXDXD/27T/C/5e1ebRh5Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWGR43jEK98XIi5B7vBilRtiQ33+IZDcZWNcliaGvscWwLC535n8loYNQXBJf5jQP
	 Zix8piO9RIB6jibngVFpL/8kv5iLw7d5ch6Emura2n5+EHj9i2+iAiev8+cdaClLsi
	 4cbPtosbmypUV4YHpYjr7NwzhU4STfVXM7Yb5bSmxgqd4s2jGh4SBUPy4kbnVUtZB6
	 xpKsW5BVSKQsEcJIfTHd7P8scYKq1r+0OpeHYar+CZ148xXgmP9zM9WGJ5H/olpn2Q
	 4PiHJSZ2ZT89PmXNYEGhDOvdEpjeec2wNItWlHamsDAVO4+VeoVcYztuL1ie5Ss3ER
	 e1clwW56m3H3Q==
Date: Tue, 5 Aug 2025 08:49:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, srini@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/15] dt-bindings: microchip-otpc: update dt node example
Message-ID: <20250805-warm-waxbill-of-revolution-5abe32@kuoka>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-4-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-4-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_234920_444905_BF8E3A13 
X-CRM114-Status: GOOD (  14.92  )
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

On Mon, Aug 04, 2025 at 03:32:07PM +0530, Varshini Rajendran wrote:
> Update the example binding according to the new driver implementation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml    | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> index cc25f2927682..e9059dce85ef 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -42,9 +42,8 @@ examples:
>          reg = <0xe8c00000 0xec>;
>          #address-cells = <1>;
>          #size-cells = <1>;
> -
> -        temperature_calib: calib@1 {
> -            reg = <OTP_PKT(1) 76>;
> +        temperature_calib: calib@41435354 {

1. You did not clean up the header.
2. I looked briefly on your driver and it seems it changes the ABI
breaking users.

Best regards,
Krzysztof


