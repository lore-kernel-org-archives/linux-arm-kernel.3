Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F789C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dl9g1rS3GGzgAfBdc0mn2zOFZtimZGKXQWHRcPkd/uU=; b=ULgN1ZUDmN4/uQyxs6N+iajq5a
	G2hgr7LbBCAr6RVRv3sDuljjgdYKw6yjgxK55hWCWy5IpJz4BlRosceqIy5pyA1sE/IyAGryLJOsh
	gM0jcBOD4TOtYKivrzH6C2sydJP5lni10a7q4dHPYe9BP+Dd1tUQQmXSMHOGORV7qtshINjs6Xkwk
	bAsCDIVSRptPuVaLXGXSPi3k/dzXdPnKhTp4/yAD7JVCzzZPrC2O7lMuZqC/rZt+d9rIhTTB0o3Ka
	/SlhPJJ1f0IBNshaeOvT70eXIvHWVqtodp/RK4lR/Rl4uIciOZZ9uHXRXTF8WjEYyIyGarPlGqZkT
	c8YoTD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to9HG-0000000Cubs-0BiR;
	Fri, 28 Feb 2025 22:56:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to9Fi-0000000CuOt-1LmW;
	Fri, 28 Feb 2025 22:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DFCD5C0095;
	Fri, 28 Feb 2025 22:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365D4C4CEE5;
	Fri, 28 Feb 2025 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740783280;
	bh=9/BEXh6bZ8n930l+zITwwGD3TVUqcE/AjCK/PLv0gB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nX/j+gbKMT3qpqycuWs1FLkNZM513VJA/ubbB3ELLAIas2x/UEUSHjmElCnSZJM+3
	 /foNfRWpibRmmI3jmjSJc/yiXsDYGs9ECi4XlrIOly7Pbrfoahe/tpjpPy6tJafgbB
	 CtwoIvOOl4cpjJrRGp/q/nmvxdj85NIeDRMwGEZvU64I3sgYW7+O4tihMU4aVJ5Y3O
	 UU0VxqFdtTGot5sUZKk0BX/4EQx59SwSTYP3i74aIEHCT6RSeoa6kxI2leO3AGhSKY
	 74+5nSVfV6Rh7RsE+AI5kEI1cFEQ2gOGKz6Ors36uE92f9osGZlLU/utjaXgBx5/Bw
	 tGDKtrPA5UAxg==
Date: Fri, 28 Feb 2025 23:54:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/15] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
Message-ID: <hmqehlztyrudpdkc46afqvgwg2jpanaprru25qxacnmna7tkha@ifz73s2oiqiq>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
 <20250227111913.2344207-11-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7eve6skvx3pjfnjm"
Content-Disposition: inline
In-Reply-To: <20250227111913.2344207-11-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_145442_403155_4FB8C8C8 
X-CRM114-Status: GOOD (  15.60  )
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


--7eve6skvx3pjfnjm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 10/15] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
MIME-Version: 1.0

Hello,

On Thu, Feb 27, 2025 at 07:19:08PM +0800, Kever Yang wrote:
> The PWM core on Rockchip's RK3562 is the same as the one already
> included in RK3328. Extend the binding accordingly to allow
>=20
> 	compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
> ---
>=20
> Changes in v3:
> - Update the commit message and collect the Acked-by tag.
>=20
> Changes in v2: None
>=20
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Do=
cumentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> index 65bfb492b3a4..e4e1976c542d 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
> @@ -30,6 +30,7 @@ properties:
>            - enum:
>                - rockchip,px30-pwm
>                - rockchip,rk3308-pwm
> +              - rockchip,rk3562-pwm
>                - rockchip,rk3568-pwm
>                - rockchip,rk3588-pwm
>                - rockchip,rv1126-pwm

Applied with Rob's Ack to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards
Uwe

--7eve6skvx3pjfnjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfCPqsACgkQj4D7WH0S
/k5fwQf/bAS8biZKL+kTke5xko1/gSdfFCKIQh8hFMMkR1nephPx57Secam01izM
4hWWBXkLtnA/4WZXDXftApK2+vParfljyN43aL1aX7ZVEYJAofAHo/VgnA5B36dR
SJgT3Pj4I10+iF3mtX0miBBxT6GpSY+wbYnscXeU/V1iAt9SuF21MsSXBHYaKd12
RS1XdmCD9FskxIx67EqE4Uee7nlRAxlmYHRLrLc0RTHABK/hWPJstx3yPDqh57TS
xFMXo643/mz0yJzWSmEJ6wGtDv6YkK59WUbzZSUBXfODP6qMJmYu0MzOodI02qsQ
WnrZme04x/XgtigQkvtigVEy8JNqyw==
=8SAG
-----END PGP SIGNATURE-----

--7eve6skvx3pjfnjm--

