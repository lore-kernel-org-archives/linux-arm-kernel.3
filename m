Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3D9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRT2HC3e4K5AX5o2Ld9A4kx4qzpZuC59viiQU6xaBO8=; b=cikH7N3/uM1BAPvYZ1g9Q3K4B9
	QVxe9ZdOEixB1/lA4COiVr5gHYGuoBQHyGJDGqHtG5+iIfVT1Jx4OLAhgoPK1z7zsH/2MoipJ+7ND
	uvZEEbHNHIRWbFSXdZ6vw54cTqy/0U4X7OPYWMBJwMdT8HzKK2d751TboXPJitwOyGdVCH8Aefz9a
	Hnx6qKA5rZUhmkcrMTz5obSmBGctw7Ukw8Zmy3v143J2V03tMzdhPd/MZyVp6wh6QuonV5s95emWv
	SAgKvXXPa8YnnZc4jyr5nNpQXMFPXcHDC7ssdJ8d/yNnMAuOilnJQU5ByJB3zpYNGi5m4AKfBjnOY
	hgJ7GxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxhSw-0000000EPME-1VMs;
	Sat, 22 Aug 2026 08:52:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxhSu-0000000EPM5-32SA;
	Sat, 22 Aug 2026 08:52:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E25414C6;
	Sat, 22 Aug 2026 08:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515641F000E9;
	Sat, 22 Aug 2026 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787388756;
	bh=pRT2HC3e4K5AX5o2Ld9A4kx4qzpZuC59viiQU6xaBO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d4wsDVas/Q9Ljsb3PtAKhZFGFePpBzd2LGdfe18PfvmSgCQwAC0heZVkr/JDM22p+
	 /lpi4SgWAMQS7TjiDfvjPJNcEHRfq4UCBtre6W3mYtPmBfbxh9AfwPwN8fWTJPScEx
	 yTxiTGlSvhRSCcEj60gelX8IG3De5QnUuFfx3foONNbmK0SNZQil5AZ/NbXSqgKGYp
	 ZH8d8PFFzbmMP6t6hdRb32n/jYYTvXAFXl7+yBZwdEYekSaLNTLG+mahagyO784bNm
	 oSM0DLu4UZhkTMq4r8A7glmS5oaYGe3F+J6VUN0bYHUsknTwf/pbuVZrWj5jIr3ESz
	 Tyvj4CSrPhboA==
Date: Sat, 22 Aug 2026 10:52:32 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shiji Yang <yangshiji66@outlook.com>, netdev@vger.kernel.org,
	Rex Lu <rex.lu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF
 to 0x80
Message-ID: <aoljUFw-rQTLDXg0@lore-qca>
References: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
 <20260821174121.326f3c49@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2D5i0aIdzt8Hqvqs"
Content-Disposition: inline
In-Reply-To: <20260821174121.326f3c49@kernel.org>
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

--2D5i0aIdzt8Hqvqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 21, Jakub Kicinski wrote:
> On Wed, 19 Aug 2026 21:07:07 +0800 Shiji Yang wrote:
> > Change WDMA RESV_BUFF from 0x40 to 0x80 to avoid CDM TX FIFO overflow.
> > Without this patch mt7986 and mt7981 may have WDMA TX hang issue. This
> > patch was pulled from mtk-openwrt-feeds GPL open source project.
>=20
> Lorenzo, could you TAL? (incl. Simon's suggestion of the Fixes tag)

sure, I am AFK now, I will review it next week.

Regards,
Lorenzo

--2D5i0aIdzt8Hqvqs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaoljUAAKCRA6cBh0uS2t
rMCMAQD5Qhui+X9AUoo4oP0JV/Wuu0TQWDg8vvOxE6LmoOSbHgD/XM3ORM99Gp+R
ASb7s30VS2r9X2oSaUY9H1C0wOUwYAw=
=geZr
-----END PGP SIGNATURE-----

--2D5i0aIdzt8Hqvqs--

