Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4202D29C41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Adoni7U+JW+6kxJbdBVTTUo4httHbZfwZ7r5Q7Hb+3k=; b=AeYONehk55t1s7tL6S/8mOIP2M
	REv57k5RSNyRYR6uhGarSlA6KwTCh23kBqyZLfibsCdVL0PZ8rjH1ztPbJzzX0S2PAzNixn0MOF+u
	piR1RhqVTzQlSpcy6wWZ6MO1fjCTOwOpWJ3d07skjOWI33r2X+7pLEagj/gCDLGr2oWU3Okib3ZLA
	yowP1i4knWpcURmkHJJlRcBsA6nzpFr0sISFISKb7+Y8+BHNp/lGlXab+NOHQZjIlZhAcdlXy4P3P
	ewwne2C2oci2cwmnV1pBJFl6uAh9iYzyYfCP3hQqzoGL+80X97NkGquHIxw8TFCcSHFpwjVTB96ac
	6MsVi+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs4C-00000002SqN-2cfI;
	Mon, 19 Jan 2026 16:25:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs49-00000002Spq-0riN;
	Mon, 19 Jan 2026 16:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Adoni7U+JW+6kxJbdBVTTUo4httHbZfwZ7r5Q7Hb+3k=; b=JL8WPY7PEAqqGVghwhfEYiwWrd
	s7NsOacr2rsNLKYDp+X/zzYW5h04Y+qd1XsTOHPYv1+hateqfuv5P0r45Jcr32MUHQyctqDJ5NZ64
	qMfkRMdUuFRS813BlrIJylPgUkB0qPwl+ia5Ml6l6lXZCGNzbeukgt6EjbGfo44WIopPzZutDsvnu
	VlCWHmNVrZw9z8+DExW561p+z0hR6ThWR05rH2knHopSKnhRDQwZEXUm1TJWvwxDrhHcgnOblmWMx
	vAhJzlYIAi5nELcGuRLb0gYglQrfJZcL/3nbP1EPFtCDkrzTVB4E4ymeYEF/ExXxxJ/M7y5JMAcWc
	nfFU3McQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs46-0000000CVXD-11oo;
	Mon, 19 Jan 2026 16:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7137409B5;
	Mon, 19 Jan 2026 16:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194ABC116C6;
	Mon, 19 Jan 2026 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839916;
	bh=j/bkmTbmdLODJy0m+kOcEDtfSshRy8Al7VaLx1xfKJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzbJZ/sqPK8LZRcCfK51VFqYITs/eIxzmFOUtQilWMFyOJ00K3WUpz8ZAoHulGn6K
	 H/TElTzNjkmK0Z+BGhA3Qxikhtkcn5P8hKn+BWHZrSiv3XzttLCKldRlxTkRAboz0I
	 ETo22/0US7qS+tlmH0kSyT8OQK6DK7dCO9/mPjxBm5SNzRT5Mb2oNnrkGePvbVLb64
	 SPwpB5BGGNRUeE3tajkVVwOgQzvoUXcPzm/pn6KvB+85TgxQ2ay/4813PIzwl8Dp6t
	 y394XHTa2lUY/StJ7Bi32OhsKOSLwCM20ci6cyN4xUNjpqdkcbDisJN9bwu5Jitlx+
	 WrgtroedJn2TQ==
Date: Mon, 19 Jan 2026 16:25:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Aishwarya TCV <Aishwarya.TCV@arm.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	"xuhui.lin@rock-chips.com" <xuhui.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip: Use plain request_irq()
Message-ID: <4406022b-11b5-4622-9662-5c3ba054e5ea@sirena.org.uk>
References: <20260116-spi-rockchip-threaded-irq-v1-1-c45c3a5a38b1@kernel.org>
 <f8658bd7-7381-4770-935a-6a98ea3f652f@rock-chips.com>
 <a5b6c607-9b8c-4fa6-98c5-6ba848f7f2e2@sirena.org.uk>
 <9c9d2fa3-46f3-43e6-95d0-6b5ec6b6ea78@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hDOzrXk8FzfWLT2w"
Content-Disposition: inline
In-Reply-To: <9c9d2fa3-46f3-43e6-95d0-6b5ec6b6ea78@rock-chips.com>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_162518_565699_43474A4D 
X-CRM114-Status: GOOD (  15.19  )
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


--hDOzrXk8FzfWLT2w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 10:10:09AM +0800, Shawn Lin wrote:
> =E5=9C=A8 2026/01/16 =E6=98=9F=E6=9C=9F=E4=BA=94 23:37, Mark Brown =E5=86=
=99=E9=81=93:

> > TBH it looked to me more like there'd been some deferral of more complex
> > work at some point but that didn't make it into the final code.  In

> Ah, indeed=EF=BC=8Crockchip_spi_isr() directly performs R/W pio in hardirq
> context which doesn't seem advisable, so probably some better
> improvement is needed in the furture. Anyway, fix the warning right
> now as $subject patch looks sensible:

Generally the best pattern with this stuff is to do PIO in process
context - it looks like the driver already has a copybreak to use DMA
for larger transfers on systems that have DMA support so this should
only be happening for very short transfers in which case the context
thrashing from going to interrupt context is probably hurting
performance anyway.

--hDOzrXk8FzfWLT2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluWucACgkQJNaLcl1U
h9BGTAf8DqPxL9iRh4yImrQOrl1QKw9rS96zsLVc8Wb0wPJLTBUwuc+vX24CW1qG
VbTXj7VulzvEMMLPPVu6MVFlOnUIeblYoyqIhvBx1BwBT6glaHECSlA/aoofxURZ
QBKQxeTpqT1kJXz4BUnh9XPAwKc9rkDbLs849tvzFvuvq0Z9xk27Zq1U96YQCYgO
8O4pShgAfU19mJUrSWltRw6EDMuNO2fCfPquUC3mqswLijINccPM9F0B71AhYAyb
/vLRsZuI+TUpLwy7oNa7iZH97+gR3sIV/eunD24GgC1fAt91pFU2YTpxzsl6bdcw
VPMiZK4jJxbF8PsPUVpZFtazIyswog==
=+Uas
-----END PGP SIGNATURE-----

--hDOzrXk8FzfWLT2w--

