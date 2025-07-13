Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E10C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyweeKyT9s5/PpwNqIa2ri7jL7PGqvs1hJzN9Csu3F8=; b=vqQxAsTjI9SKTQ3I2wIcj3n1i0
	nmp1XR9vIi5lC8HNy9ccBq+amHPd6V1AiddvtspH2ClKMQYie0c07EzQ5PToWgaf6u+d5gtTupLZ6
	qojTv6AntKTsXdH9lYZjMbaiDXPKCCxgX8TEV7sex+3FJuUrZ/ld+1Jr8EJoWEXoQKIRl/cuL4KIb
	KytIgE+Mkx+kB3VrBRJifa+gl54eouWUlGeAtyQcuQdMdRqPBTBJjUJGVbRGZQHSZJwW0JgrSb0w/
	kA33+k+nxrsyenRxskMB7yMZ97WKooPaCRc8k4i0hiFJYh+ajom2Npr/+jrZfLuwM90foHPZfn4cg
	cJc+PWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1vU-00000000Wb1-0hyf;
	Sun, 13 Jul 2025 18:59:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1t5-00000000WVS-32RR;
	Sun, 13 Jul 2025 18:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pyweeKyT9s5/PpwNqIa2ri7jL7PGqvs1hJzN9Csu3F8=; b=ygWEkd0rt530a80fVyY4JBGjfq
	wEg1cfvHUY79TYH8myZs57Zej6WOk0MiOsRI+aCGcgkhg+8qPIumSmyx90TC0ECZTtzA6dxgkdSYq
	d0lPkbn+Fs6iLAr4/jwIq0k7wQMI6Hxa1ZKvvNv2kDUonWA89qhGQUCb+xJ358OZXWaDKLxNoLs93
	J/w8UZAHhSBKGC4BpGPmDuGhsTWaJaK53C3ntHS++lw7aYON25R0rD2zpmW5zuuQYD5WCWjtWjS5P
	NChiv7AAcFHOYpYGPQH6XSlQIN6d68zZjB8c/inMNXkIcUDFd+KYCQms7YaHS7VHDUXB25mEBDeqi
	Cr5bL0Iw==;
Received: from i53875bea.versanet.de ([83.135.91.234] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ub1si-0001Dc-Tj; Sun, 13 Jul 2025 20:57:00 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, dsimic@manjaro.org, naoki@radxa.com,
 Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Jun Yan <jerrysteve1101@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing
 Technologies Co., Ltd.
Date: Sun, 13 Jul 2025 20:57:00 +0200
Message-ID: <5772394.qSoW2BAyJ8@diego>
In-Reply-To: <20250713163255.163669-2-jerrysteve1101@gmail.com>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
 <20250713163255.163669-2-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_115723_787665_4EB380D8 
X-CRM114-Status: GOOD (  12.06  )
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

Am Sonntag, 13. Juli 2025, 18:32:53 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Jun Yan:
> OneThing is a company engaged in edge computing.
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5d2a7a8d3ac6..77fbbe040706 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1108,6 +1108,8 @@ patternProperties:
>      description: OLIMEX Ltd.
>    "^olpc,.*":
>      description: One Laptop Per Child
> +  "^onething,.*":
> +    descriotion: Shenzhen OneThing Technologies Co., Ltd.

as Rob's bot pointed out, there is a typo in "description".

Also please make sure to sort entries alphabetically, "T" comes after "P"
(=3D onething after oneplus)

>    "^oneplus,.*":
>      description: OnePlus Technology (Shenzhen) Co., Ltd.
>    "^onie,.*":
>=20





