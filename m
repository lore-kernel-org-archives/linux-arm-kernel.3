Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CDDC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gz9eTvxySOAidbfF+XVurn4K+ODgENp+87ljtrx58Lo=; b=Vf/ZFPrxATlGXbXZjR6SVwZsYQ
	weeDGx0L3TKTuMsgGYol8fDLE2l2gzsRKiQxLKyDrMPi3/vpHtF43iyszGyuH+K9YvmKHAAlor9q/
	Xh/L2/N9/x0YYEEGjn5Qn7FHhT1JKU04rhX7QWu4W1oqx8ZmoU0mzIcXSk0zUTGkH3Ps9xFlk+HYu
	Rw4B6c1+khIfYfq5CpQpd83RbA/JlJGFE9BHw0z8tRA28+wYDSltCybjDs6X7OjK9tGu7t59VATIs
	QdibKWsFxvlKoz1EwCG+PsY+txupaOtgLdx9wlwhkj3VCFDqe58FzaU+zAJ5ufhBagNEkArmGRmhD
	60fA4K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgPm-00000003Psj-3gQg;
	Mon, 10 Mar 2025 16:55:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trg9a-00000003Mly-1jMB;
	Mon, 10 Mar 2025 16:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C64385C672E;
	Mon, 10 Mar 2025 16:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA865C4CEE5;
	Mon, 10 Mar 2025 16:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741624737;
	bh=IWvNhk3alqBkKhFhNbB9Ip8DmjSWG5Z1yAYgQA1qk/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5F8LiPb6IMR+i6b0xnHy61Sh7xnP8dNL6xlfD3p1+Vz/5ir+ZehR4UVFa9FzZFFB
	 th4QfuW8y6YCoufZgfCucRDyG9UKsVsxXexOMZuwWUYg+92ryvRAOmuZeioG3Q6jL5
	 A7HugzuFWlnWAxpH/1wSF01ipn1T/qHOHxQzCPfw1EJvtNbm8t9tsHkKhI60OKrBra
	 KxqxB6/yuD21RQVjCmvDhI+rEp0poQY4QznEmTjS6hC9fnJr9b6bhIuBxnLCozYp9X
	 IFhv5jfgPjBPjmpiBX2/4l/MOC6YBxXlCWRqmZfHYuFpOnRxvkQz4g1cXBtfrCsutt
	 XGI11CNCxQ1hg==
Date: Mon, 10 Mar 2025 16:38:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string
 for RK3528
Message-ID: <20250310-tidy-passable-434c473861a6@spud>
References: <20250309070603.35254-1-ziyao@disroot.org>
 <20250309070603.35254-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t70f0xBAOBC9N4NB"
Content-Disposition: inline
In-Reply-To: <20250309070603.35254-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_093858_502922_6AEF66B9 
X-CRM114-Status: GOOD (  13.91  )
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


--t70f0xBAOBC9N4NB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 09, 2025 at 07:06:01AM +0000, Yao Zi wrote:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Docume=
ntation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index a9dae5b52f28..259770b1aa08 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -37,6 +37,7 @@ properties:
>                - rockchip,px30-i2c
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
> +              - rockchip,rk3528-i2c
>                - rockchip,rk3568-i2c
>                - rockchip,rk3576-i2c
>                - rockchip,rk3588-i2c
> --=20
> 2.48.1
>=20

--t70f0xBAOBC9N4NB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ88VnAAKCRB4tDGHoIJi
0g7KAQCX8LQzI7F76ogrQQyJQ8ZKll5YFYoR+50BLXS5RprrMQEApxbq77XDuAUD
8wcWFI82HpSSD5Hi4Jfec3VI8glOmQY=
=jdhP
-----END PGP SIGNATURE-----

--t70f0xBAOBC9N4NB--

