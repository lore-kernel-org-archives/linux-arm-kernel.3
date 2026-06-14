Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F8CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuFCWVB426Kzg7aDhxtI+gq3b38s6oLNCDY46FNMzIs=; b=ni9nZ2bBVN/Kv46cAR6LkN4HB1
	MHiXcGaFfwVv4BT6BUtkvZPLeO6zLAC3ZgAp4Cv39H2v22yc2tdx06F/n0AnD+wWefQmqV6HHuwCj
	d7dxPlJ8b16NvmZAgGjZMclCmjzH/IP7OJaAGGgUYUP2XCF4twAIB3w+nq+Dalv2WlQdk+tcDHNJN
	3JDHW16e1bhTedfnrrQaBdpV7od7fPpYZmfDrZxCQ0OvF0M/1YYfkExQik38jXRI/7SOHPerh9hwl
	F1c1o1dT+QUB2G7kyMzN1wcBPwKLpUvPXqNU+nY7pf4SaqlVUBgEzWMNpPaniWb+xO2FbBRsz+c9I
	uWJsWoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYg1f-0000000Cot9-2htm;
	Sun, 14 Jun 2026 08:17:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYg1e-0000000Cosw-0by3;
	Sun, 14 Jun 2026 08:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B28D6008A;
	Sun, 14 Jun 2026 08:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9232E1F000E9;
	Sun, 14 Jun 2026 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781425020;
	bh=kuFCWVB426Kzg7aDhxtI+gq3b38s6oLNCDY46FNMzIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g3dJK+QQiIJ/R6pfAJSQShczhFQz1HRk4taNVoov5l1qOpsUQ9+v7335+qBVn8g+t
	 bgeELe2bcKj7U8Tdo1OdI7L/LqRm/KIlidjEd2Y9LtoJ79XQbqHPIY2QUI5g3JzSYN
	 vDJPDjoGI0G2Y6r/SIwAQz2IZasWKImutBDwAbVSyTBRnwMoBvKetqpXme7pMBSJFH
	 zg3RhqEfDM1nBxg9GDV8ofaXtLszPZSh8+PU+mmwvbeIIG3JUzoWdWuFFRLns+xznI
	 Z3/1Z3x09Lq1i9GuEF0FE1PU4XSpT2pk9KJvpxRnCvJ+YKVNV3xgxnfik/Oon6nPFl
	 rcf0+lAHg02hw==
Date: Sun, 14 Jun 2026 10:16:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Remove dead MT7996 NPU firmware declarations
Message-ID: <ai5jeubrGN1iMgHo@lore-desk>
References: <6a2dea77.01c4f138.336eeb.a256@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VFcFtyNt1TMkbinK"
Content-Disposition: inline
In-Reply-To: <6a2dea77.01c4f138.336eeb.a256@mx.google.com>
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


--VFcFtyNt1TMkbinK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Remove the NPU_EN7581_7996_FIRMWARE_DATA/RV32 #define macros and
> their corresponding MODULE_FIRMWARE() declarations. Neither the
> en7581_npu_soc_data nor the an7583_npu_soc_data references these
> firmware names, and no firmware loading path in the driver ever
> requests them. The only references are the #define lines themselves
> and the MODULE_FIRMWARE() declarations below.
>=20
> Keeping dead MODULE_FIRMWARE entries causes modprobe/udev to attempt
> pre-loading non-existent firmware files, generating kernel log noise
> and misleading distributors about which firmware files to package.
>=20
> Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> Signed-off-by: Wayen <win847@gmail.com>

Please drop this patch since EN7581_7996 firmware is defined via dts
for 7581:

commit 3847173525e307ebcd23bd4863da943ea78b0057
Author: Lorenzo Bianconi <lorenzo@kernel.org>
Date:   Tue Jan 20 11:17:18 2026 +0100

    net: airoha: npu: Add the capability to read firmware names from dts
   =20
    Introduce the capability to read the firmware binary names from device-=
tree
    using the firmware-name property if available.
    This patch is needed because NPU firmware binaries are board specific s=
ince
    they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
    MT7992) and the WiFi chip version info is not available in the NPU driv=
er.
    This is a preliminary patch to enable MT76 NPU offloading if the Airoha=
 SoC
    is equipped with MT7996 (Eagle) WiFi chipset.

https://github.com/openwrt/openwrt/blob/main/target/linux/airoha/dts/an7581=
-npu-mt7996.dtsi

and here these macros are used to notify userspace for firmware loading.

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 17dbdc8325..93095f3894 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -16,8 +16,6 @@
> =20
>  #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
>  #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
> -#define NPU_EN7581_7996_FIRMWARE_DATA		"airoha/en7581_MT7996_npu_data.bi=
n"
> -#define NPU_EN7581_7996_FIRMWARE_RV32		"airoha/en7581_MT7996_npu_rv32.bi=
n"
>  #define NPU_AN7583_FIRMWARE_DATA		"airoha/an7583_npu_data.bin"
>  #define NPU_AN7583_FIRMWARE_RV32		"airoha/an7583_npu_rv32.bin"
>  #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
> @@ -822,8 +820,6 @@ module_platform_driver(airoha_npu_driver);
> =20
>  MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
>  MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
> -MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_DATA);
> -MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_RV32);
>  MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
>  MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
>  MODULE_LICENSE("GPL");
> --=20
> 2.51.0
>=20
>=20

--VFcFtyNt1TMkbinK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai5jegAKCRA6cBh0uS2t
rCZWAQDu7IbS3lUX4tiezcJcZUn2Vmnen2mw6vP0GQWec0CDXwD/SwRxiFKqJ5om
MZ+MOgEjSVMNa8CZl2ZANR4iDqBVtwU=
=jB5j
-----END PGP SIGNATURE-----

--VFcFtyNt1TMkbinK--

