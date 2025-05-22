Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E477FC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 01:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCwvSW5OEksD89Qr7XzRychnTaoVvwYQQkOOKkNRy6w=; b=PKLKTbOoMbayjwjty7ttIX8FTp
	kcIkRrmf3iNbrtjAZmveGyWVp/j/kTeUMfJwJ/W+/KkgWV+bnfdfYZgvQn0bcALtoUEQFS0StElqu
	y4dWNVbceyoiXQTl/SHIFOiHtmy/+OClxqRbHtz48wquR0rABe/uFEIFkYJ7L2cMw7ZsH9m42bUuH
	UBcpFJu3bPCx6fXs3bwmmIvbBhtaeePNdFY2cRnxrlz1lRMXqx5O5RGXaRyoUl5ZZydLRRSZESizA
	+Sive156nE9wkSEN0EJu7RzRRyhWMhOCIOO/N2wDJawXZOMk5Yt1eHgrkj/gGigwUf6cgT+b7tU8O
	3Hq/MYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuvI-0000000HCVh-0vIR;
	Thu, 22 May 2025 01:40:40 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHut5-0000000HCK1-3zCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 01:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747877898;
	bh=wCwvSW5OEksD89Qr7XzRychnTaoVvwYQQkOOKkNRy6w=;
	h=Date:From:To:Cc:Subject:From;
	b=hlspnOyCwtVTDzyR7g0vVyjNHjgjARrP5flzvR2AmsENWTeqNsUhWxQsQwA6ySdLM
	 de1GFQqHSHEBswai454lFDGD7HSNPpT2YbA1ks9m3j37VehQ/HSeZviBB1XXVnn/F3
	 9gvKt2Bfzb5YyQ2EOfEiS88kZ96NezX7ahLEHaKC+463Euu1qaAEq1eqbTBBZBbXKP
	 /CrqikIvZrMzWKorkMiYL3TmlMUlaAL6kds52tE1T+gvMc0cPe6m7v+xzPJ8C7GVoa
	 txyLPOeh1dHoN3gMgoYd8ojqh87b8KaoOE4CWxxfygJFKBciX8CVRQjD/DCQJuul10
	 /mH57Xd2LWWZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rXT2s94z4x8X;
	Thu, 22 May 2025 11:38:17 +1000 (AEST)
Date: Thu, 22 May 2025 11:38:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250522113816.16953357@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qoujmc87Y0T_mUnsyo03b0r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_183824_277075_0ACC2999 
X-CRM114-Status: UNSURE (   9.56  )
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

--Sig_/qoujmc87Y0T_mUnsyo03b0r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  0a0e8571837d ("ARM: dts: stm32: add vrefint calibration on stm32mp13")
  2a47c4033e09 ("ARM: dts: stm32: add an extra pin map for USART1 on stm32h=
743"
  3acfa4becfda ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-e=
v1 board")
  3bd31eb4f6ee ("ARM: dts: stm32: add vrefint support to adc on stm32mp13")
  3f70ddb86143 ("ARM: dts: stm32: add initial support for stm32mp157-ultra-=
fly-sbc board")
  46e2ad9fd187 ("ARM: dts: stm32: add low power timer on STM32F746")
  532c5a818d2e ("arm64: defconfig: enable STM32 LP timer clockevent driver")
  7b6bbef62485 ("ARM: dts: stm32: support STM32h747i-disco board")
  7b7b6bb0f98d ("dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{=
7,8}_CK")
  826e6fb26193 ("dt-bindings: vendor-prefixes: Add Ultratronik")
  878dec8597d4 ("arm64: dts: st: Add OMM node on stm32mp251")
  8b773be67b10 ("MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT")
  8c18889c702d ("arm64: dts: st: use lptimer3 as tick broadcast source on s=
tm32mp257f-ev1")
  a4d2108a4b3f ("ARM: stm32: add a new SoC - STM32H747")
  a09cdc01ad4a ("ARM: dts: stm32: add pin map for UART8 controller on stm32=
h743")
  bf98eb91ac66 ("ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins p=
handles")
  caeec8e2b846 ("dt-bindings: arm: stm32: add compatible for stm32h747i-dis=
co board")
  dd9bfe13b47e ("ARM: dts: st: stm32: Align wifi node name with bindings")
  df863325b92c ("arm64: dts: st: add low-power timer nodes on stm32mp251")
  f069852c9b33 ("dt-bindings: arm: stm32: Document Ultratronik's Fly board =
DT binding")
  f80958d949c3 ("arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp2=
5-pinctrl.dtsi")
  fe8690b58efb ("ARM: dts: stm32: add uart8 node for stm32h743 MCU")

--=20
Cheers,
Stephen Rothwell

--Sig_/qoujmc87Y0T_mUnsyo03b0r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgugAgACgkQAVBC80lX
0GyUqQf/W5uVleIo3eT3hTnHyNVzKnk2fEGgFQbvlV6gDcKb5hzhSh8ikWLX9lvK
QHAYzer2OtndCp4WAWQ8SJ/PcRNwmK5x8xwhloO7erf/o+EWpav5VfRkKFb3fJ5t
08Iux3FTmIb+mz07M4gAHH33pR/ogLJNV4zEoIn28FbKkGXngGF1Q+PZWXIQ1eNU
cBIGtttSRXD4AiUJmtPPHt9DYZBnYyLXj1uTUAOeyrrFJsAQDd4CL6FT0tKdyIAF
qp2DQKHnGjkF7TiJf06TAaGhBxvkbXsSycV6pyp1wTvoJZch9ijOimrSj8Mzt2tp
3q2qsWrIHz1Nn/gss7PF6xAqcsd2rw==
=trE7
-----END PGP SIGNATURE-----

--Sig_/qoujmc87Y0T_mUnsyo03b0r--

