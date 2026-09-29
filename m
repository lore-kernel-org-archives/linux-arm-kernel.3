Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE33FCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAUghNeL44tviTaVmIMjHkDsIJ29Dhpn/+AN6JDKLAs=; b=kLQo80O/ZAgBL6luc+aifBG0wz
	8+1OGXy0IvO31JzmstZEVZNKZnqaxJbAWU3a/xSs0prfWp8THQ48xO/lwr/7CZ+RKYKxf8i/UB3lq
	pnqfRlayOLn25B4mD11KHir7BiN8fH8RPH8iaUhnqTVoAss8pW5qnco5tmSSF8wCvaAkGXYNKlfXx
	oiBhYa1xcFLV4sOz9zFxV2g93sLp50zHLhpZpUROQTp7Q5HP+v9JNsMiXF/C2AloP8O2yvVF9jhEu
	AcQcq92wlKlm7nlxLyD5qcWyGu8iQPlVSXpmTN1iCgzgM7BphB2hr9s/oURErQDPIyu1LbgwPThQw
	dpPFzAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhE-00000004OhB-4A6k;
	Tue, 29 Sep 2026 19:41:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhE-00000004Ogl-0IWb;
	Tue, 29 Sep 2026 19:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 474326022F;
	Tue, 29 Sep 2026 19:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20111F000FF;
	Tue, 29 Sep 2026 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790710859;
	bh=KAUghNeL44tviTaVmIMjHkDsIJ29Dhpn/+AN6JDKLAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2d3TTkISdUJC1YsLuhZljaOYdZOKKzQF+g7bVMFxM78S9Y9e+uNzUmoc/ZtK4D3F
	 LIstQvkhHvev0H5nG4LCBasAdNG0umlWOg8/QZW+Zjk4C1PfR3W71azyaBKDfe+hiU
	 sI/Mnpfc/dntc7NK0ZruCuOnKM8ucxfqNICfC9BmvVnXi115NbQ2a2Ne0F2TnBjPAl
	 lXvm4XHznPyHKOhVeq8wj/Ay9+UZdpd0NtahbFiQ4kYL22BdR8YhMCjt2ZqjkPu+Bs
	 juq/wcsIezSGXOEDR7kvrCbPcLsZdyC15CG3OetKSBLIGAPE5Y1rJGTW31qSg+EOSA
	 mOqszPh2hETDw==
Date: Tue, 29 Sep 2026 20:40:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 18/20] regulator: dt-bindings: sy8827n: support standard
 properties
Message-ID: <20260929-childish-ethically-0a9c6d63ee62@spud>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-19-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jYRsrYHOKy0uFBN"
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-19-jszhang@kernel.org>
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

--6jYRsrYHOKy0uFBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6jYRsrYHOKy0uFBN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarwUQwAKCRB4tDGHoIJi
0kiZAP98RDyWo+sgTIVhEcs8b/0YZbaCHEucmwHwYittmSNXQgD/ViPojKzhd0DA
1NfubBBIQUkUPapBQUZaKnCSWaP1BAw=
=mlj2
-----END PGP SIGNATURE-----

--6jYRsrYHOKy0uFBN--

