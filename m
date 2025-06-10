Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D02FC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muDFxLfY0+qeyLI3mE8/sqT0z3/gvu2RClGHImS1nX0=; b=gnxKLnzNKQ64qaWKybMwxEkOoQ
	wlEn8ErMHxtos2HLlhA1vxJm7TKFbHOyBy/7/VqrhYG4ejS9H2ciS4Ifv4/LVsyo2CY+eYVpFe/jG
	OhNzW5QUq0vuewiqQcAgIwptnExRY+SPiStpMn33I/78pa3cGzKBz5xNzXvon4RepTBDQmm9+DrVl
	xfbwqLZOm7ecOh31a2QtdfTCebSI8shquIsGQn1UdbOolbbE3eJECwvJ3MkDZYuDdBVd5gne3qhKH
	5wRp9dddFxd6ReasX03wef3ifWGkTBl9rokcAJnTnk9y1xUcCNW/5yoShoZZ9Xjz1LEYmezr8fF/o
	OCRCT0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP83h-00000008Mob-4BQT;
	Tue, 10 Jun 2025 23:07:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP81b-00000008MSL-0q9j
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 23:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=muDFxLfY0+qeyLI3mE8/sqT0z3/gvu2RClGHImS1nX0=; b=GGtDMmxz0SfP+/sFOYPjDxrp2s
	XPsynahifm0OqUrT+0jXCTfA593M16V8WnCp2EqAcwEMRUfpAgofW+XWNA9n3fFZdPaUaHigLJ80C
	4OOtrODVgUdt7jC/iZGLyYLf1qUwqvB+pQACSuT9rP/waQ4l/6pDhdP2c+JM8Y0tJ58JEbVdq0/ZM
	3ZlZ4XBe6C4czk/Z/E8/CDQPtNuEXpEH7fuK7L1lG7nekGB5b6Nk0PhKV1G8IeKQvWYcvF286PuT/
	whPP2W6oGancpz4Cn2RCmzQGq/tE1X7cw3mu6QB6uvcetD9BCM2G7f5/uZJUFWg81mBKrAILakiM7
	NfkU5F5w==;
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP81X-000000020ro-2eje
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749596685;
	bh=muDFxLfY0+qeyLI3mE8/sqT0z3/gvu2RClGHImS1nX0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZMD1pj8siDTBORviatsIe4lYZrJR4nlhYEN3vJ27H+r3K3pQ3Ep7ajkhs0pl0NnY9
	 SVgdmap932TmWkhVuRnF51VAvXZCWtx/XL2W+4KpyXUugp3v6M0yQGZ002erMFpRKH
	 rmHb3HAFLwZcXcma9w0rp65GsUEazukpVUzqMXxUyzEA1STYRNJP8BGsVId4os1cMg
	 tZxqmcXbUzi3AJjhk3w1y3Gw7pxZG7eIp2znCY/yq0KgXhXi0EPgUCId1dol3legH9
	 xFmRwYeBQB4wvnR+tM6RTMQxW36+efH/o7skmmoxA76qiQDnSa9YcHLO5LMDIQJOjz
	 kGcRl+Al1GztA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH4B45D4zz4w2Q;
	Wed, 11 Jun 2025 09:04:44 +1000 (AEST)
Date: Wed, 11 Jun 2025 09:04:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250611090444.237c9562@canb.auug.org.au>
In-Reply-To: <20250522113816.16953357@canb.auug.org.au>
References: <20250522113816.16953357@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b=7_cKKdRrcq./9hKW8B1SC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_000456_360043_A5353EA2 
X-CRM114-Status: GOOD (  12.91  )
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

--Sig_/b=7_cKKdRrcq./9hKW8B1SC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 22 May 2025 11:38:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   0a0e8571837d ("ARM: dts: stm32: add vrefint calibration on stm32mp13")
>   2a47c4033e09 ("ARM: dts: stm32: add an extra pin map for USART1 on stm3=
2h743"
>   3acfa4becfda ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f=
-ev1 board")
>   3bd31eb4f6ee ("ARM: dts: stm32: add vrefint support to adc on stm32mp13=
")
>   3f70ddb86143 ("ARM: dts: stm32: add initial support for stm32mp157-ultr=
a-fly-sbc board")
>   46e2ad9fd187 ("ARM: dts: stm32: add low power timer on STM32F746")
>   532c5a818d2e ("arm64: defconfig: enable STM32 LP timer clockevent drive=
r")
>   7b6bbef62485 ("ARM: dts: stm32: support STM32h747i-disco board")
>   7b7b6bb0f98d ("dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UAR=
T{7,8}_CK")
>   826e6fb26193 ("dt-bindings: vendor-prefixes: Add Ultratronik")
>   878dec8597d4 ("arm64: dts: st: Add OMM node on stm32mp251")
>   8b773be67b10 ("MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT")
>   8c18889c702d ("arm64: dts: st: use lptimer3 as tick broadcast source on=
 stm32mp257f-ev1")
>   a4d2108a4b3f ("ARM: stm32: add a new SoC - STM32H747")
>   a09cdc01ad4a ("ARM: dts: stm32: add pin map for UART8 controller on stm=
32h743")
>   bf98eb91ac66 ("ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins=
 phandles")
>   caeec8e2b846 ("dt-bindings: arm: stm32: add compatible for stm32h747i-d=
isco board")
>   dd9bfe13b47e ("ARM: dts: st: stm32: Align wifi node name with bindings")
>   df863325b92c ("arm64: dts: st: add low-power timer nodes on stm32mp251")
>   f069852c9b33 ("dt-bindings: arm: stm32: Document Ultratronik's Fly boar=
d DT binding")
>   f80958d949c3 ("arm64: dts: st: Add ospi port1 pinctrl entries in stm32m=
p25-pinctrl.dtsi")
>   fe8690b58efb ("ARM: dts: stm32: add uart8 node for stm32h743 MCU")

Can the stm32 tree please be clean up?
--=20
Cheers,
Stephen Rothwell

--Sig_/b=7_cKKdRrcq./9hKW8B1SC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhIugwACgkQAVBC80lX
0Gy2yQgAkAGaQZt4GSiuHRyOcqcwXyNSNRa0g4NUcNGWrIaM/LKfrx7mqTXuIFDs
Y80fon+MqVpxmAWsCGfb9r4s9DAAugr/7TZhCd66AC09aVyCeIJaUWe1a4mWBEY5
vm0uDKvZRg79C+jj3ePHn8gLyjK8uuUryae2YqctXUcb0FxdDiD7e6/HpTrngt1E
b+FM0EywOiRU1oZP1svCd2YBF5/dEpp+PFZEnPYjqmTqbs5sZDhCtzA5HRBKaZiS
kHW6xfWRYFN2mtD9h4SvEFXPhBriUFqC/CN8f1tnIAdPgHI0E/mR7EW5dMZxUy4O
fbYTxNVQtpDYZUEoKqvtrxqwfPEDmg==
=hXim
-----END PGP SIGNATURE-----

--Sig_/b=7_cKKdRrcq./9hKW8B1SC--

