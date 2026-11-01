Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC1606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qq/leWZl;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=wfMt29t9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7SWnd7QbyWt5i8UF5eX0OMKAyqT339F4dwQJ7Y7Vi1k=; b=qq/leWZl6zVYe9AkWznJr81jMt
	wNwzoHg8RpPR6re5mFoOsEZHvNxA83E3H+jZzQuVNJJxg67hVwfsk/n1Mnaz0ViG90SWtvIZ2eKUn
	TS3XABKZ+imG9XHFvwCmY4owiLsZb1jC9mLi4mIxMVOGQcD7tGEuQ5lqXfCdd2bCuDRSAMQ8upYbd
	DxbZ4aAIcSy4Qlwf3ZkNPaHNr9AUxy1o0W/TDQ6W9Cq4bBRPt1HoBGW3NXc5QOs3z5r+kpdd4hkrT
	N7FFsAUTG2MZgjRjPjYS+sPzVQ42c841dRn6YYr/HEjw730wq2extuXi6YI/eOzLtqGz8QMQ/Yue8
	jVq3MlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZmJ-0000000EjeN-2Zrg;
	Sun, 01 Nov 2026 17:55:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZmH-0000000Ejdz-01Fs;
	Sun, 01 Nov 2026 17:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7SWnd7QbyWt5i8UF5eX0OMKAyqT339F4dwQJ7Y7Vi1k=; b=wfMt29t93sQga2fu+5B7V28bIv
	Rr1BIKJibXRNt7NHit6+r+xACmqtAk9tDyjKcFSW1XvxRzlj4iImsAB3HZkVrkcCP2ENfnJgzoDzv
	ajj7f4GoV5IyD+WDMA3NLfgXWhNlmgpXfr9fJ7XbHMF0Zi5yyy8dkbMUm0Z91pkO99+8zriU5L3Bi
	Bh8qYYTAhcjVv7jyU3Wa1Sti4yAjgCC9WcvOD1wxYtMIuT8v48huzb0Xp8+91nuw5dI4z42ihZsLX
	CVurrkT0N55QVTiH4a/91mAuiPF7Lt56z1F8AOO6vzKC44G1P0DDlFfcrrydGoETTrjIki1ihFj5s
	eRcPuN1g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Sun, 01 Nov 2026 18:55:25 +0100
Message-ID: <2120863.kXSN5OTJKJ@phil>
In-Reply-To: <b8221ba4-dccb-42f5-ae77-a6c087fa1d05@rock-chips.com>
References: <20260922055011.14972-1-yaozhonguwl@gmail.com>
 <b8221ba4-dccb-42f5-ae77-a6c087fa1d05@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_095533_124850_1031E1B9 
X-CRM114-Status: GOOD (  23.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 17:10:04 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Shawn Lin:
> =E5=9C=A8 2026/09/22 =E6=98=9F=E6=9C=9F=E4=BA=8C 13:50, Yaozhong Li =E5=
=86=99=E9=81=93:
> > The SD slot on this board stays at 50 MHz with 3.3V signalling. The
>=20
> ...
>=20
> >=20
> > I have no schematic for this board. The claim about what LDO4 feeds
> > rests on the vendor firmware device tree plus the measurements above.
> >=20
>=20
> It's easy to find one:
> https://github.com/armbian/armbian.github.io/blob/main/board-schematics/f=
irefly-rk3399.pdf
>=20
> Too bad it was designed this way! What if sdio-wifi is working on UHS
> modebut people insert a HighSpeed only sd card?

Hmm, when I read the schematics correctly, all parts of the sdio + wifi
supplied by vcc_1v8 (both APIO3_VDD_1V8 and also vddio of the wifi module
itself), while vcc_sdio only supplies SDMMC0_VDD?


Yaozhong Li: please trim that commit message down a lot, it doesn't
have to be novel size please.


Heiko

>=20
> > The analysis and the commit message were drafted with the help of an
> > LLM-based assistant (Claude Code), cross-reviewed with a second one
> > (OpenAI Codex). The device tree change, the measurements and the final
> > wording are mine.
> >=20
> >   arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm=
64/boot/dts/rockchip/rk3399-firefly.dts
> > index 0568dfa..7cabbc1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> > @@ -777,7 +777,6 @@ &sdio0 {
> >  =20
> >   	/* Power supply */
> >   	vqmmc-supply =3D <&vcc1v8_s3>;	/* IO line */
> > -	vmmc-supply =3D <&vcc_sdio>;	/* card's power */
> >  =20
> >   	#address-cells =3D <1>;
> >   	#size-cells =3D <0>;
> > @@ -804,6 +803,8 @@ &sdmmc {
> >   	max-frequency =3D <150000000>;
> >   	pinctrl-names =3D "default";
> >   	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> > +	sd-uhs-sdr104;
> > +	vqmmc-supply =3D <&vcc_sdio>;
> >   	status =3D "okay";
> >   };
> >  =20
> >=20
> > base-commit: 940de590b839f71d6dc846160534bf202401b8b7
>=20
>=20





