Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78322C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxQXwJrG1MIxQsKzgyjzbTV53XVCvhmpZmkrCd8dgd8=; b=lXUhXpnHdGE/tl6mQ4LhouLG19
	CseB9MBGNs6WgCeCKmw+E2QtQ0bPcEbWbQRYAvMsJec061zG5i+H603KsDJsmxd/x0+D2HjcbfujS
	d0P7z2KViutSRG4s7InLpYpnuQQ0vlPJCagBnov1b8J+FfSW9HF7naLPNm53FYTIBBEt+q3Ox/UWD
	R09vrfU35mJhxBCjlPR2S3jgcLbgbF+Ai9yUgcC6+C5mSRqaxK1ZieM4oe0uD4Sz6fH8XVjS2LxhX
	vn9Xl2KytRwKwePOo/PwBp2hKj0h50xW09ssGDX2fFdjRqmgde67OHCIBAhaqvT+aB1mqFYK01MzT
	hj3XSWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVRU-00000004z0Y-0ggD;
	Fri, 09 May 2025 21:39:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVPS-00000004yot-1iZq;
	Fri, 09 May 2025 21:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QxQXwJrG1MIxQsKzgyjzbTV53XVCvhmpZmkrCd8dgd8=; b=HAZ1E+0nJ1o48jCxodnUtC2uBj
	pKb1E7NXo7Tigo3/UD6LcWEs3SG+g3KKVWYkQv/0m2jux8iA7dnLRNYa8SjB3A7BTeffTsXNPwA8j
	GHRTtnP4IJtVt1OZlUVz6gfTb1gFswlhDAnASTTqI86JfEVeNb/YMwhB3o3vOcd/7Cn09OM2LHysZ
	XqJL+lQWMwdnPv0pYjpsHZlZIk/mO1ZSYCrqZEh1+5Tput4pNmFIbQJWiSDM5r0fwMD7M5Tq1vKfg
	dVCNDKuHKMeG8D6uXpHOXHJP7iqUsRkcFwdpwc0hW/oJt3yTBiwW8DCm63ftSU9cKct1OJSE7ogkp
	2S86RGfg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDVPN-00063i-Ju; Fri, 09 May 2025 23:37:29 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: arm <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.16 #1
Date: Fri, 09 May 2025 23:37:28 +0200
Message-ID: <2857184.BEx9A2HvPv@diego>
In-Reply-To: <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
References: <2307187.iZASKD2KPV@diego>
 <c142bdf4-3910-48bb-ba5e-8accbdb32a00@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_143734_448494_8D6F4FBD 
X-CRM114-Status: GOOD (  21.47  )
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

Hi Arnd,

Am Freitag, 9. Mai 2025, 23:03:54 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Arnd Bergmann:
> On Thu, May 8, 2025, at 00:04, Heiko Stuebner wrote:
> > Hi soc maintainers,
> >
> > please find below and in a subsequent pull-requests
> > Rockchip changes for for 6.16 .
> >
> > Even some arm32 boards got some love (in the next PR)
>=20
> One small issue stuck out here:
>=20
>=20
> > Yao Zi (2):
> >       arm64: dts: rockchip: Add I2C controllers for RK3528
>=20
> This creates a lot of new aliases in the dtsi file:
>=20
> index 826f9be0be19..2c9780069af9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,6 +24,14 @@ aliases {
>                 gpio2 =3D &gpio2;
>                 gpio3 =3D &gpio3;
>                 gpio4 =3D &gpio4;
> +               i2c0 =3D &i2c0;
> +               i2c1 =3D &i2c1;
> +               i2c2 =3D &i2c2;
> +               i2c3 =3D &i2c3;
> +               i2c4 =3D &i2c4;
> +               i2c5 =3D &i2c5;
> +               i2c6 =3D &i2c6;
> +               i2c7 =3D &i2c7;
>                 serial0 =3D &uart0;
>                 serial1 =3D &uart1;
>=20
> but the corresponding nodes are left at disabled. I see
> that the same mistake is present in the uart nodes.
>=20
> Please send a fixup to remove these from the .dtsi file
> here and the similar chips, unless you are sure that every
> board will have them enabled (like e.g. the gpio nodes).
>=20
> The aliases are not meant to refer to soc-internal names,
> but the identifiers on board.

=46or the uarts and i2c (and spi), all the identifiers are always numerical
both in the SoC documentation as well as on the boards and board
schematics.

If you look in a random Rockchip schematic file, the lines for the i2c0
controller will be called i2c0_scl_foo, i2c0_sda_foo, etc.
Similar uart0_tx, uart0_rx, etc.

So while I fully understand that mmc0 -> emmc, mmc1 -> sd-card are very
much board specific, somehow repeating the very same i2c aliases for every
board feels strange. The 7th i2c controller on the soc, will never be
called anything else than i2c7 afterall.


But ok, if you feel strongly about that, I'll move the i2c and uart aliases.


Heiko



