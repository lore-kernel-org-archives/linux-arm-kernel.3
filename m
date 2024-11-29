Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE6AD70E02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 01:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmMKY/Oj/jjqMrJUIcH3+phSKvYFmPty+voQ6MlloaY=; b=txYfa7AeQLOA2cT18VbHxom7I2
	wq811ZSeyCvUNo0/b8UGQ0vchBNCLWoAq1FsoaS97AiOxp2PWoB3Pi8OpACexhpmv4JhjzLrm9T3r
	rlzABKnw4t3gx0C369y36I1Ndy0jGdQ9u1Y560gBep6J/eKE1I6U4ZyC0hC9n78FNf+1E5tV6n7fO
	EQDb9t+VGwpiDyHnzZk+tCtAXURCi+h29gM+CZ3nLYZCAhL5FBn3jQ9pbs3fa5FioL+VOWh0SyCnd
	72PXDx6gPBx1XG/T6kNTSEcZMVf6t32oprl/42r5qE9pF4UzTgf3aRKVswzhKi8FassrzPS+G02wv
	938A4Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqAR-0000000GhYF-16gN;
	Fri, 29 Nov 2024 01:51:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq9Q-0000000GhPt-3eSn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FmMK
	Y/Oj/jjqMrJUIcH3+phSKvYFmPty+voQ6MlloaY=; b=C9utPXhlHwXD/Q4eZV8T
	P2sbUZYQQgKbVEg5ymUS/amx6+P3b1z9Jc9x/zcbe3eZ4k8Ogluqql7z09qX4Jpc
	H1KpEbRX237MZvO1FXs4LYCfYiap73MPpssZkQcdf7zJ2NRwBPj+Wl5WsnLMD9MK
	UAdTbOpsVL4HhXyOxa9BsrtWAcEgmVacRxFQNV6xZYYTZgBR2c78ZiR9LXmfOKxx
	SyTgUZmQk6EldHnsT37lxZCMN61X7ZeMH0AmVNf1GUnxUCK4UIHGvFDd1X1Hvmh3
	4Ct7BXloQe/jiOF+VVyH5pqifm1UlBJPIgOefPaBunyjQPaK5memOnn38cxzWJte
	Iw==
Received: (qmail 1195180 invoked from network); 29 Nov 2024 02:50:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2024 02:50:23 +0100
X-UD-Smtp-Session: l3s3148p1@Q/oHbAMo5ptehhYU
Date: Fri, 29 Nov 2024 02:50:22 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] of: base: Document prefix argument for
 of_get_next_child_with_prefix()
Message-ID: <Z0kd3qyjdxvylAyT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20241128042632.231308-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xUozA/03lxhy0E1l"
Content-Disposition: inline
In-Reply-To: <20241128042632.231308-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_175033_771390_F9488AE4 
X-CRM114-Status: GOOD (  10.86  )
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


--xUozA/03lxhy0E1l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 12:26:30PM +0800, Chen-Yu Tsai wrote:
> When of_get_next_child_with_prefix() was added, the prefix argument was
> left undocumented. This caused a new warning to be generated during the
> kerneldoc build process:
>=20
>  drivers/of/base.c:661: warning: Function parameter or struct member 'pre=
fix'
>  	not described in 'of_get_next_child_with_prefix'
>=20
> Properly document the argument to fix this.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411280010.KGSDBOUE-lkp@i=
ntel.com/
> Fixes: 1fcc67e3a354 ("of: base: Add for_each_child_of_node_with_prefix()")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied to for-mergewindow, thanks!


--xUozA/03lxhy0E1l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdJHdoACgkQFA3kzBSg
Kbb6Wg/+MP5w1tvWSlECiUKPN20ozPr6Ka8tXeaWCrYBKKDQE5oaAXdDq79CmPX8
gToQ36xFA8EUotajUJBmZwfJzl3riZtMmJ2PYHYzpyxNIYlO+DNOX3DPhMsBj2A5
kuFRKsXZjh9inawLQtRXSoPzwSuR6x6mjmSVFBnWXCDI18e5wlmnZkQwT+IzRo0p
ceA8nyfL0KdVX0tfsc7gUZgrHmquz9kYz4Nhl4Eq9yk7zyGTrf+INxsVBycGCo9K
IDjCJSvZw0uPnvwc5iPdPEdiPPED8b0dD6GJr9GvZiCPdmqSj94wD9MYaMNF9oWk
552MZwpFqT53ooD31HKlkpaOzaB7ABxeDXaOaRMyv1yzU9yorB/O+cg2nyAyuU5P
+I67b5tiUmtRRDzZYv1G3Iy8P2aI1CozXV6M4IIOs6andqQ5UsGIxL7RlYxi5ZQu
JB6CPQytjV4vGBTeMCAhBJw/3QFHx5OhYTCmHjjgFF0COdwTN47qhAc64GxXL+tc
sgxQM1laQk1vJEIbpvRceLq8uZF7do80/3ftz/gdQRT6ECzSLPsjKtX6H7jwvyao
uQJ7yzMiz3LTkHwNKLQYeETtq8fa1+lQY3AqXdwvelJ2c8O9X7c3MkwkCqsjlGpH
ZoVODiRTJfiyz7bzty9NnX3CwM6WfYIJmPBy8j1crl3M2ohtAtc=
=hSwP
-----END PGP SIGNATURE-----

--xUozA/03lxhy0E1l--

