Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A440E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZOTCynK;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=MWxIkkSj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4UHIrg6NGC+slns24nqTvKAXnWRFIxoZbfAVKA0TEKg=; b=wZOTCynKbG8+IO
	HTe9tOQYuvNgybZPr29BMONMLZ4wvaNWFybARcCTn36/NUBELEhezVreBi1KGzGRNMJRJBZilXzAb
	n/F0DAj5ApkNJvoaT4ndhikVlVYwMl71GT8httnDYIEBpBATd7ae0eQfgvM/ILkO48IXm3RgHr3Uv
	CG3qWZ5Yr51zIdcW0ks/fUq7SGAjCWn/fj0/BoqWgxRqmqmjd50rcjXDya2zytgfkw8pDG2/GEXDm
	dVhMu+8CcFJArBIfAZ1N54Q+q2KF5YBD+8KXjne+mQyLCsZjdwEtG0eNFeamfnmg/HyaPM1qQa8Ds
	LbvA1SVXd14V2kiE8Sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvLx-00000008b0G-0Ic6;
	Thu, 05 Nov 2026 11:09:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvLt-00000008ayF-1Tsm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:09:55 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FEBB9A4;
	Thu,  5 Nov 2026 12:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793876853;
	bh=J9ImKc88GPgcB6D7fshmTuDUSz38NIgF+cMaexxCR2o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MWxIkkSjjIwpyc93MNB1pO7/3tDrI4qxEC8+GcwjHJrYAGSD/d0epfzzEdb/Ogt1G
	 bnR0V9blnX8/zn87XrkCQIxFcglHmBVBb+FE6phFYB4BDGO87ReEWYiJBQNZSXtwZR
	 2V7dvJFxOKQvTWJxEPfWX7NCZal4Bea44ZjIV728=
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105033224.2880607-1-t-lannynd@ti.com>
References: <20261105033224.2880607-1-t-lannynd@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62x-sk: Add orientation to IMX219 sensor node
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: b-brnich@ti.com, praneeth@ti.com, r-donadkar@ti.com, devarsht@ti.com, kieran.bingham@ideasonboard.com, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Thorsten Lannynd <t-lannynd@ti.com>, linux-arm-kernel@lists.infradead.org
Date: Thu, 05 Nov 2026 16:39:46 +0530
Message-ID: <179387698667.10051.17862177968667264461@freya>
User-Agent: alot/0.13.dev199+g9722e8483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030954_429667_8AB9B73C 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Thorsten,

Thank you for the patch.

Quoting Thorsten Lannynd (2026-11-05 09:02:24)
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

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

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

