Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C510C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asGUIZZs6HKRiLaci91mPEgp868GgHNmV+kuUJBygRQ=; b=UATzi4Fjl3+Jp5M5ybSXrWCo4Y
	uMaJlt97C1NuhIfAKisCPfRAuyDgiGYNO2qrmNWkIXbnPFGl2A39R8CK89rlXdPCSEUnCXPNBccNI
	A6BCbIy8vGVE2pl6KbplEj/CGRPJdaFkpiismK81gbkFrU6mQZbdZjG5oXH+gbZi6ra9FbOYHiW5S
	pwfbt0uBAR/orX9w+C8WYErDca18Lc5MM8xmb0eGrZNU83TXKvfWvUgwStsCflXTP1n84fpwixVQU
	tMTgipFaTItq/JGY4V4nIjiktriRtpEF7JYjUc8c0DBmOBcauqqIq/PabsDWlAU+8fW5nTjyOWV0d
	QOplGLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdRU-0000000CeHL-28v9;
	Thu, 12 Jun 2025 08:37:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPchW-0000000CVg7-2Cld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=asGU
	IZZs6HKRiLaci91mPEgp868GgHNmV+kuUJBygRQ=; b=eUS2FwvjW12aOCRfywim
	nGBVsPe6A1HIiOhLwJy1aTG68BL5I0LDA5IdmisK8NhYdXtdecUqPUivVIZ0fFFP
	z83/p0lStL23tR9bTI5igWdbGfyPjh43dFzDPIrqaj1P0uYqAPBtJlQfS1qWQ5Nr
	oNFTOAX4UQ7jxrWSwPIa/nQKv7PjzxETFLWFZT86jkpx+/SzBcb9Nai2h2qovJf4
	0YW7x9NVuP2IQuqEHvTc7uKeNb24Jpvkn5JU+0+MCb1HqTYZm3nl/EaPnf1aek+o
	bNi9fx3ovUignYVP2nL950MF1syW5soXElGKLE5Oy1LICIbG1/DVLw6QzUPAVMFR
	dw==
Received: (qmail 3537286 invoked from network); 12 Jun 2025 09:50:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 09:50:14 +0200
X-UD-Smtp-Session: l3s3148p1@60QMLls3uuYgAwDPXy2/ACpZfVCNKldR
Date: Thu, 12 Jun 2025 09:50:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aEqGtjc7F8vvY4ph@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
 <aCtbg0_vD07g394k@shikoro>
 <aCt9e-rrOOR0C5HI@shikoro>
 <1cea4f55-752f-4581-a003-1c9d31a36039@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DcIQ3DvmppdGZo1d"
Content-Disposition: inline
In-Reply-To: <1cea4f55-752f-4581-a003-1c9d31a36039@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_005019_433057_C69A7DC3 
X-CRM114-Status: UNSURE (   7.18  )
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


--DcIQ3DvmppdGZo1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Where? I cannot find anything in my inbox and also no pull requests on
> Github.

https://lore.kernel.org/r/20250519184530.21845-1-wsa+renesas@sang-engineering.com

You prefer to be explicitly CCed on such mails?


--DcIQ3DvmppdGZo1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhKhrIACgkQFA3kzBSg
KbYUSQ//SbP21jd8zqSNAKM50DjZ2UD0RkAZr6n17Bf4u6jCm1qnIWFJLPIPPLCH
EsyycQAgW1jJx2yJBcaA/uvQtdhKQbjfzOeHhtXxYpzm8QCggLRdSsEHuB+C3Wis
MMTAs0OtD0HyZjVHoo1X9o7rFilWxaTcNiFXeTv3Ctme3le3cK3Jf5lMK2kbP76s
+/6MEYTtpoJlVJyCiST8zRvW/79OzZpmIUsW+uad5mLRIJXs9JdUD2zAqcBE0hcf
46tl8cW3A6wOxM97mq8j0OxtO+joMhHnl/VO+QItXJaViMVNONUJu5D0bK71Po7f
wTCxes2W7UL8Kty294H//SAhgx/gGs09TfZCZQ+PDks3tFIi86+oQ2i1sKW2N5tB
hdkHxRGdI0K8U/7ZrKpVipxokCKVT6hV/tWa6Azls7Ci3U6vFMsT1eNJVTfTMME4
q0zx1zyOJABJ/lWXfxHS1R55BIryms2i4Q+EjBd5gYb0RfBOKrVWG/k3Ir5XWLNA
oNvR9ljQuXJEJKrE1u8h4blLVio2Wk8LIpuUyPIWWVJCZ4V/U9KyjH/5ZBQu/FY+
y5VkRa3hIeWU88fQF1FIhayoYAmOAJpVgNNLQY0BLP/Nc31edsNCCxpFnjvYfgiO
hbPEeBV7axh+fllilzfsPF50AvVLfyA9DrKZuBDagDOheed2LS0=
=0ZZ3
-----END PGP SIGNATURE-----

--DcIQ3DvmppdGZo1d--

