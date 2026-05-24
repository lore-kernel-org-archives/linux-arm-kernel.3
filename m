Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E554CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLiSri69Now47RImuq7She4lhkBga74FFWNykITHvrY=; b=KfhEHlHsEDiKNS73tfNXSw75nY
	7a4BgoouWn/sxNGFWGGM3OQ2XgUDoRIPwyaJxBJNY9FerH94PogV74jrcFF3x6qR1mSwVOiEVKnEU
	d75/oaF9rcksoxCR3OaGjW2XJz7YvGRYSpGSJyUe4GZPL3JY/74onrcynuIdxPl+WX5mO9ShUioaP
	891kwlpLQg1SNlqqegN/N1FEENGcmD79ynVBeDSNbK1JaeXvM97zRMg+64KikroTRfK94XqAib+hC
	175+1iF59MdJ2bGupxObPoAg408vUbWuPQUMiZmD6ntt8/5bpQxyHq3kDXYbrBFmNbBp/w1S/cfIP
	ne8zp99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR6tm-0000000EsAl-0qUi;
	Sun, 24 May 2026 11:21:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR6tk-0000000EsAV-0aTB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 11:21:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 7E0C0600AA;
	Sun, 24 May 2026 11:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 874481F000E9;
	Sun, 24 May 2026 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779621692;
	bh=oLiSri69Now47RImuq7She4lhkBga74FFWNykITHvrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ivt+XsYsfCEwwRlyrk81FgW8qmN3XGVrUO4QIE49s7hLG85UWNqNJFaSnj2oNI2Ba
	 i1HR34jswIcsOXNFB3K/MjAqwzGQ79pneyvAfKAIvQfzwvTX6+dMpKQirtRaCRntgj
	 X8gg/k38ukFxyZBKSukaVZ8pP4IHopZFKAMnlQWlkvZYGl3gzaIJ9/kpC+abZ54y64
	 wAnUhPcRqaCOF6Gt5OxzSvpXai5cXSrsDJnmFwWSg4NHRMjofNGihVHDuwCwXk7txi
	 MJ+YuW8qYiRyo/oGNqnAziNoro3Kf1WmvoCaolWRJK3C0GpMPMuEOJYge820VPRPJz
	 ej0Ch+HZiwFGQ==
Date: Sun, 24 May 2026 13:21:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linusw@kernel.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop legacy binding
Message-ID: <ahLemdy7Ie9n-Ltx@monoceros>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
 <20260523173251.72540-3-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apdghv2sfx72heyb"
Content-Disposition: inline
In-Reply-To: <20260523173251.72540-3-manishbaing2789@gmail.com>
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


--apdghv2sfx72heyb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop legacy binding
MIME-Version: 1.0

On Sat, May 23, 2026 at 05:32:51PM +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
> obsolete and redundant text binding file.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with Rob's ack from v2.

Best regards
Uwe

--apdghv2sfx72heyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoS3zYACgkQj4D7WH0S
/k7CnQf+LrJy/swVkHwrkqPTyAvOZxezQIxQ6APF6k7/l2fout14sLJ0g7dQtpaW
nUc8cmeCXmoQkDQ/uhzxhfQBxEGXIX+p92kbur2eXOUWsErUzdPFqEQ1bxZhGb5p
clieA/lMQE/uZBoFhSlF73S9yBKoQks6s5rqTsEq6vyArWYXm74eHvrcsW+UNL17
Qsr7my0ZvgUpvRVE6F++d2SpNdtgrrjUAhq3dMqn/HnlQFoNoOxPAh7FKyg5MTyF
IduJDMP/25MrUL1hRm7XDoiP8xkbHfoHpZif0h0z1xrm8URPA4N5BvTO0hlPmgCd
pDpNs+9W5CK4XIhyssis+HaaiShrMQ==
=1Xa4
-----END PGP SIGNATURE-----

--apdghv2sfx72heyb--

