Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731A0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 03:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qnwInVQxbKwG9LCg+xx1RmsFb5dT9RinSQ7qC0DlDk0=; b=ekNp5EwwUOr4Cd7IxWNEeTPGue
	k/yfGJOqmTNDzjTn/7SkNFYQN0Vxeuwti2AR0JxQ7QlyIvebs7zB1a29U0ppX7ftkrhvPDjMu5RVx
	GcaIDe0x8XDqdXodF/Bw5iWf8teKTs2xFFYe67F74fQELlT71MWH6Ufw/P6BsMq6/EAy+Ja9OPqHz
	2Cjjc9xbqYHwB29y724UwiP+Vy2UTSp29/5FR+PZRufB14vfhw1z+++korgJI2sGlp52n0mv015Na
	stq09ZPma/3SotAFPwau2nLIyL5FVe0SLaNIZ5acMVSMB2VaYRyaaiAZRZ1v45KQZrllWVYPEt8oy
	L7eqvkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu1H6-000000014Wn-41V5;
	Mon, 17 Mar 2025 03:36:24 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu1FP-000000014Hy-42va
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 03:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742182473;
	bh=qnwInVQxbKwG9LCg+xx1RmsFb5dT9RinSQ7qC0DlDk0=;
	h=Date:From:To:Cc:Subject:From;
	b=PmuR0G8dWg2ey8cBX4Kx9JKtQR8m6NwexRmLyqa9u6DM+FpVm5sP/uoISSj13cPUa
	 N9GyE+uPRmNafwq4S1+nsrA8UaoGc74zOdxEzJDs2GNI9M4hZXnCMtJD5kkUCI0YT4
	 Kkk2umFPf1Tuq9rYoIGR9RdIhjXYQ2Oq20C2++p7Dkm05dEOi2Xk8OsoDPukcsgYO/
	 8qz9GZYoeYJoJ8rwke2vOU1Zi7J07evPqmxGqlG8cLy2iRPLPiECn2il3Br8UcJm8V
	 3QEvFkqn2WeuWkXAfFXY3iuDqmHYzjWLtAfDijSnnWibFeRqyeEVWsSt+3530bkHfI
	 sH159uglmW4vA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGLF43xpjz4wcQ;
	Mon, 17 Mar 2025 14:34:32 +1100 (AEDT)
Date: Mon, 17 Mar 2025 14:34:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Hector Martin
 <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Chan <towinchenmi@gmail.com>, Sven Peter
 <sven@svenpeter.dev>
Subject: linux-next: manual merge of the backlight tree with the
 arm-soc-fixes tree
Message-ID: <20250317143431.00ba29bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YAUj+LTCYJbqdQvoWeUpnul";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_203440_365404_20F811CD 
X-CRM114-Status: GOOD (  15.43  )
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

--Sig_/YAUj+LTCYJbqdQvoWeUpnul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the backlight tree got a conflict in:

  MAINTAINERS

between commit:

  4fa911d2d4cf ("MAINTAINERS: Add apple-spi driver & binding files")

from the arm-soc-fixes tree and commit:

  d1ebaf003a06 ("MAINTAINERS: Add entries for Apple DWI backlight controlle=
r")

from the backlight tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 55e367614f61,a576324807f5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2266,7 -2254,7 +2267,8 @@@ F:	drivers/nvmem/apple-efuses.
  F:	drivers/pinctrl/pinctrl-apple-gpio.c
  F:	drivers/pwm/pwm-apple.c
  F:	drivers/soc/apple/*
 +F:	drivers/spi/spi-apple.c
+ F:	drivers/video/backlight/apple_dwi_bl.c
  F:	drivers/watchdog/apple_wdt.c
  F:	include/dt-bindings/interrupt-controller/apple-aic.h
  F:	include/dt-bindings/pinctrl/apple.h

--Sig_/YAUj+LTCYJbqdQvoWeUpnul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXmEcACgkQAVBC80lX
0Gymtwf/UK/EZUcoVy7B62NNMg/gGMWKpKRD30i9gltXYf4jNRcc8ZFUqx4Cf3GQ
WlBxAxclgwwIbunV5y9tYkhHFZlfDfLwUZadyBD1xM25wY4p5+JRtEdcDgdAUn1m
AOJFHNFXxAcN8VOqL+OF9rNb/+xtUuSl9UYBJMD/ksRX7sPM696OYmfGM1ODNnRf
XWZztqGu7r+tthEE2KYsDOncJlNhIg/2AakByv0O4NaivOUpTePup9AfkL9T9rhA
5tBsOu0LWGs0BbT9k0svlv97wcleDDkbZuIcVHfpLXWlFjX6W3qmdElJvj5LPdsM
EHYD8l4pZv3z824Fsu3op2CMi9buvA==
=iimz
-----END PGP SIGNATURE-----

--Sig_/YAUj+LTCYJbqdQvoWeUpnul--

