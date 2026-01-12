Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D15C9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNWZXaS1FJQzVZ6hwzeLxJJeSgo8s+XK9jUPMtFsA/g=; b=MUHUy0VZvFS9VV0fJkSP1rrrrA
	L8iDr68ZZgxiq1D2t8XN07XIVYcokgDTPMyfAdbRDJal5Gr4J26nhofhNCvEFd+Je9xLeN/lVFVG7
	V4isDMTFkcqMssBjV96i1tGttWNwIdRR2Rr6HKXaL0tnOQxHdU04oK0LSizmzlGaMZcfakt7C7uO/
	fNYkZDE5qICYZzoI7U6bZ2X4rYxCW7x50VZmshmHIDRpvSMI197v2RRkpjswFmi0DBJP2XovsyAC3
	zPxSiCekEZeRsLGU4f1minytZx0I/aKM/qp/IKLlmuYaymw6t3CSonFW1DrQ5qsRlo6ADWD1q/TlL
	oDdygByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfI5S-00000005Q46-0nd2;
	Mon, 12 Jan 2026 13:36:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfI5Q-00000005Q3n-3nt6;
	Mon, 12 Jan 2026 13:36:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1578D6000A;
	Mon, 12 Jan 2026 13:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A42C16AAE;
	Mon, 12 Jan 2026 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768224959;
	bh=wx3vwavyvgTGfzp6h8X47zsgs32m0wRi01cnEWDyyOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tk5eb7kbHiRVP3gn5HFlTgUmg4oXCcb/K5L3CwpyJHARmM3ebvLZPjhqc6PkGIwvx
	 og85amj9ERx0QUp3k/HAwRrxRMT5gUjjFGvjhRcUp/LwU4JqPudjQjOku4AsbGtCrO
	 4fyRBfh2HdlmGkf+v0MbWRUs5RMn+5EQkxqwk1C6d0xLsCWqB5NAHLDNovLU+XH1C3
	 40gPyOcmD9rk1assyM5T7Pn/+jin9a1xpdHANmbtp5+kiQQcQOTrvV0YtFlEHIJLxa
	 wZiX9b78BDhj5FRXo5fmtct5rVnnn++TGTFOyYbvY9VQ0NVt5BD3lq+5XJ7Dujw3q5
	 dY4jzerfhOhOA==
Date: Mon, 12 Jan 2026 14:35:57 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <aWT4vcBzG6UnaqOF@lore-desk>
References: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
 <20260112-airoha-npu-firmware-name-v1-2-d0b148b6710f@kernel.org>
 <f57867a0-a57d-4572-b0ed-b2adb41d9689@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ACHKGX5J56MzbVwz"
Content-Disposition: inline
In-Reply-To: <f57867a0-a57d-4572-b0ed-b2adb41d9689@lunn.ch>
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


--ACHKGX5J56MzbVwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Jan 12, 2026 at 11:00:08AM +0100, Lorenzo Bianconi wrote:
> > Introduce the capability to read the firmware binary names from device-=
tree
> > using the firmware-name property if available.
> > This is a preliminary patch to enable NPU offloading for MT7996 (Eagle)
> > chipset since it requires a different binary with respect to the one
> > used for MT7992 on the EN7581 SoC.
>=20
> When i look at
>=20
> airoha_npu.c
>=20
> i see:
>=20
> #define NPU_EN7581_FIRMWARE_DATA                "airoha/en7581_npu_data.b=
in"
> #define NPU_EN7581_FIRMWARE_RV32                "airoha/en7581_npu_rv32.b=
in"
> #define NPU_AN7583_FIRMWARE_DATA                "airoha/an7583_npu_data.b=
in"
> #define NPU_AN7583_FIRMWARE_RV32                "airoha/an7583_npu_rv32.b=
in"
>=20
> static const struct airoha_npu_soc_data en7581_npu_soc_data =3D {
>         .fw_rv32 =3D {
>                 .name =3D NPU_EN7581_FIRMWARE_RV32,
>                 .max_size =3D NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
>         },
>         .fw_data =3D {
>                 .name =3D NPU_EN7581_FIRMWARE_DATA,
>                 .max_size =3D NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
>         },
> };
>=20
> static const struct airoha_npu_soc_data an7583_npu_soc_data =3D {
>         .fw_rv32 =3D {
>                 .name =3D NPU_AN7583_FIRMWARE_RV32,
>                 .max_size =3D NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
>         },
>         .fw_data =3D {
>                 .name =3D NPU_AN7583_FIRMWARE_DATA,
>                 .max_size =3D NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
>         },
> };
>=20
> static const struct of_device_id of_airoha_npu_match[] =3D {
>         { .compatible =3D "airoha,en7581-npu", .data =3D &en7581_npu_soc_=
data },
>         { .compatible =3D "airoha,an7583-npu", .data =3D &an7583_npu_soc_=
data },
>         { /* sentinel */ }
> };
>=20
> Why cannot this scheme be extended with another compatible?

yes, that is another possibility I was thinking of but then I found
"firwmare-name" property was quite a common approach.
Something like:

static const struct of_device_id of_airoha_npu_match[] =3D {
	...
	{ .compatible =3D "airoha,en7581-npu-7996", .data =3D &en7581_7996_npu_soc=
_data },
	...
};

What do you think?

Regards,
Lorenzo

>=20
>     Andrew

--ACHKGX5J56MzbVwz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWT4vQAKCRA6cBh0uS2t
rHYNAQDGH3oT5hXKQNMrulNWdI8aXsyBx9SNvaFF4mgjMtA1iAD+KAgmsi6pfWp5
lz+BZ302fPMsRSq5ALTDn3pqwONpUw4=
=Ka0P
-----END PGP SIGNATURE-----

--ACHKGX5J56MzbVwz--

