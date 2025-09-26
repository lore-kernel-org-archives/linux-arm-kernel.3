Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65766CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XBCdxZwWAyM7YHqLw8rKM8rLqvMES4Ag8yxAIsV+hM=; b=FbMQErEdQqS/IzjFRXCvb48WlT
	ItzUGrepyhzjgfFuiMv3QHGKl4ckWakY/wFlOo8/wjwFHYclZq0AHPsRmCiHtOIKvoBpNnNJp8OTb
	pNFtXeLTxG7noB70O4JswYsEGbTDAO86XeY11/7eBafPkrwgXQu9ywRTf8jLaHR4CtQFxLc0JAt2d
	wpsR1T8ZdYvktjmzPEfYxhvrSpzc1nM8qkJoSqDFsDs6xHNNAcEatt9X8Md+JReYQ49JzkLLaOkAn
	dZ+CKPPmPucXyADI6fu6vZU4Qh2YCtswMYTdNUK3XJphjs4wgyBBJN53jtC8h3ZAAbSItjmK95fC3
	3wW6SGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2AtM-00000002frN-18Oy;
	Fri, 26 Sep 2025 16:01:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2AtK-00000002fqZ-1EVu;
	Fri, 26 Sep 2025 16:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8432438BA;
	Fri, 26 Sep 2025 16:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718ACC4CEF7;
	Fri, 26 Sep 2025 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758902509;
	bh=YM8IV0+v374wnHxVVm/Vnnd8QnjR389XXK1l3TAj00o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPjBmudZnf09hWZOTPBa90uUNc78OHxilarHsju0QpVLdXDTZf5eMwPs+QusAhLFa
	 ZH7B9f4yMUW9krRsFQ0nxlxRbBsRghqnvFXL3RYoSvlnPLwAR4TrFUTRli3MrPiCAW
	 KUDMgFp4AIs6K6V85SmYlShCmOajgcwWEQF/5z0DjBQ4M52DPlKNwJZS5gTi5J1CFV
	 +8RGq3rsSNFROXlne4G2uxcWwdQ4AgrrD5T+77XaENVQ7LCJ5nCu3B48CNX/+NhX68
	 BBLcMdcMtCTo1hyITS9Ahzlk1pUefKnb8VGOcLzvJtDkTFBTD5kOKG+rt4ZKUipMNN
	 O6BqmVtYm1puQ==
Date: Fri, 26 Sep 2025 18:01:47 +0200
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
Subject: Re: [PATCH net-next 2/2] net: airoha: npu: Add 7583 SoC support
Message-ID: <aNa464zcFCvNhL33@lore-desk>
References: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
 <20250926-airoha-npu-7583-v1-2-447e5e2df08d@kernel.org>
 <82a08bb5-cbc3-4bba-abad-393092d66557@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hB/pAcwWM8gt6iYi"
Content-Disposition: inline
In-Reply-To: <82a08bb5-cbc3-4bba-abad-393092d66557@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_090150_350818_66A590BC 
X-CRM114-Status: GOOD (  13.62  )
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


--hB/pAcwWM8gt6iYi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > -	ret =3D request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> > +	if (of_device_is_compatible(dev->of_node, "airoha,an7583-npu"))
> > +		fw_name =3D NPU_AN7583_FIRMWARE_DATA;
> > +	else
> > +		fw_name =3D NPU_EN7581_FIRMWARE_DATA;
> > +	ret =3D request_firmware(&fw, fw_name, dev);
> >  	if (ret)
> >  		return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> > =20
> > @@ -612,6 +623,7 @@ EXPORT_SYMBOL_GPL(airoha_npu_put);
> > =20
> >  static const struct of_device_id of_airoha_npu_match[] =3D {
> >  	{ .compatible =3D "airoha,en7581-npu" },
> > +	{ .compatible =3D "airoha,an7583-npu" },
>=20
> It would be more normal to make use of the void * in of_device_id to
> have per compatible data, such are firmware name.
>=20
> 	Andrew

ack, I implemted this way since we have 2 fw names but we can have a struct
pointed by of_device_id driver_data pointer to contains both of them.
What do you think?

Regards,
Lorenzo

--hB/pAcwWM8gt6iYi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaNa46wAKCRA6cBh0uS2t
rPX0AP4jYjmSFYol3JmGbMp9YCs2mGaQp8A9OZ1MuJvwphnyXgEAyEhcgj/ytZnA
tBXvUeNCKzmn5hurXo642VMuHkx7dAg=
=aHsk
-----END PGP SIGNATURE-----

--hB/pAcwWM8gt6iYi--

