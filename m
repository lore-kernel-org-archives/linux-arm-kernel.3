Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A46C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 01:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IbtrKg/FwI2zyW7puEU3DT9rKVvustOl2IwtxnY+xWA=; b=p0D8stHHggdjrgK6VUtWYnl8Qj
	NyEgDSiHEfYVpmTBAvIh42ZHx81iEmK3efb6McR1wA4wQjCh3VjFpHPl5GbCKgoUOJl4aYK/LVnrC
	FRIb6UuoSIyPkLhvRmemUToyCK0ASKj0SVeIN3qMgpItw+T60V/l1rC5pSFQ/pM7qxMW6XxpFtCgq
	xP8W2OvQEt0XC5KqCl26iKpbtw+Yorlpq+KqySPFPt5TZNzhbgXR7Lx3RK5k1sfmf55Pg3+hV10ot
	Aq3b3SrOSCjZ7uS+U1+g3H1ZLCRgLmrfviCFjA9Er87z03Vok2xhUDWzuuA6ZS3J59kZLbz6LL5Gr
	ZNTR5NRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1dE-000000010Qc-3h4m;
	Tue, 22 Jul 2025 01:17:24 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1al-000000010JZ-23Dm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 01:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753146732;
	bh=IbtrKg/FwI2zyW7puEU3DT9rKVvustOl2IwtxnY+xWA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZjVwWu9PU/v0TNnqSr2TGvOeNbGsYNMTBM7dKIrxH9Ydj3MXO+Lv579psaSUzkTkJ
	 ZzdoXJvkdnyCL4Wv7t49oV2axlEAQ5emCMrCDg3IQ9NQ0pQc//CabamJ85rf16yR5W
	 XOgHqHl1Fxa0VWBMUrty7+n0y2U/NHPw1QNfR7QctB/dCS8hsXdMAjkN/cNGWrNZEF
	 e0hkqZKGHQzC4gLijM0rUxNF0t02AMEBe3qPae+7kspI+DuYzu8pNvsjtYr/SWgsSC
	 onjszdIQrOUTTYbDgglq79WJLc6KF3Ltts+3d/KgFlje77vcTg2rKNkwjr/OuKz9bY
	 ni3cfZlHbJIig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmK4C6B6Cz4x11;
	Tue, 22 Jul 2025 11:12:11 +1000 (AEST)
Date: Tue, 22 Jul 2025 11:14:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Gary Yang
 <gary.yang@cixtech.com>, Guomin Chen <Guomin.Chen@cixtech.com>, Justin Chen
 <justin.chen@broadcom.com>, Lihua Liu <Lihua.Liu@cixtech.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Chen <peter.chen@cixtech.com>
Subject: linux-next: manual merge of the mailbox tree with the arc-soc tree
Message-ID: <20250722111448.2426a159@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z+.EPQLc.AK9CfzH83iy0fK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_181451_954670_855E1EEA 
X-CRM114-Status: GOOD (  17.78  )
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

--Sig_/Z+.EPQLc.AK9CfzH83iy0fK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got conflicts in:

  drivers/mailbox/Kconfig
  drivers/mailbox/Makefile

between commit:

  fe2aa2361ddb ("mailbox: add CIX mailbox driver")

from the arc-soc tree and commit:

  6aecd1f31f8e ("mailbox: Add support for bcm74110")

from the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mailbox/Kconfig
index 4fef4797b110,865da8986e53..000000000000
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@@ -340,14 -349,14 +349,24 @@@ config THEAD_TH1520_MBO
  	  kernel is running, and E902 core used for power management among other
  	  things.
 =20
 +config CIX_MBOX
 +        tristate "CIX Mailbox"
 +        depends on ARCH_CIX || COMPILE_TEST
 +        depends on OF
 +        help
 +          Mailbox implementation for CIX IPC system. The controller suppo=
rts
 +          11 mailbox channels with different operating mode and every cha=
nnel
 +          is unidirectional. Say Y here if you want to use the CIX Mailbox
 +          support.
 +
+ config BCM74110_MAILBOX
+ 	tristate "Brcmstb BCM74110 Mailbox"
+ 	depends on ARCH_BRCMSTB || COMPILE_TEST
+ 	default ARCH_BRCMSTB
+ 	help
+ 	  Broadcom STB mailbox driver present starting with brcmstb bcm74110
+ 	  SoCs. The mailbox is a communication channel between the host
+ 	  processor and coprocessor that handles various power management task
+ 	  and more.
+=20
  endif
diff --cc drivers/mailbox/Makefile
index 786a46587ba1,1c0627297474..000000000000
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@@ -73,4 -75,4 +75,6 @@@ obj-$(CONFIG_QCOM_IPCC)		+=3D qcom-ipcc.
 =20
  obj-$(CONFIG_THEAD_TH1520_MBOX)	+=3D mailbox-th1520.o
 =20
 +obj-$(CONFIG_CIX_MBOX)	+=3D cix-mailbox.o
++
+ obj-$(CONFIG_BCM74110_MAILBOX)	+=3D bcm74110-mailbox.o

--Sig_/Z+.EPQLc.AK9CfzH83iy0fK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+5ggACgkQAVBC80lX
0GxaAgf/RCHyEV46T8yTy+kQyZz5scJxBQN/bm7G/e9/JZJtpgut1ES8QvxKf9ys
PqFRNIIHyRIgRCvbiGqzq7KCrsrQMZ5EoPvWHwEUTUo+waAC+t7+iqw/3U5WHPs7
W2X/dOv0/W1hHToT/ktArSnHKgnA6xB1jFAQTqS0risUgM/jM5U4dJLpNLBSaj+B
BEgZmLWhFfkLN5ny5ZXCMa/xyS++aiSgGfVkGH2/SjUz93+xOKLH8Qez10oWqEPi
VCYB+2p4QShv94r5thFgAn6HmLtwveKXwLK2gMZs1IsVQjH4X/UQCrLXxaEqp+WH
TVQOztMFQ+ebKwVnlrYrxebnJll+qA==
=W1aI
-----END PGP SIGNATURE-----

--Sig_/Z+.EPQLc.AK9CfzH83iy0fK--

