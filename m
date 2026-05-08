Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DBCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM5ozFdNjhLrCOorefIKlM0r0GV3bwA5Z7mfJpSCFTk=; b=MpHPI1we6tT7N97xUEM07ZuxQE
	zkkxB2qvKRBm58FrN/tfKf+R2KpDKQrvFvmIzqG3QBXs5ZMjJ7hajUEkCHwUS92adR6LJGqSArvut
	a+VDZuzupCdaM9vat2i2Ysfv0PLVdE6g6eJNOXttBNAGOrV3GnO+VMOIXQbZj66KihwFxVVaeWcP3
	wZvTLhi7QtrSPkgWf3kQeO0OS2K4x1+8QkK+QibgBsAx6FAlVdW+xDnC67levYu7EzFeBoa7uVinj
	kpw0O+Q9g7Ab8M5YSme+rCFpH9X4huF7OH1SuoT2/SCeaIBWhGVS6TIS0CAdctL4AbNqIO7kM4sPH
	+ukpCh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjR-00000006lUm-0lmc;
	Fri, 08 May 2026 15:03:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjP-00000006lTf-0KTJ;
	Fri, 08 May 2026 15:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1F3E4333C;
	Fri,  8 May 2026 15:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A866C2BCB0;
	Fri,  8 May 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252590;
	bh=NM5ozFdNjhLrCOorefIKlM0r0GV3bwA5Z7mfJpSCFTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQ4Dt0cYgrEmfgZNytRHShXRSiBtAJ94LPbT20bmRuAlEFS7fx0o0NPzU1r6atvfO
	 v2XvyYmw7DGJPCU3ym0FhuBC7Kxs16kD7juYgyBMvYGVpjegKUkJ/soWBgN51q2fd4
	 yqXRD94yq4SY6sryRPpj+ApMh3gV34t7voX/U+DHTVgi+lHoyus6oiwvrE5EZD+29B
	 8v7akqzLsVh8yOkJUwx/OWUmmBvuwZKLvrWbNpmB96paITHyoSkioVrw1H2g57Kv6d
	 cVXSW0l70FlPcNGUw/yHDST8IFRxEIei1vcirTre2S+YVe/t9alh3cewMgLkP3NfQN
	 TKGsnfeVq3uMw==
Date: Fri, 8 May 2026 16:03:05 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Thomas Gleixner <tglx@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: interrupt-controller: Add support for
 Amlogic A9 SoCs
Message-ID: <20260508-barn-stoplight-b51074b42891@spud>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
 <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mlnt36XCcXWZcNH3"
Content-Disposition: inline
In-Reply-To: <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_080311_136098_B94EFC76 
X-CRM114-Status: UNSURE (   6.74  )
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


--mlnt36XCcXWZcNH3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mlnt36XCcXWZcNH3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf37KQAKCRB4tDGHoIJi
0nLMAPsFCeq/96IK484wEU77o/cSNulu7ivTsIutSLq8L+VP7AEAsziQTnbLvns0
lUzVz1X7li6jbxx7sUng/Wq33cMfcgk=
=Xg4i
-----END PGP SIGNATURE-----

--mlnt36XCcXWZcNH3--

