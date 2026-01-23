Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E21D7788E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMDxWhlC5nOmrdQBlFnypdMUOLvQlVAHKKR2/LaH7Ic=; b=mseXxqh4Lp5YQiA9al78r522I6
	V3QZ/DeXpMTIx8g+vm5pVCsHMFHCwoqNRXyMSwMCkCDxjW3w2vbFT4jyn8fJWjdkcChR1Xh5VyceL
	wbk56kesPqeNiWqRdsaoX5bZZb4hsUveOOLvylGvjkv201T0zDnmt6eMMwkBe91VV5u1MPKP/770n
	RhzwygtYzTQV7npk43YR5P7EI3gaiDKevXu+473DqEQRFYpm6NWNka8saQavJObKwZ9blg5JPwlR0
	LpIg0U6RFHDUzk8ln/Bjpb3Wh1YixcV/CH1/aDjID0uMohTFjn0c+8wB7nSUpMbKCV/DWZ3s8Gqcv
	R5G7pmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKmB-00000009GxD-2d7s;
	Fri, 23 Jan 2026 17:16:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKm9-00000009Gwp-1GMV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 027C043A4B;
	Fri, 23 Jan 2026 17:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C8C4CEF1;
	Fri, 23 Jan 2026 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188608;
	bh=aMDxWhlC5nOmrdQBlFnypdMUOLvQlVAHKKR2/LaH7Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0L+ihcnCO6gK8k6F3P/u+Yi1giyGodb/U+f+X5b2HpCoQVzrEBgP4n0d1M9hTAh9
	 BbkUy8ybvvn90rQJJr+re5tob9gaMGkoHRtKzb3rf4xEgoqHpy4rSreTbfGDIziIge
	 m4h6t7JtiNxNPAJ7LVgU54zd6e8a3wcdhLP96mu9Xi27k2RgvBAm0/aTTEsB1oEh+8
	 d+TolSHEitGsAvWk3EFD1A3Z80hqeKK4/uvFNb8Z6KnLq9fkqUALrcbGsSQ0GUocI2
	 OPE9w0L7tT3o9NMMwywL6RY9LMy8K87RdURNrKyTRbzut9wZUMuS2djSb0suuLNZHJ
	 22PX3rteUcdwQ==
Date: Fri, 23 Jan 2026 17:16:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Message-ID: <20260123-crook-siberian-8585f695d630@spud>
References: <20260123093322.1327389-1-richard.genoud@bootlin.com>
 <20260123093322.1327389-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CAw543iWCw6hPofx"
Content-Disposition: inline
In-Reply-To: <20260123093322.1327389-2-richard.genoud@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_091649_352024_96E021D9 
X-CRM114-Status: UNSURE (   6.94  )
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


--CAw543iWCw6hPofx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CAw543iWCw6hPofx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXOs+wAKCRB4tDGHoIJi
0h32AQDLqV2mPg23b2nz6Sb13oSR73B61KVZ6efRpRHAMb/5PQEAkVqiTCVFbhVf
BJ7Cx0d0nfZ7dqTZwBrUBLQm03iSYgU=
=qfxy
-----END PGP SIGNATURE-----

--CAw543iWCw6hPofx--

