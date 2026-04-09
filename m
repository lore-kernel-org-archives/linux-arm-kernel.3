Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED049EA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iE8w8BKR9j/c/KXxBdy3hHdvFhkW5sMVrg83EMjqrqE=; b=oLh3rNDY2EDRjtk2+C5xywyunY
	79xZ25L0jlNmKr9jJ8RBKBe/PJZv1hiR/3YBIUkx1of2MfrQfVVq4OJGzN0yWos87yJjZZ9v9+diD
	B52TUjZECxmd0SreBGIomf4/cAhInVTDV7g0HPF77yCuDwOoeQsZn8MuWQoM7KkC0V2iwYFuIsA3h
	AhpXXeCQWUZEX2ByG++1yH8lN7UXyAl4cR7i9bR2W1Mv7UmLArOmK/HcdBqrmW/oJAQUmh6w5q4Fn
	a9Ay2Sjas4oRUbmawveYDbEXF6VxJp5uNVe9fb2CgJsVeAtZJTPvFDLbUNpcZRHqe1MVmjuzhB/QR
	QUtCSHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp9E-0000000AS5s-0EZn;
	Thu, 09 Apr 2026 13:10:16 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp99-0000000AS48-0zRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:10:14 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775740202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iE8w8BKR9j/c/KXxBdy3hHdvFhkW5sMVrg83EMjqrqE=;
	b=N9Bco2Ei3oTM6eVFFmiNqUiCX0NTEkLaqtjBfRsV5q/xJ8gOTt81MFvLwuUNXEYR/pkr53
	XTxf8e5oRSJVghhqEUrMCQ4gUiXjHMqbpBaZwWlmEaLRUZ/v1Fa51J+RSQO4NPqZyeWVOW
	POg0F86nqnX0ZjGNgR95HygdWV3ORZI=
Date: Thu, 09 Apr 2026 13:09:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <7ac2cb56696a4d23f5951291101ce5292c9042c2@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt
 port to lan5
To: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, "Daniel Golle" <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "Andrew
 LaMarche" <andrewjlamarche@gmail.com>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260303202006.37515-1-linux@fw-web.de>
References: <20260303202006.37515-1-linux@fw-web.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061012_644290_E4FD3BF5 
X-CRM114-Status: GOOD (  11.94  )
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

Hi,

just a friendly ping....

Am 3. M=C3=A4rz 2026 um 21:20 schrieb "Frank Wunderlich" <linux@fw-web.de=
 mailto:linux@fw-web.de?to=3D%22Frank%20Wunderlich%22%20%3Clinux%40fw-web=
.de%3E >:
>=20
>=20From: Frank Wunderlich <frank-w@public-files.de>
>=20
>=20It turns out that the label mgmt confuses users and now official case=
 is
> released where the port is labeled with number 5. So just rename it to
> lan5 to follow naming convension (lan1-4 from mxl switch and lan6 for l=
an-
> combo).
>=20
>=20Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro=
.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> index a48132f09411..1175ee156cb3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> @@ -207,7 +207,7 @@ &gsw_phy0_led0 {
>  };
>=20=20
>=20 &gsw_port0 {
> - label =3D "mgmt";
> + label =3D "lan5";
>  };
>=20=20
>=20 /* R4Pro has only port 0 connected, so disable the others */
> --=20
>=202.43.0
>=20

regards=20Frank

