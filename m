Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95162CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWtIneBIlQhjcv6vSIMhHxV3eQvlE53NKWO7dJEV4a8=; b=hwvw6E2AEEnnHHZh5fTI8ltLdL
	pdGqj8U+VTUjnVP0bnLwcddsYKlVxUfT48HADSbOSsJiyvsGFFxD7vKjiYA1BKa8QsFGAkrvfzUWz
	raD20Wyg7nsyQ/ujgb8b162+RpfZyCATB2kDEmA2ltRym/G5WlNoCVO9ZMXQnKaG6R571TXV+RH4U
	vaxUrOK2FtJP8DpAd2i3ExLt2o9JZEdBtvm1oLfjyySBfL/3GEqoE+L+mRQcKIDcdaZZ/UCouRQ9n
	3Q8cOGKM4RnFywUBvMGEAFzaobRqG5YIZWBm/8uTBw/HmY6i9IZcgEA/sxQIytgJKfYZaKi3l7RLN
	v8iV+17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2V1-0000000BBzC-3QNc;
	Mon, 01 Jun 2026 13:16:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2V0-0000000BByp-0Cfk;
	Mon, 01 Jun 2026 13:16:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A42142CED;
	Mon,  1 Jun 2026 13:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314501F00893;
	Mon,  1 Jun 2026 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780319769;
	bh=BWtIneBIlQhjcv6vSIMhHxV3eQvlE53NKWO7dJEV4a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WD2m4k22PhkVpk0bEbkTalKbbpJ2MYHUEElNlmNa4Maq/ZPJGoV8uvaMA/Qtf5gIT
	 M1wky4nad7SMAO9zhgQrAekKrDuXZqWJurxQIQgnx6bXfQSARqJjROqTh0K5BH2le5
	 ftEimi3lGlcYQbhNBk0RAtP1/NcZK+how9NV7pzmHg2ymlBIztZCQzXyfPPEtYv/4E
	 khyS6PhKisPkdgkqhteL6laPYLa5l/uyZafayRJ9ZUfHYiRqonGIfRmLWPeSnyjG+M
	 HJ1eY7ACypRFdgzhUz0f9GGlNCS9GSdyp38Ao4SgCtMguCewRCoXh74sR3+dtPyt9/
	 E8w+j++UsPylQ==
Date: Mon, 1 Jun 2026 14:16:03 +0100
From: Mark Brown <broonie@kernel.org>
To: y.oudjana@protonmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/4] MediaTek MT6735+MT6328 SoC/PMIC pair base support
Message-ID: <169f4676-07f6-46d4-9478-55af4de1e6a0@sirena.org.uk>
References: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2/ypeZQb3Jmpy3Y"
Content-Disposition: inline
In-Reply-To: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
X-Cookie: Have a nice day!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_061610_105784_81597418 
X-CRM114-Status: GOOD (  11.15  )
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


--c2/ypeZQb3Jmpy3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 31, 2026 at 11:10:41AM +0200, Yassine Oudjana via B4 Relay wrote:
> These patches are part of a larger effort to support the MT6735 SoC family in
> mainline Linux. More patches (unsent or sent and pending review or revision)
> can be found here[1].

Please send patches for unrelated subsystems as separate serieses to
each subsystem unless there's a depdendency, making everything into a
cross subsystem series just makes it harder to work out what's supposed
to happen.

--c2/ypeZQb3Jmpy3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodhhIACgkQJNaLcl1U
h9DICQf/R2lYrAwOVaBt02e0o2KXDCOg7XUNcak0rKzUO6DJv/i+DBjYEr9yT8tc
rGMsTpjPtmINDcIZBmSo3+yMjUMusP3PofGq3KtYhS2Sw08sVOzrFoItEUcpt1do
tgcsj3U87khkp9maizKvOi9wxe9N0g1mked+B/ejcHXmYqFcEfCpSWg/TLzUM5je
ggYinIghnIfrE8odn66Vda4OwVITZVy3QamQwnXsrCuv11MbS3uKuzO1Xdrdwexb
ySiGSWUKCxKqeWUsqclavQjnQQHVShAjku304mKF0uOZ3UJmsLPIbvbMr18VhMkL
ndY1hQKyOYiBfJDe4ykrwxnVINhGng==
=Vvm7
-----END PGP SIGNATURE-----

--c2/ypeZQb3Jmpy3Y--

