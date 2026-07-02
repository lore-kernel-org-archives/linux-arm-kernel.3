Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03770C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Z85cQ6uU0GVtAZUpmRXHyd6C4EsGOmLz1XMPvSK4wo=; b=LP4OXBaZ/D8GkUUn0FYqP2HfT8
	hqNxMGGzNphwdWWA7rk2KvKqsZ01y4uz/zdg0tmBqxjAcMmeyqCzRpmuySMuFrKTY3ThY3kcgxaET
	QqWQnX+NePLjBN4is7oXSOZO22u0aiGwEln57Xs5E88+j1ds2//mAnl9bxddbCctnXRkSyvrJgfSM
	IjECmeMS2rTa/QxfxQ91wc8HChUpw/aofaGm+08QzkQKUGO1gTnK1i1fuX4X6LmDoW/WXiybeJjHV
	sd/lnn5HfFd1Rql+N2kTcTK1N145EdwbGHcVlJD2RsbNilhH219qjmVFEMD9fW8QmDGGoHQlGqpSa
	TQBUAyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMPN-00000005Hkw-3FBj;
	Thu, 02 Jul 2026 18:45:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMPN-00000005Hkg-0pSM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 18:45:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB69940057;
	Thu,  2 Jul 2026 18:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9C81F000E9;
	Thu,  2 Jul 2026 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783017908;
	bh=2Z85cQ6uU0GVtAZUpmRXHyd6C4EsGOmLz1XMPvSK4wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lq1WHjyMJAk0Jm7Uv9pgDiSOP6jj32Enc3jeuBZge6AZtSYljC/kgqXGmlpt2Eb0I
	 ucueQyNOBfKaWND1I7R7mZWs1aXMtNOgtiFz6fxoqfzbWfNff3AjXdOYcRPl9K9xtB
	 kSK8ANQSv31o6Hnqt05xDCBjf8Elh3vIXhJbk3HRIU+FRYx5x3iCV4F29SuJ1Qw05y
	 U1viVePIM3pM7DOjA44c+u9aIQlTFVMaYYmETGEmS6JFZlFIFtg0M91SYKoJKicG9u
	 QqGBwD95vfL8luEeLwkwXg1ifRZZbqdugke7nKWYxfwj171Z2UvkVrkdDaVnvPIvQg
	 OxYAwsSuBiV9g==
Date: Thu, 2 Jul 2026 19:45:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
Message-ID: <20260702-upper-gumball-d8bebf96da5d@spud>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mQHzYtXtpMBTI3Nd"
Content-Disposition: inline
In-Reply-To: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
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

--mQHzYtXtpMBTI3Nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mQHzYtXtpMBTI3Nd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakaxrwAKCRB4tDGHoIJi
0pVnAP4tatAlnoFqSSWR0Dehwd5JIMcYJH+x9gGwkCIsU97H/QD/ZCVMzErs59f2
PlcGU5fGnv1DYWjhCFiGO+3KWCNFyQ8=
=r6LU
-----END PGP SIGNATURE-----

--mQHzYtXtpMBTI3Nd--

