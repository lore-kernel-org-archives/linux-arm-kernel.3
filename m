Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF4ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mH0TyJv0Rw2BilhHEoAghVWVdkgLjNO77ffazY/dz80=; b=gdIJFKODHDqFaO1S65muu7TqBL
	wBq+HbIJTsJM4p/5IMeIHulvxVtXXuBZQxz1oQOj5f2AHT0+RyhjEGi3ABp/+kVObJDQv3gnKkV97
	c3sx5wyZ3gvySFy0BPloVuEbwIl9Q6x6EnImZ+0hDFI/kPlODS1Kcns+OLhh7zbJrD2TqXCVjqBhO
	YGf46v4c77jyrVBZoY+0DR3iOOmjjBDDR++TKYRWUHGmoQZLsd4Xmtw5NIS7UIg5TPJG4NzP5Jniz
	7X9EIV5UOHeTDzh4R+AAK3l2qrQwx+Kkd7Qx1GYg+H/+/rPBR3fV69CtgUGLV9wdxHmJjCeeshIf6
	9+uNCHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4WH-00000003Bz5-2z1T;
	Mon, 15 Sep 2025 08:25:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4WE-00000003ByZ-1EyB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9289C43538;
	Mon, 15 Sep 2025 08:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19164C4CEF1;
	Mon, 15 Sep 2025 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757924701;
	bh=pn3KOaP+bzbLsKtQz+c6VUe9G0WP+rbgfvOthuv4F4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKxBfeUv2uqV1gQyLnahEugBcH/mb/NVbnOoWodG89kEPsf/5+1ps2UyLzGa5/83Z
	 x7FYfyAV8Q4RPTsM7UHPzL34s5AzsX9sFV610inQVBfg5iIOSYKWnWzb/3SoIabgoo
	 JHohfo/x9gqwxaOFWb69mqiyCii4Y/cHmZkFm5rYFfseG8tjLD01A31epEQ70cfBX5
	 +1R6AiBfEnGuniN6iT/UUEuSJLG6/RaOSg7QyVnMI+hVi8QEF+mKxkSeQHwU97TtEX
	 GjRBL3bnRuc2zHP++54YfWR/9Lkm8jHUfT51gypkL1L+LcjUIDi0q9tIj7zcMAlLFL
	 EEtJfSTOOI6wA==
Date: Mon, 15 Sep 2025 10:24:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: pwm: samsung: add exynos8890 compatible
Message-ID: <b73vhk7jmt4pf2sr4oe56eum27fvydnvoc5q32qatbxrmoyknl@jl6afgispecg>
References: <20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mesynlqvfl7e7g6c"
Content-Disposition: inline
In-Reply-To: <20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_012502_357693_55652AB0 
X-CRM114-Status: GOOD (  14.08  )
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


--mesynlqvfl7e7g6c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] dt-bindings: pwm: samsung: add exynos8890 compatible
MIME-Version: 1.0

On Sun, Sep 14, 2025 at 04:20:33PM +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos8890-pwm compatible string to binding document.
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-samsung.yaml
> index 17a2b927a..97acbdec3 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> @@ -31,6 +31,7 @@ properties:
>            - enum:
>                - samsung,exynos5433-pwm
>                - samsung,exynos7-pwm
> +              - samsung,exynos8890-pwm
>                - samsung,exynosautov9-pwm
>                - samsung,exynosautov920-pwm
>                - tesla,fsd-pwm

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

as merge window material.

Best regards
Uwe

--mesynlqvfl7e7g6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjHzVgACgkQj4D7WH0S
/k6u8QgAhZqtoIqw0fwOzEGmM67GX0Tkhoe3lLucE4prNZn1m9W7wW5niWTxxW1b
hbpdAqLdakYKjvJq+y/U8BJ0QPVtFfXY26mVY64EdCo/bQz+jJ2bEA6jT0Z1Lv1z
/ZQOXiEx4TmMYi885zl0zBYb6wve0l0eQHzUs3+KdYTHYZ0M+LV32JxROUj2Ruk3
YmRgUDYTk5id5e0kTX9ozd9gSLpMBAEh1yHaIYiGW06U2KAcRf4uEgOp7R8yiJ2t
Ms1Viv0LDPjHUwQSxiajHosvp8DNbh1G42bOxuQnAbJGKW0jmFodjvBa8DU2QuOV
sjMF0001RDHuax8jphkJmHjXPIJI5Q==
=rd6b
-----END PGP SIGNATURE-----

--mesynlqvfl7e7g6c--

