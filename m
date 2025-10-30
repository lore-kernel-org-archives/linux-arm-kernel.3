Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBEFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1y3B+8RUYFHKy7C4XHtKEXlhSgIPJIedO3quTvmsnw=; b=XGN5Zl+C6MJHLJzoEgcaX9qkbh
	rWAj3CP3WAGFiFkE85gbNF7bOR8R2T/XqUERpY5w0Qj0LLgIIxrDBXqUd/S7tyT3GWSi6JfLTXzPk
	XE47kYbioej/5ujzzeQdM7a/Rh6hwAG81LliV/xcNIhXQg1MD+CbGV2vN66jbVlQ9eOe1rQ/tYwpa
	vJ39Ijo84k0cKTVubdhQFu/1wjV13rwGQPPrA3RxL4ctnqW1r54aAijzN1Zc4LyJ3Ou9VEAcDxcSn
	rapTIyVfYA0wkKobxncMUwxrEbialpcXDpm1zNysahmwNyaREa2AoaO3Ie+VMN6kwSixAhzunrqTh
	yLSIS9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWKM-00000004X0X-2TBa;
	Thu, 30 Oct 2025 17:20:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWKL-00000004X02-0kIV;
	Thu, 30 Oct 2025 17:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9594441BB;
	Thu, 30 Oct 2025 17:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15760C4CEF8;
	Thu, 30 Oct 2025 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761844843;
	bh=u1y3B+8RUYFHKy7C4XHtKEXlhSgIPJIedO3quTvmsnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkjBz/+eMf9gwnuS/btR8gNRi5Y9H5T1/MvDgOETJ01Dlf7POOO8RpU31DJXRWkz0
	 2sg5vdBqJj8Ph6kWnzFnjJqOVHS0p9qIdVvuTwEQdEkbWnKfitwI60rwv1R0RaXOIM
	 SllKsLbXxhoU+lYjc5zZSCwVSFAaxUBYQb1pw/L2dvWot+q9EEwCz01cn454THCbNq
	 eW15Oz+PjCT/eyWSex7gJkIKAg9STU6JMZ93zoBM4JW6g3PVmElPdab0CgaA3lJY0S
	 V180/yFR9pgQdRK2zMgvjebt/1nWBiFL0eYyUUTKzuqEz6PjDvxKLTfQ4gaxsmO29o
	 dKSoOx1QelBig==
Date: Thu, 30 Oct 2025 18:20:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, srini@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, chunfeng.yun@mediatek.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, sean.wang@mediatek.com, zhiyong.tao@mediatek.com, 
	andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, jitao.shi@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 04/11] dt-bindings: pwm: Support MediaTek MT8189 evb
 board disp-pwm
Message-ID: <fqceagmqxbix4bnpacimf2lwpnwrw3gpwzknh3a7pt7sfmccm2@4jnh4ynkwwcg>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-5-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnp73246a7ax7u7v"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-5-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_102045_237706_2A5EBD26 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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


--tnp73246a7ax7u7v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 04/11] dt-bindings: pwm: Support MediaTek MT8189 evb
 board disp-pwm
MIME-Version: 1.0

On Thu, Oct 30, 2025 at 09:44:36PM +0800, Jack Hsu wrote:
> add compatible string for mt8189 evb board dts node of disp-pwm
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>

LGTM. Assuming this patch will go in together with the other patches
=66rom this series via arm-soc:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--tnp73246a7ax7u7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkDnmYACgkQj4D7WH0S
/k6ntAgAmefAEgqrCjLWiUHmGcabEITjr9SAE4YojmK2oq78HLZC4n0T3P19U5zm
VFVFw+gARsZVw2CQ2ANeQiQBXWVDyT8BQ9Vh0PZZvVvE7fqMZM3FfIQ9bU2OgdWE
vmSpfUBeyu1Fm95OZrMi475gX0v9ej4Tj6uLesaLywvcW0l8JZRPpRHDwpARP7rL
fXgtxa69IAvwq1YGDcJfHXe3M+Z4t7OIJpE8qbAVkTpAqH438a26TzlQEgxHsXzi
4C26RMlvhfSb/Ajn1ZU+y1SYyskpUOyGNUKMVYYoRUQEN9D/o3Mrx1T8BAhzpu5A
XXCuNcZ2Tx5Mz3amOjApNarZkQVZhw==
=Yaxj
-----END PGP SIGNATURE-----

--tnp73246a7ax7u7v--

