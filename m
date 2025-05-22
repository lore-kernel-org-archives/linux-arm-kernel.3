Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD941C54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 03:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5969M2rt8A9H8jXyAe1CRFepbcBCsnguHNEWanyUaM=; b=KK8zgwtL1cB+Nqx47b8NJ+TlmW
	dJgbcLmUtOStzfBAxYcMCMCgrlUNRc6DT8R5RqZKpu9Gl5EfJMvT/H/rHbL9DtvacVOXnsCvDJbg9
	tWEA7hLq6nr8JPcNpUnI0xMGrrGuqaWV7nVEztSRDh9oAeVq5ANSEoc3hzjIWkDpLawf8joaM+iUx
	ItfzwuZebiUFpPYrXCcuECUfxNdRNfrSazq/txLpdeTHhgthe5j3mr9K5YMlj1TirfXGmVr/Anvon
	59ZNQZ9ysmpqtktfnI26NefGngXBT+TzC0RZuNmQD2TILU4WB4zcPgr2QViRq1lMSfDqw813Ya3uv
	QMjLXL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHx3J-0000000HNnI-29gK;
	Thu, 22 May 2025 03:57:05 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHx0o-0000000HNSI-1t1P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 03:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747886068;
	bh=E5969M2rt8A9H8jXyAe1CRFepbcBCsnguHNEWanyUaM=;
	h=Date:From:To:Cc:Subject:From;
	b=CsekdJ0BbTNqTMFXEQe5LFbH2KPAKBh5GP57BjIjX2tO8fsVL9TLlDUB58qnKJtSA
	 VAB6i/7Uht8V7hwz+w5fbhh8hhdtqDXzpeBGXXKN6Vnn9zC5DOkmuYnE1qMPEftoMo
	 86Y9wA8IugGY4ey2XaR/Ow4xCxoQWe00I8uIMvKMKF32D3hTd2xxLZmeh3uHaPeLKM
	 NB7A6sSu0qxQFGKJNP3XiQJ6Nj4Es3OwOU5A4ykzLOmRdEhX+v0X02SyPdqLhho7BQ
	 aRBb9IEJSb/M8OJJ62WEbIsNcz0p2mos/FZESwaJmB37iZEbxa9/xcz0Brc4MeJkH8
	 RjXaXfinVoWiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2vYb1RDkz4wcx;
	Thu, 22 May 2025 13:54:27 +1000 (AEST)
Date: Thu, 22 May 2025 13:54:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Eric Biggers <ebiggers@google.com>,
 Fabio Estevam <festevam@denx.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the crypto tree with the arm-soc-fixes
 tree
Message-ID: <20250522135426.31baa98c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ImKYQSiFcD9J_N.rImKCANl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_205430_752104_5CE3974E 
X-CRM114-Status: GOOD (  15.28  )
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

--Sig_/ImKYQSiFcD9J_N.rImKCANl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  6c9ab811871b ("arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected")

from the arm-soc-fixes tree and commit:

  3357b6c94569 ("crypto: tcrypt - rename CRYPTO_TEST to CRYPTO_BENCHMARK")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index e0d6ac7fd91a,4166bc4d3cec..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1724,15 -1729,14 +1724,14 @@@ CONFIG_NLS_CODEPAGE_437=3D
  CONFIG_NLS_ISO8859_1=3Dy
  CONFIG_SECURITY=3Dy
  CONFIG_CRYPTO_USER=3Dy
 +CONFIG_CRYPTO_CHACHA20=3Dm
- CONFIG_CRYPTO_TEST=3Dm
+ CONFIG_CRYPTO_BENCHMARK=3Dm
  CONFIG_CRYPTO_ECHAINIV=3Dy
  CONFIG_CRYPTO_MICHAEL_MIC=3Dm
  CONFIG_CRYPTO_ANSI_CPRNG=3Dy
  CONFIG_CRYPTO_USER_API_RNG=3Dm
 -CONFIG_CRYPTO_CHACHA20_NEON=3Dm
  CONFIG_CRYPTO_GHASH_ARM64_CE=3Dy
  CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
- CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
  CONFIG_CRYPTO_SHA512_ARM64_CE=3Dm
  CONFIG_CRYPTO_SHA3_ARM64=3Dm
  CONFIG_CRYPTO_SM3_ARM64_CE=3Dm

--Sig_/ImKYQSiFcD9J_N.rImKCANl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgun/IACgkQAVBC80lX
0GyPogf9FadLTwEAH1WdTiF1LfsqmcK2B26c+1VO43iD8/S8a2oCTMzPROrwkG57
f1dO+XZs9ty4ypHdJSa9wO2xPSlxBaOEHYbBhaiMCXrlKcCVqAFyPKQkxBPyyzM+
j6syCdxJ/ISlshRqhWnMyqusN44d4XlFsC7rOoyLeBwgmv1Cthtzw1yD9zfJIkEX
rnUiuOgoM7LTyIIZeAtjdr8ADCasWmSTPWfqz+CPXUieMSOU1dFlvT0RIv2L80Zw
ytUlzcoI2eO+bTk+Ffm+Rbgy8ndnOXSldDYR0K5O0sJkfSMV/cmeBFvfbiRi3phz
edwWNOjwW+sq1VkG0gVqu+fNFSkRYA==
=4qkD
-----END PGP SIGNATURE-----

--Sig_/ImKYQSiFcD9J_N.rImKCANl--

