Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E59C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 21:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb2iab43R14TaHi2LhilVsAfQHLjbSucuUohgG/g22s=; b=kj+m9RtdUjxYbVrnMhjAlXsQ1I
	YPJfX/Jr1ET1WSweUKQpMeYb1sFB9fGcArgofnVZA92JIinCSHfhVc3QOmEh6YxcNF1WOO3vGNz5X
	8zBOuWK17DsA13qBTdizrWOQp+aL63JzAlcihSjcvVtNQlZ1og7/0l0tTSxBqbVrhiaCWvI8OIOAE
	TdrIKIwLul2HUS2KkVFC/+rCCVSXsOUazKjXKhn2IKtQeRbEqjpjgzzIlLHdGIgBg7xaEKEeSnwig
	bm4IhnVKsKnu5fSACu80h9gtVfoQKGwmj6zX1EHaOfAOasjN0ae6sKhnz3mKHwE3G8u52oP9zDm9I
	y9phWRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thEb9-0000000Fa47-3BWG;
	Sun, 09 Feb 2025 21:12:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thEZl-0000000FZxc-3Ovm;
	Sun, 09 Feb 2025 21:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gb2iab43R14TaHi2LhilVsAfQHLjbSucuUohgG/g22s=; b=17ofavTrJlDkSA0wepYh6WqHEx
	Gki+F+NfSeySibY9PcEYt/HYGQquBsCOewjIUBGnFlq2fpG0nG4B6K/3JZ9pPZGSTYYRotrV0Lb7y
	bEBYjCp1BLSm4TvIrvpN4iiW+V7LB4NgO7dCVOe74BUBLeezfgwxfkaAco2Vo130qptNV34zLQRan
	mq4m5D7H/W1eqJlAu0fQBru4RWt3gRej2HFK9VE2gQFnO9LwUbd6apgBcJZLQW7Yy2Q15CX2L2n2F
	LPZicvxnaiaYb24nddgLbacbwjZ4ESAEeKMN547AI7wTn/uwdnCEnoxiaKnhNqUl1HfZTKNOadi6j
	nvIZ8sEQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thEZk-00027w-Eh; Sun, 09 Feb 2025 22:10:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
Date: Sun, 09 Feb 2025 22:10:47 +0100
Message-ID: <4315116.iIbC2pHGDl@diego>
In-Reply-To: <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_131049_856851_427F9FBD 
X-CRM114-Status: GOOD (  17.40  )
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

Hi Mark,

Am Montag, 20. Januar 2025, 10:01:27 MEZ schrieb Alexey Charkov:
> Add a compatible string for SPDIF on RK3588, which is similar to the
> one on RK3568.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>

as the binding is more in the driver-realm, is this patch still
somewhere on your radar?

Thanks a lot
Heiko

> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> index c3c989ef2a2c81eba73fae3d1ee4bfd18a8e5d29..32dea7392e8d49fc6402a64fc9f7115a47a8b8ad 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> @@ -31,6 +31,10 @@ properties:
>                - rockchip,rk3288-spdif
>                - rockchip,rk3308-spdif
>            - const: rockchip,rk3066-spdif
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-spdif
> +          - const: rockchip,rk3568-spdif
>  
>    reg:
>      maxItems: 1
> 
> 





