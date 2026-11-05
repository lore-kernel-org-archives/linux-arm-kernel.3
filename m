Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E445606EE9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sjHZDC1L;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TjQdIb1l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NOF5QOMavsiAnWtFGJ6Jf9A10hmMS77Tff+wL/xSXu8=; b=sjHZDC1LYxRuXt
	WviggaFvy5U4T0mpHYOoAExWxwvfubwk9hm9nrczGfNtqkHpV2WrS1NaEHPs6rIAAqMdkFk/yKucz
	AHoqT6IxK2lZ6REecLMTmUH4D6tktGLk3N3sETBkvjT7r+WBlqyuTYxKgLi+rXGBPAUt61Af6a+Rm
	PlO/D8EldKA+hNEeTx3t8dvF36KRIb20OnvFmp+fJkuMCgQedMcTAzJoL3EcqV6gWRUZ697A6wpRr
	WiCeZAjHd3r+6YLUvldegZfOLpBTIlsuE19NBB3WAbO/u++CBV+gc20uM3aj8mx5VM6Uvw4flA0ts
	RQYFGttOC8U+Dk+tEWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuSf-00000008Qh4-1RYM;
	Thu, 05 Nov 2026 10:12:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuSc-00000008Qgi-2CPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:12:48 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24D5433D;
	Thu,  5 Nov 2026 11:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793873425;
	bh=GDs6YCbVDxVScqZZAT353arDeziqS2XASVgUdwgJvtI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TjQdIb1lGXuJGu2gow2cLgH9JAWEeq+cuvu2zKL4PQULlTotjt2xbDIjnfBfw4hlB
	 lOJUFOfKaHyJcr9NQDZF3Rxjh+bi72VECj9NSPqObx64SQuN8GIBd2TAlSIONDTE20
	 cL8cBnUksNxep76n/jnevwUomc9NEEZN0dTSHoQA=
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105033224.2880607-1-t-lannynd@ti.com>
References: <20261105033224.2880607-1-t-lannynd@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: b-brnich@ti.com, praneeth@ti.com, r-donadkar@ti.com, devarsht@ti.com, jai.luthra@ideasonboard.com, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Thorsten Lannynd <t-lannynd@ti.com>, linux-arm-kernel@lists.infradead.org
Date: Thu, 05 Nov 2026 10:12:40 +0000
Message-ID: <179387356065.194410.14555444564110226308@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_021246_727264_D4BA06A5 
X-CRM114-Status: GOOD (  11.95  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quoting Thorsten Lannynd (2026-11-05 03:32:24)
> The IMX219 CSI2 expansion module is externally attached. Without the
> orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
> exposed and libcamera fails with:
>=20
>   ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
>   Mandatory V4L2 control 0x009a0922 not available
>=20
> Set orientation =3D <MEDIA_ORIENTATION_EXTERNAL> to fix this.
>=20
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
> v2:
>   - Use MEDIA_ORIENTATION_EXTERNAL instead of <2> (Kieran Bingham)
>   - Add #include <dt-bindings/media/video-interface-devices.h>
>=20
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 149c59c07182..70c2a197f1dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -8,6 +8,7 @@
>  /plugin/;
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interface-devices.h>
> =20
>  &{/} {
>         clk_imx219_fixed: imx219-xclk {
> @@ -72,6 +73,7 @@ ov5640: camera@10 {
>                                 VDDL-supply =3D <&reg_1p2v>;
> =20
>                                 reset-gpios =3D <&exp1 13 GPIO_ACTIVE_HIG=
H>;
> +                               orientation =3D <MEDIA_ORIENTATION_EXTERN=
AL>;
> =20
>                                 port {
>                                         csi2_cam0: endpoint {
> --=20
> 2.34.1
>

