Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1383606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jLf3Q3lU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hvnzdb5d;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ovcCqlh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VMhnWUVSQ2tILOB4G/emtQlgU+NR+argJ27mPCGNL+4=; b=jLf3Q3lUJ0ad8c+Tbq1rQ76Cq4
	QP5jpjgoXmTiB3LkArq5WGatDEmCypwlsxodFT0VzhW1zA6MEyHNd/YJo8wRzHB+mDouu6wZJOHum
	IM6DZ+DjHnIOe2eWaFH27f9cHOLt80iwqEdT+7Npa+wghfsXHorEEI+U5SUiTarmCl9IeqpQ4Mc7+
	QfOh02+qPpErDs9+P2+ojHIIUHgshOq+PV8JArLrUVxitu7/gCqEQpGRtuNfGYGV5WPdwqHlF3Rf8
	X3w4fxqOg8XR/4izYlSgxvL1g0Dm69euV3stfZo0lkTaaHluw8Y1Avpk4cnmXpxKIZxcTtKxBu6WN
	XrG06MuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvmb-00000008gO2-2toe;
	Thu, 05 Nov 2026 11:37:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvmX-00000008gL6-0Whq;
	Thu, 05 Nov 2026 11:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VMhnWUVSQ2tILOB4G/emtQlgU+NR+argJ27mPCGNL+4=; b=Hvnzdb5dFEhacdePPuhGFZXXkR
	+zIDqrPcAlMb2DiyrPfZgYOfycgYybM9QIVT26m4iPUeMEdnUV5qi3Li1xVk8k4lnKqznuAA2hppH
	YDG0e8tnV7NCo6Rxp2ZU6gehnr4uWTDaptAK25bCVYr6lx2DuIbCrMoUCEer6+7lGx4r40dWYM2Rn
	t8rOVptU5ABcihrhWHZ0Q51v1RbhvIbM5yR1XDLybLG1thWRREjHQryKZpbstR1sm/Yybm+f51CTi
	3qxHHX/cHnds0lfrhbcipvt8pm4UPb8gpXKzrWK0ZFp+KEKzFplncmrOfhn2vlHFJ1pqVSvaosi7j
	YWtbm2QA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvmU-00000002tnW-0gAK;
	Thu, 05 Nov 2026 11:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VMhnWUVSQ2tILOB4G/emtQlgU+NR+argJ27mPCGNL+4=; b=ovcCqlh7VrjwANEc7//D13mAC7
	VksmRuZHZ/2GBLXZhGPO/i9gLDz/Uh4ZlTcJfTilOWw4jrcidB6sCY0aa2IDhhiBXBMCcei44br/N
	xQcZJKGqIHwaf9qXFMnN9G1DRw6VnLyoS0iZFFUu2jLH/Xz4t1VU84HUJEOlSjsk5uPc1FSiF9//a
	lEDTZWM7pNflmGJh4AhEWFG4WpBUlVTUQzFQLASEFPXmGwpbNlEcFN5iFwV1S8Ysu/S4uFy6V6NOx
	jycjBSr6knqI86H0o3xwoslL8tbZgX14BtXg+ll1GWEPWB5wwgB5v+5iErkUTxlZlxEbrwGuHsdB/
	Qt56sqfg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Thu, 05 Nov 2026 12:37:13 +0100
Message-ID: <3342569.D8ZAKjAxdT@diego>
In-Reply-To: <20261105102556.1365-1-yaozhonguwl@gmail.com>
References: <20261105102556.1365-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_113722_105157_8AE2521A 
X-CRM114-Status: GOOD (  27.22  )
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Donnerstag, 5. November 2026, 11:25:56 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Yaozhong Li:
> Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
> schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
> of the WiFi SDIO node instead, and that consumer keeps the rail from
> switching to 1.8V.
>=20
> The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
> supply stays vcc1v8_s3.
>=20
> Fix the supplies of sdio0 and sdmmc accordingly and enable SDR104, which
> now becomes possible.
>=20
> With UHS enabled, sequential read from a 64GB SDXC card inserted after
> boot goes from 22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz,
> with no WiFi errors.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
> Changes in v2:
> - Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
>   instead of dropping it (Heiko)
> - Rewrite the commit message (Heiko)
> - Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhong=
uwl@gmail.com/
>=20
> A note on testing: with a card in the slot at boot, the first
> initialisation fails tuning ("All phases bad") and the card comes up in
> high speed mode, as it does without this patch. A card inserted after
> boot, or a rebind of the controller, comes up in SDR104; the numbers
> above were taken that way.
>=20
> The GRF io-domain device binds about 250 ms after fe320000.mmc here, so
> SDMMC0_VDD is still configured for 3.3V when the card switches to 1.8V.
> Forcing that GRF_IO_VSEL bit to 3.3V with the io-domain driver unbound
> reproduces the same failure on demand. This looks like the probe
> ordering issue Jonas described for the ROCK 3B [1]. It also happens with
> SDR50, with a second card, and with sdio0 left without a vmmc-supply as
> in v1.
>=20
> If you would rather not enable UHS until that is solved, I can send the
> supply changes on their own.
>=20
> [1] https://lore.kernel.org/all/e9ff5387-b3c1-41a7-b251-a12789d25a70@kwib=
oo.se/
>=20
>  arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64=
/boot/dts/rockchip/rk3399-firefly.dts
> index 0568dfa..fe1f8d7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -777,7 +777,7 @@ &sdio0 {
> =20
>  	/* Power supply */
>  	vqmmc-supply =3D <&vcc1v8_s3>;	/* IO line */
> -	vmmc-supply =3D <&vcc_sdio>;	/* card's power */
> +	vmmc-supply =3D <&vcc3v3_sys>;	/* card's power */
> =20
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> @@ -804,6 +804,8 @@ &sdmmc {
>  	max-frequency =3D <150000000>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;

=46rom the schematics vcc3v3_sys also supplies the sd-slot (via an
always-on regulator / page 20 for me),  so adding

	vmmc-supply =3D <&vcc3v3_sys>;

would be nice, so that the declaration becomes more complete.

> +	vqmmc-supply =3D <&vcc_sdio>;
>  	status =3D "okay";
>  };


Thanks
Heiko



