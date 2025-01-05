Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE3BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 22:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Dgu+xEK/xsOALa18iqsnwD7qKYhUuHCiXmp3fWkzNU=; b=nzV6dnwHbRGEGaCNCu78T61sJG
	AksXYs6jlYX0LqjJfP5W6M57snbbAdheO54gn+lnFzUJ4JokwF3fAfME/r4LMjenl79BWBG7yTxiv
	Y2CzddZY1IvU5nKsmNdVIQ3IwDzKlo26VfZCL3IiryjUDrjFO9cTzBuZFXkfn89GfDn8DQSVEjc5g
	USW5LVMoeOTi+7QbYqfVuil4QN9O45iqwJkFyZCuXtqszQky9Hj8BMd27fYfdxD04AInAhXsEqCbw
	QT/KDwRhvQaVHEe4pdHT2pC2dvu4YFARhgqDcq/0kB/5zjaE/GORcB91SLudJf7sLapTAy5Nw0CcF
	iR39RD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZH7-0000000HTqc-2F1o;
	Sun, 05 Jan 2025 22:39:13 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUZFv-0000000HTmT-2r20
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 22:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736116662;
	bh=2Dgu+xEK/xsOALa18iqsnwD7qKYhUuHCiXmp3fWkzNU=;
	h=Date:From:To:Cc:Subject:From;
	b=NCSL19hlxmvEs/mV14xF7Es4UMMIwxagnRwZrXnQ+LZFiXpqw6TzkMoe7tT5++YZ6
	 nViBQMY0xH3rpbclza2J9StPGr99ykj/gaP0X1Jxj/DeocpFPGiYxyUQGqS5CtW47W
	 QadILaE+VNG805ZtYp1RBfeA5gzaHK3Xa2h10aQCAvZWyuYlKgqyLIJrOJ6ZMy0ceq
	 DwyrqxIPEIoahUVxVrnJTwE5d9qDdwsanKSRWdT3JFptDrfHaU3Iy3V1sqfzYwqC/R
	 /v64m58zmzfutROx+U3mogs2PlE5ph+RCweWkhIOBHZNd1qRJRMCeUGDlHDDPQ6wtI
	 eYoZBHre86ltQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRByr4VSlz4wcs;
	Mon,  6 Jan 2025 09:37:40 +1100 (AEDT)
Date: Mon, 6 Jan 2025 09:37:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250106093723.147ef27c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+hoe4iC_lj08K4GqCk0iDhd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_143800_072444_1622FAF2 
X-CRM114-Status: UNSURE (   8.55  )
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

--Sig_/+hoe4iC_lj08K4GqCk0iDhd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  b7ebfb84a09d ("arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32=
mp257f-ev1")
  7db93f0277d9 ("arm64: dts: st: add csi & dcmipp node in stm32mp25")
  abf9b56d5dc5 ("ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15x=
x DHCOM SoM")
  ee843399b312 ("ARM: dts: stm32: add counter subnodes on stm32mp157 dk boa=
rds")
  db10d90e8f16 ("ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1")
  47d9d3c1d424 ("ARM: dts: stm32: add counter subnodes on stm32mp135f-dk")
  ba8ff583891a ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp15")
  ae281e200680 ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp13")

These are commits

  8df9bff27889 ("arm64: dts: st: enable imx335/csi/dcmipp pipeline on stm32=
mp257f-ev1")
  d67635e62d80 ("arm64: dts: st: add csi & dcmipp node in stm32mp25")
  479b8227ffc4 ("ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15x=
x DHCOM SoM")
  5f8049c1d170 ("ARM: dts: stm32: add counter subnodes on stm32mp157 dk boa=
rds")
  00de2022848b ("ARM: dts: stm32: add counter subnodes on stm32mp157c-ev1")
  2879145733cc ("ARM: dts: stm32: add counter subnodes on stm32mp135f-dk")
  57f1e18bb6c0 ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp15")
  ec9bd8e7c06d ("ARM: dts: stm32: populate all timer counter nodes on stm32=
mp13")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+hoe4iC_lj08K4GqCk0iDhd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7CaMACgkQAVBC80lX
0GxmOAgAgu0j5vtOg/zWzwdf/08nOkQz+Dj/7s2qImByzrVrv0joGjqDZ2kQCMxM
vWF4lnalyfKp55+Vq3+p8XZMpMnP75/OSLz67nGv24im/KcrItX8lndu3SeU+fXL
cs2bydGCXsm3ctZtiLsAh0e1ZBwJ/3lf8BxYCXMRRwbOX/gpGZySK2BXmYd1Lrje
sr/JHTXjLhB81pGaCsqPidbyo3ZhTJZ7o3HceNkOUVkXUVCaFyp91LFV5nGRZFiX
n487n5wPAz2MVHy4lyJqm9YiACINTcIygYpWJqHZgl47LoYftHxVnhgQmtJwP8em
aecnJqhzNagwLbYewP8XhVj+nRCD4w==
=6s81
-----END PGP SIGNATURE-----

--Sig_/+hoe4iC_lj08K4GqCk0iDhd--

