Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA08D29FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kOkEvWB8IjrnJSFWvfV7NsR+wn8pdfHtmGf3dF5Aic=; b=N/FK/UekNk2Kr9NGU34kkQmZeQ
	K+3gmB9P3MFroQDO+mavQjBPitSip2s1YqWNBfz5xA6DqpdZgmtwhpZL1SO+YGc+ExCIyn7HPZyWv
	/fJo5VAHUTzObVc1MGFZInDG+IetUaSGxmKZhABp7jotBXkAc4Gw0Qj5TvA95W+u8hdNIJ/xUMiUy
	77CBHSA9U7qFHPfJjxrKtHpAhJB/OP1W1v5z1NEOfTNQzoru+3xNQFaFbMXHDEjjBu6PcBrl0wuo4
	+ICaXhrRQOTUB8foQlY708u9SvI5Adj7yThnru7sXGkp2KFBdi0PbnX2GVlVJ7ZutoyTriSn+AKX7
	IEebbblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIE6-0000000BxNq-3Bop;
	Thu, 15 Jan 2026 07:57:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIE5-0000000BxNg-1ZbL;
	Thu, 15 Jan 2026 07:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3380960167;
	Thu, 15 Jan 2026 07:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899D1C116D0;
	Thu, 15 Jan 2026 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768463823;
	bh=z7M1gJSxco/n4ZsPehNhTapu74iwMGfHlhkpGIYRppU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxUWpxsPOzHxOA0tGdbH62iRX4bmlHdJ4ghaK0B9VqEVDKqGzIE19FruKFYFVBVGK
	 cWQqk+drILJSEIGsBFzk26fMSBtflhxTa6ReUMaFeCtJ7SHcwzGsq5sgpmHIvMBV3d
	 Zzo3ZgeYY1cL8RzYLYSI9NTRn4yXyXpJZ0zF+mPwTsObq8xoOEOeTYaQT2Bc6/sB/Z
	 xFxQ8jF8NHhhmVBGvlFHNEY+uVDBPWrc49KP+AmWf8VfMGN3lyy7Qj5rnz4/WSMNRr
	 O+bbaBgjpVLIC3fc1Yy9oHKzR46sxzkO/Jccdz8C5Ra1ycdyXERKoyyHLIzm2EgpYM
	 hvs1kzMCSec1Q==
Date: Thu, 15 Jan 2026 08:57:01 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sayantan Nandy <sayantann11@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com
Subject: Re: [PATCH] net: airoha_eth: increase max MTU to 9220 for DSA jumbo
 frame support the industry standard for jumbo frame MTU is 9216 bytes. When
 using DSA sub-system, an extra 4 byte tag is added to each frame. To allow
 users to set the standard 9216-byte MTU via ifconfig ,increase
 AIROHA_MAX_MTU to 9220 bytes (9216+4).
Message-ID: <aWidzQgGXpbht9zL@lore-desk>
References: <20260115064043.45589-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agj4UNEhb8R3CoY5"
Content-Disposition: inline
In-Reply-To: <20260115064043.45589-1-sayantann11@gmail.com>
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


--agj4UNEhb8R3CoY5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This change ensures compatibility with common network equipment and jumbo=
 frame configurations.

can you please provide more details?

Regards,
Lorenzo

>=20
> Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index fbbc58133364..20e602d61e61 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -21,7 +21,7 @@
>  #define AIROHA_MAX_NUM_IRQ_BANKS	4
>  #define AIROHA_MAX_DSA_PORTS		7
>  #define AIROHA_MAX_NUM_RSTS		3
> -#define AIROHA_MAX_MTU			9216
> +#define AIROHA_MAX_MTU			9220
>  #define AIROHA_MAX_PACKET_SIZE		2048
>  #define AIROHA_NUM_QOS_CHANNELS		4
>  #define AIROHA_NUM_QOS_QUEUES		8
> --=20
> 2.43.0
>=20

--agj4UNEhb8R3CoY5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWidzQAKCRA6cBh0uS2t
rE5mAQDNH43QGKQqdK54O/WNSaz5NO5TROfHNgllhMJoY2J7gAEArEqFD7ASdBH5
PfGPjeC1j0qi9Ysjn4GYqMIXUyyIWAQ=
=JgeZ
-----END PGP SIGNATURE-----

--agj4UNEhb8R3CoY5--

