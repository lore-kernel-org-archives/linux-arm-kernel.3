Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E04CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0Hch7OiXKFVL9PJtBagkKejRb0RaDNA40bNxA65fj8=; b=He9k5K+GBYlWEktDN2cUqQA1Zr
	VZ2/vacYh27k9tRYEtiTvs9PJMqitKl9vt6VuTY7+WwIVscjvyRlWKv+USChPG7a2PA+ipyduCnkd
	4mLiR7CDOC4Oy8xL70/QQ3tfPcC77CifA0qClLuR7OwPhhRJ/fcrRYpO0+bWZvcwSj8auMEKc1znV
	bbzC5Az4DgyierFrnnueEpuTpZ8jJVveBRUpCgQ2iWVHVZdzeehVfqgdwV16spSMyubk2521Gs/da
	LFU8M0GoPh0hwd/95/+83PQ5ELJSTIK7sE11nRTw2ZG3Zvo0n3nu9Jcrf04LQ9MPZiu9f6GzGx8th
	NU5oHnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP09-00000002CBG-0WPS;
	Wed, 07 Oct 2026 10:35:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEP06-00000002CA1-16h4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:35:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6830760218;
	Wed,  7 Oct 2026 10:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D4A1F0089E;
	Wed,  7 Oct 2026 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369353;
	bh=j0Hch7OiXKFVL9PJtBagkKejRb0RaDNA40bNxA65fj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bupQdlyWlpwR7HfvzVeWU744sdawNFdMx+a2KcAKbXoVZODSlCraPTHY38+VS95DH
	 rc9h5ECSxzpMUBQa0Vk435DIw3KSXD//OwUNHhXEY65HK0McTqgMsf/bCawCIIm8tz
	 fxF6Cggz9Xd+Rh7CMidpqd+WQd3NS7uc6RZ4ZwJSCzVSyY46YzaivpfYzC+hLYjEfD
	 jDjLLzbnnGWskKnU9Kgjr7oC8hYbvphQ/GfR7ZkFBSSgRPjMz5GxBTSya7MZt9Lov4
	 DN0W1sZ2XWo+rvbwNUp9uhuEdHLwYfzgnzFvXuHUyI97i0tsEUdald5fLlUO/fvhmc
	 3mpedvjDlesWQ==
Date: Wed, 7 Oct 2026 11:35:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor
 prefix
Message-ID: <20261007-92e855de534df44fbf665e4f@squawk>
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QUTSUWkAe13RUNYF"
Content-Disposition: inline
In-Reply-To: <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
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

--QUTSUWkAe13RUNYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 01:33:06AM +0800, Pufan Jin wrote:
> Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
> Co., Ltd.).

Where does this ALINX come from? Website url?

>=20
> Signed-off-by: Pufan Jin <2254650260@qq.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969..97e7ef340 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -90,6 +90,8 @@ patternProperties:
>      description: AlgolTek, Inc.
>    "^alientek,.*":
>      description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
> +  "^alinx,.*":
> +    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
>    "^allegro,.*":
>      description: Allegro DVT
>    "^allegromicro,.*":
> --=20
> 2.55.0
>=20

--QUTSUWkAe13RUNYF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYghAAKCRB4tDGHoIJi
0r3uAQDX2D3jt0hLUbjRyv+0v3F/Qa1cIP5/vxVU5mzQR2palwEA35o0Z9cu6onr
/jo2K0I9EASfEsj3+5x3Ql838iQ9TQU=
=QWdH
-----END PGP SIGNATURE-----

--QUTSUWkAe13RUNYF--

