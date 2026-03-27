Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B210F287A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7GPS/nSwXZJvO5+VimqZ1lyXRzJdKX6ostzDGJqGJs=; b=VEIebM/A19uUAdes3TRSKArIxy
	NOIZzwDi8Qy9/a2zOXPA2cVkwTKuZ7Ktk+ksEiZ9McRULywvdFkiI3m8AGgjL8QYlFnIhnOvJXF0G
	SR0ywk0yf4mlIxlzXKN8RKUjoCr+LaB/mLJBK/8UlcCppgw/kkZadu8njMNIKVpjJV8eKGjPH38Lt
	WdYxOurEvJYh2NG9aDsK2jqDjmhKrMVIkw8gL9140+dqppWy+kggjGo4lIZ+AmHW2PHMklwdUxYiZ
	Yb+plpG11m4EPT5+NoHl9hBwTtv7BYFnwyFy6H+Lgj6Xag5mx6QmW8DHKu/6AedY1kRzS+QlRlrge
	R9xdelLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H3h-00000008LTc-0clc;
	Fri, 27 Mar 2026 23:57:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H3c-00000008LTR-09C2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDB7C60054;
	Fri, 27 Mar 2026 23:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3039CC19423;
	Fri, 27 Mar 2026 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774655858;
	bh=Z+C8Mr4hj+VYbGJqXZdYRUnzSM8Qlb01FQjNN5N+BOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTgne21xOaYvvb+nnAEAw5491NkIbOxQPYRt+X6VCCHA0obAey3BuWF9sF6/Kq08u
	 tKtyzViSGHrVgnbSHyvpQqEfY53dSULcDG+rhSdXfQ8JzkwpIA+Sg/BGW7m2k27OdT
	 x7a71BsuHmMQRtN55R4G52eoi3ApT2yFHfcO9AIezSVcyKdh9Ewl5fYs7niRUv0i8s
	 /VUJi3DTTzGhNQCNN4Q9BW5Bw3Upv3CtPTRP7X+XAfxLBn5WJXopQweoJC3iW77JwZ
	 0dzmr59C+PAp5yKzHYulVbbjh4TMo44pHNTJqU9bSUixZ7T71gQg9q8bEDQB95y7KL
	 7zp1jzLmZCedQ==
Date: Sat, 28 Mar 2026 00:57:35 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Marc Dietrich <marvin24@gmx.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: tegra: paz00: configure WiFi rfkill switch
 through device tree
Message-ID: <accZZt67giPEzj-_@orome>
References: <acRtWZohqfDLbMKE@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k2pxdycxeywdal76"
Content-Disposition: inline
In-Reply-To: <acRtWZohqfDLbMKE@google.com>
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


--k2pxdycxeywdal76
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] ARM: tegra: paz00: configure WiFi rfkill switch
 through device tree
MIME-Version: 1.0

On Wed, Mar 25, 2026 at 04:29:54PM -0700, Dmitry Torokhov wrote:
> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
> device can be instantiated via device tree.
>=20
> Add the declaration there and drop board-paz00.c file and relevant
> Makefile fragments.
>=20
> Tested-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> V2:
> - added Marc's Tested-by
>=20
> V1:
> - https://lore.kernel.org/r/aY_BpRQmLdqOOW2K@google.com
>=20
>  arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
>  arch/arm/mach-tegra/Makefile               |  2 -
>  arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
>  arch/arm/mach-tegra/board.h                |  2 -
>  arch/arm/mach-tegra/tegra.c                |  4 --
>  5 files changed, 8 insertions(+), 64 deletions(-)

Applied, thanks.

Thierry

--k2pxdycxeywdal76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnHGW8ACgkQ3SOs138+
s6HglBAAnTw+fnmUs12ZT3O/1Qbn2VfbBJakXecAJqbKWkFn9a9zNmUHXJJKpE5l
0NCzuPyvd/VUEqhc6ns2TyhLs+BeYNo+7Hb7YRm1W+CmJZ1yO8RSqdpxkhvnzVyL
Szi/kyDzThyrodQ9bXPBsPJZKkQiFJ0saIBzLn3GCYa7a1MAJjU9NYuyPlv9PmDv
ftnODDAzKFLNdAc/JWut7AbmtjzeBjflOLo8waSQ8nru30AZucdAUSYM3GuJmlha
dIzp7eKVeQPMol1O0q7HEKfMYu8B7U4H5sD1aeZeAKwK4tEJXFkwaz6h12+4aBC+
Q69obhtTjNDIeZxFGs3qqvE9aYH6nqEB90OOK3uCQvwfJKAvqPD0eSXN4tfSbB4F
ZWzVXfYZrfQWASKc92VPonNmoI21hl4HgrdE7Ci9nzsRS2jBseAI8n7KrPBfsrh2
BAsa8JNPpkoarcfkaJi5L1/aU/fCPhpPS47HBkQKeRFFKaqaWxXNSUO+hVg53T2D
qcHKlxCfFfVaAYTUUcfLBCWrQIXKBvQe5Ztq7ZT/9SI95Kh74Gl1oRL7MB88veYq
w8vQP98X1p+K+tGkKR4KRtSOMM/p0/PcVP8Mq+s3l5Y4B+flLsEuBGQg1McxygpJ
C8izn2Yldh3b/TJxp8+IgWW2uOmJwx7WQu8t4IO9P7TcPFx6HPs=
=ULwY
-----END PGP SIGNATURE-----

--k2pxdycxeywdal76--

