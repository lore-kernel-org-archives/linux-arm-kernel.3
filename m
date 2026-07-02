Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82456C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlWQKLBpPejSZHZZzN/mxlrqMYq2TV7X1RN6v4yZKnQ=; b=RnI5aBFb6XaK86/8UtM32cB1pJ
	yL/ADU/hcJTnDKz+axMtMdlE1YsVwgebLX/WL1fMXo4nbLb+LvUWw9QGpF39Iaqn64vyTvqk15cOi
	cRmvZmRbnClDfrxQ4eXZX1sg48y8ddZjFZsXOrrurtDLMD8V4p932sc1eLTGMwFLMDZF0G7M1E8yG
	rdXcK4bLUCZ3bSoZvCzJvgQtlnpzA2jAsP2UdzKjq2EL+D0csaITPNfTMF0nfxSW0p/bhoV7BS6ND
	MoM/MlAvFgD53oJI9Cxr1u/9balttoeUB1A7C59WqZxd2y15nfTbo1nrnTHD1uPWHNPj8wNdVeaHx
	5qNw/4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMP6-00000005Hhk-2qLY;
	Thu, 02 Jul 2026 18:44:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMP6-00000005Hhd-0W8J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 18:44:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7A94601CA;
	Thu,  2 Jul 2026 18:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2365B1F000E9;
	Thu,  2 Jul 2026 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783017890;
	bh=RlWQKLBpPejSZHZZzN/mxlrqMYq2TV7X1RN6v4yZKnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mv15d627BMhysj+dOXP1Epessj05M96xpkncn6udtJd28nby1H8MaWbOzU9mPmAmF
	 DoyFv/BiP0r6RrpTnolEpOTWx3yVNGJ+zXlsGgbiuMlT9urSaFU4VkRzMeg8qJUbno
	 Zpb7NtzkMd2U+ImaLp5xaHf2sSxAqRKormo0oW+Xzn5vMCKtvL5Wec2aiuX5FrUS4i
	 H2FDyAjV+6gqbg8UyAKSGvz/Exb1T7nO6FYTRHMy0Jp4x+hArkQRk7rhqFntHOTgfm
	 AbRkUTSAYZbycHK9S1+Cn+Gq0Qt1gS8VM12khfGIyCFv8FGpesNsd5c+liHJE6aXJ/
	 opet5GnVwyagQ==
Date: Thu, 2 Jul 2026 19:44:45 +0100
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
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
Message-ID: <20260702-handstand-juggling-108225b4599b@spud>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
 <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZulPCrKKJP31cIw"
Content-Disposition: inline
In-Reply-To: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
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

--FZulPCrKKJP31cIw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FZulPCrKKJP31cIw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakaxnQAKCRB4tDGHoIJi
0rzBAP9zhEDgVgJdOXCZal2TY5Vh8abZgA2I4I4i3kMyryX0ZwD/XaiOCZN5gKFk
aUYY65HjHUxhL5MGWH0r0SJy4Srk0w8=
=h88k
-----END PGP SIGNATURE-----

--FZulPCrKKJP31cIw--

