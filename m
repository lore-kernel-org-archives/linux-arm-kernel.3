Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6508D59F4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dGz6sXpIYnfnzHJ+ERZLLt+6h9zPbAIm2B4e0PRpDcE=; b=ELC32VAW75Tkj4Lu9hedwY6i63
	zRc/K9BFE4ZKjnsQMlrseaxIII5SoSp4+wiKmQllOGMZvyziU53POIkEPieMpdPFEpUZ012T8NUeR
	bFZ4BcEQQ2JhRatAb17hpi3aJGpg9CYDjRuZ77x9bK4MHZefo3VL++hdpIXL0VK1nB+/vF8PfF9zC
	aECT899CJmpqdFm1muk6uQ2gtxIxEVyy28Ekl0u2c69WzG3Kl6fWUYDCQuSUett1tHUxMwlXSHo/h
	DFH+g4QQvmHZ4Ua4ZFbODK1KUtmkIEbCr24PBcMlUyCH8Ozu4n/YTAniAzPw6E88JIgYeduedHK2H
	7xg7X/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iSX-00000003vlW-1O8f;
	Wed, 06 Nov 2024 16:00:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iLt-00000003uFm-0ipW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 236F5A43F51;
	Wed,  6 Nov 2024 15:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91842C4CEC6;
	Wed,  6 Nov 2024 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908427;
	bh=Yr2XYRl/QEdKuVaJlW7cGh64FWbceGPSwehS2+4ZYYQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OfFzh+gpMFce0Fw/iuVG9A/dYiMutG7db+ng9KugAl5GTmCnU2rqu/GltNtFi/J8a
	 m+vSiqNyhX7MC2j+6ntwv9Sd1Z0T5i+xIRiq9iwWdWYPBlfSpED6TqfghkY0x/jf5W
	 QltD5dbWEBOPgC/7O6AgYNttzob6cEXSHLcAJTec/ogxiaLG0w1oh2ZvuQuwZb0Y+c
	 HfiDT+ZB0CY4ovr0t+LPWpiQlVinrXmX90nT1jyPt79av7cmFuE2l/wlRy4COpklun
	 Httl/H0wn0R+h2NkIOaKl9ZcqkU3P+Tz/1yQXAid3E0wSi2AMAdrDCwcCk70Qdp1wl
	 YmuGdaANQrA5w==
Received: by wens.tw (Postfix, from userid 1000)
	id 326B95FB0F; Wed,  6 Nov 2024 23:53:45 +0800 (CST)
Date: Wed, 6 Nov 2024 23:53:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.12
Message-ID: <ZyuRCalH2vhHXm0Q@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHvUgcaLkj0lpz+u"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_075349_300814_3877D8D8 
X-CRM114-Status: UNSURE (   9.86  )
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


--jHvUgcaLkj0lpz+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.12

for you to fetch changes up to dd36ad71ad65968f97630808bc8d605c929b128e:

  ARM: dts: cubieboard4: Fix DCDC5 regulator constraints (2024-10-25 23:27:34 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.12

- Fix DCDC5 voltage range on Cubieboard 4

----------------------------------------------------------------
Andre Przywara (1):
      ARM: dts: cubieboard4: Fix DCDC5 regulator constraints

 arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--jHvUgcaLkj0lpz+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmcrkQYACgkQOJpUIZwP
JDB6MQ//QVdW64jrLwkNDuuGxduDftgFwTMCo5z+d6T1YcO4MbupEBFBrgKF7ozC
BbtkG3jsauDDLNw/5vC6UKnF8b68JuTfCkTiJna9NwQ/wl0cYXcIBophtHw2oMW+
d1nE0CaIOOAVG5kfNbVH6V2bEP4xBkx6+QG2hxzTiyWPri3u1mUNS/vijkOG/PB/
Tg0XMDbORapVpof1BgDYBQMk4TjEGev3XITifaFbdYvOJSBu6iV1sM8vSw0V7kBP
B8gkYJe7f4ylDQDJuhlxW6muXgVgYFj1CyfeEzGeN0VGt1U0BScYElI/sOf8m7RP
RxYS5ay2zMciA5JJJL/+YGnYCEpOTXKGjOdWGRX95Zc05nx2TSk/6NK9e8XsUpRC
ewPDXNtsHiN8UzLYO8clVOWZnKgy+sWpBzL6CC7MmABo5jU4LYImKDqrHGnSfFCQ
lqgTpQ8b2jno8WDWHFLeoKaG8V18o07FYXhlCx518wOG8JiBrXLLiGshpldZDy8Y
57N4FjoLnU2YcOI4XEQ/YPPMcfQYm11akAeIOr4xUmuKdNts4nLmSeDOsSSYiq8d
76cyoKDI/BlnAjl1zfvJFhMma56vkDwsG3dH176dFPMJaAD47/YotL1FY8cpQp0b
F7It7eZtO4qgcMyLoKIDOiwt+IRzTm4MLDHV99Ju5nHqm3GOJCg=
=2lyZ
-----END PGP SIGNATURE-----

--jHvUgcaLkj0lpz+u--

