Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0B2C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmRIPpIqvkVAkrubDKFklVL04Xfv129vaIPgrm4Yy5k=; b=LiYRn/vUvu+eDORpqreXUP15Yv
	wvlWcvQ35cuZ4YSTkhJZelBetjGNMaZ4EE8jaAs9HdNNznF1yo/ZzwdA1N7Wfl3zgjetJkoW3sNB8
	aM7iJbzH5WgJZjD7CFcsVgA770YvZdGb5fZbqb8ONq/8hVphzUIb7BN+2eeSIV+lsn45ZEXvss/bO
	9awpk3+9BSXkVwtGEZAIzUSZ7ziDIkkmb8HRVQ4btLl0VaPXruvuNtIqX9Fgehnta0smkNO5RuE+g
	1jKAWYQCSjIiNJPdSX8P/u+oBtlX1iw4/vFvpnC/WWSTw9xQGEKJOvO8ZMx2WIbKekx1wOoMP5Bq0
	osyqloxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDaT-0000000B8fY-44ee;
	Tue, 06 May 2025 08:23:37 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDYW-0000000B8W8-4BmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gmRI
	PpIqvkVAkrubDKFklVL04Xfv129vaIPgrm4Yy5k=; b=BE8MOvP6igWh7P2kHM9r
	qvWEmpQ3ei/ovfOENWsoiB83JOmtFDfwPS+HLGCu11suxjOZL0Jyv4nSy+ztJFkd
	pyHN733ZwldAZt9PKHFndS9zLAE24PGF4KkFgCXqKjoO5275tnHLrQ7U4DaWrLy9
	rLTx5VZMmeu/hIrjLt0WviNa9TxQgGs5tSU5CIVxnPVc/P8sJ23mDISSaTfr0Bb2
	vsbFUHHZFCNjnFVp8a3H/ZT02laMgI/XkDxTig0hf09KHO9m3wjglnzTbKk8G1Ty
	vMz7BjSJrU9TeodUBC5h5zezahWroQ9yr7aOHC5OxO8HnefHk7MM8rzZlaCPkwyo
	SQ==
Received: (qmail 2842625 invoked from network); 6 May 2025 10:21:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2025 10:21:35 +0200
X-UD-Smtp-Session: l3s3148p1@hdn7TXM0umRtKPHL
Date: Tue, 6 May 2025 10:21:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Enable more support for
 RZN1D-DB/EB
Message-ID: <aBnGjaWcrTVZ7n4h@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hUvouY1iMcx/SUJd"
Content-Disposition: inline
In-Reply-To: <a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_012137_308661_EA893B97 
X-CRM114-Status: GOOD (  11.28  )
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


--hUvouY1iMcx/SUJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 02:16:13PM +0200, Geert Uytterhoeven wrote:
> Enable more support for the Renesas RZN1D-DB and RZN1D-EB development
> and expansion boards:
>   - Polled GPIO buttons (also used on the Marzen development board),
>   - Synopsys DesignWare I2C adapters,
>   - National Semiconductor LM75 sensors and compatibles (which requires
>     not disabling Hardware Monitoring support),
>   - Arasan SDHCI controllers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I overlooked this, sorry to be too late in the game. Still, this is
good, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hUvouY1iMcx/SUJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgZxokACgkQFA3kzBSg
KbYgeg/7BVULVbm4uhMi0fHNL6npTU2SfYMCFPXBvtdT9mDgYb6py41zD+HkDDJi
7eZq2rkL6otW7WMh8RPmhttu1XTVzdBw8qnlMn0UDJ+zE3rL44iKa2U0VsSaTPzr
OL00YNU7E+oxTnv3RyPyZTMTDHfApXuoRRGdHUGOFmsHNWTvv3TxnbFmeXjUJ1Th
+guJfhGeQDIndu5yCp3H8aNlr4Ym9828j3feNUyWDWzb3R66xH+gTHrNyxEQt61B
8Jrxp/iYJv8jyBAkVV6jskyP1clTtmwJBSorNTmkQuCL2rmELmwUz1wULtC856mj
kKutkR8InfEOQgPmBkn204tkVYozHX9cDGOB3ZHQCUVw2Ws3E+pLoZUOShdXErb/
XbpJMwah6WGwfGMnHfLUf+H64UtlasRImoyxAbSZnEKQ0+9L8vUerS92MMVPEX/N
qbv1dpVmb2uputlarDDk+ozhdC3Zyx/9XMpGVHauUauEiwP7YH7dWpiebwOeSeIr
mFpDXcrYb5Dg6zrZvYRGw3DWDzcpO7YzIprlq1FWM1SU/9nXvOS+LfyTi16CoL9Q
At5qvSTezaChkysw+Oz+/UrfhAowQJEm2bHtI8QB+Sm5DNds5Wgi0DiZY9S9RW2V
cqDbw+guK+iKzvYHkQ9qNQbYSj7cNXhd08A0ZtW1mgy2Y0igwDY=
=88Zw
-----END PGP SIGNATURE-----

--hUvouY1iMcx/SUJd--

