Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC601105D9AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiRsyqA8gapL9LmlJ2rGgGsXps9zlQ66AzSloszYUaQ=; b=mv8G5HJSmYSeYc80B/pWQWGf1f
	hAuWcUHYHZdpAWk77DWu5gkKbwhI1uMPRkY73fnW1GIdUtXZ/v34hwcNHSIBlI2Bg+KejvN/a3xYJ
	rFjW6kJalt3ZGQlta1AKF2uB9IZcHXvWlo+u0yqyf2f16WvnbOIDQM7wBUt7WnfkExYwIkMwjsF7b
	yXMCm8d+KUv+RBd8zXI6uD4vq1zKd12rK4rWTSKJfj76wIzWSdDEUuQAGsuvftkRc/TLpoQGTBcBl
	0Zfg9qcWgyar7q6Cyklhhake7ySWnw7DgcRcX9zK52WSXe7dvsNWzSB6wjlOECAgNdjMn/aPUJw25
	CDF30Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPJ9-00000008cRJ-3hd0;
	Wed, 08 Apr 2026 09:34:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPJ8-00000008cRA-1g9Z;
	Wed, 08 Apr 2026 09:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77CEB600AD;
	Wed,  8 Apr 2026 09:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99ADC19421;
	Wed,  8 Apr 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775640885;
	bh=xB2G7g50HPojzs91gVhYtm9ibj6OxWB3a3yj4DtnA9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCfmrL2jaBS2Zir8M+930wpHrwSiWb69VCPUF2OaZOMPzdm7HQyBDiWU3WZrLKPEJ
	 8K1yB42YQjodE3UsdJeA+PvQI5EuaQcKHp8n9ptkJlp0KAYEqTP0meK39CFNWnZnR5
	 QhepcmDlPZxOmYgPD24obbjbip6ihfpIe+HAhYP4SCm0FAX3ppt0y1Mg6KCePy4SWI
	 25VtanpprO9taPO1sVdnhpRQiE3QdeHgkoNT9OoX8D/sg19ksbA15A7vp9RjeRxIgM
	 +DW9hRZZbhVPRAbQQWhcuuy+mBCQ/CP4wdY370sxnrdlQuSyGfSLczZXA5u5HXn8C/
	 jtzWF4gtNoyAg==
Date: Wed, 8 Apr 2026 11:34:42 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Zenm Chen <zenmchen@gmail.com>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH mt76] wifi: mt76: mt76x2u: Add support for ELECOM
 WDC-867SU3S
Message-ID: <adYhMgllS55Chvpb@lore-desk>
References: <20260407154430.9184-1-zenmchen@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ECjadagwUqD3QKe7"
Content-Disposition: inline
In-Reply-To: <20260407154430.9184-1-zenmchen@gmail.com>
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


--ECjadagwUqD3QKe7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 07, Zenm Chen wrote:
> Add the ID 056e:400a to the table to support an additional MT7612U
> adapter: ELECOM WDC-867SU3S.
>=20
> Compile tested only.
>=20
> Cc: stable@vger.kernel.org # 5.10.x

I do not think this material for stable. Anyway:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> Signed-off-by: Zenm Chen <zenmchen@gmail.com>
> ---
> This ID was found from [1] and adding it to the device table should be=20
> enough to make it work. Hardware probes at [2] can prove its existence.
>=20
> [1] https://bushowhige.blogspot.com/2019/08/ubuntu-1804-mediatek-usb-wi-f=
i.html
> [2] https://linux-hardware.org/?id=3Dusb:056e-400a
> ---
>  drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt76x2/usb.c
> index 01cb3b283..459c4044f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
> @@ -16,6 +16,7 @@ static const struct usb_device_id mt76x2u_device_table[=
] =3D {
>  	{ USB_DEVICE(0x0e8d, 0x7612) },	/* Aukey USBAC1200 - Alfa AWUS036ACM */
>  	{ USB_DEVICE(0x057c, 0x8503) },	/* Avm FRITZ!WLAN AC860 */
>  	{ USB_DEVICE(0x7392, 0xb711) },	/* Edimax EW 7722 UAC */
> +	{ USB_DEVICE(0x056e, 0x400a) },	/* ELECOM WDC-867SU3S */
>  	{ USB_DEVICE(0x0e8d, 0x7632) },	/* HC-M7662BU1 */
>  	{ USB_DEVICE(0x0471, 0x2126) }, /* LiteOn WN4516R module, nonstandard U=
SB connector */
>  	{ USB_DEVICE(0x0471, 0x7600) }, /* LiteOn WN4519R module, nonstandard U=
SB connector */
> --=20
> 2.53.0
>=20

--ECjadagwUqD3QKe7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCadYhMgAKCRA6cBh0uS2t
rH4BAQDadaOqA+izjfKsqTGZE4t7netvYf9LX/dwKhfjXP+BpwEAmT0UWS1fM3wY
y/Xgc7k8ncdplQixrzhIVJD56iveDAM=
=Vfip
-----END PGP SIGNATURE-----

--ECjadagwUqD3QKe7--

