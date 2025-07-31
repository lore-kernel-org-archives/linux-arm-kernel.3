Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I04yD0YtgyJOQ/tADeNk0II4/5tx8Bsowhc0prCMek8=; b=cdAoPE6Vax71bISavKtAKKMk8G
	JuoufIV9yrk4GvPn/+vjdDpipAWdqHEKOv3x2tBXOsPdd03OlzH6/86m616VXNjInL3sYHjb1bcHt
	VyrYIHaWVEWCU1RE4OD1YzOzY9kobqjtTK4mL+iG9zczfbgY54K6KEZegvxdmg9C9Qw87F2aa0F46
	1fIFfBvs1XxZowZlaWXGlZ5EsgGz0379fgxiXEXtEg6fdser/w+5NCa1IXhYEFDN7APIvdtcyJmLE
	ZmHAN8ovtpcpp9pxJwaoQNLFFujskPDe6KajLhV4DTahc8LOkeb5AlsTQmq+DIDMvsvj0gvbS38jd
	7V+bWM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVCJ-00000003yFo-3rgs;
	Thu, 31 Jul 2025 15:27:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhV8p-00000003xry-48Fr;
	Thu, 31 Jul 2025 15:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45C37A5546E;
	Thu, 31 Jul 2025 15:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D56C4CEEF;
	Thu, 31 Jul 2025 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753975462;
	bh=hV+4QbSz5Udx3GshLiQvcY/nKgtH8erkV2rR614Vsok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tA3sXF8Wm+rCh5mCtzlnzkpSBzdJoXk9uSm04XD8G9+Xe5wPjXpJ4iw2zM1jkor20
	 i4KXvmcOZ7WWlRvwPhSiIs1SPOheHn/6xyQ0fQslkUJVFNXoz5IadUOSTgEog7jKmW
	 FIVJ3hqnsenhiJ43t/lk9fwP48XUqtV6oWICB6s6HuhzLTH4eO52tw/S4Cj3Ut1dUm
	 +vUgpTgdQhY7eGIQY1ov5B8CfJQB3Otitgqz49+4RmJPzCkfEew0aePtsGJmuGLirm
	 XvAjFnWzTY1jfUzZWhlOCZViCSnFXCHtaqIaj1/w2L8nO3se8Uj7f7y7OM5xm1ydpQ
	 PtHBAHEbsi6qA==
Date: Thu, 31 Jul 2025 17:24:20 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: npu: Add missing MODULE_FIRMWARE macros
Message-ID: <aIuKpP-wKp1FA8jM@lore-desk>
References: <20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org>
 <1ef51e54-9ad1-4e98-aaba-63d493e22959@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E2aXBMfY4AdSuySP"
Content-Disposition: inline
In-Reply-To: <1ef51e54-9ad1-4e98-aaba-63d493e22959@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_082424_093156_FF2B3BA3 
X-CRM114-Status: GOOD (  10.78  )
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


--E2aXBMfY4AdSuySP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Jul 31, 2025 at 12:25:21PM +0200, Lorenzo Bianconi wrote:
> > Introduce missing MODULE_FIRMWARE definitions for firmware autoload.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> If this is for net it needs a Fixes: tag.

ack, right. I will add it in v2.

Regards,
Lorenzo

>=20
>     Andrew
>=20
> ---
> pw-bot: cr

--E2aXBMfY4AdSuySP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaIuKpAAKCRA6cBh0uS2t
rLfQAQDKaUprICj1f1jY9i/BonCKzcGgE8L5TpLpaeKx2bdKGwD8CYzZ+VBSB8Rc
eh1L1nTp4U8W+SKz05d/eRhmsNs3BA4=
=1Iaq
-----END PGP SIGNATURE-----

--E2aXBMfY4AdSuySP--

