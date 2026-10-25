Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1AC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/qzTsky;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDBIPq80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GVMGWBA+doRG5gBfYl36HB4dJIKG+rbnEDlBd4twPQo=; b=Y/qzTskybhJr5vByToIs/asYa/
	IzDWx+DeS+racYlHu5GJIVffYQbAVyWt25dDBwotx7Y6LAqQmMHVyvaogWGLTHXc2WE3OeIiwDQPu
	myfwtv4co2d8wIkSa/v3IpQnwNFdf0kWaA1ITfSCIAdbXa4E44A72FgOYIxurBkwERGYqX0/8YkaM
	rkytJtBLVkGXZ1VUWp/zRM4kqIgK+vxC0tmZh1X106eVNXSEdew28Vno+e2T3LSXNipSW6ClHKypo
	yVY1DSTrHPgFDBBffSbuzO57QfC3NH/FnewFZCb2gBA+iXy38nHkZpM8aCWL4ELCkYLJYRgTqBBP+
	ENrsT3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL75d-00000001UVA-2IWP;
	Sun, 25 Oct 2026 22:53:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL75b-00000001UUx-44q7;
	Sun, 25 Oct 2026 22:53:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 552BA43CAC;
	Sun, 25 Oct 2026 22:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072181F01825;
	Sun, 25 Oct 2026 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792968799;
	bh=GVMGWBA+doRG5gBfYl36HB4dJIKG+rbnEDlBd4twPQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDBIPq8082STVAbpK/dhoqKQX0p90ygwzGL96Yrk64xLM6B8ewnaPBUPrTAGyz0Y9
	 1kN0u7UokMJVTrRAawHlio0VP5Bg+xY21Y6Tt60J9BdxkDQeGrhNoqB7DPpGTMhyap
	 9jtPwE+fma1vWMO4od2a8h0K4AratjSZ/bGB1A4oV41Tyc417SyEdVj0iCrgzqywh2
	 Ru+U6+Lj3/btC4qBsm/NY8JaRhsgNDarlfVT3yph2P2tU92K8vAUTAI56yXlNl/F/0
	 IJx/2VFvBF5rR2opam8LJGTTFxEv0efGnI6PmSOMnc9WsDZCwtiPOiJkAGDSAL+bAI
	 Lr++F/m02IbLw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 63FCC1AC5994; Sun, 25 Oct 2026 22:53:16 +0000 (GMT)
Date: Sun, 25 Oct 2026 22:53:16 +0000
From: Mark Brown <broonie@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>,
	jiebing chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
Message-ID: <at6IXIyAkf90DU1W@sirena.co.uk>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vAQcFAodtabSXAEP"
Content-Disposition: inline
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Cookie: Victory or defeat!
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--vAQcFAodtabSXAEP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 08:23:57PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
>=20
> This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
> (and the tohdmitx S4 patch) unchanged apart from rebasing, with
> Jiebing's authorship kept, and adds one fix on top:

Jiebing (who I notice that you have not CCed...) also sent a v7:

   https://lore.kernel.org/all/20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlo=
gic.com/

Please coordinate with each other.

--vAQcFAodtabSXAEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat6IXAAKCRAv73Ows9A4
iUkDAQCQveKgx4r2d/eG20lgPhus7tKTm51YTADZ/MON+PoyegEAs8Sr/ir19Hyl
KSZbcPte+19qqTv9mWpsTI64D0/Qsg0=
=I+6b
-----END PGP SIGNATURE-----

--vAQcFAodtabSXAEP--

