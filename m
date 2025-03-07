Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57622C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2F6Zdb1CkSBitSIoiyY8ywRdELphgvUiwPTl0y2m+g=; b=KbuMI31wY0L3v4wchnzDONAUSr
	LbFiMmAuUo2NtCO2zEadsQVbFVou7B9idEJGH+jlw/7VuOuhKhV8uCFwBz1Ds1UN3csIG59JYE0aL
	3HEU9U/zE6Lt3NSniacpR8OMu3bK1ME9m/7Dy+8T2/4UqheBgaeLLVwTVH1KD7rJfSG9cEm6M1Qln
	sKkfFV23gxBvOtq0BFHHAzcOnevJhQSnvYdcN8D71UugIKC+eMG7+QMoMp3grsB7HpRlyLwQPdzdO
	EAK+N8DZWlfpwN/u8tk5cNIrz8a9FQZIYMd1uKTtz6FLm9EFymu7HOr5+g9e+b0qLtJIT5ML95VsL
	nidRGozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU3n-0000000Diiy-2yy2;
	Fri, 07 Mar 2025 09:32:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU1H-0000000DiBp-1s4r;
	Fri, 07 Mar 2025 09:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D2F6Zdb1CkSBitSIoiyY8ywRdELphgvUiwPTl0y2m+g=; b=MfBYfJcDOUJ7bmp4dok8wEmuaJ
	s+yyx3IlEJGd4KThHeWy3pAxTHVErNEA+3t9rrrGyHhIC1iQ+ZefIqjYk7FknH3oKX1GjF2gY3WLT
	+lUHpZPwe7d2cLz5xeEN6MiYDqzmLU124SaDix8I1yDz9h/nJOWkU25hJB96NDIOe/KL7D9WeUZyy
	pKWGJnS728oPVRpb60e1WJAaDeNsSG8y0bj9ocXbmZSCYH+bmYT9X9qsbYhB7GeJxVRUT8u1XNv1+
	RFFGO32ilew0RNMPDCaMkVYG9KjTO/rZTL7gkmRUNjHbh66yygeEemgVc3gb0CuLZRwoc0wz+6PkS
	NKUMyvLw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqU0n-0002G6-II; Fri, 07 Mar 2025 10:28:57 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniel Golle <daniel@makrotopia.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: rng: rockchip,rk3588-rng.: Drop unnecessary status
 from example
Date: Fri, 07 Mar 2025 10:28:55 +0100
Message-ID: <5865714.DvuYhMxLoT@diego>
In-Reply-To: <20250307081406.35242-1-krzysztof.kozlowski@linaro.org>
References: <20250307081406.35242-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_012927_550965_EA050BA1 
X-CRM114-Status: GOOD (  14.69  )
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

Am Freitag, 7. M=C3=A4rz 2025, 09:14:06 MEZ schrieb Krzysztof Kozlowski:
> Device nodes are enabled by default, so no need for 'status =3D "okay"' in
> the DTS example.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.ya=
ml b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> index 757967212f55..ca71b400bcae 100644
> --- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> @@ -53,7 +53,6 @@ examples:
>          interrupts =3D <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
>          clocks =3D <&scmi_clk SCMI_HCLK_SECURE_NS>;
>          resets =3D <&scmi_reset SCMI_SRST_H_TRNG_NS>;
> -        status =3D "okay";
>        };
>      };
> =20
>=20





