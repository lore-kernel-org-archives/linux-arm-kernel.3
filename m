Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCBDD591AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IQ+/qlAPIVtK5c7UjGrT6bzGc6QP7fuCo5yCioqtvA=; b=hTXtUDOUwx8Li3M2aUyAOm5Xr6
	gSINFUxXh3uGViQkqf5IwlBPYhmXgJ3BjKy6zUUaakgINNeHFy88Z3AVEPwMDV7uUXFDjxhURaBOx
	Vob/FUIdZ6T76cGMXL9HtvKCNvTvXkIEJWdfeni8NJV6aVDrCqOn5dVjV176Wo2VfpPh0kcnAZsBk
	5CxjEvVV8nIWZWxpQM3kaLQhGPi3mYoT6WEE6Amyh7uL4gjHPNY0LiN8RBu2YwUXoiY2d9m3Ngscc
	SjPkbUTR1rI4jBKAw3euwgVkpf6egPCcLA2ftdXT4EI85C7p+9BrhER6KuLeWQZGhZv9+78+GywD2
	2P9r6G1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD7XK-0000000ATX6-14c1;
	Mon, 18 Nov 2024 19:35:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD7WM-0000000ATMm-0jPm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 19:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4IQ+
	/qlAPIVtK5c7UjGrT6bzGc6QP7fuCo5yCioqtvA=; b=ZJWU0pTsUmezyoO4QRFD
	ksMkot+jJiGIlXObDkvBnyK5AKBRDtoUalHtoVVqTCuuK7roE93EuoikoAUgV0MV
	GDhFoF9RswTk+f+bRYrXq3R8Jn1J/ky9yiYt3i0jq8G7Nx8bUzl5KSPba4mc783B
	jpALQMKrUTYSBbTJoqifzjqNiMQApvYN6Ql0DDFbXuJy5GZNH6WlFgiHNXoKzhsa
	puMblOHBgIFuz+csH+LOYOZ7gXrGpHje6pl2MgMr3W+6H2mm0GtRYwB2sbdhs6LB
	DO4+ZwZD8jTCCPs1YktaaZeMioDVoaPflm6m0PoGBPIZ/TlKUPNUTtsXcXH5aZQq
	hg==
Received: (qmail 320855 invoked from network); 18 Nov 2024 20:34:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 20:34:45 +0100
X-UD-Smtp-Session: l3s3148p1@zKZMAjUngr4ujntT
Date: Mon, 18 Nov 2024 20:34:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-kernel@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/15] coresight: etm4x: don't include 'pm_wakeup.h'
 directly
Message-ID: <ZzuW1Gh8ULYurUKH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-5-wsa+renesas@sang-engineering.com>
 <ea311a21-959d-4985-9364-7c85d256ab09@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WVupqj1J1l+LAVq0"
Content-Disposition: inline
In-Reply-To: <ea311a21-959d-4985-9364-7c85d256ab09@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_113451_073775_A327E066 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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


--WVupqj1J1l+LAVq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> If you plan to take this as a collection outside of CoreSight tree,
>=20
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>=20
> Otherwise, I can pick this up.

As stated in the cover letter, please pick it up. There are no
dependencies.


--WVupqj1J1l+LAVq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc7ltAACgkQFA3kzBSg
KbajBw/+Iw5lYdddTN921JDSBexKi7CMET5BgZ+xmLzXHFZG94SwxZazKIKgLGRj
jKdD91uGgFgxZo+W092wF+rMcA1AhCzwFhwIeJbf+yOXJuDUKtlqsD/PypPyWZkK
2OhNgbM+czo6FLrBGpwYdRjmmhRwkGJVzpNxJiK6EEK14e5ih5h0u9cbri2YZxe/
XU2cQ7KrbMenAum5xy/t3dBIWBQRNbaAVWVuf25vGta0dKC1+MrAd4vxvz0sQlVc
r9m+uC05Y8rzvOvi33KijYkwF2Tv6/S0onG5zE9ODUAMT5VqCAht+DBwbIEwc+D6
uUvzcGxnfYv5x77JnCgnf5oPeoJGe6u4xSq7xZ9NsdL+SN9TumpBrlA6wp3Ue/te
Fy0mFcKOfkrfuDRYFrfczsew5KJ4Gj5CBVxgbw1/860Fs/gKZ4uu5cU5Pgl0+GbX
92nXHFMAoIYQ/XOFH6AdxbEfloI42kbDxTeIZ+AmanY1eCMcAZ2l3eQxMCX9gMTM
dRRAZPkO7PtJwRCCcsbxR9Wq0VXKQ4dvaRB6NOl/C53IiI/lJTzw96jlYG70ne6c
MQp6lbm7xbUA2VrdZayFbE/A5Ym9rMG1XNCaFPcNU+c5HjqZB93EB8SRmYjlj7SS
2j9RkQP9YoyIn2sBcc+fInrTH71/V3koiAMKOQdT2kZh2PKjWcw=
=madr
-----END PGP SIGNATURE-----

--WVupqj1J1l+LAVq0--

