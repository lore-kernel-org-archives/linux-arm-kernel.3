Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43CDC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 02:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wRLi88NGIWQ62coVwqYaF7X6oUj1qrvMhLktbakRYuU=; b=n8EBWnY3Fb+2NbdJ2wJsmRlbhs
	DUHBRozVK3UBQ+IkkRxhM0dsC8ztINvDvqJyWJvjXWmYvxp0R28dPB0EHfN0nkxox2BuwrUya4xsv
	GlyQKSpvjTvAROzOQh1R+s0JHH7cet0MCJyg8a8Zve7jGzDfd4dK86UxSoSH5T+HAigFQjjD2O9He
	G2fRnw0nm8eVB0aFk8jCZIep1ezKsvi/eD3F6yJScn68NJo12HqLftubCfrgzWvCO05tVwE4dtg9j
	1UaTERM6hImZY5RwmgdNgrhBe4hEtkHN10Ea28DT3/SF/7l61SFclA6ZBguBXwOMEH++jgl53T/gz
	G7nOvg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFkXk-00000002FxC-13Wl;
	Fri, 16 May 2025 02:11:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFkVF-00000002Fmk-2Jl8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 02:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44E885C53E7;
	Fri, 16 May 2025 02:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D43C4CEE7;
	Fri, 16 May 2025 02:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747361328;
	bh=X7Y2TUm5WKa8IQzCF3jrHIgaYTlWsW3VGzqSmV/UGCA=;
	h=Date:From:To:Cc:Subject:From;
	b=DkM8a4n2bIGr9l3gEO/gp1anlCqJgF5ipiLdRHQ2X9owzQBkT8g4iYuYRP114qaKB
	 40T9tyMr25gcSfk85u8Or70jh1uBsvoxHJ7lHJzkaVJjYOtyhnSaDJSfVbs+WCPVRF
	 6Qnaqxav9zBf/qyy1FfGdiNGfFm78ZtHrHSHq1u20jCFVUg1fj9+Iul3e6Hj+BjFx9
	 w1i/WsiUsHMMV4XPIjbwyZuhmHx3s3A0oLJXMOCvW7CvGRuvSBaMRFRsKP3Go30X2a
	 RcxBNd3NIXegsAbM57tFE+8KOWw2l/zt3sZdxouTaN6HTny+doNHaWFbD2qgFhhwOO
	 3Re5MDhmhByGA==
Received: by wens.tw (Postfix, from userid 1000)
	id 0FEFC5F74F; Fri, 16 May 2025 10:08:46 +0800 (CST)
Date: Fri, 16 May 2025 10:08:46 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.15
Message-ID: <aCaeLgjZllV7bauX@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OtkIcRTRYefZpLF2"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_190849_639203_8C1E2692 
X-CRM114-Status: UNSURE (   8.91  )
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


--OtkIcRTRYefZpLF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.15

for you to fetch changes up to 573f99c7585f597630f14596550c79e73ffaeef4:

  Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection" (2025-04-27 13:38:14 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.15

Only one fix:

Switch back to I2C for PMICs on Allwinner H6 devices. Apparently using
Allwinner's proprietary bus ended up causing issues when the PMIC was
sharing the bus with other devices.

----------------------------------------------------------------
Jernej Skrabec (1):
      Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"

 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++++-----------
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 ++++----
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 ++++++-------
 3 files changed, 37 insertions(+), 37 deletions(-)

--OtkIcRTRYefZpLF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmgmni0ACgkQOJpUIZwP
JDBP6w//dfQ8y3BaDDpECuxk4MTFho8BrEKAUOVNTStsS9UgkdAk+Z2IGRJFSEfY
vh0Dbr7/MB5Zna60cDgmlF2bIjeE09yDRU+l1MUSMVemKwZBV3TIQriuPNO1susH
0vfAo/MbvHaC6bta39VCg7dwCMFYKiBHjr83CJnPkUjCMJtUaZeeJOv0kMv5w3cw
TEdBx0sPp0DXAwnWD1f5Jn65KBR8SJKYIW4zMIGxmHyYKkoKLTgQ5OGyhHb2QfLG
rZjR3nvB4V67tLlse89BPi42hxeZLNTJ1X8ryt3HHH0mDZZfA70h2vpcQSco1gF+
78L7TWzR7KdspPj62XcD8WQjYTcmOZRZ7Q1+IDrfgS3VUuqpnpW21d42qTmScvqz
GJmA9YEQ4NdUtSiDC4mzjKrMzLrTj5T7eL5HgHiyJw1PehZNoJYdJGqDGcHVXsu2
yllTynJLJxB5XYRYf1sOJwBTAxl33m2n08BFO0zDL6HSZYkxw3yoCQ+OmHPNFDBq
B+Rdscpnv6s7Tl8P69wq2HNYXCK+W/4S5+T/3IiDktVMwdfJEXCM7Ivid+R+fQ0U
ceKYO9La8wiKwPGkgJoZML79RnDQ9AcIav8DwQWZAicVnROCIXRz4XpBjfqP++GE
tOSFoq5oRYi5ytmiTbKK35Yy8heERk6osS2UvNc16eVjRLhNSpc=
=7c46
-----END PGP SIGNATURE-----

--OtkIcRTRYefZpLF2--

