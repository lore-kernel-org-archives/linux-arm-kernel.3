Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB077CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Thgki5zYQNPufQB/hqjVbfgpOjLAZ0LYxJg6D63BT2k=; b=ktPVi0d2qvOGRnXMn4R41WVYT2
	Oe1a7u3opSFTGxUao+uBS6xdn5OS7FKWikyjXAklSvCnTvfLUF5uqVhIwhBScMAlgOA4+80uFowSx
	njsnG9zNiycBykPFB2dsuhbxPIoKR5qXVcOP+ahARwSxYwdSFtq7DLb8a9mTjoPilEtwvf93p47jH
	eyDg9PIpTL78eIzO7wcuUgFU990K8OSzmUTHRgheTyjijPhaPeT1IaM6G4ODgisIXpSNkqbamEjQX
	L4UA83RioL/RZviXQ8+86h8sUXhg6NaqXOmHXHxJ51gmL6K544dHv3ajDm+WiwUFU0jIQHUaCBp1+
	wDz26F/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmsc-00000009TVn-0YTU;
	Thu, 25 Jun 2026 16:24:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmsa-00000009TVc-1gBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:24:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EA1060098;
	Thu, 25 Jun 2026 16:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBC61F000E9;
	Thu, 25 Jun 2026 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404679;
	bh=Thgki5zYQNPufQB/hqjVbfgpOjLAZ0LYxJg6D63BT2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e0sPHYhS15iIt6v6svyOSB6VfqT2c+Nbmp6t4lEzP02sAJOrt/DlDumjKNrBI0QiB
	 w+xXAJWNiNgOZe2zJLLwZ4cCUcKvtHkIg7uoidvdNzZS/RRLDmIItHRQPG/90tQn29
	 F0NYkygXW50pxT0X1QFGqv42wuHARillQnmOjgnmEuZ7dhX10w1ZF1JGRmZasBPFVb
	 7/Q2uL03x6ssc1Q9vz9e2N9mQbl2j3fuiv7g6R/tV2mI/zsUDqzIaAmZryCb7xOIA4
	 FcTY2XLRn8VrTOndUvKBUDH3YgkiEVKQkv2MDYTJd8UBbtnYkO+99GQgICGPYKTqVU
	 ygx49lbKpiv3g==
Date: Thu, 25 Jun 2026 17:24:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20260625-gab-tartly-46ae1d07bb22@spud>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KgOo0vAcTHRZVL56"
Content-Disposition: inline
In-Reply-To: <20260625110638.38438-2-cwweng.linux@gmail.com>
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


--KgOo0vAcTHRZVL56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 07:06:37PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
>=20
> Add devicetree binding for the Enhanced ADC controller found on
> Nuvoton MA35D1 SoCs.
>=20
> The controller has one register region, one interrupt and one functional
> clock. ADC inputs are described using standard channel child nodes,
> including optional differential channel pairs.
>=20
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KgOo0vAcTHRZVL56
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1WQgAKCRB4tDGHoIJi
0rzsAQC4BpLKlBd36IGdD4/quH53bLAWjEVwrOFiN5Oh3JYKfwD/a+oArr5PGsuQ
N2sp8zcfi/PLAn244zTapkzBFxNtkgY=
=oDJ9
-----END PGP SIGNATURE-----

--KgOo0vAcTHRZVL56--

