Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AB9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yJJ6Drmoy9vfnwtdLHzsRae6NHXOlK9Gmybvb6mNTg=; b=XjgDPGFrM284Cy5BNUDP7IlSM7
	w5PgeijH1YVoCNbk7lQuscRc5jQi2Wn3pd3NRG7AKqVtL6UtHNkYTd/3LvNY0bcca0ioYIgYpZilI
	W62Wv8ae3LSFSMPNuD4zc4WMtOwGoiqoYVYXZsoSnKO1wzAipDY0nAbtoBEQ9JUHetBJsDPrh/R9i
	xGD8Gxitn+Dd9hpQ378Oz0h97Ry3sg4g0v5dAutCx9xgHc7BEmXPwseBEADtTzmVMY34L50xUyyiE
	1l0oSMJtbofxjB2FMzpUw/oQg7I2jYRTWnmp5Y7Jfl3+NMuUC8t+G1JX5aRe4Xf3rITwpPXAxDHoS
	jXKNuTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tir4J-0000000E7n0-2pbz;
	Fri, 14 Feb 2025 08:29:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tir2s-0000000E7SD-0dgt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34CF9A4100A;
	Fri, 14 Feb 2025 08:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9C2C4CEDF;
	Fri, 14 Feb 2025 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521653;
	bh=umGs2f8JsxE41Yq3/TX60DBVwiLiOcTZOkxMPH65zVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9pPn/G6xAXrX7koevvifKhjd8InbQfDSr4R4fneKtezV5CGNSKnrio1ZhBmBl0rm
	 7TSZzklUVz/5t95PoK64ywDLnVLCaaJzEGW3PkLtXfILnBs3k7Pl+sY6h4wlluc2ai
	 tL7OEWByg4+W/k1THY54Yo6sS8ODkCcmZ8hhl/PYmhggJo93c9B2oEZ3p1Md5+TGkr
	 oJ8Q/Lclwp0rABoNHUcxxj0Jo0x6Z3ODMYSE8wvblVpR5jLykG7L+BRaKeW5OJEP89
	 vzNK25RWx+z6c4X5AfQrIIlpXGpQCygZMIlzr1F3dKmOe1enDzve0sx59xyNec+QtK
	 C15godChkxIkg==
Date: Fri, 14 Feb 2025 09:27:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v2 05/15] dt-bindings: reset: atmel,at91sam9260-reset:
 add microchip,sama7d65-rstc
Message-ID: <20250214-flashy-myna-of-opportunity-dce05a@krzk-bin>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <b78ea6d7b306bca7012cff604b67b65b89b41093.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b78ea6d7b306bca7012cff604b67b65b89b41093.1739221064.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_002734_254012_C045E1AF 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org, sre@kernel.org, claudiu.beznea@tuxon.dev, p.zabel@pengutronix.de, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 02:13:05PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RSTC compatible to DT bindings documentation. The
> sama7d65-rstc is compatible with the sama7g5-rstc.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/reset/atmel,at91sam9260-reset.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> index 98465d26949ee..a1c21c3880f9d 100644
> --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> @@ -23,6 +23,11 @@ properties:
>                - atmel,sama5d3-rstc
>                - microchip,sam9x60-rstc
>                - microchip,sama7g5-rstc
> +
> +      - items:
> +          - const: microchip,sama7d65-rstc
> +          - const: microchip,sama7g5-rstc
> +

No need for blank lines around. It's making it unnecessary long.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


